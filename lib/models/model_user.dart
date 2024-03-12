// To parse this JSON data, do
//
//     final modelUsers = modelUsersFromJson(jsonString);

import 'dart:convert';

List<ModelUsers> modelUsersFromJson(String str) => List<ModelUsers>.from(json.decode(str).map((x) => ModelUsers.fromJson(x)));

String modelUsersToJson(List<ModelUsers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUsers {
  int id;
  String name;
  String username;
  String email;
  String fullname;

  ModelUsers({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.fullname,
  });

  factory ModelUsers.fromJson(Map<String, dynamic> json) => ModelUsers(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    fullname: json["fullname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "fullname": fullname,
  };
}