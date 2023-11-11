import 'package:liveroute/headers.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final args = AppRoutes.pBusRouteHistory;
    final lc = Get.find<BusRouteHistoryController>();
    return Stack(
      children: [
        Container(
            color: Colors.amber,
            child: MapboxMap(
              attributionButtonMargins: Point(-1000, -1000),
              logoViewMargins: const Point(-1000, -1000),
              initialCameraPosition:
                  const CameraPosition(target: LatLng(76, 78)),
              accessToken: lc.token,
            )),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 35,
                  child: CircleAvatar(
                    backgroundColor: Colors.white54,
                    foregroundColor: Colors.black,
                    child: IconButton(
                        onPressed: Get.previousRoute.isNotEmpty
                            ? Get.back
                            : () => ToRoutes.toBusRoute(
                                busRoute: args.busRoute, off: true),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 20,
                        )),
                  )),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      args.busRouteHistory,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Flexible(
                      child: Text(
                        args.busRoute,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: Get.previousRoute.isNotEmpty ? 35 : 0),
            ],
          ),
        ))
      ],
    );
  }
}
