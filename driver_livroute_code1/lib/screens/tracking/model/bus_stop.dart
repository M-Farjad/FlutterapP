import 'package:liveroute/headers.dart';
import 'package:liveroute/screens/tracking/model/stop.dart';
import 'package:liveroute/screens/tracking/model/time.dart';

class BusStop {
  final Stop stop;
  final Time time;

  static const String time_ = 'time';
  static const String stop_ = 'stop';

  const BusStop({
    required this.stop,
    required this.time,
  });

  // json decode and extract values from json map
  factory BusStop.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return BusStop.fromJson(json);
  }
  factory BusStop.fromJson(Map<String, dynamic> json) {
    return BusStop(
      stop: Stop.fromJson(json[stop_]),
      time: Time.fromString(json[time_]),
    );
  }

  // extract the values from json map
  Map<String, dynamic> toJson() {
    return {
      stop_: stop.toJson(),
      time_: time.toString(),
    };
  }
}
