import 'package:get_it/get_it.dart';
import 'package:weather_app/services/worldclock/worldclock_service.dart';
import 'package:weather_app/services/worldclock/worldclock_service_impl.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton<WorldClockService>(WorldClockServiceImpl());
}
