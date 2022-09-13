import 'dart:convert';
import 'package:football_flutter/models/team_model.dart';

class TeamsModel {
  TeamModel home;
  TeamModel away;
  TeamsModel({
    required this.home,
    required this.away,
  });

  Map<String, dynamic> toMap() {
    return {
      'home': home.toMap(),
      'away': away.toMap(),
    };
  }

  factory TeamsModel.fromMap(Map<String, dynamic> map) {
    return TeamsModel(
      home: TeamModel.fromMap(map['home']),
      away: TeamModel.fromMap(map['away']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamsModel.fromJson(String source) => TeamsModel.fromMap(json.decode(source));
}
