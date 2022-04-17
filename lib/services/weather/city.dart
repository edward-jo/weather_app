import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/services/weather/coordinates.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final int id;
  final String name;
  final String state;
  final String country;
  final Coordinates coord;

  City(this.id, this.name, this.state, this.country, this.coord);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
