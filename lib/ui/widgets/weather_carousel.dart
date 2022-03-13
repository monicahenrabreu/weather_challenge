import 'package:flutter/material.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/ui/widgets/weather_card.dart';

class WeatherCarousel extends StatelessWidget {
  const WeatherCarousel({
    Key? key,
    required this.weatherList,
    required this.onTap,
    this.isCelsius = true,
  }) : super(key: key);

  final List<WeatherModel> weatherList;
  final void Function(WeatherModel weather) onTap;
  final bool isCelsius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: false,
          itemCount: weatherList.length,
          itemBuilder: (context, index) => WeatherCard(
              weather: weatherList[index],
              onTap: () => onTap(weatherList[index]),
              isCelsius: isCelsius),
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              )),
    );
  }
}
