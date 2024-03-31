import 'dart:convert';

class Language {
  final String id;
  final String name;
  final String code;
  final String description;
  final String image;
  final String course;

  Language(
      {required this.name,
      required this.id,
      required this.code,
      required this.description,
      required this.course,
      required this.image});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'code': code,
      'course': course,
      'description': description,
      'image': image
    };
  }

  factory Language.fromJson(Map<String, dynamic> json) {
  return Language(
    id: json['_id'] ?? '',
    name: json['name'] ?? '',
    code: json['code'] ?? '',
    description: json['description'] ?? '',
    image: json['image'] ?? '',
    course: json['course'] ?? '',
  );
}


  String toJson() => json.encode(toMap());

  factory Language.fromJsonString(String jsonString) =>
      Language.fromJson(json.decode(jsonString));
}
