// To parse this JSON data, do
//
//     final messagetype = messagetypeFromJson(jsonString);

import 'dart:convert';

Messagetype messagetypeFromJson(String str) => Messagetype.fromJson(json.decode(str));

String messagetypeToJson(Messagetype data) => json.encode(data.toJson());

class Messagetype {
  String message;
  List<MessageType> messageTypes;

  Messagetype({
    required this.message,
    required this.messageTypes,
  });

  factory Messagetype.fromJson(Map<String, dynamic> json) => Messagetype(
    message: json["message"],
    messageTypes: List<MessageType>.from(json["MessageTypes"].map((x) => MessageType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "MessageTypes": List<dynamic>.from(messageTypes.map((x) => x.toJson())),
  };
}

class MessageType {
  String id;
  String messageType;

  MessageType({
    required this.id,
    required this.messageType,
  });

  factory MessageType.fromJson(Map<String, dynamic> json) => MessageType(
    id: json["_id"],
    messageType: json["messageType"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "messageType": messageType,
  };
}
