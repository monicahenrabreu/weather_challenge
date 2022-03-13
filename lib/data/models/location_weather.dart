import 'package:json_annotation/json_annotation.dart';

part 'location_weather.g.dart';

@JsonSerializable()
class LocationWeather {
  final String? title;
  final String? location_type;
  final int? woeid;
  final String? latt_long;

  LocationWeather(
      this.title,
      this.location_type,
      this.woeid,
      this.latt_long);

  factory LocationWeather.fromJson(Map<String, dynamic> json) =>
      _$LocationWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$LocationWeatherToJson(this);
}
