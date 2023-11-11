import 'package:liveroute/headers.dart';

class BusRouteTabBar extends StatelessWidget {
  const BusRouteTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black,
      ),
      unselectedLabelColor: Colors.black,
      labelPadding: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      indicatorPadding: const EdgeInsets.all(0),
      labelColor: Colors.white,
      tabs: [
        _tab('Morning'),
        _tab('Evening'),
      ],
    );
  }

  Tab _tab(String name) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          name,
        ),
      ),
    );
  }
}
