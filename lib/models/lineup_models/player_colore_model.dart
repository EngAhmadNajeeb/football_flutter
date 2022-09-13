import 'dart:convert';

class PlayerColoreModel {
  String primary;
  String number;
  String border;
  PlayerColoreModel({
    required this.primary,
    required this.number,
    required this.border,
  });

  Map<String, dynamic> toMap() {
    return {
      'primary': primary,
      'number': number,
      'border': border,
    };
  }

  factory PlayerColoreModel.fromMap(Map<String, dynamic> map) {
    return PlayerColoreModel(
      primary: map['primary'] ?? '',
      number: map['number'] ?? '',
      border: map['border'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerColoreModel.fromJson(String source) => PlayerColoreModel.fromMap(json.decode(source));
}
