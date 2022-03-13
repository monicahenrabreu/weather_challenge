import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_challenge/data/models/weather_model.dart';

class WeatherState extends Equatable {
  final bool? isLoading;
  final WeatherModel? currentWeather;
  final Position? currentPosition;
  final String? woeid;
  final List<WeatherModel>? weatherList;
  final bool? isCelsius;

  const WeatherState({
    this.isLoading,
    this.currentWeather,
    this.currentPosition,
    this.woeid,
    this.weatherList,
    this.isCelsius,
  });

  WeatherState copyWith({
    bool? isLoading,
    WeatherModel? currentWeather,
    Position? currentPosition,
    String? woeid,
    List<WeatherModel>? weatherList,
    bool? isCelsius,
  }) {
    return WeatherState(
        isLoading: isLoading ?? this.isLoading,
        currentWeather: currentWeather ?? this.currentWeather,
        currentPosition: currentPosition ?? this.currentPosition,
        woeid: woeid ?? this.woeid,
        weatherList: weatherList ?? this.weatherList,
        isCelsius: isCelsius ?? this.isCelsius);
  }

  WeatherLoadingState copyLoading({
    bool? isLoading,
  }) {
    return WeatherLoadingState(
        isLoading: isLoading ?? this.isLoading,
        currentWeather: currentWeather,
        currentPosition: currentPosition,
        woeid: woeid,
        weatherList: weatherList,
        isCelsius: isCelsius);
  }

  WeatherLoadedState copyLoaded({
    WeatherModel? currentWeather,
    List<WeatherModel>? weatherList,
    Position? currentPosition,
    String? woeid,
    bool? isCelsius,
  }) {
    return WeatherLoadedState(
        currentWeather: currentWeather ?? this.currentWeather,
        currentPosition: currentPosition ?? this.currentPosition,
        woeid: woeid ?? this.woeid,
        weatherList: weatherList ?? this.weatherList,
        isCelsius: isCelsius ?? this.isCelsius);
  }

  WeatherErrorState copyError() {
    return WeatherErrorState();
  }

  @override
  List<Object?> get props => [
        isLoading,
        currentWeather,
        currentPosition,
        woeid,
        weatherList,
        isCelsius
      ];
}

class WeatherInitialState extends WeatherState {
  WeatherInitialState()
      : super(
            isLoading: false,
            currentWeather: null,
            currentPosition: null,
            woeid: null,
            weatherList: List.of([]),
            isCelsius: true);
}

class WeatherLoadingState extends WeatherState {
  WeatherLoadingState(
      {bool? isLoading,
      WeatherModel? currentWeather,
      Position? currentPosition,
      String? woeid,
      List<WeatherModel>? weatherList,
      bool? isCelsius})
      : super(
            isLoading: isLoading,
            currentWeather: currentWeather,
            currentPosition: currentPosition,
            woeid: woeid,
            weatherList: weatherList,
            isCelsius: isCelsius);
}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(
      {WeatherModel? currentWeather,
      Position? currentPosition,
      String? woeid,
      List<WeatherModel>? weatherList,
      bool? isCelsius})
      : super(
            isLoading: false,
            currentWeather: currentWeather,
            currentPosition: currentPosition,
            woeid: woeid,
            weatherList: weatherList,
            isCelsius: isCelsius);
}

class WeatherErrorState extends WeatherState {
  WeatherErrorState()
      : super(
            isLoading: false,
            currentWeather: null,
            currentPosition: null,
            woeid: null,
            weatherList: List.of([]),
            isCelsius: true);
}
