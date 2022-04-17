import 'package:weather_app/models/weather_model.dart';

abstract class WeatherService {
  Stream<WeatherModel> getCurrentWeatherByCityName(String cityName);
}
