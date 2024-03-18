// To parse this JSON data, do
//
//     final modelEditPegawai = modelEditPegawaiFromJson(jsonString);

import 'dart:convert';

ModelEditPegawai modelEditPegawaiFromJson(String str) => ModelEditPegawai.fromJson(json.decode(str));

String modelEditPegawaiToJson(ModelEditPegawai data) => json.encode(data.toJson());

class ModelEditPegawai {
  bool isSuccess;
  String message;

  ModelEditPegawai({
    required this.isSuccess,
    required this.message,
  });

  factory ModelEditPegawai.fromJson(Map<String, dynamic> json) => ModelEditPegawai(
    isSuccess: json["isSuccess"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
  };
}
