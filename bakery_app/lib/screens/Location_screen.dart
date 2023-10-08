import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RouteMapScreen extends StatefulWidget {
  @override
  _RouteMapScreenState createState() => _RouteMapScreenState();
}

class _RouteMapScreenState extends State<RouteMapScreen> {
  late final GoogleMapController mapController;
  Set<Polyline> _polylines = {};
  String distance = '';
  String duration = '';

  late final GoogleMapController googleMapController;

  final LatLng _origin = LatLng(31.6943, 74.2472); // Start point
  LatLng? _destination; // End point
  final _polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];

  Future<void> _getPolylines() async {
    String Distance = '';
    String Duration = '';

    final String apiUrl = "https://maps.googleapis.com/maps/api/directions/json?" +
        "origin=${_origin.latitude},${_origin.longitude}" +
        "&destination=${_destination!.latitude},${_destination!.longitude}" +
        "&key=AIzaSyCKqd_rf7rHWHA7n48Z301SVTosbF2QCAg"; // Replace with your Google API key

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      String points = data["routes"][0]["overview_polyline"]["points"];
      setState(() {
        polylineCoordinates = _decodePolyline(points);
      });

      Distance = data["routes"][0]["legs"][0]["distance"]["text"];
      Duration = data["routes"][0]["legs"][0]["duration"]["text"];
    }

    distance = Distance;
    duration = Duration;

    print("Distance: $Distance");
    print("Duration: $Duration");
  }

  Future<void> _handleSearchPlace() async {
    Prediction? prediction = await PlacesAutocomplete.show(
      context: context,
      apiKey:
          'AIzaSyCKqd_rf7rHWHA7n48Z301SVTosbF2QCAg', // Replace with your Google API key
      language: 'en',
      strictbounds: false,
      types: [''],
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [
        Component(
          Component.country,
          'pk',
        ),
      ],
    );

    if (prediction != null && prediction.placeId != null) {
      PlacesDetailsResponse details = await GoogleMapsPlaces(
        apiKey: 'AIzaSyCKqd_rf7rHWHA7n48Z301SVTosbF2QCAg',
      ).getDetailsByPlaceId(prediction.placeId!);

      setState(() {
        _destination = LatLng(
          details.result.geometry!.location.lat,
          details.result.geometry!.location.lng,
        );
        googleMapController.animateCamera(
          CameraUpdate.newLatLng(_destination!),
        );
      });
    }
  }

  String? Destinationaddress;
  Future<void> _getAddressFromCoordinates(LatLng coordinates) async {
    final apiKey = 'YOUR_GOOGLE_MAPS_API_KEY';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${coordinates.latitude},${coordinates.longitude}&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        Destinationaddress = data['results'][0]['formatted_address'];
      }
    }
  }

  Set<Marker> _buildMarkers(Color color) {
    Set<Marker> markers = Set();
    markers.add(
      Marker(
        markerId: MarkerId('origin'),
        position: _origin,
        infoWindow: InfoWindow(
            title: 'StartMarker', snippet: 'UKKIL Bakery, KSK Lahore'),
      ),
    );
    if (_destination != null) {
      final markerIcon =
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
      _getAddressFromCoordinates(_destination!);
      markers.add(
        Marker(
          markerId: MarkerId('destination'),
          position: _destination!,
          icon: markerIcon,
          infoWindow: InfoWindow(
            title: 'StartMarker',
            snippet: Destinationaddress,
          ),
        ),
      );
    }
    return markers;
  }

  Set<Polyline> _buildPolylines() {
    Set<Polyline> polylines = Set();
    if (_destination != null) {
      _getPolylines();
      polylines.add(
        Polyline(
          polylineId: PolylineId('route'),
          color: Colors.pink,
          width: 3,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          visible: true,
          points: polylineCoordinates,
        ),
      );
    }
    return polylines;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Route Map')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _handleSearchPlace,
            child: Text(
              'Search Location',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: _origin, zoom: 18),
              onMapCreated: (controller) {
                googleMapController = controller;
              },
              markers: _buildMarkers(Colors.pink),
              polylines: _buildPolylines(),
            ),
          ),
        ],
      ),
    );
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1e5, lng / 1e5));
    }

    return points;
  }
}
