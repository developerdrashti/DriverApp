// To parse this JSON data, do
//
//     final mappingdriver = mappingdriverFromJson(jsonString);

import 'dart:convert';

Mappingdriver mappingdriverFromJson(String str) => Mappingdriver.fromJson(json.decode(str));

String mappingdriverToJson(Mappingdriver data) => json.encode(data.toJson());

class Mappingdriver {
  String message;
  bool isSuccess;
  int statusCode;
  Result result;

  Mappingdriver({
    required this.message,
    required this.isSuccess,
    required this.statusCode,
    required this.result,
  });

  factory Mappingdriver.fromJson(Map<String, dynamic> json) => Mappingdriver(
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
  List<DriverDefaultMapping> driverDefaultMapping;

  Result({
    required this.driverDefaultMapping,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    driverDefaultMapping: List<DriverDefaultMapping>.from(json["DriverDefaultMapping"].map((x) => DriverDefaultMapping.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "DriverDefaultMapping": List<dynamic>.from(driverDefaultMapping.map((x) => x.toJson())),
  };
}

class DriverDefaultMapping {
  String id;
  String shiftTypeId;
  String routeId;
  String vehicleRegId;
  String driverPickupTime;
  String driverDropTime;

  DriverDefaultMapping({
    required this.id,
    required this.shiftTypeId,
    required this.routeId,
    required this.vehicleRegId,
    required this.driverPickupTime,
    required this.driverDropTime,
  });

  factory DriverDefaultMapping.fromJson(Map<String, dynamic> json) => DriverDefaultMapping(
    id: json["_id"],
    shiftTypeId: json["shiftTypeId"],
    routeId: json["routeId"],
    vehicleRegId: json["vehicleRegId"],
    driverPickupTime: json["driverPickupTime"],
    driverDropTime: json["driverDropTime"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "shiftTypeId": shiftTypeId,
    "routeId": routeId,
    "vehicleRegId": vehicleRegId,
    "driverPickupTime": driverPickupTime,
    "driverDropTime": driverDropTime,
  };
}
