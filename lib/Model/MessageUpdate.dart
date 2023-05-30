// To parse this JSON data, do
//
//     final messageUpdate = messageUpdateFromJson(jsonString);

import 'dart:convert';

MessageUpdate messageUpdateFromJson(String str) => MessageUpdate.fromJson(json.decode(str));

String messageUpdateToJson(MessageUpdate data) => json.encode(data.toJson());

class MessageUpdate {
  String message;
  bool isSuccess;
  int statusCode;

  MessageUpdate({
    required this.message,
    required this.isSuccess,
    required this.statusCode,
  });

  factory MessageUpdate.fromJson(Map<String, dynamic> json) => MessageUpdate(
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
