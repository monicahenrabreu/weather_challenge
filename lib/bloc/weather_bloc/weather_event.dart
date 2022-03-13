import 'package:equatable/equatable.dart';
import 'package:weather_challenge/data/models/weather_model.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetWeatherListByLocation extends WeatherEvent {
  GetWeatherListByLocation();

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

class SwitchTemperatureUnitEvent extends WeatherEvent {
  SwitchTemperatureUnitEvent();

  @override
  List<Object?> get props => [];
}
