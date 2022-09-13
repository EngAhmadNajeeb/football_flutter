import 'dart:convert';

import 'package:football_flutter/models/fixture_models/fixture_model.dart';
import 'package:football_flutter/models/fixture_models/goals_model.dart';
import 'package:football_flutter/models/fixture_models/league_model.dart';
import 'package:football_flutter/models/fixture_models/score_model.dart';
import 'package:football_flutter/models/fixture_models/teams_model.dart';

class FixtureItemModel {
  FixtureModel fixture;
  LeagueModel league;
  TeamsModel teams;
  GoalsModel goals;
  ScoreModel score;
  FixtureItemModel({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      'fixture': fixture.toMap(),
      'league': league.toMap(),
      'teams': teams.toMap(),
      'goals': goals.toMap(),
      'score': score.toMap(),
    };
  }

  factory FixtureItemModel.fromMap(Map<String, dynamic> map) {
    return FixtureItemModel(
      fixture: FixtureModel.fromMap(map['fixture']),
      league: LeagueModel.fromMap(map['league']),
      teams: TeamsModel.fromMap(map['teams']),
      goals: GoalsModel.fromMap(map['goals']),
      score: ScoreModel.fromMap(map['score']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FixtureItemModel.fromJson(String source) => FixtureItemModel.fromMap(json.decode(source));
}
