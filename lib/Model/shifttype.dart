// To parse this JSON data, do
//
//     final shiftType = shiftTypeFromJson(jsonString);

import 'dart:convert';

ShiftType shiftTypeFromJson(String str) => ShiftType.fromJson(json.decode(str));

String shiftTypeToJson(ShiftType data) => json.encode(data.toJson());

class ShiftType {
  ShiftType({
    required this.message,
    required this.shiftTypes,
  });

  String message;
  List<ShiftTypeElement> shiftTypes;

  factory ShiftType.fromJson(Map<String, dynamic> json) => ShiftType(
    message: json["message"],
    shiftTypes: List<ShiftTypeElement>.from(json["shiftTypes"].map((x) => ShiftTypeElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "shiftTypes": List<dynamic>.from(shiftTypes.map((x) => x.toJson())),
  };
}

class ShiftTypeElement {
  ShiftTypeElement({
    required this.id,
    required this.name,
    required this.code,
    required this.isActive,
  });

  String id;
  String name;
  String code;
  bool isActive;

  factory ShiftTypeElement.fromJson(Map<String, dynamic> json) => ShiftTypeElement(
    id: json["_id"],
    name: json["name"],
    code: json["code"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "code": code,
    "isActive": isActive,
  };
}
