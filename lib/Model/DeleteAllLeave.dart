// To parse this JSON data, do
//
//     final clearAllLeave = clearAllLeaveFromJson(jsonString);

import 'dart:convert';

ClearAllLeave clearAllLeaveFromJson(String str) => ClearAllLeave.fromJson(json.decode(str));

String clearAllLeaveToJson(ClearAllLeave data) => json.encode(data.toJson());

class ClearAllLeave {
  String message;
  bool isSuccess;
  int statusCode;
  Result result;

  ClearAllLeave({
    required this.message,
    required this.isSuccess,
    required this.statusCode,
    required this.result,
  });

  factory ClearAllLeave.fromJson(Map<String, dynamic> json) => ClearAllLeave(
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
  bool acknowledged;
  int modifiedCount;
  dynamic upsertedId;
  int upsertedCount;
  int matchedCount;

  Result({
    required this.acknowledged,
    required this.modifiedCount,
    this.upsertedId,
    required this.upsertedCount,
    required this.matchedCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    acknowledged: json["acknowledged"],
    modifiedCount: json["modifiedCount"],
    upsertedId: json["upsertedId"],
    upsertedCount: json["upsertedCount"],
    matchedCount: json["matchedCount"],
  );

  Map<String, dynamic> toJson() => {
    "acknowledged": acknowledged,
    "modifiedCount": modifiedCount,
    "upsertedId": upsertedId,
    "upsertedCount": upsertedCount,
    "matchedCount": matchedCount,
  };
}
