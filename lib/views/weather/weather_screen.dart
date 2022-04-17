import 'package:flutter/material.dart';
import 'package:weather_app/views/weather/datetime_widget.dart';
import 'package:weather_app/views/weather/weather_widget.dart';

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
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            const Expanded(
              child: DateTimeWidget(),
              flex: 4,
            ),
            const Expanded(
              child: WeatherWidget(),
              flex: 4,
            ),
            Expanded(
              child: Container(color: Colors.green),
              flex: 2,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
