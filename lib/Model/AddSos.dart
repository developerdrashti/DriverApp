// // To parse this JSON data, do
// //
// //     final addSos = addSosFromJson(jsonString);
//
// import 'dart:convert';
//
// AddSos addSosFromJson(String str) => AddSos.fromJson(json.decode(str));
//
// String addSosToJson(AddSos data) => json.encode(data.toJson());
//
// class AddSos {
//   AddSos({
//     required this.message,
//     required this.sos,
//   });
//
//   String message;
//   Sos sos;
//
//   factory AddSos.fromJson(Map<String, dynamic> json) => AddSos(
//     message: json["message"],
//     sos: Sos.fromJson(json["sos"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "sos": sos.toJson(),
//   };
// }
//
// class Sos {
//   Sos({
//     required this.organizerId,
//     required this.memberId,
//     required this.memberName,
//     required this.orgNo,
//     required this.memberEmgNo,
//     required this.id,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });
//
//   String organizerId;
//   String memberId;
//   String memberName;
//   String orgNo;
//   String memberEmgNo;
//   String id;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;
//
//   factory Sos.fromJson(Map<String, dynamic> json) => Sos(
//     organizerId: json["organizerId"],
//     memberId: json["memberId"],
//     memberName: json["memberName"],
//     orgNo: json["orgNo"],
//     memberEmgNo: json["memberEmgNo"],
//     id: json["_id"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "organizerId": organizerId,
//     "memberId": memberId,
//     "memberName": memberName,
//     "orgNo": orgNo,
//     "memberEmgNo": memberEmgNo,
//     "_id": id,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "__v": v,
//   };
// }
// To parse this JSON data, do
//
//     final addSos = addSosFromJson(jsonString);

import 'dart:convert';

AddSos addSosFromJson(String str) => AddSos.fromJson(json.decode(str));

String addSosToJson(AddSos data) => json.encode(data.toJson());

class AddSos {
  AddSos({
    required this.message,
    required this.sos,
  });

  String message;
  Sos sos;

  factory AddSos.fromJson(Map<String, dynamic> json) => AddSos(
    message: json["message"],
    sos: Sos.fromJson(json["sos"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "sos": sos.toJson(),
  };
}

class Sos {
  Sos({
    required this.memberId,
    required this.orgNo,
    required this.memberEmgNo,
    required this.memberName,
  });

  String memberId;
  String orgNo;
  String memberEmgNo;
  String memberName;

  factory Sos.fromJson(Map<String, dynamic> json) => Sos(
    memberId: json["memberId"],
    orgNo: json["orgNo"],
    memberEmgNo: json["memberEmgNo"],
    memberName: json["memberName"],
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "orgNo": orgNo,
    "memberEmgNo": memberEmgNo,
    "memberName": memberName,
  };
}
