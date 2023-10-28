import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/weather/weather_cubit.dart';
import 'screens/home_screen.dart';
import 'utilities/theme_color.dart';

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
}
