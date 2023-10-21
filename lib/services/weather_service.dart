import 'package:dio/dio.dart';

import '../models/weather.dart';

class WeatherService {
  final Dio dio = Dio();

  Future<Weather> getWeather({required String cityName}) async {
    final response = await dio.get(
      'http://api.weatherapi.com/v1/forecast.json?key=5e6ed2285b65436a9f813120231408&q=$cityName&days=1',
    );

    return Weather.fromMap(response.data);
  }
}
