import 'package:dropikmed001/Model/Canceldriverleave.dart';
import 'package:dropikmed001/Model/DeleteAllLeave.dart';
import 'package:dropikmed001/Model/leave.dart';

import 'package:dropikmed001/Model/login_model.dart';
import 'package:dropikmed001/Services/sessionmanagement.dart';
import 'package:dropikmed001/screens/Change_Vehical.dart';
import 'package:dropikmed001/screens/Leave_detail.dart';

import 'package:dropikmed001/screens/Member.dart';
import 'package:dropikmed001/screens/Navigation_screen.dart';
import 'package:dropikmed001/screens/Profile.dart';
import 'package:dropikmed001/screens/Message.dart';
import 'package:dropikmed001/screens/leavedetailupdatescrren.dart';

import 'package:dropikmed001/utils/AppColors.dart';
import 'package:dropikmed001/utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import '../Services/Apiclass.dart';

class LeaveScreen extends StatefulWidget {
  State<LeaveScreen> createState() => _LeaveState();
}

class _LeaveState extends State<LeaveScreen> {
  List<DriverLeave> list_driver = [];
  bool isapprooved = false;
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    Apicall();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: Apicall,
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: FloatingActionButton(
                // isExtended: true,
                child: Icon(Icons.add),
                backgroundColor: Appcolors.primary,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Leave_detail()));
                },
              ),
            ),
            appBar: AppBar(
              backgroundColor: Appcolors.primary,
              title: Text(
                "Leave",
                style: TextStyle(
                    fontFamily: "OpenSans",
                    color: Appcolors.white,
                    fontSize: 20),
              ),
              leading: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.menu),
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                      // showAlertDialog(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(Icons.notifications_none),
                    ))
              ],
            ),
            body: isShow == false
                ? Stack(
                    children: [
                      list_driver.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.folder,color: Appcolors.primary,),
                                  Text("Leave data is empty")
                                ],
                              ))
                          : Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: list_driver.length,
                                          itemBuilder: (context, index) {
                                            print(
                                                "date checker ${list_driver[index].endDate}${list_driver[index].startDate}");
                                            String enddate = list_driver.isEmpty
                                                ? "Date"
                                                : DateFormat('dd-MM-yyyy')
                                                    .format(list_driver[index]
                                                        .endDate);
                                            DateTime parsedDate =
                                                DateTime.parse(
                                                        list_driver[index]
                                                            .startDate
                                                            .toString())
                                                    .toLocal();
                                            String Enddate=list_driver.isEmpty?"11 jan 2023":DateFormat('dd-MM-yyyy').format(list_driver[index].endDate);
                                            String dateend=list_driver.isEmpty?"11 jan 2023":DateFormat('dd-MM-yyyy').format(list_driver[index].endDate);

                                            String startdate =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(parsedDate);
                                            print("DATEFORMATE||$startdate");
                                            return InkWell(
                                              onLongPress: () {
                                                print(
                                                    'fhgfdsljoisadjfsigjfdslkjv');
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Wrap(
                                                      children: [
                                                        ListTile(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => Leave_detailupdate(list_driver[index].id,list_driver[index].reason,enddate,startdate,list_driver[index].shiftTypeId.name,list_driver[index].leaveTypeId.name)));
                                                          },
                                                          leading:
                                                              Icon(Icons.edit),
                                                          title: Text('Edit'),
                                                        ),
                                                        ListTile(
                                                          onTap: () {
                                                            Cencelleave(list_driver[index].id);

                                                          },
                                                          leading: Icon(Icons
                                                              .delete_outline),
                                                          title: Text('Cancel'),
                                                        ),
                                                        ListTile(
                                                          onTap: () {
                                                            Celarallleave();

                                                          },
                                                          leading:
                                                              Icon(Icons.clear),
                                                          title:
                                                              Text('Clear All'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Leave_detail()));
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.all(5),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 204, 204, 204),
                                                        offset: const Offset(
                                                          0.0,
                                                          5.0,
                                                        ),
                                                        blurRadius: 5.0,
                                                        spreadRadius: 0.5,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.date_range,
                                                            color:
                                                                Appcolors.black,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "$startdate",
                                                                  style: TextStyle(
                                                                      fontSize: 18,
                                                                      color:
                                                                      Appcolors
                                                                          .black,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                                ),
                                                                startdate==Enddate?Text(""):Text(" TO ${Enddate}",style: TextStyle(
                                                                    fontSize: 18,
                                                                    color:
                                                                    Appcolors
                                                                        .black,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),)
                                                              ],
                                                            )
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 15),
                                                        child: DottedLine(
                                                          direction:
                                                              Axis.horizontal,
                                                          lineLength:
                                                              double.infinity,
                                                          lineThickness: 1.0,
                                                          dashLength: 4.0,
                                                          dashColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  170,
                                                                  170,
                                                                  170),
                                                          dashRadius: 0.0,
                                                          dashGapLength: 4.0,
                                                          dashGapColor: Colors
                                                              .transparent,
                                                          dashGapRadius: 0.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: Text(
                                                          list_driver.isEmpty
                                                              ? "reson"
                                                              : list_driver[
                                                                      index]
                                                                  .reason,
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      134,
                                                                      134,
                                                                      134),
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: DottedLine(
                                                          direction:
                                                              Axis.horizontal,
                                                          lineLength:
                                                              double.infinity,
                                                          lineThickness: 1.0,
                                                          dashLength: 4.0,
                                                          dashColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  170,
                                                                  170,
                                                                  170),
                                                          dashRadius: 0.0,
                                                          dashGapLength: 4.0,
                                                          dashGapColor: Colors
                                                              .transparent,
                                                          dashGapRadius: 0.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 50,
                                                                top: 5),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                  height: 30,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            207,
                                                                            207,
                                                                            207),
                                                                        offset:
                                                                            const Offset(
                                                                          0.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            2.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            238,
                                                                            238,
                                                                            238),
                                                                        offset: const Offset(
                                                                            0.0,
                                                                            0.0),
                                                                        blurRadius:
                                                                            10.0,
                                                                        spreadRadius:
                                                                            2.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      list_driver
                                                                              .isEmpty
                                                                          ? ""
                                                                          : '${list_driver[index].leaveTypeId.name}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              196,
                                                                              105,
                                                                              19),
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  )),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  height: 30,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Appcolors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            207,
                                                                            207,
                                                                            207),
                                                                        offset:
                                                                            const Offset(
                                                                          0.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            2.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            238,
                                                                            238,
                                                                            238),
                                                                        offset: const Offset(
                                                                            0.0,
                                                                            0.0),
                                                                        blurRadius:
                                                                            10.0,
                                                                        spreadRadius:
                                                                            2.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      list_driver
                                                                              .isEmpty
                                                                          ? ""
                                                                          : '${list_driver[index].shiftTypeId.name}',
                                                                      style: TextStyle(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              196,
                                                                              105,
                                                                              19),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  )),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                  height: 30,
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(
                                                                              5),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            207,
                                                                            207,
                                                                            207),
                                                                        offset:
                                                                            const Offset(
                                                                          0.0,
                                                                          5.0,
                                                                        ),
                                                                        blurRadius:
                                                                            2.0,
                                                                        spreadRadius:
                                                                            1.0,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            238,
                                                                            238,
                                                                            238),
                                                                        offset: const Offset(
                                                                            0.0,
                                                                            0.0),
                                                                        blurRadius:
                                                                            10.0,
                                                                        spreadRadius:
                                                                            2.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      list_driver
                                                                              .isNotEmpty
                                                                          ? list_driver[index].isApproved == true
                                                                              ? "IsApproved"
                                                                              : "pending"
                                                                          : "DATA NOT FOund",
                                                                      style: TextStyle(
                                                                          color: isapprooved == list_driver[index].isApproved
                                                                              ? Colors
                                                                                  .black
                                                                              : Colors
                                                                                  .green,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          }))
                                ],
                              ),
                            )
                    ],
                  )
                : Container(
                    child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Appimages.folder,
                          height: 100,
                        ),
                        Text(
                          "Data Not Found",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))));
  }

  Future<void> Apicall() async {
    HttpService api = HttpService();
    SessionManagement sessionManagement = SessionManagement();
    LoginModel login = await sessionManagement.getModel("Driver");
    String? token = login.result.res.response.token;
    String driverid = login.result.res.response.driverId;
    DriverLeaveList? response = await api.getdatadriver(
      token,
      driverid,
    );
    // dynamic data = await api.getleaveUpdate(token, list_driver.first.id);
    // print("DATA||${data}");
    print(response!.message);
    if (response.message == "Ok") {
      setState(() {
        list_driver = response.driverLeave;
        isShow = false;
      });
      print(list_driver[0].reason);
    } else {
      setState(() {
        isShow = true;
      });
      print("data not retrive");
    }
  }

  void Cencelleave(String leaveid) async{
    HttpService api = HttpService();
    SessionManagement sessionManagement = await SessionManagement();
    LoginModel updateprofile = await sessionManagement.getModel("Driver");
    String token = updateprofile.result.res.response.token;
    Cancelriverleave update = await api.Cancelmemberleavedata(token,leaveid);
    print(update.message);
    if (update.message == "Ok") {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationScreen(selectIndex: 2,)), (route) => false);
      setState(() {
      });
      Fluttertoast.showToast(
          msg: update.message, toastLength: Toast.LENGTH_LONG);
    } else {
      Fluttertoast.showToast(msg: "not updated leave", toastLength: Toast.LENGTH_LONG);
    }
  }

  void Celarallleave() async {
    print("add member leave");
    HttpService api=  HttpService();
    SessionManagement sessionManagement=await SessionManagement();
    LoginModel addleave=await sessionManagement.getModel("Member");
    String token= addleave.result.res.response.token;
    String memberid=addleave.result.res.response.driverId;
    ClearAllLeave login= await api.Clearallleavedata(
        token,
        memberid);
    if(login.message=="Ok"){
      Fluttertoast.showToast(msg: "data clear successfully",toastLength: Toast.LENGTH_LONG);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationScreen(selectIndex: 2,)), (route) => false);

    }else{
      Fluttertoast.showToast(msg: "Leave not Add",toastLength: Toast.LENGTH_LONG);
    }

  }
}
/*
add this text in pubspec.yml
      |
loading_animation_widget: ^1.2.0+4
*/