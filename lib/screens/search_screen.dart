import 'package:flutter/material.dart';

import '../services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) async {
              final weather =
                  await WeatherService().getWeather(cityName: value);
              Navigator.pop(context, weather);
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              hintText: 'Enter a city name',
              suffixIcon: Icon(Icons.search_rounded),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
