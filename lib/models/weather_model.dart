import 'package:weather/weather.dart';

class WeatherModel {
  WeatherModel(this._weather);

  final Weather _weather;

  String? get cityName => _weather.areaName;

  double get temperature => _weather.temperature?.celsius ?? 0;

  String? get description => _weather.weatherDescription;

  String? get iconInfo => _weather.weatherIcon;

  DateTime? get dateTime => _weather.date;
}
