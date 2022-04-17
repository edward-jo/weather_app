import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:weather_app/service_locator.dart';
import 'package:weather_app/services/weather/weather_service.dart';
import 'package:weather_app/services/worldclock/worldclock_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () async {
                await serviceLocator<WorldClockService>().getCurrentDateTime();
              },
              child: const Text('Get DateTime Data'),
            ),
            TextButton(
              onPressed: () async {
                // XXX: Test weather data fetching
                final stream = serviceLocator<WeatherService>()
                    .getCurrentWeatherByCityName('Seoul');
                await for (var weather in stream) {
                  developer.log(weather.toString());
                }
              },
              child: const Text('Get Weather Data'),
            ),
          ],
        ),
      ),
    );
  }
}
