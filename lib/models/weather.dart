import 'dart:convert';

class Weather {
  final String cityName;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final DateTime date;
  final String image;
  final String condition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.date,
    required this.image,
    required this.condition,
  });

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));

  factory Weather.fromMap(Map<String, dynamic> map) {
    final todayForecast = map['forecast']['forecastday'][0]['day'];
    return Weather(
      cityName: map['location']['name'],
      temperature: todayForecast['avgtemp_c'],
      minTemperature: todayForecast['mintemp_c'],
      maxTemperature: todayForecast['maxtemp_c'],
      date: DateTime.parse(map['current']['last_updated']),
      image: map['current']['condition']['icon'],
      condition: map['current']['condition']['text'],
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'cityName': cityName,
      'temperature': temperature,
      'minTemperature': minTemperature,
      'maxTemperature': maxTemperature,
      'date': date,
      'image': image,
      'condition': condition,
    };
  }
}
