import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather.dart';
import '../../services/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  getWeather({required String cityName}) async {
    emit(WeatherLoadingState());

    try {
      final weather = await WeatherService().getWeather(cityName: cityName);

      emit(WeatherLoadedState(weather: weather));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
