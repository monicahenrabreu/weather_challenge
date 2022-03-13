import 'package:equatable/equatable.dart';
import 'package:weather_challenge/data/models/weather_model.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetWeatherByLocationEvent extends WeatherEvent {
  GetWeatherByLocationEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrentWeatherEvent extends WeatherEvent {
  GetCurrentWeatherEvent();

  @override
  List<Object?> get props => [];
}

class SwitchCurrentWeatherEvent extends WeatherEvent {
  final WeatherModel weather;

  SwitchCurrentWeatherEvent(this.weather);

  @override
  List<Object?> get props => [weather];
}
