import 'dart:convert';

class VenueModel {
  int id;
  String name;
  String city;
  VenueModel({
    required this.id,
    required this.name,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'city': city,
    };
  }

  factory VenueModel.fromMap(Map<String, dynamic> map) {
    return VenueModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VenueModel.fromJson(String source) => VenueModel.fromMap(json.decode(source));
}
