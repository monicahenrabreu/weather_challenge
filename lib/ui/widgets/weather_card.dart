import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_challenge/configs/constants.dart';
import 'package:weather_challenge/data/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
    required this.weather,
    required this.onTap,
    required this.isCelsius,
  }) : super(key: key);

  final WeatherModel weather;
  final void Function() onTap;
  final bool isCelsius;

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
            SvgPicture.network(
              '${Constants.urlImage}${weather.weatherStateImage}${Constants.imageFormat}',
              height: 60,
            ),
            Text(
              isCelsius
                  ? '${weather.minTemp.toString()}º / ${weather.maxTemp.toString()}º'
                  : '${weather.minTempFahreneit.toString()}º / ${weather.maxTempFahreneit.toString()}º',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
