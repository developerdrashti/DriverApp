// To parse this JSON data, do
//
//     final membersList = membersListFromJson(jsonString);

import 'dart:convert';

MembersList membersListFromJson(String str) => MembersList.fromJson(json.decode(str));

String membersListToJson(MembersList data) => json.encode(data.toJson());

class MembersList {
  String message;
  List<DriverMember> driverMembers;

  MembersList({
    required this.message,
    required this.driverMembers,
  });

  factory MembersList.fromJson(Map<String, dynamic> json) => MembersList(
    message: json["message"],
    driverMembers: List<DriverMember>.from(json["DriverMembers"].map((x) => DriverMember.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "DriverMembers": List<dynamic>.from(driverMembers.map((x) => x.toJson())),
  };
}

class DriverMember {
  String id;
  String memberName;
  String memberProfile;
  String pickUpTime;
  String dropTime;
  String memberPickupLocation;
  String memberDropLocation;

  DriverMember({
    required this.id,
    required this.memberName,
    required this.memberProfile,
    required this.pickUpTime,
    required this.dropTime,
    required this.memberPickupLocation,
    required this.memberDropLocation,
  });

  factory DriverMember.fromJson(Map<String, dynamic> json) => DriverMember(
    id: json["_id"],
    memberName: json["memberName"],
    memberProfile: json["memberProfile"],
    pickUpTime: json["pickUpTime"],
    dropTime: json["dropTime"],
    memberPickupLocation: json["memberPickupLocation"],
    memberDropLocation: json["memberDropLocation"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "memberName": memberName,
    "memberProfile": memberProfile,
    "pickUpTime": pickUpTime,
    "dropTime": dropTime,
    "memberPickupLocation": memberPickupLocation,
    "memberDropLocation": memberDropLocation,
  };
}
