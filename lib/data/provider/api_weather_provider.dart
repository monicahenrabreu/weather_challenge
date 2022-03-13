import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_challenge/configs/constants.dart';
import 'package:weather_challenge/data/models/location_weather.dart';
import 'package:weather_challenge/data/models/location_woeid_weather.dart';
import 'package:weather_challenge/data/models/weather.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/utils/utils.dart';

class ApiWeatherProvider {

  Future<List<WeatherModel>?>? getWeatherByLocation() async {

    final Uri _url = Uri.https(
        Constants.API_WEATHER_URL,
        Constants.SEARCH_LOCATION,
        {Constants.LAT_LONG: '36.96,-122.02'});

    var response = await http.get(_url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<LocationWeather> locationWeathers =
          body.map((e) => LocationWeather.fromJson(e)).toList();

      if (locationWeathers != null || locationWeathers.isNotEmpty) {
        final Uri _urlLocation = Uri.https(Constants.API_WEATHER_URL,
            '${Constants.LOCATION}${locationWeathers.first.woeid}/');

        var responseLocation = await http.get(_urlLocation);

        if (responseLocation.statusCode == 200) {
          dynamic bodyLocation = jsonDecode(responseLocation.body);

          LocationWoeidWeather locationWoeidWeather = LocationWoeidWeather.fromJson(bodyLocation);

          List<WeatherModel>? weatherList =
              locationWoeidWeather.consolidated_weather?.map((Weather weather) {
            String weekDay = parseDateToWeekDay(day: weather.applicable_date!);
            String abbrWeekDay = parseDateToWeekDay(
                day: weather.applicable_date!,
                configureDate: ConfigureDate.weekAbbrDay);

            return WeatherModel(
              weatherState: weather.weather_state_name,
              weatherStateImage: weather.weather_state_abbr,
              dateAbbr: abbrWeekDay,
              date: weekDay,
              minTemp: weather.min_temp?.round(),
              maxTemp: weather.max_temp?.round(),
              currentTemp: weather.the_temp?.round(),
              windSpeed: weather.wind_speed,
              airPressure: weather.air_pressure,
              humidity: weather.humidity,
            );
          }).toList();

          return weatherList?.sublist(1);
        }
      }

      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }

  Future<WeatherModel?>? getCurrentWeather() async {

    final String formattedDay = dateFormatted(DateTime.now());

    final Uri _urlLocation = Uri.https(Constants.API_WEATHER_URL,
        '${Constants.LOCATION}44418/${formattedDay}');

    var responseLocation = await http.get(_urlLocation);

    if (responseLocation.statusCode == 200) {
      List<dynamic> bodyLocation = jsonDecode(responseLocation.body);

      Weather locationWeathers = Weather.fromJson(bodyLocation.first);

      String weekDay =
          parseDateToWeekDay(day: locationWeathers.applicable_date!);
      String abbrWeekDay = parseDateToWeekDay(
          day: locationWeathers.applicable_date!,
          configureDate: ConfigureDate.weekAbbrDay);

      WeatherModel? weatherModel = WeatherModel(
        weatherState: locationWeathers.weather_state_name,
        weatherStateImage: locationWeathers.weather_state_abbr,
        dateAbbr: abbrWeekDay,
        date: weekDay,
        minTemp: locationWeathers.min_temp?.round(),
        maxTemp: locationWeathers.max_temp?.round(),
        currentTemp: locationWeathers.the_temp?.round(),
        windSpeed: locationWeathers.wind_speed,
        airPressure: locationWeathers.air_pressure,
        humidity: locationWeathers.humidity,
      );

      return weatherModel;
    }

    print('Request failed with status: ${responseLocation.statusCode}.');
    return null;
  }
}
