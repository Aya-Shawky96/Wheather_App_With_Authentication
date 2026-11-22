import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherModel;

  Future<void> fetchWeather() async {
    weatherModel = await WeatherService.getWeather();
    notifyListeners();
  }
}
