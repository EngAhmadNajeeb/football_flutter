import 'dart:convert';

class PeriodModel {
  int? first;
  int? second;
  PeriodModel({
    this.first,
    this.second,
  });

  Map<String, dynamic> toMap() {
    return {
      'first': first,
      'second': second,
    };
  }

  factory PeriodModel.fromMap(Map<String, dynamic> map) {
    return PeriodModel(
      first: map['first']?.toInt(),
      second: map['second']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PeriodModel.fromJson(String source) => PeriodModel.fromMap(json.decode(source));
}
