import 'package:liveroute/headers.dart';

final kBusRoute1 =
    Busroute(routeName: 'route5', isSpeacial: false, symbol: '5');
final kBusRoute2 =
    Busroute(routeName: 'route6', isSpeacial: false, symbol: '6');
final kBusRoute3 =
    Busroute(routeName: 'rana_town', isSpeacial: true, symbol: 'RT');

final kStop1 =
    Stop(stopname: '5-1', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop2 =
    Stop(stopname: '5-2', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop3 =
    Stop(stopname: '5-3', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop4 =
    Stop(stopname: '5-4', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop5 =
    Stop(stopname: '6-1', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop6 =
    Stop(stopname: '6-2', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop7 =
    Stop(stopname: '6-3', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop8 =
    Stop(stopname: '6-4', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop9 =
    Stop(stopname: 'RT-1', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop10 =
    Stop(stopname: 'RT-2', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop11 =
    Stop(stopname: 'RT-3', geoLocation: GeoLocation(latitude: 0, longitude: 0));
final kStop12 =
    Stop(stopname: 'RT-4', geoLocation: GeoLocation(latitude: 0, longitude: 0));

final kBusStops1 = [
  BusStop(stop: kStop1, time: Time.timeOfDay(hour: 7, minute: 1)),
  BusStop(stop: kStop2, time: Time.timeOfDay(hour: 7, minute: 2)),
  BusStop(stop: kStop3, time: Time.timeOfDay(hour: 7, minute: 3)),
  BusStop(stop: kStop4, time: Time.timeOfDay(hour: 7, minute: 4))
];
final kBusStops2 = [
  BusStop(stop: kStop4, time: Time.timeOfDay(hour: 4, minute: 1)),
  BusStop(stop: kStop3, time: Time.timeOfDay(hour: 4, minute: 2)),
  BusStop(stop: kStop2, time: Time.timeOfDay(hour: 4, minute: 3)),
  BusStop(stop: kStop1, time: Time.timeOfDay(hour: 4, minute: 4))
];
final kBusStops3 = [
  BusStop(stop: kStop5, time: Time.timeOfDay(hour: 7, minute: 1)),
  BusStop(stop: kStop6, time: Time.timeOfDay(hour: 7, minute: 2)),
  BusStop(stop: kStop7, time: Time.timeOfDay(hour: 7, minute: 3)),
  BusStop(stop: kStop8, time: Time.timeOfDay(hour: 7, minute: 4))
];
final kBusStops4 = [
  BusStop(stop: kStop8, time: Time.timeOfDay(hour: 4, minute: 1)),
  BusStop(stop: kStop7, time: Time.timeOfDay(hour: 4, minute: 2)),
  BusStop(stop: kStop6, time: Time.timeOfDay(hour: 4, minute: 3)),
  BusStop(stop: kStop5, time: Time.timeOfDay(hour: 4, minute: 4))
];
final kBusStops5 = [
  BusStop(stop: kStop12, time: Time.timeOfDay(hour: 12, minute: 1)),
  BusStop(stop: kStop11, time: Time.timeOfDay(hour: 12, minute: 2)),
  BusStop(stop: kStop10, time: Time.timeOfDay(hour: 12, minute: 3)),
  BusStop(stop: kStop9, time: Time.timeOfDay(hour: 12, minute: 4))
];

final kLocations1 = kBusStops1
    .map((e) => Location(
        geoLocation: e.stop.geoLocation,
        datetime: DateTime(2023, 9, 28, e.time.hour, e.time.minute)))
    .toList();
final kLocations2 = kBusStops2
    .map((e) => Location(
        geoLocation: e.stop.geoLocation,
        datetime: DateTime(2023, 9, 28, e.time.hour, e.time.minute)))
    .toList();
final kLocations3 = kBusStops3
    .map((e) => Location(
        geoLocation: e.stop.geoLocation,
        datetime: DateTime(2023, 9, 28, e.time.hour, e.time.minute)))
    .toList();
final kLocations4 = kBusStops4
    .map((e) => Location(
        geoLocation: e.stop.geoLocation,
        datetime: DateTime(2023, 9, 28, e.time.hour, e.time.minute)))
    .toList();
final kLocations5 = kBusStops5
    .map((e) => Location(
        geoLocation: e.stop.geoLocation,
        datetime: DateTime(2023, 9, 28, e.time.hour, e.time.minute)))
    .toList();

final kTrack1 = Track(locations: kLocations1, busStops: kBusStops1);
final kTrack2 = Track(locations: kLocations2, busStops: kBusStops2);
final kTrack3 = Track(locations: kLocations3, busStops: kBusStops3);
final kTrack4 = Track(locations: kLocations4, busStops: kBusStops4);
final kTrack5 = Track(locations: kLocations5, busStops: kBusStops5);

final kBusRouteTrack1 = BusrouteTrack(
  busroute: kBusRoute1,
  speacialTrack: null,
  morningTrack: kTrack1,
  eveningTrack: kTrack2,
);
final kBusRouteTrack2 = BusrouteTrack(
  busroute: kBusRoute2,
  speacialTrack: null,
  morningTrack: kTrack3,
  eveningTrack: kTrack4,
);
final kBusRouteTrack3 = BusrouteTrack(
  busroute: kBusRoute3,
  speacialTrack: kTrack5,
  morningTrack: null,
  eveningTrack: null,
);
