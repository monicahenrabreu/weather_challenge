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
    on<GetWeatherListByLocation>(_onGetWeatherListByLocationEvent);
    on<GetCurrentWeatherEvent>(_onGetCurrentWeatherEvent);
    on<SwitchCurrentWeatherEvent>(_onSwitchCurrentWeatherEvent);
    on<SwitchTemperatureUnitEvent>(_onSwitchTemperatureUnitEvent);
  }

  void _onGetWeatherListByLocationEvent(
      GetWeatherListByLocation event, Emitter<WeatherState> emit) async {
    emit(state.copyLoading(isLoading: true));

    Position? currentPosition = state.copyWith().currentPosition ??
        await locationProvider.getCurrentLocation();

    List<WeatherModel>? weatherList =
        await apiWeatherProvider.getWeatherListByLocation(currentPosition);

    if (weatherList == null) {
      emit(state.copyError());
      return;
    }

    String woied = state.woeid ?? weatherList.first.woeid;

    WeatherModel? currentWeather =
        await apiWeatherProvider.getCurrentWeather(woied);

    if (currentWeather == null) {
      emit(state.copyError());
      return;
    }

    emit(state.copyLoaded(
        currentWeather: currentWeather,
        currentPosition: currentPosition,
        weatherList: weatherList,
        woeid: woied));
  }

  void _onGetCurrentWeatherEvent(
      GetCurrentWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyLoading(isLoading: true));

    Position? position = state.copyWith().currentPosition;
    String woeid = state.copyWith().woeid!;

    WeatherModel? newWeather =
        await apiWeatherProvider.getCurrentWeather(woeid);

    if (newWeather == null) {
      emit(state.copyError());
      return;
    }

    emit(state.copyLoaded(
        currentWeather: newWeather, currentPosition: position));
  }

  void _onSwitchCurrentWeatherEvent(
      SwitchCurrentWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyLoading(isLoading: true));
    WeatherModel weather = event.weather;
    emit(state.copyLoaded(currentWeather: weather));
  }

  void _onSwitchTemperatureUnitEvent(
      SwitchTemperatureUnitEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyLoading(isLoading: true));
    bool? isCelsius = state.copyWith().isCelsius;
    emit(state.copyLoaded(isCelsius: !isCelsius!));
  }
}
