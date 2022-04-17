import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/secure.dart';
import 'package:weather_app/services/weather/city.dart';
import 'package:weather_app/services/weather/weather_service.dart';
import 'package:weather_app/services/weather/weather_service_impl.dart';
import 'package:weather_app/services/worldclock/worldclock_service.dart';
import 'package:weather_app/services/worldclock/worldclock_service_impl.dart';
import 'package:weather_app/view_models/datetime_viewmodel.dart';
import 'package:weather_app/view_models/weather_viewmodel.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton<WorldClockService>(
    WorldClockServiceImpl(),
  );

  serviceLocator.registerSingleton<WeatherService>(() {
    final wf = WeatherFactory(weatherApiKey);
    return WeatherServiceImpl(wf);
  }());

  serviceLocator.registerSingleton<DateTimeViewModel>(
    DateTimeViewModel(
      serviceLocator<WorldClockService>(),
    ),
  );

  serviceLocator.registerSingletonAsync<WeatherViewModel>(() async {
    // Loading city list from json file
    final jsonStr = await rootBundle.loadString('assets/simple.city.list.json');
    final cityListJson = json.decode(jsonStr);
    final cityList = List<City>.from(cityListJson.map((e) => City.fromJson(e)));
    // Weather service
    final weatherService = serviceLocator<WeatherService>();

    return WeatherViewModel(cityList, weatherService);
  });
}
