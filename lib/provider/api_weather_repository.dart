import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/provider/api_weather_provider.dart';

class ApiWeatherRepository {
  final _provider = ApiWeatherProvider();

  Future<List<WeatherModel>?> getWeatherByLocation() async {
    return await _provider.getWeatherByLocation();
  }

  Future<WeatherModel?>? getCurrentWeather() async {
    return await _provider.getCurrentWeather();
  }
}
