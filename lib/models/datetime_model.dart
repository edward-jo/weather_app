import 'package:intl/intl.dart';

class DateTimeModel {
  DateTimeModel(this._dateTime);

  final DateTime _dateTime;

  DateTime get localDateTime => _dateTime.toLocal();

  String get date => DateFormat('d MMMM y').format(localDateTime);

  String get weekday => DateFormat.EEEE().format(localDateTime);
}
