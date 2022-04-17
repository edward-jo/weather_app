import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:weather_app/view_models/datetime_viewmodel.dart';
import 'package:weather_app/view_models/weather_viewmodel.dart';
import 'package:weather_app/views/weather/datetime_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late final DateTimeViewModel _dateTimeVM;
  late final WeatherViewModel _weatherVM;

  @override
  void initState() {
    super.initState();
    _dateTimeVM = context.read<DateTimeViewModel>();
    _weatherVM = context.read<WeatherViewModel>();
  }

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
            Expanded(
              child: Container(color: Colors.red),
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
