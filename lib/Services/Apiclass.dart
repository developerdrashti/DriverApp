import 'dart:convert';
import 'package:dropikmed001/Model/AddDriverLeave.dart';
import 'package:dropikmed001/Model/AddDriverLeave.dart';
import 'package:dropikmed001/Model/AddDriverLeave.dart';
import 'package:dropikmed001/Model/AddDriverLeave.dart';
import 'package:dropikmed001/Model/AddMessagetype.dart';
import 'package:dropikmed001/Model/AddMessagetype.dart';
import 'package:dropikmed001/Model/AddSos.dart';
import 'package:dropikmed001/Model/Canceldriverleave.dart';
import 'package:dropikmed001/Model/DeleteAllLeave.dart';
import 'package:dropikmed001/Model/Failed.dart';
import 'package:dropikmed001/Model/LatLng.dart';
import 'package:dropikmed001/Model/Leavetype.dart';
import 'package:dropikmed001/Model/MessageUpdate.dart';
import 'package:dropikmed001/Model/MessageUpdate.dart';
import 'package:dropikmed001/Model/Messagelist.dart';
import 'package:dropikmed001/Model/Messagetype.dart';
import 'package:dropikmed001/Model/NotificationCount.dart';
import 'package:dropikmed001/Model/Notificationlist.dart';
import 'package:dropikmed001/Model/Notificationupdate.dart';
import 'package:dropikmed001/Model/Profile.dart';
import 'package:dropikmed001/Model/SingleDriverleavedetail.dart';
import 'package:dropikmed001/Model/UpdateDriverleave.dart';
import 'package:dropikmed001/Model/UpdateProfile.dart';
import 'package:dropikmed001/Model/UpdateProfile.dart';
import 'package:dropikmed001/Model/leave.dart';
import 'package:dropikmed001/Model/login_model.dart';
import 'package:dropikmed001/Model/memeberlist.dart';
import 'package:dropikmed001/Model/shifttype.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Model/UpdateProfile.dart';

class HttpService {
  //http://3.26.113.171:8080
  String BASEURL = "http://3.26.113.171:8080/api";
  String logins = "/mobile/driverLogin";
  String Driverleave = "/mobile/getDriverLeave/";
  String leavetype = "/master/getLeaveType";
  String Memberlist="/Mobile/getRouteMember";
  String shifttype = "/dropDown/getShiftType";
  String profile = "/Mobile/getOneDriverProfile/";
  String message = "/mobile/getAllDriverMessage/";
  String lanlng = "/mobile/addLatitudeLongitude";
  String messagetype = "/dropDown/getMessageType";
  String Drivermessage = "/mobile/addDriverMessage";
  String AdddriverLeave = "/mobile/addDriverLeave";
  String notification = "/Mobile/getAllNotificationList";
  String count = "/Mobile/getNotificationCount";
  String updatenotification = "Mobile/updateOneNotification";
  String _updateProfile = "/Mobile/updateDriverProfile/";
  String updateMessages = "/Mobile/updateDriverMessage/";
  String updateleavse = "/Mobile/updateDriverLeave/";
  String mapping = "/Mobile/addDriverDefaultMapping";
  String singledriverleave = "/mobile/getOneDriverDetailedLeave/";
  String updatedriverleave="/Mobile/updateDriverLeave/";
  String canceldriverleave="/Mobile/getOneDriveLeaveDelete/";
  String deleteallleave="/Mobile/clearAllNotificationForDriver";
  String Messageupdate="/Mobile/updateDriverMessage/";
  String getmessagetype="/dropDown/getMessageType";
  String deletemessage="/Mobile/clearDriverNotification";
  Future<dynamic> checkLogin(String username, String deviceid,
      String devicedetail, bool isfrommobile) async {
    try {
      final url = Uri.parse('http://3.26.113.171:8080/api/mobile/driverLogin');
      final header = <String, String>{
        'Content-Type': 'application/json',
      };
      final body = {
        'username': username,
        'deviceId': deviceid,
        'deviceDetails': devicedetail,
        'isFromMobile': isfrommobile.toString(),
      };
      final jsonString = json.encode(body);

      final http.Response response =
      await http.post(url, headers: header, body: jsonString);
      var data = jsonDecode(response.body);
      if (data['isSuccess']) {
        return data;
      } else {
        throw data;
      }
    } catch (_) {
      return {'isSuccess': false, 'message': "not found"};
    }
  }

