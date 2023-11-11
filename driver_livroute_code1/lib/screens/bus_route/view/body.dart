import 'package:liveroute/headers.dart';
import 'package:liveroute/screens/bus_route/widget/bus_route_app_bar.dart';
import 'package:liveroute/screens/bus_route/widget/bus_route_history_grid_view.dart';
import 'package:liveroute/screens/bus_route/widget/bus_route_tab_bar.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final args = AppRoutes.pBusRoute;
    final _isShrink = false.obs;
    final isSpeacial = false.obs;
    final isAllowed = true.obs;
    return SafeArea(
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (c, isShrink) {
          _isShrink.value = isShrink;
          return [
            BusRouteAppBar(
              name: args.busRoute,
              isSpeacial: isSpeacial.value,
            ),
          ];
        },
        body: SafeArea(
          child: Obx(
            () => DefaultTabController(
                length: 2,
                child: Scaffold(
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: isAllowed.value
                      ? FloatingActionButton(
                          backgroundColor: Colors.black,
                          onPressed: () {},
                          child: Icon(Icons.add),
                        )
                      : null,
                  body: Column(
                    children: [
                      Obx(() => SizedBox(height: _isShrink.value ? 8 : 6)),
                      isSpeacial.value
                          ? const SizedBox.shrink()
                          : const BusRouteTabBar(),
                      const SizedBox(height: 8),
                      Expanded(
                          child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              children: isSpeacial.value
                                  ? [const BusRouteHistoryGridView()]
                                  : [
                                      const BusRouteHistoryGridView(),
                                      const BusRouteHistoryGridView()
                                    ]))
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
