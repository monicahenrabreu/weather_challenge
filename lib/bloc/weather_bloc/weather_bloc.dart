import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/data/provider/api_weather_provider.dart';
import 'bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final ApiWeatherProvider provider;

  WeatherBloc(this.provider) : super(WeatherInitialState()) {
    on<GetWeatherByLocationEvent>(_onGetWeatherByLocationEvent);
    on<GetCurrentWeatherEvent>(_onGetCurrentWeatherEvent);
    on<SwitchCurrentWeatherEvent>(_onSwitchCurrentWeatherEvent);
    on<SwitchTemperatureEvent>(_onSwitchTemperatureEvent);
  }

  void _onGetWeatherByLocationEvent(
      GetWeatherByLocationEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyLoading(isLoading: true));

    List<WeatherModel>? weatherList = await provider.getWeatherByLocation();

    if (weatherList == null) {
      emit(state.copyError());
      return;
    }

    WeatherModel? currentWeather = await provider.getCurrentWeather();

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
    WeatherModel? currentWeather = await provider.getCurrentWeather();

    if (currentWeather == null) {
      emit(state.copyError());
      return;
    }

    emit(state.copyLoaded(currentWeather: currentWeather));
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
