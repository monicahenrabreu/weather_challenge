import 'package:flutter/material.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/ui/widgets/weather_carousel.dart';
import 'package:weather_challenge/ui/widgets/weather_details_card.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    Key? key,
    required this.currentWeather,
    required this.weatherList,
    this.isCelsius = true,
    required this.onRefresh,
    required this.onTap,
    required this.onSwitchTemperature,
  }) : super(key: key);

  final WeatherModel currentWeather;
  final List<WeatherModel> weatherList;
  final bool isCelsius;
  final Future<void> Function() onRefresh;
  final void Function(WeatherModel weatherModel) onTap;
  final void Function() onSwitchTemperature;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return RefreshIndicator(
            onRefresh: onRefresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    WeatherDetailsCard(
                      weather: currentWeather,
                      isCelsius: isCelsius,
                      onSwitchTemperature: onSwitchTemperature,
                    ),
                    WeatherCarousel(
                        weatherList: weatherList,
                        onTap: onTap,
                        isCelsius: isCelsius),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
