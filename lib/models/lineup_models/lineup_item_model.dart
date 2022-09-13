import 'dart:convert';

import 'package:football_flutter/models/lineup_models/coach_model.dart';
import 'package:football_flutter/models/lineup_models/player_model.dart';
import 'package:football_flutter/models/team_model.dart';

class LineupItemModel {
  TeamModel team;
  String formation;
  List<int> listFormation;
  List<PlayerModel> startXI;
  List<PlayerModel> substitutes;
  CoachModel coach;
  LineupItemModel({
    required this.team,
    required this.formation,
    required this.listFormation,
    required this.startXI,
    required this.substitutes,
    required this.coach,
  });

  Map<String, dynamic> toMap() {
    return {
      'team': team.toMap(),
      'formation': formation,
      'startXI': startXI.map((x) => x.toMap()).toList(),
      'substitutes': substitutes.map((x) => x.toMap()).toList(),
      'coach': coach.toMap(),
    };
  }

  factory LineupItemModel.fromMap(Map<String, dynamic> map) {
    String formation = map['formation'] ?? '';
    return LineupItemModel(
      team: TeamModel.fromMap(map['team']),
      formation: formation,
      listFormation:
          formation.split('-').map<int>((e) => int.tryParse(e) ?? 0).toList(),
      startXI: List<PlayerModel>.from(
          map['startXI']?.map((x) => PlayerModel.fromMap(x['player'])) ?? const []),
      substitutes: List<PlayerModel>.from(
          map['substitutes']?.map((x) => PlayerModel.fromMap(x)) ?? const []),
      coach: CoachModel.fromMap(map['coach']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LineupItemModel.fromJson(String source) =>
      LineupItemModel.fromMap(json.decode(source));
}
