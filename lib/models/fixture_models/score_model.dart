import 'dart:convert';
import 'package:football_flutter/models/fixture_models/goals_model.dart';

class ScoreModel {
  GoalsModel halftime;
  GoalsModel fulltime;
  GoalsModel extratime;
  GoalsModel penalty;
  ScoreModel({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });

  Map<String, dynamic> toMap() {
    return {
      'halftime': halftime.toMap(),
      'fulltime': fulltime.toMap(),
      'extratime': extratime.toMap(),
      'penalty': penalty.toMap(),
    };
  }

  factory ScoreModel.fromMap(Map<String, dynamic> map) {
    return ScoreModel(
      halftime: GoalsModel.fromMap(map['halftime']),
      fulltime: GoalsModel.fromMap(map['fulltime']),
      extratime: GoalsModel.fromMap(map['extratime']),
      penalty: GoalsModel.fromMap(map['penalty']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoreModel.fromJson(String source) => ScoreModel.fromMap(json.decode(source));
}
