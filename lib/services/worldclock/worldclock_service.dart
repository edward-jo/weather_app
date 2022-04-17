import 'package:weather_app/services/worldclock/worldclock.dart';

abstract class WorldClockService {
  Future<WorldClock> getCurrentDateTime();
}