  Future<DriverLeaveList>? getdatadriver(String token, String drivrid) async {
    print("$BASEURL$Driverleave$drivrid");
    final res = await get(Uri.parse("$BASEURL$Driverleave$drivrid"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        });
    print("$BASEURL$Driverleave$drivrid");
    print(res.statusCode);
    if (res.statusCode == 200) {
      return DriverLeaveList.fromJson(json.decode(res.body));
    } else {
      throw "message";
    }
  }

  Future<dynamic> getleaveUpdate(String token, String leavseId, sdate,
      edate) async {
    print("levse Update |$BASEURL$Driverleave$leavseId");
    try {
      final res = await put(Uri.parse("$BASEURL$updateleavse$leavseId"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': "$token",
          },
          body: jsonEncode(
              <String, String>{"startDate": sdate, "endDate": edate}));

      print(res.statusCode);
      if (res.statusCode == 200) {
        return json.decode(res.body);
      } else {
        print("data not found form leavse update");
      }
    } catch (e) {
      throw Exception("leave update error : $e");
    }
  }

  // Future<DriverLeaveList>? getdatadriver(String token, String drivrid) async {
  //   print("$BASEURL$Driverleave$drivrid");
  //   final res = await get(Uri.parse("$BASEURL$Driverleave$drivrid"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization':
  //             "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJvcmdhbml6YXRpb24iOnsiX2lkIjoiNjQ0YTQwZGI0YjEzNzUzOWQ2YjNlMTBkIiwibmFtZSI6IlJBS19zY2hvb2wiLCJjb250YWN0Tm8iOiI5ODk4Njc2NzQ1IiwiZW1haWwiOiJzaWZpaGlqODIwQGxhcmxhbmQuY29tIiwiYnVzaW5lc3NUeXBlIjoiNjQwNmNhNzAwYmM0N2U3YjVlNjJjNDE5IiwiY29tcGFueU5hbWUiOiIiLCJyb2xlQ29kZSI6Ik9SRyIsImFkZHJlc3MiOiIiLCJwb3N0Q29kZSI6IiIsInBhc3N3b3JkIjoiJDJiJDEwJEpOWTJpcTZKaFh4eWE2OFk4U3lCeGV4VGxoMi45MFJTbzJ2dDZ3ZnNtYXMuc1N2OUg4dXJlIiwiaXNWZXJpZmllZCI6dHJ1ZSwiZGVzY3JpcHRpb24iOiIiLCJub3RlIjoiIiwiZGV0YWlscyI6IiIsImlzQWN0aXZlIjp0cnVlLCJpc0RlbGV0ZWQiOmZhbHNlLCJjcmVhdGVkQXQiOiIyMDIzLTA0LTI3VDA5OjMxOjA3LjIzMFoiLCJ1cGRhdGVkQXQiOiIyMDIzLTA0LTI4VDEwOjA5OjU0LjMxM1oiLCJfX3YiOjB9LCJpYXQiOjE2ODM5NTYxMzMsImV4cCI6MTY4NDA0MjUzM30.6mrrHwI67djZT_A7ZYKANYKZeeMNkzyYs-VjzTMXzsE",
  //       });
  //   print("$BASEURL$Driverleave$drivrid");
  //   print(res.statusCode);
  //   if (res.statusCode == 200) {
  //     return DriverLeaveList.fromJson(json.decode(res.body));
  //   } else {
  //     throw "message";
  //   }
  // }

