// import 'package:dotted_line/dotted_line.dart';
//
// import 'package:dropikmed001/utils/AppColors.dart';
// import 'package:flutter/material.dart';
//
//
//
// class complain extends StatefulWidget {
//   const complain({Key? key}) : super(key: key);
//
//   @override
//   State<complain> createState() => _complainState();
// }
//
// class _complainState extends State<complain> {
//   var _name = 'Sir, I Want to draw you Kind attention t';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//         floatingActionButton: FloatingActionButton(
//           // isExtended: true,
//           child: Icon(Icons.add),
//           backgroundColor: Appcolors.primary,
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>Complain_detail()));
//
//           },
//         ),
//         appBar: AppBar(
//           backgroundColor: Appcolors.primary,
//           title: Text(
//             "Complain",
//             style:
//             TextStyle(fontWeight: FontWeight.bold, fontFamily: 'OpenSana'),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height - 20,
//                 child: ListView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: 20,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: EdgeInsets.all(10),
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color.fromARGB(255, 204, 204, 204),
//                               offset: const Offset(
//                                 0.0,
//                                 5.0,
//                               ),
//                               blurRadius: 5.0,
//                               spreadRadius: 0.5,
//                             ),
//                           ],
//                           color: Appcolors.white,
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         child: Column(
//                           children: [
//                             Container(
//                               child: Text(
//                                 _name.length > 10
//                                     ? _name.substring(0, 40) + '...'
//                                     : _name,
//                                 style: TextStyle(
//                                     color: Appcolors.black,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500,
//                                     fontFamily: 'OpenSans'),
//                               ),
//                             ),
//                             Container(
//                               //height of container
//                                 child: DottedLine(
//                                   direction: Axis.horizontal,
//                                   lineLength: double.infinity,
//                                   lineThickness: 1.0,
//                                   dashLength: 4.0,
//                                   dashColor: Color.fromARGB(255, 145, 145, 145),
//                                   dashRadius: 0.0,
//                                   dashGapLength: 4.0,
//                                   dashGapColor: Colors.transparent,
//                                   dashGapRadius: 0.0,
//                                 )),
//                             Padding(
//                               padding:
//                               const EdgeInsets.only(top: 10, right: 240),
//                               child: Container(
//                                 child: Text(
//                                   "3 jan 2023",
//                                   style:
//                                   TextStyle(fontWeight: FontWeight.normal),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10),
//                               child: Container(
//
//
//                                   child: DottedLine(
//
//                                     direction: Axis.horizontal,
//                                     lineLength: double.infinity,
//                                     lineThickness: 1.0,
//                                     dashLength: 4.0,
//                                     dashColor: Color.fromARGB(255, 145, 145, 145),
//                                     dashRadius: 0.0,
//                                     dashGapLength: 4.0,
//                                     dashGapColor: Colors.transparent,
//                                     dashGapRadius: 0.0,
//                                   )),
//                             ),
//                             Container(
//                               padding: EdgeInsets.only(top: 5, left: 200),
//                               width: double.maxFinite,
//                               alignment: Alignment.center,
//                               // margin: EdgeInsets.only(top: 590, right: 40, left: 40),
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     minimumSize: Size(00, 30),
//                                     primary: Color(0xFFFFFFFF),
//                                   ),
//                                   onPressed: () {
//                                     // setState(() {
//                                     //   Navigator.push(
//                                     //       context,
//                                     //       MaterialPageRoute(
//                                     //           builder: (context) =>
//                                     //               password_confirm_screen()));
//                                     // });
//                                   },
//                                   child: Text(
//                                     "Status",
//                                     style: TextStyle(
//                                         fontSize: 15, color: Appcolors.primary),
//                                   )),
//                             )
//                           ],
//                         ),
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ));
//   }
// }
//
// class Complain_detail extends StatefulWidget {
//   const Complain_detail({Key? key}) : super(key: key);
//
//   @override
//   State<Complain_detail> createState() => _Complain_detailState();
// }
//
// class _Complain_detailState extends State<Complain_detail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(
//       backgroundColor: Appcolors.primary,
//       title: Text("Complain ",style: TextStyle(
//           fontFamily: "OpenSans",
//           color: Colors.white,
//           fontSize: 20
//       ),),
//       leading: GestureDetector(
//         onTap: (){
//           Navigator.pop(context);
//         },
//         child: Icon(Icons.arrow_back),
//       ),
//       actions: [
//         GestureDetector(
//             onTap: (){
//               // showAlertDialog(context);
//             },
//             child: Padding(
//               padding: EdgeInsets.all(20),
//               child: Icon(Icons.notifications_none),
//             )
//         )
//       ],
//     ),
//       body: Column(children: [Container(
//         padding: EdgeInsets.only(top: 30,right: 220),
//         child: Text("Complain",style: TextStyle(color: Appcolors.black,fontWeight: FontWeight.w600,fontFamily: 'OpenSans',fontSize:20),
//         ),
//       ),
//         Container(
//           height: 200,
//           margin: EdgeInsets.all(15),
//
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.withOpacity(0.05),
//             border: Border.all(color: Appcolors.black),
//           ),
//
//           child: TextField(
//             decoration: InputDecoration(
//
//               border:InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 10),
//
//               hintText: " Enter  Your    Complain",),
//             keyboardType: TextInputType.text,
//             autofocus: false,
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//               margin: EdgeInsets.only(top: 200,left: 20,right: 20),
//               decoration: BoxDecoration(
//                   borderRadius:
//                   BorderRadius.only(bottomLeft: Radius.circular(20))),
//               height: 50,
//
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(00, 50),
//                   primary: Color(0xFFec9c24),
//                 ),
//                 onPressed: () {
//                   // setState(() {
//                   //   Navigator.push(
//                   //       context,
//                   //       MaterialPageRoute(
//                   //           builder: (context) => Profile_details()));
//                   // }
//                   // );
//
//                 },
//                 child: Text(
//                   "      Send      ",
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Appcolors.white,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: 'OpenSans'),
//                 ),
//               )),
//         ),
//
//       ],
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:dropikmed001/Model/DeleteAllLeave.dart';
import 'package:dropikmed001/Model/Messagelist.dart';
import 'package:dropikmed001/Model/login_model.dart';
import 'package:dropikmed001/Services/Apiclass.dart';
import 'package:dropikmed001/Services/sessionmanagement.dart';
import 'package:dropikmed001/screens/Message_detail.dart';
import 'package:dropikmed001/screens/Messagedetailupdatescrren.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:dropikmed001/utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Message_screen extends StatefulWidget {


  @override
  State<Message_screen> createState() => _Message_screenState();
}

