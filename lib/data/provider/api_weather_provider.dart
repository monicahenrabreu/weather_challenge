import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weather_challenge/configs/constants.dart';
import 'package:weather_challenge/data/models/location_weather.dart';
import 'package:weather_challenge/data/models/location_woeid_weather.dart';
import 'package:weather_challenge/data/models/weather.dart';
import 'package:weather_challenge/data/models/weather_model.dart';
import 'package:weather_challenge/data/transform/transform.dart';
import 'package:weather_challenge/utils/utils.dart';

class ApiWeatherProvider {
  Future<List<WeatherModel>?>? getWeatherListByLocation(
      Position position) async {
    final Uri _url = Uri.https(
        Constants.API_WEATHER_URL,
        Constants.SEARCH_LOCATION,
        {Constants.LAT_LONG: '${position.latitude},${position.longitude}'});

    var response = await http.get(_url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      //is only needed the first location since is the nearest one
      LocationWeather locationWeather = LocationWeather.fromJson(body.first);

      if (locationWeather.woeid != null) {
        List<WeatherModel>? weatherModelList =
            await _getWeatherList(locationWeather.woeid.toString());
        return weatherModelList;
      }

      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }

  Future<WeatherModel?>? getCurrentWeather(String woeid) async {
    final String formattedDay = dateFormatted(DateTime.now());

    final Uri _urlLocation = Uri.https(
        Constants.API_WEATHER_URL, '${Constants.LOCATION}$woeid/$formattedDay');

    var responseLocation = await http.get(_urlLocation);

    if (responseLocation.statusCode == 200) {
      List<dynamic> bodyLocation = jsonDecode(responseLocation.body);
      Weather weather = Weather.fromJson(bodyLocation.first);

      WeatherModel weatherModel =
          transformWeatherIntoWeatherModel(weather, woeid);
      return weatherModel;
    }

    print('Request failed with status: ${responseLocation.statusCode}.');
    return null;
  }

  Future<List<WeatherModel>?> _getWeatherList(String woeid) async {
    final Uri _urlLocation =
        Uri.https(Constants.API_WEATHER_URL, '${Constants.LOCATION}${woeid}/');

    var responseLocation = await http.get(_urlLocation);

    if (responseLocation.statusCode == 200) {
      dynamic bodyLocation = jsonDecode(responseLocation.body);

      LocationWoeidWeather locationWoeidWeather =
          LocationWoeidWeather.fromJson(bodyLocation);

      List<WeatherModel>? weatherList =
          locationWoeidWeather.consolidated_weather?.map((Weather weather) {
        WeatherModel weatherModel =
            transformWeatherIntoWeatherModel(weather, woeid);
        return weatherModel;
      }).toList();

      //the first element, which is the weather of the day, will be descarted
      //since the getCurrentWeather method retrieves the updated weather (by 3 hours)
      return weatherList?.sublist(1);
    }
  }
}
