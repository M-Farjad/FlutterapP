import 'package:liveroute/headers.dart';

class BusRouteHistoryTile extends StatelessWidget {
  const BusRouteHistoryTile(
      {super.key,
      required this.date,
      required this.timeA,
      required this.timeB,
      required this.stop,
      required this.distance});
  final String date;
  final String timeA;
  final String timeB;
  final int stop;
  final double distance;

  static final _largeTextStyle = TextStyle(
    fontSize: rSize(mobile: 16, web: 14),
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFEDECEB),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black12,
          )),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => ToRoutes.toBusRouteHistory(
          busRoute: AppRoutes.pBusRoute.busRoute,
          busRouteHistory: date,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: rSize(mobile: 8, web: 10),
            horizontal: rSize(mobile: 12, web: 14),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.teal[900],
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Text(
                    date,
                    style: TextStyle(color: Colors.grey[100]),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(),
                    Text(
                      '$timeA - $timeB',
                      // style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Text(
                      '$stop stops - ${distance.toStringAsFixed(1)} Km',
                      // style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                  ],
                ),
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
