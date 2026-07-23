import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  static final Dio dio = Dio();
  static Future<WeatherModel> getWeather() async {
    try {
      final response = await dio.get(
        'https://iats.runasp.net/api/Country/GetCountries',
      );
      print(response.data);

      return WeatherModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }
}
