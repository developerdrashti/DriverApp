// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  String message;
  bool isSuccess;
  int statusCode;
  Result result;

  Profile({
    required this.message,
    required this.isSuccess,
    required this.statusCode,
    required this.result,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
  List<Driver> driver;

  Result({
    required this.driver,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    driver: List<Driver>.from(json["driver"].map((x) => Driver.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "driver": List<dynamic>.from(driver.map((x) => x.toJson())),
  };
}

class Driver {
  String id;
  String name;
  String photo;
  String dob;
  String contactNo;
  String email;
  String address;
  String pinCode;
  String bloodGroup;
  List<String> routeName;
  List<String> shiftName;
  List<String> shiftInTime;
  List<String> shiftOutTime;
  List<String> vehicleNo;

  Driver({
    required this.id,
    required this.name,
    required this.photo,
    required this.dob,
    required this.contactNo,
    required this.email,
    required this.address,
    required this.pinCode,
    required this.bloodGroup,
    required this.routeName,
    required this.shiftName,
    required this.shiftInTime,
    required this.shiftOutTime,
    required this.vehicleNo,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["_id"],
    name: json["name"],
    photo: json["photo"],
    dob: json["dob"],
    contactNo: json["contactNo"],
    email: json["email"],
    address: json["address"],
    pinCode: json["pinCode"],
    bloodGroup: json["bloodGroup"],
    routeName: List<String>.from(json["routeName"].map((x) => x)),
    shiftName: List<String>.from(json["shiftName"].map((x) => x)),
    shiftInTime: List<String>.from(json["shiftInTime"].map((x) => x)),
    shiftOutTime: List<String>.from(json["shiftOutTime"].map((x) => x)),
    vehicleNo: List<String>.from(json["vehicleNo"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "photo": photo,
    "dob": dob,
    "contactNo": contactNo,
    "email": email,
    "address": address,
    "pinCode": pinCode,
    "bloodGroup": bloodGroup,
    "routeName": List<dynamic>.from(routeName.map((x) => x)),
    "shiftName": List<dynamic>.from(shiftName.map((x) => x)),
    "shiftInTime": List<dynamic>.from(shiftInTime.map((x) => x)),
    "shiftOutTime": List<dynamic>.from(shiftOutTime.map((x) => x)),
    "vehicleNo": List<dynamic>.from(vehicleNo.map((x) => x)),
  };
}
