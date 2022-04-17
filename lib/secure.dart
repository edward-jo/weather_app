import 'package:flutter_dotenv/flutter_dotenv.dart';

final String weatherApiKey = dotenv.env['WEATHER_API_KEY'] ?? '';
