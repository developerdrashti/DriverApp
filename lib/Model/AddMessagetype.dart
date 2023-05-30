// To parse this JSON data, do
//
//     final addMessageType = addMessageTypeFromJson(jsonString);

import 'dart:convert';

AddMessageType addMessageTypeFromJson(String str) => AddMessageType.fromJson(json.decode(str));

String addMessageTypeToJson(AddMessageType data) => json.encode(data.toJson());

class AddMessageType {
  String message;
  DriverMessage driverMessage;

  AddMessageType({
    required this.message,
    required this.driverMessage,
  });

  factory AddMessageType.fromJson(Map<String, dynamic> json) => AddMessageType(
    message: json["message"],
    driverMessage: DriverMessage.fromJson(json["DriverMessage"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DriverMessage": driverMessage.toJson(),
  };
}

class DriverMessage {
  String driverId;
  String messageType;
  String message;
  String time;
  String createdBy;
  String updatedBy;
  bool isActive;
  bool isDeleted;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  DriverMessage({
    required this.driverId,
    required this.messageType,
    required this.message,
    required this.time,
    required this.createdBy,
    required this.updatedBy,
    required this.isActive,
    required this.isDeleted,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory DriverMessage.fromJson(Map<String, dynamic> json) => DriverMessage(
    driverId: json["driverId"],
    messageType: json["messageType"],
    message: json["message"],
    time: json["time"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "driverId": driverId,
    "messageType": messageType,
    "message": message,
    "time": time,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "isActive": isActive,
    "isDeleted": isDeleted,
    "_id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
