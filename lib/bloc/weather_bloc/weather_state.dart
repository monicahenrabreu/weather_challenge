import 'package:equatable/equatable.dart';
import 'package:weather_challenge/data/models/weather_model.dart';

class WeatherState extends Equatable {
  final bool? isLoading;
  final WeatherModel? currentWeather;
  final List<WeatherModel>? weatherList;
  final bool? isCelsius;

  const WeatherState({
    this.isLoading,
    this.currentWeather,
    this.weatherList,
    this.isCelsius,
  });

  WeatherState copyWith({
    bool? isLoading,
    WeatherModel? currentWeather,
    List<WeatherModel>? weatherList,
    bool? isCelsius,
  }) {
    return WeatherState(
        isLoading: isLoading ?? this.isLoading,
        currentWeather: currentWeather ?? this.currentWeather,
        weatherList: weatherList ?? this.weatherList,
        isCelsius: isCelsius ?? this.isCelsius);
  }

  WeatherLoadingState copyLoading({
    bool? isLoading,
  }) {
    return WeatherLoadingState(
        isLoading: isLoading ?? this.isLoading,
        currentWeather: currentWeather,
        weatherList: weatherList,
        isCelsius: isCelsius);
  }

  WeatherLoadedState copyIsCelsius({
    bool? isCelsius,
  }) {
    return WeatherLoadedState(isCelsius: isCelsius ?? this.isCelsius);
  }

  WeatherLoadedState copyLoaded({
    WeatherModel? currentWeather,
    List<WeatherModel>? weatherList,
    bool? isCelsius,
  }) {
    return WeatherLoadedState(
        currentWeather: currentWeather ?? this.currentWeather,
        weatherList: weatherList ?? this.weatherList,
        isCelsius: isCelsius ?? this.isCelsius);
  }

  WeatherErrorState copyError() {
    return WeatherErrorState();
  }

  @override
  List<Object?> get props =>
      [isLoading, currentWeather, weatherList, isCelsius];
}

class WeatherInitialState extends WeatherState {
  WeatherInitialState()
      : super(
            isLoading: false,
            currentWeather: null,
            weatherList: List.of([]),
            isCelsius: true);
}

class WeatherLoadingState extends WeatherState {
  WeatherLoadingState(
      {bool? isLoading,
      WeatherModel? currentWeather,
      List<WeatherModel>? weatherList,
      bool? isCelsius})
      : super(
            isLoading: isLoading,
            currentWeather: currentWeather,
            weatherList: weatherList,
            isCelsius: isCelsius);
}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(
      {WeatherModel? currentWeather,
      List<WeatherModel>? weatherList,
      bool? isCelsius})
      : super(
            isLoading: false,
            currentWeather: currentWeather,
            weatherList: weatherList,
            isCelsius: isCelsius);
}

class WeatherErrorState extends WeatherState {
  WeatherErrorState()
      : super(
            isLoading: false,
            currentWeather: null,
            weatherList: List.of([]),
            isCelsius: true);
}
