// To parse this JSON data, do
//
//     final modelLogin = modelLoginFromJson(jsonString);

import 'dart:convert';

ModelLogin modelLoginFromJson(String str) => ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
  int value;
  String id;
  String username;
  String fullname;
  String message;

  ModelLogin({
    required this.value,
    required this.id,
    required this.username,
    required this.fullname,
    required this.message,
  });

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
    value: json["value"],
    id: json["id"],
    username: json["username"],
    fullname: json["fullname"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "id": id,
    "username": username,
    "fullname": fullname,
    "message": message,
  };
}
