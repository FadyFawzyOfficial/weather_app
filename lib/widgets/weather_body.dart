import 'package:flutter/material.dart';

import '../models/weather.dart';
import '../utilities/theme_color.dart';

class WeatherBody extends StatelessWidget {
  final Weather weather;

  const WeatherBody({super.key, required this.weather});

  @override
  Widget build(context) {
    final themeColor = getThemeColor(condition: weather.condition);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [themeColor[500]!, themeColor[300]!, themeColor[100]!],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.cityName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            'updated at ${weather.date.hour}:${weather.date.minute}',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https:${weather.image}'),
              Text(
                '${weather.temperature.round()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Max temp: ${weather.maxTemperature.round()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Min temp: ${weather.minTemperature.round()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            weather.condition,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
