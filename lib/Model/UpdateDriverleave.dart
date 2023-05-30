// To parse this JSON data, do
//
//     final updatedriverleave = updatedriverleaveFromJson(jsonString);

import 'dart:convert';

Updatedriverleave updatedriverleaveFromJson(String str) => Updatedriverleave.fromJson(json.decode(str));

String updatedriverleaveToJson(Updatedriverleave data) => json.encode(data.toJson());

class Updatedriverleave {
  String message;
  bool isSuccess;
  int statusCode;

  Updatedriverleave({
    required this.message,
    required this.isSuccess,
    required this.statusCode,
  });

  factory Updatedriverleave.fromJson(Map<String, dynamic> json) => Updatedriverleave(
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
