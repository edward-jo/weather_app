import 'package:flutter/material.dart';
import 'package:weather_app/models/datetime_model.dart';
import 'package:weather_app/services/worldclock/worldclock_service.dart';
import 'package:weather_app/view_models/mixins/internet_checking.dart';

class DateTimeViewModel extends ChangeNotifier with InternetChecking {
  DateTimeViewModel(this._service);

  final WorldClockService _service;

  Future<DateTimeModel> fetchCurrentDateTime() async {
    await makeErrorInInternetNotAvailableCase();
    var ret = await _service.getCurrentDateTime();
    return DateTimeModel(ret.currentDateTime);
  }
}
