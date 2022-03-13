import 'package:flutter/material.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/ui/widgets/landscape_weather_details_card.dart';
import 'package:weather_challenge/ui/widgets/portrait_weather_details_card.dart';

class WeatherDetailsCard extends StatelessWidget {
  const WeatherDetailsCard({
    Key? key,
    required this.weather,
    this.isCelsius = true,
    required this.onSwitchTemperature,
  }) : super(key: key);

  final WeatherModel weather;
  final bool isCelsius;
  final void Function() onSwitchTemperature;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? PortraitWeatherDetailsCard(
            weather: weather,
            onSwitchTemperature: onSwitchTemperature,
            isCelsius: isCelsius,
          )
        : LandscapeWeatherDetailsCard(
            weather: weather,
            onSwitchTemperature: onSwitchTemperature,
            isCelsius: isCelsius,
          );
  }
}
