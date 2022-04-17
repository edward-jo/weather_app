import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/secure.dart';
import 'package:weather_app/services/weather/city.dart';
import 'package:weather_app/services/weather/weather_service.dart';
import 'package:weather_app/services/weather/weather_service_impl.dart';
import 'package:weather_app/services/worldclock/worldclock_service.dart';
import 'package:weather_app/services/worldclock/worldclock_service_impl.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton<WorldClockService>(WorldClockServiceImpl());

  serviceLocator.registerSingleton<WeatherService>(() {
    final wf = WeatherFactory(weatherApiKey);
    return WeatherServiceImpl(wf);
  }());

  // XXX: Test loading city list
  serviceLocator.registerSingletonAsync<List<City>>(() async {
    // TODO: Handle exception
    final jsonStr = await rootBundle.loadString('assets/simple.city.list.json');
    final cityListJson = json.decode(jsonStr);
    final cityList = List<City>.from(cityListJson.map((e) => City.fromJson(e)));
    for (final c in cityList) {
      developer.log(c.toJson().toString());
    }
    return cityList;
  });
}
