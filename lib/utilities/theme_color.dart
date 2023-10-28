import 'package:flutter/material.dart';

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
