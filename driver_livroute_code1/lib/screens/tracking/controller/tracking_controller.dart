import 'package:liveroute/configs/logo_configs.dart';
import 'package:liveroute/headers.dart';

import 'package:geolocator/geolocator.dart';
import 'package:liveroute/screens/tracking/controller/dummy_data_tracks.dart';

enum ApiState { loading, error, completed }

class TrackingController extends GetxController {
  final currLattitude = 0.0.obs;
  final currLongitude = 0.0.obs;
  final info = ''.obs;

  final busrouteTracks = <BusrouteTrack>[].obs;

  MapboxMapController? mapController;
  Symbol? s;

  bool isInitialized = false;

  final isFetching = false.obs;
  final state = ApiState.loading.obs;

  loadBusRoutes() {
    if (state.value != ApiState.completed) {
      if (!isFetching.value) {
        isFetching.value = true;
        // Call Api
        final brt = [kBusRouteTrack1, kBusRouteTrack2, kBusRouteTrack3];
        busrouteTracks.clear();
        busrouteTracks.assignAll(brt);
        state.value = ApiState.completed;
        isFetching.value = false;
      }
    }
    // call api
  }

  onMapCreate(MapboxMapController c) async {
    print("DEBUGL CALLED ON MAP CREATED");
    mapController = c;
    await Future.delayed(Duration(seconds: 1));

    s = await mapController?.addSymbol(SymbolOptions(
      iconSize: 0.1,
      iconImage: LogoConfigs.logoBlack,
      geometry: LatLng(31.53314, 74.3081594),
    ));

    print("SUYMBOL $s added");
  }

  start() {
    print("CALLED");
    try {
      _determinePosition().then((value) => print(value));
    } catch (e) {
      print("ERROR ${e}");
    }
  }

  stop() {}

  streaPost() async {
    Geolocator.getPositionStream(
            locationSettings: LocationSettings(accuracy: LocationAccuracy.best))
        .listen((event) {
      info.value = event.toJson().toString();
      currLattitude.value = event.latitude;
      currLongitude.value = event.longitude;
      _updatePostition();
    });
  }

  _updatePostition() {
    if (s != null) {
      mapController?.updateSymbol(s!, SymbolOptions(geometry: _postLatLng));
    }
  }

  get _postLatLng {
    final l = LatLng(currLattitude.value, currLongitude.value);
    print("DEBUG: L $l");
    return l;
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
      final g = await Geolocator.getCurrentPosition();
      print("G $g");
    } catch (e) {
      print("ERROR $e");
    }

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      final res = await Geolocator.openLocationSettings();

      print("res  $res");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
