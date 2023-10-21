import 'package:dio/dio.dart';

import '../models/weather.dart';

class WeatherService {
  static const _baseUrl = 'http://api.weatherapi.com/v1';
  static const _apiKey = '5e6ed2285b65436a9f813120231408';

  final Dio dio = Dio();

  Future<Weather> getWeather({required String cityName}) async {
    final response = await dio.get(
      '$_baseUrl/forecast.json?key=$_apiKey&q=$cityName&days=1',
    );

    return Weather.fromMap(response.data);
  }
}
