import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/service_locator.dart';
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
    return MaterialApp(
      title: 'Studypie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(),
    );
  }
}
