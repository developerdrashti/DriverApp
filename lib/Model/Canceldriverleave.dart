// To parse this JSON data, do
//
//     final cancelriverleave = cancelriverleaveFromJson(jsonString);

import 'dart:convert';

Cancelriverleave cancelriverleaveFromJson(String str) => Cancelriverleave.fromJson(json.decode(str));

String cancelriverleaveToJson(Cancelriverleave data) => json.encode(data.toJson());

class Cancelriverleave {
  String message;
  bool isSuccess;
  int statusCode;

  Cancelriverleave({
    required this.message,
    required this.isSuccess,
    required this.statusCode,
  });

  factory Cancelriverleave.fromJson(Map<String, dynamic> json) => Cancelriverleave(
    message: json["message"],
    isSuccess: json["isSuccess"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "isSuccess": isSuccess,
    "statusCode": statusCode,
  };
}
