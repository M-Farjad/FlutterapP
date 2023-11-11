import 'package:liveroute/headers.dart';

class TrackingMap extends StatelessWidget {
  const TrackingMap({super.key});

  @override
  Widget build(BuildContext context) {
    final tc = Get.find<TrackingController>();
    String style = MapboxStyles.LIGHT;

    return MapboxMap(

        // styleString: 'mapbox://styles/mapbox/streets-v12',
        // styleString: 'mapbox://styles/mapbox/dark-v11',
        onStyleLoadedCallback: () {
          print("STYLE LOAD BACK CALLED");
        },
        styleString: style,
        onMapCreated: tc.onMapCreate,
        accessToken: kToken,
        logoViewMargins: const Point(-1000, -1000),
        attributionButtonMargins: const Point(-1000, -100),
        compassViewMargins: const Point(-1000, -1000),
        initialCameraPosition: CameraPosition(
            target: LatLng(
          tc.currLattitude.value,
          tc.currLongitude.value,
        )));
  }
}
