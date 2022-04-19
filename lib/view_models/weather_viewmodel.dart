import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather/city.dart';
import 'package:weather_app/services/weather/weather_service.dart';
import 'package:weather_app/view_models/mixins/internet_checking.dart';

class WeatherViewModel extends ChangeNotifier with InternetChecking {
  WeatherViewModel(this._cityList, this._service);

  final List<City> _cityList;
  final WeatherService _service;

  String? _cityName;

  String get cityName => _cityName ?? _cityList.first.name;

  set cityName(String name) {
    _cityName = name;
    notifyListeners();
  }

  List<City> get cityList => _cityList;

  Stream<WeatherModel> getCurrentWeatherStream(String cityName) async* {
    await makeErrorInInternetNotAvailableCase();
    yield* _service.getCurrentWeatherByCityName(cityName);
  }
}
