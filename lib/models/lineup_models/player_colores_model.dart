import 'dart:convert';

import 'package:football_flutter/models/lineup_models/player_colore_model.dart';

class PlayerColoresModel {
  PlayerColoreModel player;
  PlayerColoreModel goalkeeper;
  PlayerColoresModel({
    required this.player,
    required this.goalkeeper,
  });

  Map<String, dynamic> toMap() {
    return {
      'player': player.toMap(),
      'goalkeeper': goalkeeper.toMap(),
    };
  }

  factory PlayerColoresModel.fromMap(Map<String, dynamic> map) {
    return PlayerColoresModel(
      player: PlayerColoreModel.fromMap(map['player']),
      goalkeeper: PlayerColoreModel.fromMap(map['goalkeeper']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerColoresModel.fromJson(String source) => PlayerColoresModel.fromMap(json.decode(source));
}
