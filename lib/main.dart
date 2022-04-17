import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/service_locator.dart';
import 'package:weather_app/view_models/datetime_viewmodel.dart';
import 'package:weather_app/view_models/weather_viewmodel.dart';
import 'package:weather_app/views/weather/weather_screen.dart';

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
        future: serviceLocator.allReady(),
        builder: (context, snapshot) {
          /// Show indicator until services are ready
          if (snapshot.connectionState != ConnectionState.done) {
            return Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          }

          /// Show failure message if failed to init services
          if (snapshot.hasError) {
            return Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  snapshot.error.toString(),
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          }

          /// Start app
          return MaterialApp(
            title: 'Studypie',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
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
