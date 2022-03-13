// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_woeid_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationWoeidWeather _$LocationWoeidWeatherFromJson(
        Map<String, dynamic> json) =>
    LocationWoeidWeather(
      (json['consolidated_weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['woeid'] as int?,
    );

Map<String, dynamic> _$LocationWoeidWeatherToJson(
        LocationWoeidWeather instance) =>
    <String, dynamic>{
      'consolidated_weather': instance.consolidated_weather,
      'woeid': instance.woeid,
    };