  Future<MembersList> getmember(String token,String driverid,String shiftid) async {

    print( "$BASEURL$Memberlist?driId=$driverid${'&shiId=$shiftid'}");
   // /api/Mobile/getRouteMember?driId=63d3c7d6a1282b4d1cd8f3a7&shiId=63fd8e2f5b608051243451c0
    final res = await get(
        Uri.parse(
            "$BASEURL$Memberlist?driId=$driverid${'&shiId=$shiftid'}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        });
    print(res.statusCode);
    if (res.statusCode == 200) {
      return MembersList.fromJson(json.decode(res.body));
    } else {
      throw "message";
    }
  }

  Future<LeaveType>? getLeavetype() async {
    final res = await get(
        Uri.parse("$BASEURL$leavetype"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (res.statusCode == 200) {
      print(res.statusCode);
      print(res.body);
      return LeaveType.fromJson(json.decode(res.body));
    } else {
      throw "message";
    }
  }

  Future<ShiftType>? getShiftType(String token,) async {
    final res = await get(
        Uri.parse("$BASEURL$shifttype"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        });
    if (res.statusCode == 200) {
      print(res.statusCode);
      print(res.body);
      return ShiftType.fromJson(json.decode(res.body));
    } else {
      throw "message";
    }
  }

  Future<Profile> getprofiledata(String token, String driverid) async {
    print('$BASEURL$profile$driverid');

    http.Response res = await get(Uri.parse('$BASEURL$profile$driverid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        });
    if (res.statusCode == 200) {
      print("data get ${res.statusCode}");
      print(res.statusCode);
      return Profile.fromJson(json.decode(res.body));
    } else {
      throw "Exception occured";
    }
  }

  // Future<Messagelist>? getmessage(String token, String drivrid) async {
  //   print("$BASEURL$message$drivrid");
  //   final res = await get(Uri.parse("$BASEURL$Driverleave$drivrid"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': "$token",
  //       });
  //   print("$BASEURL$Driverleave$drivrid");
  //   print(res.statusCode);
  //   if (res.statusCode == 200) {
  //     return Messagelist.fromJson(json.decode(res.body));
  //   } else {
  //     throw "message";
  //   }
  // }

  Future<MasseagelistModel?> getmessage(String token, String Drivid) async {
    try {
      final response =
      await http.get(Uri.parse("$BASEURL$message$Drivid"), headers: {
        "Authorization": token,
      });
      print("message DATA||${response.body}");
      if (response.statusCode == 200) {
        return MasseagelistModel.fromJson(jsonDecode(response.body));
      } else {
        Exception(" DATA not Found");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Latitudelongitude> AddLatlng(String token,
      String vid,
      String lat,
      String lng,
      String speed,
      String degree,
      String code,
      String desc,
      String note,
      String detail,
      String cby,
      String uby) async {
    print(lanlng);
    http.Response response = await http.post(
      Uri.parse(lanlng),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "$token",
      },
      body: jsonEncode(<String, String>{
        "vehicleId": vid,
        "latitude": lat,
        "longitude": lng,
        "speed": speed,
        "temp": degree,
        "code": code,
        "description": desc,
        "note": note,
        "details": detail,
        "createdBy": cby,
        "updatedBy": uby
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return Latitudelongitude.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }

  Future<Messagetype> getMessagetype(String token,) async {
    final res = await get(
        Uri.parse("$BASEURL$getmessagetype"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        });
    if (res.statusCode == 200) {
      print(res.statusCode);
      print(res.body);
      return Messagetype.fromJson(json.decode(res.body));
    } else {
      throw "message";
    }
  }

  Future<AddMessageType> AddMessagetype(String token,
      String driverId,
      String messageType,
      String message,
      String time,
      String createdBy,
      String updatedBy,
      String isActive,
      String isDeleted,) async {
    try {
      final http.Response response = await http.post(
        Uri.parse('$BASEURL$Drivermessage'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "$token"
        },
        body: jsonEncode(<String, String>{
          "driverId": driverId,
          "messageType": messageType,
          "message": message,
          "time": time,
          "createdBy": createdBy,
          "updatedBy": updatedBy,
          "isActive": isActive,
          "isDeleted": isDeleted
        }),
      );
      if (response.statusCode == 200) {
        print("rhgitrjklrjgefk");
        print(response.statusCode);
        return AddMessageType.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }
    } catch (_) {
      throw 'message';
    }
  }

  Future<AddDriverLeave> AddDriverleave(String token,
      String driverid,
      String shiftid,
      String leaveid,
      String startdate,
      String enddate,
      String reason,
      String approvedate,
      String code,
      String description,
      String note,
      String details,
      String createdby,
      String updatedby) async {
    try {
      print('$BASEURL$AdddriverLeave');
      final http.Response response = await http.post(
        Uri.parse('$BASEURL$AdddriverLeave'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Authorization": "$token"
        },
        body: jsonEncode(<String, String>{
          "driverId": driverid,
          "shiftTypeId": shiftid,
          "leaveTypeId": leaveid,
          "startDate": startdate,
          "endDate": enddate,
          "reason": reason,
          "approvedDate": approvedate,
          "code": code,
          "description": description,
          "note": note,
          "details": details,
          "createdBy": createdby,
          "updatedBy": updatedby
        }),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return AddDriverLeave.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }
    } catch (_) {
      throw 'message';
    }
  }

  Future<NotificationList> getNotification(String token,
      String userid,
      String usertype,
      String action) async {
    try {
      final http.Response response = await http.post(
        Uri.parse('$BASEURL$notification'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(
            <String, String>{
              "userId": userid,
              "userType": usertype,
              "action":action
            }),
      );
      print('$BASEURL$notification');
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return NotificationList.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }
    } catch (_) {
      throw 'message';
    }
  }

  Future<NotificationCount> getNotificationcount(String token,
      String userid,
      String usertype,) async {
    try {
      final http.Response response = await http.post(
        Uri.parse('$BASEURL$count'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(
            <String, String>{"userId": userid, "userType": usertype}),
      );
      print('$BASEURL$notification');
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return NotificationCount.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }
    } catch (_) {
      throw 'message';
    }
  }

  Future<NotificationUpdate> getNotificationupdate(String token,
      String userid,
      String action,) async {
    try {
      final http.Response response = await http.post(
        Uri.parse('$BASEURL$updatenotification'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(<String, String>{
          "_id": userid,
          "action": action
        }),
      );
      print('$BASEURL$notification');
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return NotificationUpdate.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }
    } catch (_) {
      throw 'message';
    }
  }

  Future<UpdateProfile> updateprofile(String token,String memberid,String photo,String iamgename,String bloodgroup,String name,String Email) async {
    print("$BASEURL$_updateProfile$memberid");
    try{
      final http.Response response = await http.put(
        Uri.parse("$BASEURL$_updateProfile$memberid"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(<String, String>{
          "photo": photo,
          "imageName": iamgename,
          "bloodGroup": bloodgroup,
          "name": name,
          "email": Email
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return UpdateProfile.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }

    }catch(_){
      throw 'message';
    }

  }


  Future<dynamic> updateMessage(String token, String messageId, messagtype,
      messageCat) async {
    print("UPDATE API WORK|| $BASEURL$updateMessages$messageId");
    try {
      final res = await put(Uri.parse("$BASEURL$updateMessages$messageId"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': "$token",
          },
          body: jsonEncode(<String, String>{
            "messageType": messagtype,
            "message": messageCat,
          }));

      print("UPDATE MESSAGE RESPONSE || ${res.body}");
      if (res.statusCode == 200) {
        return json.decode(res.body);
      } else {
        print('data not found ');
      }
    } catch (e) {
      throw Exception("message update Exception :$e");
    }
  }

  Future<dynamic> clearMessage(String token, String driverid,) async {
    print("$BASEURL$_updateProfile$driverid");
    try {
      final http.Response response = await http.post(
        Uri.parse(
            "http://3.26.113.171:8080/api/Mobile/clearDriverNotification"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(<String, String>{
          "driverId": driverid,
        }),
      );
      print(response.statusCode);
      print("response || ${response.body}");
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to create album.');
      }
    } catch (e) {
      throw 'clear message $e';
    }
  }

  Future<dynamic> Appmapping(String token, String contct,
      String driverid,) async {
    try {
      final http.Response response = await http.post(
        Uri.parse('$BASEURL$mapping'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(<String, String>{
          "contactNo": contct,
          "driverId": driverid
        }),
      );
      var data = jsonDecode(response.body);
      if (data['isSuccess']) {
        return data;
      } else {
        throw data;
      }
    } catch (_) {
      return {
        "isSuccess": false,
        "message": "not found data"
      };
    }
  }

  Future<dynamic> getDriversingleleavelist(String token, String Leaveid) async {
    print("Call Leave list api ");
    try {
      http.Response res = await get(
          Uri.parse("$BASEURL$singledriverleave$Leaveid"),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'Authorization': "$token",
          });
      print("$BASEURL$singledriverleave$Leaveid");
      print(res.statusCode);
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        print(data);
        if (data['isSuccess']) {
          return data;
        }
        else {
          return Failed.fromJson(data);
        }
      }
      else {
        return {
          "isSuccess": false,
          "message": "Some thing went wrong"
        };
      }
    } catch (_) {
      return {
        "isSuccess": false,
        "message": "Exceptions occurred"
      };
    }
  }
  Future<SingleDriverleavedetail> getleavedata(String token,String Memberid) async{
    print('$BASEURL$profile$Memberid');

    http.Response res = await get(Uri.parse('$BASEURL$singledriverleave$Memberid'),
        headers: <String ,String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        });
    if(res.statusCode==200){
      print("data get ${res.statusCode}");
      print(res.statusCode);
      return SingleDriverleavedetail.fromJson(json.decode(res.body));
    }else{
      throw "Exception occured";
    }


  }
  Future<Updatedriverleave> updateDriverleave(String token,String id,String startdate,String enddate,String reson,String shiftid,String leaveid) async {
    try{
      final http.Response response = await http.put(
        Uri.parse("$BASEURL$updatedriverleave$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(<String, String>{
          "startDate":startdate,
          "endDate":enddate,
          "reason":reson,
          "shiftTypeId": shiftid,
          "leaveTypeId":leaveid,

        }),
      );
      print("$BASEURL$updatedriverleave$id");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return Updatedriverleave.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }
    }catch(_){
      throw 'message';
    }

  }
  Future<Cancelriverleave> Cancelmemberleavedata(String token,String leaveid) async {
    print("$BASEURL$canceldriverleave$leaveid");
    try{
      final http.Response response = await http.put(
        Uri.parse("$BASEURL$canceldriverleave$leaveid"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(<String, String>{


        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return Cancelriverleave.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }

    }catch(_){
      throw 'message';
    }

  }
  Future<ClearAllLeave> Clearallleavedata(String token, String did,) async {
    try{
      final http.Response response = await http.post(
        Uri.parse('$BASEURL$deleteallleave'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(<String, String>{
          "driverId": did,
        }),
      );
      if (response.statusCode == 200) {
        return ClearAllLeave.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }
    }catch(_){
      throw 'message';
    }

  }
  Future<MessageUpdate> updateDrivermessage(String token,String id,String messagetype,String message,String time,) async {
    try{
      final http.Response response = await http.put(
        Uri.parse("$BASEURL$Messageupdate$id"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(<String, String>{
          "messageType":messagetype,
          "message":message,
          "time": time,

        }),
      );
      print("$BASEURL$Messageupdate$id");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return MessageUpdate.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }
    }catch(_){
      throw 'message';
    }

  }
  Future<ClearAllLeave> Clearallmessagedata(String token, String did,) async {
    try{
      final http.Response response = await http.post(
        Uri.parse('$BASEURL$deletemessage'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "$token",
        },
        body: jsonEncode(<String, String>{
          "driverId": did,
        }),
      );
      if (response.statusCode == 200) {
        return ClearAllLeave.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }
    }catch(_){
      throw 'message';
    }

  }
  Future<dynamic> getdrivermemberlist(String token,String driverid,String shiftid) async {
    print("$BASEURL$Memberlist?driId=$driverid${'&shiId=$shiftid'}");
    print("Call Leave list api ");
   // $BASEURL$teacher?student_id=$studentid${'&class_id=$Classid'}
    try{
     http. Response res = await get(Uri.parse("$BASEURL$Memberlist?driId=$driverid${'&shiId=$shiftid'}"),
     // http.Response res = await get("$BASEURL$Memberlist?driId=$driverid${'&shiId=$shiftid'}"),
        //  http://3.26.113.171:8080/api/Mobile/getRouteMember?driId=6463501a01b5fd6aafaa531d&shiId=64632f81902dfef7980de793
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'Authorization': "$token",
          });
     print(res.statusCode);
      if (res.statusCode == 200) {

        var data =json.decode(res.body);
        print(data);
        if(data['isSuccess']){
          return data;
        }
        else{
          return Failed.fromJson(data);
        }
      }
      else{
        return{
          "isSuccess":false,
          "message":"Some thing went wrong"
        };
      }
    } catch(_){
      return{
        "isSuccess":false,
        "message":"Exceptions occurred"
      };

    }
  }
}

// if(response.issucess=false){
//   return login
// }
// else{
//   if (response.statusCode != 200){
//     Fluttertoast.showToast(msg: "Your number is not register Please check number",toastLength: Toast.LENGTH_LONG);
//   }else{
//     return LoginModel.fromJson(json.decode(response.body));
//   }
// }