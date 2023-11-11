import 'package:liveroute/headers.dart';

class BusRouteAppBar extends StatelessWidget {
  const BusRouteAppBar({
    super.key,
    required this.name,
    required this.isSpeacial,
  });
  final String name;
  final bool isSpeacial;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      floating: true,
      pinned: false,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      leadingWidth: Get.previousRoute.isEmpty ? null : 30,
      elevation: 2,
      title: Row(
        children: [
          Expanded(
              child: Text(
            name.capitalizeFirst!,
            style: TextStyle(
              fontSize: rSize(mobile: 18, web: 18),
              fontWeight: FontWeight.w600,
            ),
          )),
          if (isSpeacial) const Icon(Icons.star),
        ],
      ),
    );
  }
}
