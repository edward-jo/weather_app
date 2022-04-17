import 'dart:developer' as developer;

import 'package:weather/weather.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/services/weather/weather_service.dart';

class WeatherServiceImpl implements WeatherService {
  WeatherServiceImpl(this._wf);

  final WeatherFactory _wf;

  @override
  Stream<Weather> getCurrentWeatherByCityName(String cityName) async* {
    yield await _getCurrentWeatherByCityName(cityName);
    yield* Stream.periodic(const Duration(seconds: weatherFetchPeriodSecs))
        .asyncMap((_) => _getCurrentWeatherByCityName(cityName));
  }

  Future<Weather> _getCurrentWeatherByCityName(String cityName) async {
    try {
      var weather = await _wf.currentWeatherByCityName(cityName);
      developer.log('Weather: \n${weather.toString()}');
      return weather;
    } catch (e) {
      return Future.error('No Weather Data( ${e.toString()} )');
    }
  }
}
