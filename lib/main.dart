import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_challenge/data/provider/api_weather_provider.dart';
import 'package:weather_challenge/bloc/weather_bloc/bloc.dart';
import 'package:weather_challenge/data/provider/location_provider.dart';
import 'package:weather_challenge/weather_app.dart';

void main() {
  ApiWeatherProvider apiWeatherProvider = ApiWeatherProvider();
  LocationProvider locationProvider = LocationProvider();

  runApp(BlocProvider(
    create: (_) => WeatherBloc(
      apiWeatherProvider: apiWeatherProvider,
      locationProvider: locationProvider,
    ),
    child: const WeatherApp(),
  ));
}
