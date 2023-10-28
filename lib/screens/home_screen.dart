import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/weather/weather_cubit.dart';
import '../models/weather.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_body.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Weather? weather;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () async {
              weather = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
              setState(() {});
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherBody(weather: state.weather);
          } else {
            return const Text('There was an error!');
          }
        },
      ),
    );
  }
}
