// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String message;
    bool isSuccess;
    int statusCode;
    Result result;

    LoginModel({
        required this.message,
        required this.isSuccess,
        required this.statusCode,
        required this.result,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    Res res;

    Result({
        required this.res,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        res: Res.fromJson(json["res"]),
    );

    Map<String, dynamic> toJson() => {
        "res": res.toJson(),
    };
}

class Res {
    Response response;
    bool paymentCheck;
    bool rfidCardCheck;
    bool isMultiShift;
    String businessNameAdd;

    Res({
        required this.response,
        required this.paymentCheck,
        required this.rfidCardCheck,
        required this.isMultiShift,
        required this.businessNameAdd,
    });

    factory Res.fromJson(Map<String, dynamic> json) => Res(
        response: Response.fromJson(json["response"]),
        paymentCheck: json["paymentCheck"],
        rfidCardCheck: json["rfidCardCheck"],
        isMultiShift: json["isMultiShift"],
        businessNameAdd: json["businessNameAdd"],
    );

    Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "paymentCheck": paymentCheck,
        "rfidCardCheck": rfidCardCheck,
        "isMultiShift": isMultiShift,
        "businessNameAdd": businessNameAdd,
    };
}

class Response {
    String organizerId;
    String driverId;
    String driverName;
    String profilePhoto;
    String deviceDetails;
    bool isFromMobile;
    String contactNo;
    String deviceId;
    String token;
    bool isActive;
    bool isDeleted;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Response({
        required this.organizerId,
        required this.driverId,
        required this.driverName,
        required this.profilePhoto,
        required this.deviceDetails,
        required this.isFromMobile,
        required this.contactNo,
        required this.deviceId,
        required this.token,
        required this.isActive,
        required this.isDeleted,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        organizerId: json["organizerId"],
        driverId: json["driverId"],
        driverName: json["driverName"],
        profilePhoto: json["profilePhoto"],
        deviceDetails: json["deviceDetails"],
        isFromMobile: json["isFromMobile"],
        contactNo: json["contactNo"],
        deviceId: json["deviceId"],
        token: json["token"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "organizerId": organizerId,
        "driverId": driverId,
        "driverName": driverName,
        "profilePhoto": profilePhoto,
        "deviceDetails": deviceDetails,
        "isFromMobile": isFromMobile,
        "contactNo": contactNo,
        "deviceId": deviceId,
        "token": token,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
