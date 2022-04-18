import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/service_locator.dart';
import 'package:weather_app/view_models/datetime_viewmodel.dart';
import 'package:weather_app/view_models/weather_viewmodel.dart';
import 'package:weather_app/views/common/platform_circular_indicator.dart';
import 'package:weather_app/views/themes/theme.dart';
import 'package:weather_app/views/weather/weather_screen.dart';

import 'constants.dart';

void main() async {
  /// Load environment variables
  await dotenv.load();

  /// Setup services
  setupServiceLocator();

  /// Bind and create widget tree
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: serviceLocator.allReady(
          timeout: const Duration(seconds: serviceSetupTimeoutSecs),
        ),
        builder: (context, snapshot) {
          /// Show indicator until services are ready
          if (snapshot.connectionState != ConnectionState.done) {
            return Container(
              color: Colors.white,
              child: const Center(
                child: PlatformCircularIndicator(),
              ),
            );
          }

          /// Show failure message if failed to init services
          if (snapshot.hasError) {
            return Container(
              color: Colors.white,
              child: Center(
                child: _BuilderError(error: snapshot.error!),
              ),
            );
          }

          /// Start app
          return MaterialApp(
            title: 'Studypie',
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            home: MultiProvider(
              providers: [
                ChangeNotifierProvider.value(
                  value: serviceLocator<DateTimeViewModel>(),
                ),
                ChangeNotifierProvider.value(
                  value: serviceLocator<WeatherViewModel>(),
                ),
              ],
              child: const WeatherScreen(),
            ),
          );
        });
  }
}

/// Widget that checks error type and show error message
///
class _BuilderError extends StatelessWidget {
  const _BuilderError({Key? key, required this.error}) : super(key: key);

  final Object error;

  @override
  Widget build(BuildContext context) {
    String message;

    if (error is WaitingTimeOutException) {
      final exception = error as WaitingTimeOutException;
      developer.log('Timeout: Not ready( ${exception.notReadyYet.length} )');
      for (var e in exception.notReadyYet) {
        developer.log(e);
      }
      message = 'Timeout error. Please restart app';
    } else {
      message = error.toString();
    }

    return Text(
      message,
      textDirection: TextDirection.ltr,
      style: const TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}
