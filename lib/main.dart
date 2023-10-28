import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/weather/weather_cubit.dart';
import 'screens/home_screen.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: getThemeColor(
                condition:
                    state is WeatherLoadedState ? state.weather.condition : '',
              ),
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }

  MaterialColor getThemeColor({required String condition}) {
    if (condition.isEmpty) return Colors.blue;

    switch (condition) {
      case 'Sunny':
      case 'Clear':
        return Colors.amber;
      case 'Partly Cloud':
      case 'Cloud':
      case 'Overcast':
      case 'Mist':
      case 'Fog':
      case 'Freezing fog':
        return Colors.blueGrey;
      default:
        return Colors.blue;
    }
  }
}
