import 'dart:convert';

class GoalsModel {
  int? home;
  int? away;
  GoalsModel({
    this.home,
    this.away,
  });


  Map<String, dynamic> toMap() {
    return {
      'home': home,
      'away': away,
    };
  }

  factory GoalsModel.fromMap(Map<String, dynamic> map) {
    return GoalsModel(
      home: map['home']?.toInt(),
      away: map['away']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GoalsModel.fromJson(String source) => GoalsModel.fromMap(json.decode(source));
}
