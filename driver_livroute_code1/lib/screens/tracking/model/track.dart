import 'package:liveroute/headers.dart';
import 'package:liveroute/screens/tracking/model/bus_stop.dart';
import 'package:liveroute/screens/tracking/model/location.dart';
import 'package:liveroute/screens/tracking/model/stop.dart';

class Track {
  final List<Location> locations;
  final List<BusStop> busStops;

  static const String locations_ = 'locations';
  static const String busStops_ = 'bus_stops';

  const Track({
    required this.locations,
    required this.busStops,
  });

  Track.add()
      : locations = [],
        busStops = [];

  // json decode and extract values from json map
  factory Track.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Track.fromJson(json);
  }
  factory Track.fromJson(Map<String, dynamic> json) {
    final busStops = (json[busStops_] as List?) ?? [];
    final locations = (json[locations_] as List?) ?? [];
    return Track(
      busStops: busStops.map((stop) => BusStop.fromJson(stop)).toList(),
      locations:
          locations.map((location) => Location.fromJson(location)).toList(),
    );
  }

  // extract the values from json map
  Map<String, dynamic> toJson() {
    return {
      busStops_: busStops,
      locations_: locations,
    };
  }
}
