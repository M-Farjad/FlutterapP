import 'package:liveroute/headers.dart';

class GeoLocation {
  double latitude;
  double longitude;

  static const String latitude_ = 'latitude';
  static const String longitude_ = 'longitude';

  GeoLocation({
    required this.latitude,
    required this.longitude,
  });

  List<double> get latLon => [latitude, longitude];
  List<double> get lonLat => [longitude, latitude];

  Map<String, dynamic> toJson() {
    return {
      latitude_: latitude,
      longitude_: longitude,
    };
  }

  // json decode and extract values from json map
  factory GeoLocation.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return GeoLocation.fromJson(json);
  }
  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      latitude: json[latitude_],
      longitude: json[longitude_],
    );
  }
}
