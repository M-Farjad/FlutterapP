import 'package:liveroute/headers.dart';

class BusRouteTile extends StatelessWidget {
  const BusRouteTile({super.key});

  static final _largeTextStyle = TextStyle(
    fontSize: rSize(mobile: 16, web: 14),
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFEDECEB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black12,
          )),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => ToRoutes.toBusRoute(busRoute: 'route5'),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: rSize(mobile: 8, web: 10),
            horizontal: rSize(mobile: 12, web: 14),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(child: Text("Route 5", style: _largeTextStyle)),
                    Icon(Icons.speaker),
                  ],
                ),
                const _StopAndTime(name: 'UET', timeA: '07:55', timeB: '04:10'),
                const _StopAndTime(
                    name: 'AZFC', timeA: '07:10', timeB: '05:04'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StopAndTime extends StatelessWidget {
  const _StopAndTime({
    super.key,
    required this.name,
    required this.timeA,
    required this.timeB,
  });

  final String name;
  final String timeA;
  final String timeB;

  static const _stopTextStyle = TextStyle(
    fontSize: 13,
  );
  static const _timeTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(184, 0, 0, 0),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_pin,
          size: 16,
          color: Color.fromARGB(228, 0, 95, 3),
        ),
        Expanded(child: Text(name, style: _stopTextStyle)),
        Text(
          "$timeA - $timeB",
          style: _timeTextStyle,
        )
      ],
    );
    ;
  }
}
