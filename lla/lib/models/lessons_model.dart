import 'dart:convert';

class Lessons {
  final String id;
  final String name;
  final String description;
  final String level;

  Lessons(
      {required this.name,
      required this.id,
      required this.description,
      required this.level
     });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'description': description,
      'level': level
    };
  }

  factory Lessons.fromJson(Map<String, dynamic> json) {
    return Lessons(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      level: json['level'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Lessons.fromJsonString(String jsonString) =>
      Lessons.fromJson(json.decode(jsonString));
}
