import 'dart:convert';

import 'package:football_flutter/models/fixture_models/period_model.dart';
import 'package:football_flutter/models/fixture_models/status_model.dart';
import 'package:football_flutter/models/fixture_models/venue_model.dart';


class FixtureModel {
  int id;
  String timezone;
  String date;
  int timestamp;
  PeriodModel periods;
  VenueModel venue;
  StatusModel status;
  FixtureModel({
    required this.id,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.periods,
    required this.venue,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timezone': timezone,
      'date': date,
      'timestamp': timestamp,
      'periods': periods.toMap(),
      'venue': venue.toMap(),
      'status': status.toMap(),
    };
  }

  factory FixtureModel.fromMap(Map<String, dynamic> map) {
    return FixtureModel(
      id: map['id']?.toInt() ?? 0,
      timezone: map['timezone'] ?? '',
      date: map['date'] ?? '',
      timestamp: map['timestamp']?.toInt() ?? 0,
      periods: PeriodModel.fromMap(map['periods']),
      venue: VenueModel.fromMap(map['venue']),
      status: StatusModel.fromMap(map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FixtureModel.fromJson(String source) => FixtureModel.fromMap(json.decode(source));
}
