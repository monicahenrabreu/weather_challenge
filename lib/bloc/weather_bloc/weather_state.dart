import 'package:equatable/equatable.dart';
import 'package:weather_challenge/data/models/weather_model.dart';

class WeatherState extends Equatable {
  final bool? isLoading;
  final WeatherModel? currentWeather;
  final List<WeatherModel>? weatherList;

  const WeatherState({this.isLoading, this.currentWeather, this.weatherList});

  WeatherState copyWith({
    bool? isLoading,
    WeatherModel? currentWeather,
    List<WeatherModel>? weatherList,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      currentWeather: currentWeather ?? this.currentWeather,
      weatherList: weatherList ?? this.weatherList,
    );
  }

  WeatherLoadingState copyLoading({
    bool? isLoading,
  }) {
    return WeatherLoadingState(
      isLoading: isLoading ?? this.isLoading,
      currentWeather: currentWeather,
      weatherList: weatherList,
    );
  }

  WeatherLoadedState copyLoaded({
    WeatherModel? currentWeather,
    List<WeatherModel>? weatherList,
    bool? isCelsius,
  }) {
    return WeatherLoadedState(
      currentWeather: currentWeather ?? this.currentWeather,
      weatherList: weatherList ?? this.weatherList,
    );
  }

  WeatherErrorState copyError() {
    return WeatherErrorState();
  }

  @override
  List<Object?> get props => [isLoading, currentWeather, weatherList];
}

class WeatherInitialState extends WeatherState {
  WeatherInitialState()
      : super(
          isLoading: false,
          currentWeather: null,
          weatherList: List.of([]),
        );
}

class WeatherLoadingState extends WeatherState {
  WeatherLoadingState({
    bool? isLoading,
    WeatherModel? currentWeather,
    List<WeatherModel>? weatherList,
  }) : super(
            isLoading: isLoading,
            currentWeather: currentWeather,
            weatherList: weatherList);
}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState({
    WeatherModel? currentWeather,
    List<WeatherModel>? weatherList,
  }) : super(
          isLoading: false,
          currentWeather: currentWeather,
          weatherList: weatherList,
        );
}

class WeatherErrorState extends WeatherState {
  WeatherErrorState()
      : super(
          isLoading: false,
          currentWeather: null,
          weatherList: List.of([]),
        );
}
