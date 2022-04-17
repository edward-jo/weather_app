import 'package:flutter/material.dart';

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
              onPressed: () {},
              child: const Text('Get DateTime Data'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Get Weather Data'),
            ),
          ],
        ),
      ),
    );
  }
}
