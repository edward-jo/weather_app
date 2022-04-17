import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;
import 'package:weather_app/services/worldclock/worldclock.dart';
import 'package:weather_app/services/worldclock/worldclock_service.dart';
import 'package:weather_app/services/worldclock/worldclock_service_exception.dart';

class WorldClockServiceImpl implements WorldClockService {
  final _host = 'worldclockapi.com';
  final _path = '/api/json/utc/now';

  @override
  Future<WorldClock> getCurrentDateTime() async {
    final uri = Uri.http(_host, _path);
    final response = await http.get(uri);
    developer.log('CurrentDateTime Response: ${response.body.toString()}');
    if (response.statusCode != 200) {
      throw WorldClockServiceException('Failed to fetch current date & time');
    }
    return WorldClock.fromJson(json.decode(response.body));
  }
}
