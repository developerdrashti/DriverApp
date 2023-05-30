// To parse this JSON data, do
//
//     final addDriverLeave = addDriverLeaveFromJson(jsonString);

import 'dart:convert';

AddDriverLeave addDriverLeaveFromJson(String str) => AddDriverLeave.fromJson(json.decode(str));

String addDriverLeaveToJson(AddDriverLeave data) => json.encode(data.toJson());

class AddDriverLeave {
  String message;
  bool isSuccess;
  int statusCode;
  Result result;

  AddDriverLeave({
    required this.message,
    required this.isSuccess,
    required this.statusCode,
    required this.result,
  });

  factory AddDriverLeave.fromJson(Map<String, dynamic> json) => AddDriverLeave(
    message: json["message"],
    isSuccess: json["isSuccess"],
    statusCode: json["statusCode"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "isSuccess": isSuccess,
    "statusCode": statusCode,
    "result": result.toJson(),
  };
}

class Result {
  Result();

  factory Result.fromJson(Map<String, dynamic> json) => Result(
  );

  Map<String, dynamic> toJson() => {
  };
}
