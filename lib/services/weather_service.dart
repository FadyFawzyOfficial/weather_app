import 'package:dio/dio.dart';

import '../models/weather.dart';

class WeatherService {
  static const _baseUrl = 'http://api.weatherapi.com/v1';
  static const _apiKey = '5e6ed2285b65436a9f813120231408';
  static const _defaultErrorMessage = 'Oops, there was an error, try later.';

  final Dio dio = Dio();

  Future<Weather> getWeather({required String cityName}) async {
    try {
      final response = await dio.get(
        '$_baseUrl/forecast.json?key=$_apiKey&q=$cityName&days=1',
      );

      return Weather.fromMap(response.data);
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? _defaultErrorMessage;
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(_defaultErrorMessage);
    }
  }
}
