import 'package:liveroute/headers.dart';

get kToken => dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? '';

class BusRouteHistoryController extends GetxController {
  final String token = dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? '';
}
