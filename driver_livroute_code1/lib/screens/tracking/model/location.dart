import 'package:liveroute/headers.dart';
import 'package:liveroute/screens/tracking/model/geo_location.dart';

class Location {
  final GeoLocation geoLocation;
  final DateTime datetime;

  static const String geoLocation_ = 'geo_location';
  static const String datetime_ = 'datetime';

  Location({
    required this.geoLocation,
    required this.datetime,
  });

  Location.add({
    required this.geoLocation,
  }) : datetime = DateTime.now().toUtc();

  // json decode and extract values from json map
  factory Location.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Location.fromJson(json);
  }
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      geoLocation: GeoLocation.fromJson(json[geoLocation_]),
      datetime: DateTime.tryParse(json[datetime_]) ?? DateTime(0),
    );
  }

  // extract the values from json map
  Map<String, dynamic> toJson() {
    return {
      geoLocation_: geoLocation.toJson(),
      datetime_: datetime.toUtc().toIso8601String(),
    };
  }
}
