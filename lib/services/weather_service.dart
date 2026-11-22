import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  static final Dio dio = Dio();
  static Future<WeatherModel> getWeather() async {
    try {
      final response = await dio.get(
        'https://iats.runasp.net/api/Country/GetCountries',
      );
      return WeatherModel.fromJson(response.data);
    } on DioException catch (dioException) {
      throw Exception("Failed to fetch weather data: ${dioException.message}");
    } catch (other) {
      throw Exception('Other Exception: ${other.toString()}');
    }
  }
}
