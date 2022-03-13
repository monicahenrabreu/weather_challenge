import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final String? weather_state_name;
  final String? weather_state_abbr;
  final String? wind_direction_compass;
  final DateTime? created;
  final String? applicable_date;
  final double? min_temp;
  final double? max_temp;
  final double? the_temp;
  final double? wind_speed;
  final double? wind_direction;
  final double? air_pressure;
  final double? humidity;
  final double? visibility;
  final double? predictability;

  Weather(
      this.weather_state_name,
      this.weather_state_abbr,
      this.wind_direction_compass,
      this.created,
      this.applicable_date,
      this.min_temp,
      this.max_temp,
      this.the_temp,
      this.wind_speed,
      this.wind_direction,
      this.air_pressure,
      this.humidity,
      this.visibility,
      this.predictability);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
