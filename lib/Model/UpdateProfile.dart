// // To parse this JSON data, do
// //
// //     final updateProfile = updateProfileFromJson(jsonString);

// import 'dart:convert';

// UpdateProfile updateProfileFromJson(String str) => UpdateProfile.fromJson(json.decode(str));

// String updateProfileToJson(UpdateProfile data) => json.encode(data.toJson());

// class UpdateProfile {
//   String message;
//   bool isSuccess;
//   int statusCode;
//   Result result;

//   UpdateProfile({
//     required this.message,
//     required this.isSuccess,
//     required this.statusCode,
//     required this.result,
//   });

//   factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
//     message: json["message"],
//     isSuccess: json["isSuccess"],
//     statusCode: json["statusCode"],
//     result: Result.fromJson(json["result"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "isSuccess": isSuccess,
//     "statusCode": statusCode,
//     "result": result.toJson(),
//   };
// }

// class Result {
//   Member member;

//   Result({
//     required this.member,
//   });

//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     member: Member.fromJson(json["member"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "member": member.toJson(),
//   };
// }

// class Member {
//   String id;
//   String organizerId;
//   String name;
//   String photo;
//   String dob;
//   String contactNo;
//   String email;
//   String address;
//   String pinCode;
//   String bloodGroup;
//   String description;
//   String note;
//   String details;
//   String createdBy;
//   String updatedBy;
//   bool isActive;
//   bool isDeleted;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   Member({
//     required this.id,
//     required this.organizerId,
//     required this.name,
//     required this.photo,
//     required this.dob,
//     required this.contactNo,
//     required this.email,
//     required this.address,
//     required this.pinCode,
//     required this.bloodGroup,
//     required this.description,
//     required this.note,
//     required this.details,
//     required this.createdBy,
//     required this.updatedBy,
//     required this.isActive,
//     required this.isDeleted,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   factory Member.fromJson(Map<String, dynamic> json) => Member(
//     id: json["_id"],
//     organizerId: json["organizerId"],
//     name: json["name"],
//     photo: json["photo"],
//     dob: json["dob"],
//     contactNo: json["contactNo"],
//     email: json["email"],
//     address: json["address"],
//     pinCode: json["pinCode"],
//     bloodGroup: json["bloodGroup"],
//     description: json["description"],
//     note: json["note"],
//     details: json["details"],
//     createdBy: json["createdBy"],
//     updatedBy: json["updatedBy"],
//     isActive: json["isActive"],
//     isDeleted: json["isDeleted"],
//     createdAt: DateTime.parse(json["createdAt"]),
//     updatedAt: DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//   );

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "organizerId": organizerId,
//     "name": name,
//     "photo": photo,
//     "dob": dob,
//     "contactNo": contactNo,
//     "email": email,
//     "address": address,
//     "pinCode": pinCode,
//     "bloodGroup": bloodGroup,
//     "description": description,
//     "note": note,
//     "details": details,
//     "createdBy": createdBy,
//     "updatedBy": updatedBy,
//     "isActive": isActive,
//     "isDeleted": isDeleted,
//     "createdAt": createdAt.toIso8601String(),
//     "updatedAt": updatedAt.toIso8601String(),
//     "__v": v,
//   };
// }

class UpdateProfile {
  String? message;
  bool? isSuccess;
  int? statusCode;
  Result? result;

  UpdateProfile({this.message, this.isSuccess, this.statusCode, this.result});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    isSuccess = json["isSuccess"];
    statusCode = json["statusCode"];
    result = json["result"] == null ? null : Result.fromJson(json["result"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["isSuccess"] = isSuccess;
    _data["statusCode"] = statusCode;
    if (result != null) {
      _data["result"] = result?.toJson();
    }
    return _data;
  }
}

class Result {
  List<Driver>? driver;

  Result({this.driver});

  Result.fromJson(Map<String, dynamic> json) {
    driver = json["driver"] == null
        ? null
        : (json["driver"] as List).map((e) => Driver.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (driver != null) {
      _data["driver"] = driver?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Driver {
  String? id;
  String? name;
  String? photo;
  String? dob;
  String? contactNo;
  String? email;
  String? address;
  String? pinCode;
  String? bloodGroup;
  List<String>? routeName;
  List<String>? shiftName;
  List<String>? shiftInTime;
  List<String>? shiftOutTime;
  List<String>? vehicleNo;

  Driver(
      {this.id,
      this.name,
      this.photo,
      this.dob,
      this.contactNo,
      this.email,
      this.address,
      this.pinCode,
      this.bloodGroup,
      this.routeName,
      this.shiftName,
      this.shiftInTime,
      this.shiftOutTime,
      this.vehicleNo});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    photo = json["photo"];
    dob = json["dob"];
    contactNo = json["contactNo"];
    email = json["email"];
    address = json["address"];
    pinCode = json["pinCode"];
    bloodGroup = json["bloodGroup"];
    routeName =
        json["routeName"] == null ? null : List<String>.from(json["routeName"]);
    shiftName =
        json["shiftName"] == null ? null : List<String>.from(json["shiftName"]);
    shiftInTime = json["shiftInTime"] == null
        ? null
        : List<String>.from(json["shiftInTime"]);
    shiftOutTime = json["shiftOutTime"] == null
        ? null
        : List<String>.from(json["shiftOutTime"]);
    vehicleNo =
        json["vehicleNo"] == null ? null : List<String>.from(json["vehicleNo"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["photo"] = photo;
    _data["dob"] = dob;
    _data["contactNo"] = contactNo;
    _data["email"] = email;
    _data["address"] = address;
    _data["pinCode"] = pinCode;
    _data["bloodGroup"] = bloodGroup;
    if (routeName != null) {
      _data["routeName"] = routeName;
    }
    if (shiftName != null) {
      _data["shiftName"] = shiftName;
    }
    if (shiftInTime != null) {
      _data["shiftInTime"] = shiftInTime;
    }
    if (shiftOutTime != null) {
      _data["shiftOutTime"] = shiftOutTime;
    }
    if (vehicleNo != null) {
      _data["vehicleNo"] = vehicleNo;
    }
    return _data;
  }
}
