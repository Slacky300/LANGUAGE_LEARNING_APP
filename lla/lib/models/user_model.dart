import 'dart:convert';

class User{
  final String username;
  final String email;
  final String password;
  final String token;
  final String id;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.token,
    required this.id
  });

  Map<String, dynamic> toMap(){
    return {
      'username': username,
      'email': email,
      'password': password,
      'token': token,
      'id': id
    };
  }

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
      id: json['_id']
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJsonString(String jsonString) => User.fromJson(json.decode(jsonString));
}