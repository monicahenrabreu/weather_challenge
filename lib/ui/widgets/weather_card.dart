import 'package:flutter/material.dart';
import 'package:weather_challenge/data/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
    required this.weather,
    required this.onTap,
  }) : super(key: key);

  final WeatherModel weather;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.yellow,
      height: 160,
      width: 160,
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              weather.dateAbbr!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Icon(Icons.ac_unit),
            Text(
              '${weather.minTemp.toString()}º / ${weather.maxTemp.toString()}º',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
