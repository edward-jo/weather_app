import 'package:weather/weather.dart';

class WeatherModel {
  WeatherModel(this._weather);

  final Weather _weather;

  Temperature? get temperature => _weather.temperature;

  String? get description => _weather.weatherDescription;

  String? get iconInfo => _weather.weatherIcon;

  DateTime? get dateTime => _weather.date;
}
