import 'dart:convert';

class CoachModel {
  int id;
  String name;
  String photo;
  CoachModel({
    required this.id,
    required this.name,
    required this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
    };
  }

  factory CoachModel.fromMap(Map<String, dynamic> map) {
    return CoachModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      photo: map['photo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CoachModel.fromJson(String source) => CoachModel.fromMap(json.decode(source));
}
