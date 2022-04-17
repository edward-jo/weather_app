import 'package:weather/weather.dart';

abstract class WeatherService {
  Stream<Weather> getCurrentWeatherByCityName(String cityName);
}
