import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'constants.dart';

class LiveTrackingPage extends StatefulWidget {
  const LiveTrackingPage({super.key});

  @override
  State<LiveTrackingPage> createState() => _LiveTrackingPageState();
}

class _LiveTrackingPageState extends State<LiveTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng sourceLocation = const LatLng(31.553615, 74.358518);
  LatLng destinationLocation = const LatLng(31.563079, 74.346619);
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  final PolylinePoints polylinePoints = PolylinePoints();
  List<LatLng> polylineCoordinates = [];

  final Location location = Location();
  LocationData? locationData;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    await getCurrentLocation();
    await setCustomIcon();
    await getPolyLinePoints();
  }

  Future<void> setCustomIcon() async {
    try {
      final iconsResult = await Future.wait([
        BitmapDescriptor.asset(
          const ImageConfiguration(size: Size(48, 48)),
          'assets/Pin_source.png',
        ),
        BitmapDescriptor.asset(
          const ImageConfiguration(size: Size(48, 48)),
          'assets/Pin_destination.png',
        ),
      ]);
      setState(() {
        log('Icons loaded successfully: $iconsResult');
        sourceIcon = iconsResult[0];
        destinationIcon = iconsResult[1];
      });
    } catch (e) {
      debugPrint('Error loading custom icons: $e');
    } finally {}
  }

  Future<void> getPolyLinePoints() async {
    try {
      PolylineResult polylineResult =
          await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: googleMapsAPIKey,
        request: PolylineRequest(
          origin:
              PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
          destination: PointLatLng(
            destinationLocation.latitude,
            destinationLocation.longitude,
          ),
          mode: TravelMode.driving,
          optimizeWaypoints: true,
        ),
      );

      if (polylineResult.points.isNotEmpty) {
        setState(() {
          polylineCoordinates = polylineResult.points
              .map((point) => LatLng(point.latitude, point.longitude))
              .toList();
        });
      }
    } catch (e) {
      debugPrint('Error getting polyline points: $e');
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationData currentLoc = await location.getLocation();
      setState(() {
        locationData = currentLoc;
      });

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(currentLoc.latitude!, currentLoc.longitude!),
            zoom: 14,
          ),
        ),
      );

      // location.onLocationChanged.listen((LocationData newLoc) async {
      //   await controller.animateCamera(
      //     CameraUpdate.newCameraPosition(
      //       CameraPosition(
      //         target: LatLng(newLoc.latitude!, newLoc.longitude!),
      //         zoom: 14,
      //       ),
      //     ),
      //   );
      //   setState(() {
      //     locationData = newLoc;
      //   });
      // });
    } catch (e) {
      debugPrint('Error getting current location: $e');
    }
  }

  Future<BitmapDescriptor> createCustomMarker(GlobalKey markerKey) async {
    RenderRepaintBoundary boundary =
        markerKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(pngBytes);
  }

  final GlobalKey markerKey = GlobalKey();

  Widget buildMarkerWidget(String networkImageUrl) {
    return RepaintBoundary(
      key: markerKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/Pin_current_location.png', width: 100),
          CircleAvatar(
            backgroundImage: NetworkImage(networkImageUrl),
            radius: 25,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: sourceLocation,
          zoom: 14,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          Marker(
            markerId: const MarkerId('source'),
            position: sourceLocation,
            infoWindow: const InfoWindow(title: 'Source'),
            icon: sourceIcon,
          ),
          Marker(
            markerId: const MarkerId('destination'),
            position: destinationLocation,
            infoWindow: const InfoWindow(title: 'Destination'),
            icon: destinationIcon,
          ),
          if (locationData != null)
            Marker(
              markerId: const MarkerId('current_location'),
              position:
                  LatLng(locationData!.latitude!, locationData!.longitude!),
              infoWindow: const InfoWindow(title: 'Current Location'),
              icon: BitmapDescriptor.defaultMarker,
            ),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId('route'),
            color: primaryColor,
            width: 5,
            points: polylineCoordinates,
          ),
        },
      ),
    );
  }
}
