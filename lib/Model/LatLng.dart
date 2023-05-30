// To parse this JSON data, do
//
//     final latitudelongitude = latitudelongitudeFromJson(jsonString);

import 'dart:convert';

Latitudelongitude latitudelongitudeFromJson(String str) => Latitudelongitude.fromJson(json.decode(str));

String latitudelongitudeToJson(Latitudelongitude data) => json.encode(data.toJson());

class Latitudelongitude {
  String message;
  bool isSuccess;
  int statusCode;

  Latitudelongitude({
    required this.message,
    required this.isSuccess,
    required this.statusCode,
  });

  factory Latitudelongitude.fromJson(Map<String, dynamic> json) => Latitudelongitude(
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
