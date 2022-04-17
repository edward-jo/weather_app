// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      json['id'] as int,
      json['name'] as String,
      json['state'] as String,
      json['country'] as String,
      Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'state': instance.state,
      'country': instance.country,
      'coord': instance.coord,
    };
