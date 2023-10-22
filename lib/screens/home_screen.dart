import 'package:flutter/material.dart';

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
      body: weather == null ? const NoWeatherBody() : const WeatherBody(),
    );
  }
}
