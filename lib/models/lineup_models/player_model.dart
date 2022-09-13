import 'dart:convert';

class PlayerModel {
  int id;
  String name;
  int number;
  String pos;
  String grid;
  PlayerModel({
    required this.id,
    required this.name,
    required this.number,
    required this.pos,
    required this.grid,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'pos': pos,
      'grid': grid,
    };
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      number: map['number']?.toInt() ?? 0,
      pos: map['pos'] ?? '',
      grid: map['grid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerModel.fromJson(String source) => PlayerModel.fromMap(json.decode(source));
}
