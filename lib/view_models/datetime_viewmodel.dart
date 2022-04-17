import 'package:flutter/material.dart';
import 'package:weather_app/models/datetime_model.dart';
import 'package:weather_app/services/worldclock/worldclock_service.dart';

class DateTimeViewModel extends ChangeNotifier {
  DateTimeViewModel(this._service);

  final WorldClockService _service;

  Future<DateTimeModel> fetchCurrentDateTime() async {
    var ret = await _service.getCurrentDateTime();
    return DateTimeModel(ret.currentDateTime);
  }
}
