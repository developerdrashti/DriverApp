// To parse this JSON data, do
//
//     final singleDriverleavedetail = singleDriverleavedetailFromJson(jsonString);

import 'dart:convert';

SingleDriverleavedetail singleDriverleavedetailFromJson(String str) => SingleDriverleavedetail.fromJson(json.decode(str));

String singleDriverleavedetailToJson(SingleDriverleavedetail data) => json.encode(data.toJson());

class SingleDriverleavedetail {
  String message;
  Driver driver;

  SingleDriverleavedetail({
    required this.message,
    required this.driver,
  });

  factory SingleDriverleavedetail.fromJson(Map<String, dynamic> json) => SingleDriverleavedetail(
    message: json["message"],
    driver: Driver.fromJson(json["driver"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "driver": driver.toJson(),
  };
}

class Driver {
  String id;
  String organizerId;
  String driverId;
  String shiftTypeId;
  String leaveTypeId;
  DateTime startDate;
  DateTime endDate;
  String reason;
  bool isApproved;
  dynamic approvedDate;
  String code;
  String description;
  String note;
  String details;
  bool isClear;
  String createdBy;
  String updatedBy;
  bool isActive;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Driver({
    required this.id,
    required this.organizerId,
    required this.driverId,
    required this.shiftTypeId,
    required this.leaveTypeId,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.isApproved,
    this.approvedDate,
    required this.code,
    required this.description,
    required this.note,
    required this.details,
    required this.isClear,
    required this.createdBy,
    required this.updatedBy,
    required this.isActive,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["_id"],
    organizerId: json["organizerId"],
    driverId: json["driverId"],
    shiftTypeId: json["shiftTypeId"],
    leaveTypeId: json["leaveTypeId"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    reason: json["reason"],
    isApproved: json["isApproved"],
    approvedDate: json["approvedDate"],
    code: json["code"],
    description: json["description"],
    note: json["note"],
    details: json["details"],
    isClear: json["isClear"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "organizerId": organizerId,
    "driverId": driverId,
    "shiftTypeId": shiftTypeId,
    "leaveTypeId": leaveTypeId,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "reason": reason,
    "isApproved": isApproved,
    "approvedDate": approvedDate,
    "code": code,
    "description": description,
    "note": note,
    "details": details,
    "isClear": isClear,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "isActive": isActive,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
