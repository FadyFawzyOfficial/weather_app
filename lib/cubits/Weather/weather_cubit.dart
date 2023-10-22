import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/weather_service.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitialState());

  getWeather({required String cityName}) async {
    try {
      final weather = await WeatherService().getWeather(cityName: cityName);

      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
