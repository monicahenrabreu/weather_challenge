// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      json['weather_state_name'] as String?,
      json['weather_state_abbr'] as String?,
      json['wind_direction_compass'] as String?,
      json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      json['applicable_date'] as String?,
      (json['min_temp'] as num?)?.toDouble(),
      (json['max_temp'] as num?)?.toDouble(),
      (json['the_temp'] as num?)?.toDouble(),
      (json['wind_speed'] as num?)?.toDouble(),
      (json['wind_direction'] as num?)?.toDouble(),
      (json['air_pressure'] as num?)?.toDouble(),
      (json['humidity'] as num?)?.toDouble(),
      (json['visibility'] as num?)?.toDouble(),
      (json['predictability'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'weather_state_name': instance.weather_state_name,
      'weather_state_abbr': instance.weather_state_abbr,
      'wind_direction_compass': instance.wind_direction_compass,
      'created': instance.created?.toIso8601String(),
      'applicable_date': instance.applicable_date,
      'min_temp': instance.min_temp,
      'max_temp': instance.max_temp,
      'the_temp': instance.the_temp,
      'wind_speed': instance.wind_speed,
      'wind_direction': instance.wind_direction,
      'air_pressure': instance.air_pressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
    };
