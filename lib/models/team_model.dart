import 'dart:convert';

import 'package:football_flutter/models/lineup_models/player_colores_model.dart';

class TeamModel {
  int id;
  String name;
  String logo;
  bool? winner;
  PlayerColoresModel? colors;
  TeamModel({
    required this.id,
    required this.name,
    required this.logo,
    this.winner,
    this.colors,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'winner': winner,
      'colors': colors?.toMap(),
    };
  }

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
      winner: map['winner'],
      colors: map['colors'] != null ? PlayerColoresModel.fromMap(map['colors']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamModel.fromJson(String source) => TeamModel.fromMap(json.decode(source));
}
