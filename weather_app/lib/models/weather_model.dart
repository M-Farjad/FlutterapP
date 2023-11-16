class WeatherModel {
  final String cityName;
  final double temperature;
  final String mainCode;
  WeatherModel(
      {required this.cityName,
      required this.temperature,
      required this.mainCode});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cityName: json['name'],
        temperature: json['main']['temp'].toDouble(),
        mainCode: json['weather'][0]['main']);
  }
}
