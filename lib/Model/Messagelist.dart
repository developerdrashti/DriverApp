// // To parse this JSON data, do
// //
// //     final messagelist = messagelistFromJson(jsonString);
//
// import 'dart:convert';
//
// Messagelist messagelistFromJson(String str) => Messagelist.fromJson(json.decode(str));
//
// String messagelistToJson(Messagelist data) => json.encode(data.toJson());
//
// class Messagelist {
//   String message;
//   List<AllDriverMessage> allDriverMessage;
//
//   Messagelist({
//     required this.message,
//     required this.allDriverMessage,
//   });
//
//   factory Messagelist.fromJson(Map<String, dynamic> json) => Messagelist(
//     message: json["message"],
//     allDriverMessage: List<AllDriverMessage>.from(json["AllDriverMessage"].map((x) => AllDriverMessage.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "AllDriverMessage": List<dynamic>.from(allDriverMessage.map((x) => x.toJson())),
//   };
// }
//
// class AllDriverMessage {
//   String id;
//   CreatedBy driverId;
//   MessageType messageType;
//   Message message;
//   String time;
//   CreatedBy createdBy;
//   CreatedBy updatedBy;
//   bool isActive;
//   bool isDeleted;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;
//   Result result;
//   Type msgType;
//   OrganizerId? organizerId;
//
//   AllDriverMessage({
//     required this.id,
//     required this.driverId,
//     required this.messageType,
//     required this.message,
//     required this.time,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.isActive,
//     required this.isDeleted,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//     required this.result,
//     required this.msgType,
//     this.organizerId,
//   });
//
//   factory AllDriverMessage.fromJson(Map<String, dynamic> json) => AllDriverMessage(
//     id: json["_id"],
//     driverId: createdByValues.map[json["driverId"]]!,
//     messageType: messageTypeValues.map[json["messageType"]]!,
//     message: messageValues.map[json["message"]]!,
//     time: json["time"],
//     createdBy: createdByValues.map[json["createdBy"]]!,
//     updatedBy: createdByValues.map[json["updatedBy"]]!,
//     isActive: json["isActive"],
//     isDeleted: json["isDeleted"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     result: Result.fromJson(json["result"]),
//     msgType: typeValues.map[json["msgType"]]!,
//     organizerId: organizerIdValues.map[json["organizerId"]]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "driverId": createdByValues.reverse[driverId],
//     "messageType": messageTypeValues.reverse[messageType],
//     "message": messageValues.reverse[message],
//     "time": time,
//     "createdBy": createdByValues.reverse[createdBy],
//     "updatedBy": createdByValues.reverse[updatedBy],
//     "isActive": isActive,
//     "isDeleted": isDeleted,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "__v": v,
//     "result": result.toJson(),
//     "msgType": typeValues.reverse[msgType],
//     "organizerId": organizerIdValues.reverse[organizerId],
//   };
// }
//
// enum CreatedBy { THE_63_D3_C385299_F832_BB7042045 }
//
// final createdByValues = EnumValues({
//   "63d3c385299f832bb7042045": CreatedBy.THE_63_D3_C385299_F832_BB7042045
// });
//
// enum Message { ACCIDENT, DVG }
//
// final messageValues = EnumValues({
//   "Accident": Message.ACCIDENT,
//   "dvg": Message.DVG
// });
//
// enum MessageType { THE_641844_D05_BB7_A3_E8_A313114_C, THE_641845335_BB7_A3_E8_A3131152 }
//
// final messageTypeValues = EnumValues({
//   "641844d05bb7a3e8a313114c": MessageType.THE_641844_D05_BB7_A3_E8_A313114_C,
//   "641845335bb7a3e8a3131152": MessageType.THE_641845335_BB7_A3_E8_A3131152
// });
//
// enum Type { BREAK_DOWN, ACCIDENT }
//
// final typeValues = EnumValues({
//   "Accident": Type.ACCIDENT,
//   "BreakDown": Type.BREAK_DOWN
// });
//
// enum OrganizerId { THE_63_CE5_FF3_C3_C788_D27_A9_FFD30 }
//
// final organizerIdValues = EnumValues({
//   "63ce5ff3c3c788d27a9ffd30": OrganizerId.THE_63_CE5_FF3_C3_C788_D27_A9_FFD30
// });
//
// class Result {
//   MessageType id;
//   OrganizerId organizerId;
//   Type messageType;
//   String code;
//   String details;
//   OrganizerId createdBy;
//   OrganizerId updatedBy;
//   bool isActive;
//   bool isDeleted;
//
//   Result({
//     required this.id,
//     required this.organizerId,
//     required this.messageType,
//     required this.code,
//     required this.details,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.isActive,
//     required this.isDeleted,
//   });
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: messageTypeValues.map[json["_id"]]!,
//     organizerId: organizerIdValues.map[json["organizerId"]]!,
//     messageType: typeValues.map[json["messageType"]]!,
//     code: json["code"],
//     details: json["details"],
//     createdBy: organizerIdValues.map[json["createdBy"]]!,
//     updatedBy: organizerIdValues.map[json["updatedBy"]]!,
//     isActive: json["isActive"],
//     isDeleted: json["isDeleted"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": messageTypeValues.reverse[id],
//     "organizerId": organizerIdValues.reverse[organizerId],
//     "messageType": typeValues.reverse[messageType],
//     "code": code,
//     "details": details,
//     "createdBy": organizerIdValues.reverse[createdBy],
//     "updatedBy": organizerIdValues.reverse[updatedBy],
//     "isActive": isActive,
//     "isDeleted": isDeleted,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
class MasseagelistModel {
  String? message;
  List<AllDriverMessage>? allDriverMessage;

