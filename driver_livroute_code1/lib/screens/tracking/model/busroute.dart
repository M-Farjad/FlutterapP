import 'package:liveroute/headers.dart';

class Busroute {
  final String routeName;
  final bool isSpeacial;
  final String symbol;

  static const String isSpeacial_ = 'is_speacial';
  static const String routeName_ = 'route_name';
  static const String symbol_ = 'symbol';

  static String? isValidRouteName(String? routeName) {
    if (routeName == null) return 'Please Enter Bus Route Name';
    if (routeName.length < 3) return 'Bus Route name too small';
    return null;
  }

  static String? isValidSymbol(String? symbol) {
    if (symbol == null) return 'Please Enter Bus Route symbol';
    symbol = symbol.trim();
    if (symbol.length > 3) return 'Bus Route symbol too large';
    return null;
  }

  Busroute({
    required this.routeName,
    required this.isSpeacial,
    required this.symbol,
  });

  Busroute.add({
    required String dRouteName,
    required bool? dIsSpeacial,
    required String? dSymbol,
  })  : routeName = dRouteName.trim(),
        isSpeacial = dIsSpeacial ?? false,
        symbol = getSymbol(routeName: dRouteName, symbol: dSymbol);

  static String getSymbol(
      {required String routeName, required String? symbol}) {
    symbol = symbol != null ? symbol.trim() : '';
    symbol = symbol.isEmpty ? routeName[routeName.length - 1] : symbol;
    return symbol;
  }

  // json decode and extract values from json map
  factory Busroute.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return Busroute.fromJson(json);
  }
  factory Busroute.fromJson(Map<String, dynamic> json) {
    return Busroute(
      isSpeacial: json[isSpeacial_] ?? false,
      routeName: json[routeName_],
      symbol: json[symbol_],
    );
  }

  // extract the values from json map
  Map<String, dynamic> toJson() {
    return {
      isSpeacial_: isSpeacial,
      routeName_: routeName,
      symbol_: symbol,
    };
  }
}
