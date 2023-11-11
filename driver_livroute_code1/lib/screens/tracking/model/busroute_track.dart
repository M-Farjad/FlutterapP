import 'package:liveroute/headers.dart';
import 'package:liveroute/screens/tracking/model/busroute.dart';
import 'package:liveroute/screens/tracking/model/track.dart';

class BusrouteTrack {
  final Busroute busroute;
  final Track? speacialTrack;
  final Track? morningTrack;
  final Track? eveningTrack;
  bool get isSpeacial => busroute.isSpeacial;

  static const String busroute_ = 'busroute';
  static const String speacialTrack_ = 'speacial_track';
  static const String morningTrack_ = 'morning_track';
  static const String eveningTrack_ = 'evening_track';

  BusrouteTrack({
    required this.busroute,
    required this.speacialTrack,
    required this.morningTrack,
    required this.eveningTrack,
  });

  // json decode and extract values from json map
  factory BusrouteTrack.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return BusrouteTrack.fromJson(json);
  }
  factory BusrouteTrack.fromJson(Map<String, dynamic> json) {
    final speacialTrack = (json[speacialTrack_] as Map<String, dynamic>?);
    final morningTrack = (json[morningTrack_] as Map<String, dynamic>?);
    final eveningTrack = (json[eveningTrack_] as Map<String, dynamic>?);
    return BusrouteTrack(
      busroute: Busroute.fromJson(json[busroute_]),
      speacialTrack:
          speacialTrack == null ? null : Track.fromJson(speacialTrack),
      morningTrack: morningTrack == null ? null : Track.fromJson(morningTrack),
      eveningTrack: eveningTrack == null ? null : Track.fromJson(eveningTrack),
    );
  }

  // extract the values from json map
  Map<String, dynamic> toJson() {
    if (isSpeacial) {
      return {
        busroute_: busroute.toJson(),
        speacialTrack_: speacialTrack?.toJson(),
      };
    } else {
      return {
        busroute_: busroute.toJson(),
        morningTrack_: morningTrack?.toJson(),
        eveningTrack_: eveningTrack?.toJson(),
      };
    }
  }
}
