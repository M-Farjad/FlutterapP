import 'dart:convert';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  static const BASE_URL = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;
  WeatherServices({required this.apiKey});

  Future<WeatherModel> getWeather(String cityName) async {
    final url = "$BASE_URL?q=$cityName&appid=$apiKey&units=metric";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(json.decode(response.body));
      } else {
        throw Exception("Error getting weather");
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception("Error getting weather");
  }

  Future<String> getCurrentCity() async {
    //get permission from user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    //fetch User location
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //convert the location into a list of placemark objects
    final placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //extract the city name from the placemark object
    final cityName = placeMarks[0].locality;

    return cityName ?? "";
  }
}
