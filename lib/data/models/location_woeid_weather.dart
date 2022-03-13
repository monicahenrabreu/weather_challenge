import 'package:json_annotation/json_annotation.dart';
import 'package:weather_challenge/data/models/weather.dart';

part 'location_woeid_weather.g.dart';

@JsonSerializable()
class LocationWoeidWeather {
  final List<Weather>? consolidated_weather;

  LocationWoeidWeather(this.consolidated_weather);

  factory LocationWoeidWeather.fromJson(Map<String, dynamic> json) =>
      _$LocationWoeidWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$LocationWoeidWeatherToJson(this);
}
