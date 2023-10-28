part of 'weather_cubit.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weather;

  WeatherLoadedState({required this.weather});
}

class WeatherFailureState extends WeatherState {}
