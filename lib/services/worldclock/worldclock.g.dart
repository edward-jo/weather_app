// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worldclock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorldClock _$WorldClockFromJson(Map<String, dynamic> json) => WorldClock(
      id: json[r'$id'] as String,
      currentDateTime: DateTime.parse(json['currentDateTime'] as String),
      utcOffset: json['utcOffset'] as String,
      isDayLightSavingsTime: json['isDayLightSavingsTime'] as bool,
      dayOfTheWeek: json['dayOfTheWeek'] as String,
      timeZoneName: json['timeZoneName'] as String,
      currentFileTime: (json['currentFileTime'] as num).toDouble(),
      ordinalDate: json['ordinalDate'] as String,
      serviceResponse: json['serviceResponse'] as String?,
    );

Map<String, dynamic> _$WorldClockToJson(WorldClock instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      'currentDateTime': instance.currentDateTime.toIso8601String(),
      'utcOffset': instance.utcOffset,
      'isDayLightSavingsTime': instance.isDayLightSavingsTime,
      'dayOfTheWeek': instance.dayOfTheWeek,
      'timeZoneName': instance.timeZoneName,
      'currentFileTime': instance.currentFileTime,
      'ordinalDate': instance.ordinalDate,
      'serviceResponse': instance.serviceResponse,
    };
