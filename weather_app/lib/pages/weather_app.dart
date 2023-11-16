import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService =
      WeatherServices(apiKey: "12b1cd462a71ec54a58496c3f225be48");

  WeatherModel? _weather;

  //fetch weather
  _fetchWeather() async {
    //get Current City
    String cityName = await _weatherService.getCurrentCity();
    //get Weather for City
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
        log("Weather: ${weather.cityName}");
      });
    } catch (e) {
      log(e.toString());
    }
  }

  //weather animations
  String getWeatherAnimation(String? mainCode) {
    if (mainCode == null) return "assets/sunny.json";
    switch (mainCode) {
      case "clouds":
      case "mist":
      case "haze":
      case "smoke":
      case "dust":
      case "fog":
        return "assets/cloudy.json";
      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/rainy.json";
      case "thunderstorm":
        return "assets/thunder.json";
      case "clear":
        return "assets/sunny.json";
      default:
        return "assets/sunny.json";
    }
  }

  //init state
  @override
  void initState() {
    super.initState();

    //fetch wearher on init
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on_outlined),
              //city Name
              Text(_weather?.cityName ?? "loading city..."),

              //animations
              Lottie.asset(getWeatherAnimation(_weather?.mainCode)),

              //tempreture
              Text("${_weather?.temperature.round() ?? 0}*C"),

              //weather condition
              Text(_weather?.mainCode ?? "loading weather..."),
            ],
          ),
        ),
      ),
    );
  }
}
