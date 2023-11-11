import 'package:liveroute/headers.dart';
import 'package:liveroute/screens/bus_route/widget/bus_route_history_tile.dart';

class BusRouteHistoryGridView extends StatelessWidget {
  const BusRouteHistoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        padding: const EdgeInsets.only(bottom: 85),
        // controller: sc,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              rView(context: context, desktop: 3, tablet: 2, mobile: 1),
          mainAxisExtent: 80,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (_, index) => const BusRouteHistoryTile(
          date: '19-SEP',
          timeA: '07:10',
          timeB: '08:00',
          stop: 10,
          distance: 45.565,
        ),
      ),
    );
  }
}
