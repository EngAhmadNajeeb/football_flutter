import 'dart:convert';

class LeagueModel {
  int id;
  String name;
  String country;
  String logo;
  String flag;
  int season;
  String round;
  LeagueModel({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.round,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'country': country,
      'logo': logo,
      'flag': flag,
      'season': season,
      'round': round,
    };
  }

  factory LeagueModel.fromMap(Map<String, dynamic> map) {
    return LeagueModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      country: map['country'] ?? '',
      logo: map['logo'] ?? '',
      flag: map['flag'] ?? '',
      season: map['season']?.toInt() ?? 0,
      round: map['round'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LeagueModel.fromJson(String source) => LeagueModel.fromMap(json.decode(source));
}
