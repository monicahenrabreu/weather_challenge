import 'package:flutter/material.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/ui/widgets/weather_carousel.dart';
import 'package:weather_challenge/ui/widgets/weather_details_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherModel currentWeather;

  final List<WeatherModel> weatherList = [
    WeatherModel(
      weatherState: 'Light Rain',
      weatherStateImage: 'lr',
      dateAbbr: 'Fri',
      date: 'Friday',
      minTemp: 9,
      maxTemp: 16,
      currentTemp: 14,
      windSpeed: 5,
      airPressure: 1008,
      humidity: 11,
    ),
    WeatherModel(
      weatherState: 'Light Rain',
      weatherStateImage: 'lr',
      dateAbbr: 'Sat',
      date: 'Saturday',
      minTemp: 10,
      maxTemp: 17,
      currentTemp: 15,
      windSpeed: 3,
      airPressure: 1001,
      humidity: 9,
    ),
    WeatherModel(
      weatherState: 'Heavy Rain',
      weatherStateImage: 'lr',
      dateAbbr: 'Sun',
      date: 'Sunday',
      minTemp: 8,
      maxTemp: 14,
      currentTemp: 10,
      windSpeed: 3,
      airPressure: 1006,
      humidity: 13,
    ),
    WeatherModel(
      weatherState: 'Showers',
      weatherStateImage: 'lr',
      dateAbbr: 'Mon',
      date: 'Monday',
      minTemp: 12,
      maxTemp: 15,
      currentTemp: 13,
      windSpeed: 5,
      airPressure: 1002,
      humidity: 9,
    )
  ];

  @override
  void initState() {
    currentWeather = weatherList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                WeatherDetailsCard(weather: currentWeather),
                WeatherCarousel(
                    weatherList: weatherList.sublist(1), onTap: _onTap),
              ],
            );
          }),
        ),
      ),
    );
  }

  void _onTap(WeatherModel weather) {
    setState(() {
      currentWeather = weather;
    });
  }
}