class _Message_screenState extends State<Message_screen> {
  List<AllDriverMessage> message_list = [];
  bool isShow = true;
  String? token;
  String? driverid;
  bool isshowBanner = false;
  @override
  void initState() {
    super.initState();
    //setdata();

    Apicall().whenComplete(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: Apicall,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: FloatingActionButton(
              // isExtended: true,
              child: Icon(Icons.add),
              backgroundColor: Appcolors.primary,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Messsage_detail()));
              },
            ),
          ),
          appBar: AppBar(
            backgroundColor: Appcolors.primary,
            // leading: GestureDetector(
            //   onTap: () {
            //     Scaffold.of(context).openDrawer();
            //   },
            //   child: Icon(Icons.menu),
            // ),
            title: Text(
              "Message",
              style: TextStyle(
                  fontFamily: "OpenSans", color: Appcolors.white, fontSize: 20),
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
          body: isshowBanner == true
              ? Container(
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
                ))
              : Stack(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: message_list.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onLongPress: () {
                                        print('fhgfdsljoisadjfsigjfdslkjv');
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Wrap(
                                              children: [
                                                ListTile(
                                                 onTap:(){
                                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Messagedetailupdatescrren(message_list[index].id,  message_list[index]
                                                       .msgType
                                                       .toString(), message_list[index].message, message_list[index].time)));

                                            },
                                                  leading: Icon(Icons.edit),
                                                  title: Text('Edit'),
                                                ),
                                                ListTile(
                                                  onTap: () {
                                                    Clearallmessage();

                                            },
                                                  leading: Icon(Icons.clear),
                                                  title: Text('Clear All'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 15, left: 5),
                                                child: Text(
                                                  message_list[index]
                                                      .msgType
                                                      .toString(),
                                                  // message_list[index].message != null
                                                  //     ? message_list[index]
                                                  //     .message
                                                  //     .toString()
                                                  //     : "message",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Appcolors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                child: DottedLine(
                                                  direction: Axis.horizontal,
                                                  lineLength: double.infinity,
                                                  lineThickness: 1.0,
                                                  dashLength: 4.0,
                                                  dashColor: Color.fromARGB(
                                                      255, 170, 170, 170),
                                                  dashRadius: 0.0,
                                                  dashGapLength: 4.0,
                                                  dashGapColor:
                                                      Colors.transparent,
                                                  dashGapRadius: 0.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 50, top: 16),
                                                child: Row(
                                                  children: [
                                                    Expanded(child: Text(
                                                      message_list[index]
                                                          .message
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Appcolors
                                                              .darkblack,
                                                          fontFamily:
                                                          'OpenSans'),
                                                    ),)
                                                    // Text(
                                                    //     message_list.isEmpty
                                                    //         ? "12:30"
                                                    //         : message_list[index].time,
                                                    //     style: TextStyle(
                                                    //         color: Appcolors.darkblack,
                                                    //         fontFamily: 'OpenSans')),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                child: DottedLine(
                                                  direction: Axis.horizontal,
                                                  lineLength: double.infinity,
                                                  lineThickness: 1.0,
                                                  dashLength: 4.0,
                                                  dashColor: Color.fromARGB(
                                                      255, 170, 170, 170),
                                                  dashRadius: 0.0,
                                                  dashGapLength: 4.0,
                                                  dashGapColor:
                                                      Colors.transparent,
                                                  dashGapRadius: 0.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 50, top: 16),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.timelapse,
                                                      size: 25,
                                                      color:
                                                          Appcolors.darkblack,
                                                    ),
                                                    Text(
                                                      message_list[index]
                                                          .time
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Appcolors
                                                              .darkblack,
                                                          fontFamily:
                                                              'OpenSans'),
                                                    ),
                                                    // Text(
                                                    //     message_list.isEmpty
                                                    //         ? "12:30"
                                                    //         : message_list[index].time,
                                                    //     style: TextStyle(
                                                    //         color: Appcolors.darkblack,
                                                    //         fontFamily: 'OpenSans')),
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
          // : Container(
          //     margin: EdgeInsets.symmetric(vertical: 200),
          //     child: Center(
          //       child: Column(
          //         children: [
          //           Image.asset(
          //             Appimages.folder,
          //             height: 100,
          //           ),
          //           Text(
          //             "Data Not Found",
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //     ))
          ),
    );
  }

  Future<void> Apicall() async {
    message_list.clear();
    print("get member data");
    HttpService api = HttpService();
    SessionManagement sessionManagement = SessionManagement();
    LoginModel login = await sessionManagement.getModel("Driver");
    token = login.result.res.response.token;
    driverid = login.result.res.response.driverId;
    print(token);
    print(message_list);
    var getdata = await api.getmessage(token!, driverid!);
    print("DATATEST||${getdata?.allDriverMessage}");
    print("DATATEST||${getdata?.allDriverMessage.runtimeType}");
    if (getdata?.allDriverMessage == null) {
      setState(() {
        isshowBanner = true;
      });
    } else {
      setState(() {
        isshowBanner = false;
      });
    }
    if (getdata?.message == "Ok") {
      getdata?.allDriverMessage!.forEach((element) {
        message_list.add(element);
      });
      print("MESEG EX|${message_list.first.message}");
    } else {
      print("Message Not Valid");
    }
  }

  void Clearallmessage() async {
    print("add member leave");
    HttpService api=  HttpService();
    SessionManagement sessionManagement=await SessionManagement();
    LoginModel addleave=await sessionManagement.getModel("Member");
    String token= addleave.result.res.response.token;
    String memberid=addleave.result.res.response.driverId;
    ClearAllLeave login= await api.Clearallmessagedata(
        token,
        memberid);
    if(login.message=="Ok"){
      Fluttertoast.showToast(msg: "data clear successfully",toastLength: Toast.LENGTH_LONG);


    }else{
      Fluttertoast.showToast(msg: "Leave not Add",toastLength: Toast.LENGTH_LONG);
    }

  }
}
