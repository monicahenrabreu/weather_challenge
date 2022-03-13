import 'package:flutter/material.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/ui/widgets/humidity_pressure_wind_widget.dart';

class WeatherDetailsCard extends StatelessWidget {
  const WeatherDetailsCard({Key? key, required this.weather,}) : super(key: key);

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
            child: Text(
          weather.date!,
          style: Theme.of(context).textTheme.headline2,
        )),
        const Divider(
          height: 16,
        ),
        Text(
          weather.weatherState!,
          style: Theme.of(context).textTheme.headline3,
        ),
        const Divider(
          height: 16,
        ),
        const Icon(Icons.ac_unit),
        const Divider(
          height: 16,
        ),
        Center(
            child: Text(
              '${weather.currentTemp.toString()}º',
              style: Theme.of(context).textTheme.headline1,
            )),
        const Divider(
          height: 16,
        ),
        HumidityPressureWindWidget(
          humidity: weather.humidity,
          airPressure: weather.airPressure,
          windSpeed: weather.windSpeed,
        ),
      ],
    );
  }
}
