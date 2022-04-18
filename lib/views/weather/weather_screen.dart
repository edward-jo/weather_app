import 'package:flutter/material.dart';
import 'package:weather_app/views/weather/citylist_widget.dart';
import 'package:weather_app/views/weather/datetime_widget.dart';
import 'package:weather_app/views/weather/weather_widget.dart';

/// Widget that shows current date, weather, and city list.
/// Weather info is changed by selecting city on [CityListWidget].
///
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Weather'))),
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          children: const <Widget>[
            Expanded(
              child: DateTimeWidget(),
              flex: 4,
            ),
            Expanded(
              child: WeatherWidget(),
              flex: 4,
            ),
            Expanded(
              child: CityListWidget(),
              flex: 2,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
