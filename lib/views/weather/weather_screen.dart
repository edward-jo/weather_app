import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/service_locator.dart';
import 'package:weather_app/services/weather/weather_service.dart';
import 'package:weather_app/view_models/datetime_viewmodel.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late final DateTimeViewModel _dateTimeVM;

  @override
  void initState() {
    super.initState();
    _dateTimeVM = context.read<DateTimeViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () async {
                final dateTime = await _dateTimeVM.fetchCurrentDateTime();
                developer.log('${dateTime.weekday}, ${dateTime.date}');
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
