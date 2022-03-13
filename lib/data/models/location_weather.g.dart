// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationWeather _$LocationWeatherFromJson(Map<String, dynamic> json) =>
    LocationWeather(
      json['title'] as String?,
      json['location_type'] as String?,
      json['woeid'] as int?,
      json['latt_long'] as String?,
    );

Map<String, dynamic> _$LocationWeatherToJson(LocationWeather instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location_type': instance.location_type,
      'woeid': instance.woeid,
      'latt_long': instance.latt_long,
    };
