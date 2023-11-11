import 'package:liveroute/headers.dart';
import 'package:liveroute/screens/tracking/model/geo_location.dart';
import 'package:liveroute/screens/tracking/model/location.dart';

class Stop {
  final GeoLocation geoLocation;
  final String stopname;

  static const String geoLocation_ = 'geo_location';
  static const String stopname_ = 'stopname';

  const Stop({
    required this.stopname,
    required this.geoLocation,
  });

  // json decode and extract values from json map
  factory Stop.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Stop.fromJson(json);
  }
  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(
      stopname: json[stopname_] ?? '',
      geoLocation: GeoLocation.fromJson(json[geoLocation_]),
    );
  }

  // extract the values from json map
  Map<String, dynamic> toJson() {
    return {
      stopname_: stopname,
      geoLocation_: geoLocation,
    };
  }
}
