import 'package:json_annotation/json_annotation.dart';

part 'worldclock.g.dart';

@JsonSerializable()
class WorldClock {
  @JsonKey(name: r'$id')
  final String id;
  final DateTime currentDateTime;
  final String utcOffset;
  final bool isDayLightSavingsTime;
  final String dayOfTheWeek;
  final String timeZoneName;
  final double currentFileTime;
  final String ordinalDate;
  final String? serviceResponse;

  WorldClock({
    required this.id,
    required this.currentDateTime,
    required this.utcOffset,
    required this.isDayLightSavingsTime,
    required this.dayOfTheWeek,
    required this.timeZoneName,
    required this.currentFileTime,
    required this.ordinalDate,
    required this.serviceResponse,
  });

  factory WorldClock.fromJson(Map<String, dynamic> json) =>
      _$WorldClockFromJson(json);

  Map<String, dynamic> toJson() => _$WorldClockToJson(this);
}
