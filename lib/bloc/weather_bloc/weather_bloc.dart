import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/data/provider/api_weather_provider.dart';
import 'package:weather_challenge/data/provider/location_provider.dart';
import 'bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final LocationProvider locationProvider;
  final ApiWeatherProvider apiWeatherProvider;

  WeatherBloc(
      {required this.locationProvider, required this.apiWeatherProvider})
      : super(WeatherInitialState()) {
    on<GetWeatherByLocationEvent>(_onGetWeatherByLocationEvent);
    on<GetCurrentWeatherEvent>(_onGetCurrentWeatherEvent);
    on<SwitchCurrentWeatherEvent>(_onSwitchCurrentWeatherEvent);
    on<SwitchTemperatureEvent>(_onSwitchTemperatureEvent);
  }

  void _onGetWeatherByLocationEvent(
      GetWeatherByLocationEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyLoading(isLoading: true));

    Position? currentPosition = state.copyWith().currentPosition ??
        await locationProvider.getCurrentLocation();

    List<WeatherModel>? weatherList =
        await apiWeatherProvider.getWeatherByLocation(currentPosition);

    if (weatherList == null) {
      emit(state.copyError());
      return;
    }

    WeatherModel? currentWeather =
        await apiWeatherProvider.getCurrentWeather(weatherList.first.woeid);

    if (currentWeather == null) {
      emit(state.copyError());
      return;
    }

    emit(state.copyLoaded(
        currentWeather: currentWeather, weatherList: weatherList));
  }

  void _onGetCurrentWeatherEvent(
      GetCurrentWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyLoading(isLoading: true));

    WeatherModel? currentWeather = state.copyWith().currentWeather;

    if (currentWeather == null) {
      emit(state.copyError());
      return;
    }

    WeatherModel? newWeather =
        await apiWeatherProvider.getCurrentWeather(currentWeather.woeid);

    if (newWeather == null) {
      emit(state.copyError());
      return;
    }

    emit(state.copyLoaded(currentWeather: newWeather));
  }

  void _onSwitchCurrentWeatherEvent(
      SwitchCurrentWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyLoading(isLoading: true));
    WeatherModel weather = event.weather;
    emit(state.copyLoaded(currentWeather: weather));
  }

  void _onSwitchTemperatureEvent(
      SwitchTemperatureEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyLoading(isLoading: true));
    bool? isCelsius = state.copyWith().isCelsius;
    emit(state.copyLoaded(isCelsius: !isCelsius!));
  }
}