  MasseagelistModel({this.message, this.allDriverMessage});

  MasseagelistModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    allDriverMessage = json["AllDriverMessage"] == null
        ? null
        : (json["AllDriverMessage"] as List)
        .map((e) => AllDriverMessage.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (allDriverMessage != null) {
      _data["AllDriverMessage"] =
          allDriverMessage?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class AllDriverMessage {
  String? id;
  String? driverId;
  String? messageType;
  String? message;
  String? time;
  String? createdBy;
  String? updatedBy;
  bool? isActive;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? v;
  Result? result;
  String? msgType;

  AllDriverMessage(
      {this.id,
        this.driverId,
        this.messageType,
        this.message,
        this.time,
        this.createdBy,
        this.updatedBy,
        this.isActive,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.result,
        this.msgType});

  AllDriverMessage.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    driverId = json["driverId"];
    messageType = json["messageType"];
    message = json["message"];
    time = json["time"];
    createdBy = json["createdBy"];
    updatedBy = json["updatedBy"];
    isActive = json["isActive"];
    isDeleted = json["isDeleted"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    result = json["result"] == null ? null : Result.fromJson(json["result"]);
    msgType = json["msgType"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["driverId"] = driverId;
    _data["messageType"] = messageType;
    _data["message"] = message;
    _data["time"] = time;
    _data["createdBy"] = createdBy;
    _data["updatedBy"] = updatedBy;
    _data["isActive"] = isActive;
    _data["isDeleted"] = isDeleted;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    if (result != null) {
      _data["result"] = result?.toJson();
    }
    _data["msgType"] = msgType;
    return _data;
  }
}

class Result {
  String? id;
  String? organizerId;
  String? messageType;
  String? code;
  String? details;
  String? createdBy;
  String? updatedBy;
  bool? isActive;
  bool? isDeleted;

  Result(
      {this.id,
        this.organizerId,
        this.messageType,
        this.code,
        this.details,
        this.createdBy,
        this.updatedBy,
        this.isActive,
        this.isDeleted});

  Result.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    organizerId = json["organizerId"];
    messageType = json["messageType"];
    code = json["code"];
    details = json["details"];
    createdBy = json["createdBy"];
    updatedBy = json["updatedBy"];
    isActive = json["isActive"];
    isDeleted = json["isDeleted"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["organizerId"] = organizerId;
    _data["messageType"] = messageType;
    _data["code"] = code;
    _data["details"] = details;
    _data["createdBy"] = createdBy;
    _data["updatedBy"] = updatedBy;
    _data["isActive"] = isActive;
    _data["isDeleted"] = isDeleted;
    return _data;
  }
}
