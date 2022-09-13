import 'dart:convert';

class StatusModel {
  String long;
  String short;
  int elapsed;
  StatusModel({
    required this.long,
    required this.short,
    required this.elapsed,
  });

  Map<String, dynamic> toMap() {
    return {
      'long': long,
      'short': short,
      'elapsed': elapsed,
    };
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      long: map['long'] ?? '',
      short: map['short'] ?? '',
      elapsed: map['elapsed']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusModel.fromJson(String source) => StatusModel.fromMap(json.decode(source));
}
