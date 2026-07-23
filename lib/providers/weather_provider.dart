import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherModel;

  Future<void> fetchWeather() async {
      weatherModel = await WeatherService.getWeather();
      print("FETCH CALLED");
      notifyListeners();

  }
}

//? VS !
//? -> may be null
//! -> MUST be value if don`t have value app will crash