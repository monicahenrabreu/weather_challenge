import 'package:weather_challenge/data/models/weather.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/utils/utils.dart';

WeatherModel transformWeatherIntoWeatherModel(Weather weather, String woeid) {
  String weekDay = parseDateToWeekDay(day: weather.applicable_date!);
  String abbrWeekDay = parseDateToWeekDay(
      day: weather.applicable_date!, configureDate: ConfigureDate.weekAbbrDay);

  double currentTempFareheit = convertCelsiusToFahrenheit(weather.the_temp!);
  double minTempFareheit = convertCelsiusToFahrenheit(weather.min_temp!);
  double maxTempFareheit = convertCelsiusToFahrenheit(weather.max_temp!);

  WeatherModel? weatherModel = WeatherModel(
    woeid: woeid,
    weatherState: weather.weather_state_name,
    weatherStateImage: weather.weather_state_abbr,
    dateAbbr: abbrWeekDay,
    date: weekDay,
    minTemp: weather.min_temp?.round(),
    minTempFahreneit: minTempFareheit.round(),
    maxTemp: weather.max_temp?.round(),
    maxTempFahreneit: maxTempFareheit.round(),
    currentTemp: weather.the_temp?.round(),
    currentTempFahreneit: currentTempFareheit.round(),
    windSpeed: weather.wind_speed,
    airPressure: weather.air_pressure,
    humidity: weather.humidity,
  );

  return weatherModel;
}
