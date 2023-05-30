// import 'package:dropikmed001/Model/Profile.dart';
// import 'package:dropikmed001/Services/Apiclass.dart';
// import 'package:dropikmed001/Services/sessionmanagement.dart';
// import 'package:dropikmed001/screens/Profile_detail.dart';
// import 'package:dropikmed001/utils/AppImages.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../Model/login_model.dart';
// import '../utils/AppColors.dart';
//
// class ProfileScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => Profile_screen();
// }
//
// class Profile_screen extends State<ProfileScreen> {
//   String Name = "";
//   String email = "";
//   String contactno = "";
//   String address = "";
//   String department = "";
//   String shifttype = "";
//   String pic = "";
//   List<MemberProfileDetail> detail = [];
//   @override
//   void initState() {
//     super.initState();
//     Apicall();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolors.primary,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Appcolors.primary,
//         elevation: 0,
//         title: Text(
//           "Profile ",
//           style: TextStyle(
//               fontFamily: "OpenSans", color: Appcolors.white, fontSize: 20),
//         ),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//         actions: [
//           GestureDetector(
//               onTap: () {
//                 // showAlertDialog(context);
//               },
//               child: Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Icon(Icons.notifications_none),
//               ))
//         ],
//       ),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(20)),
//         margin: EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           physics: AlwaysScrollableScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 child: Stack(
//                   children: [
//                     Image.asset(
//                       Appimages.splashbottom,
//                       opacity: const AlwaysStoppedAnimation(.5),
//                       fit: BoxFit.cover,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 150, top: 80, bottom: 20),
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                             color: Appcolors.primary,
//                             width: 3.0,
//                             style: BorderStyle.solid),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(100)),
//                       ),
//                       child: CircleAvatar(
//                         backgroundColor: Appcolors.white,
//                         radius: 16.0,
//                         child: ClipRRect(
//                           child: Image.asset(
//                             Appimages.bus,
//                             height: 200,
//                             width: 200,
//                           ),
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   "Name",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w200,
//                       color: Appcolors.black,
//                       fontFamily: 'OpenSans',
//                       fontSize: 12),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Text(Name),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   "Mobile No",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w200,
//                       color: Appcolors.black,
//                       fontFamily: 'OpenSans',
//                       fontSize: 12),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Text(contactno),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   "Email Address",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w200,
//                       color: Appcolors.black,
//                       fontFamily: 'OpenSans',
//                       fontSize: 12),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Text(email),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   "Address",
//                   style: TextStyle(
//                       fontWeight: FontWeight.w200,
//                       color: Appcolors.black,
//                       fontFamily: 'OpenSans',
//                       fontSize: 12),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Text(address),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                     margin: EdgeInsets.only(left: 30, right: 30, top: 30),
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             BorderRadius.only(bottomLeft: Radius.circular(20))),
//                     height: 40,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: Size(00, 50),
//                         primary: Color(0xFFec9c24),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Profile_details()));
//                         // Logout(context);
//                         //
//                       },
//                       child: Text(
//                         "        EDIT        ",
//                         style: TextStyle(
//                             fontSize: 18,
//                             color: Appcolors.white,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'OpenSans'),
//                       ),
//                     )),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void Apicall() async {
//     HttpService httpService = HttpService();
//     SessionManagement sessionManagement = await SessionManagement();
//     LoginModel profile = await sessionManagement.getModel("Driver");
//     String? token = profile.result.res.response.token;
//     String driverid = profile.result.res.response.driverId;
//     print(driverid);
//     dynamic response = await httpService.getprofiledata(token, driverid);
//     Profile profiledetail = response;
//     print(profiledetail.message);
//     detail = profiledetail.result.memberProfileDetails;
//     if (profiledetail.message == "Ok") {
//       setState(() {
//         Name = detail[0].memberName;
//         contactno = detail[0].memberPhoneNo;
//         // email = detail[0]!.memberAddress;
//         department = detail[0].memberDepartmentName;
//         //shifttype = detail[0]!.memberShiftName;
//         address = detail[0].memberAddress;
//       });
//     } else {
//       print("Data not found");
//     }
//   }
// }
import 'dart:math';

import 'package:dotted_line/dotted_line.dart';
import 'package:dropikmed001/Model/Profile.dart';
import 'package:dropikmed001/Services/Apiclass.dart';
import 'package:dropikmed001/Services/sessionmanagement.dart';
import 'package:dropikmed001/screens/Profile_detail.dart';
import 'package:dropikmed001/utils/AppImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/login_model.dart';
import '../utils/AppColors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Profile_screen();
}

class Profile_screen extends State<ProfileScreen> {
  String name = "";
  String email = "";
  String contactno = "";
  String address = "";
  String BloodGroup = "";
  String id = "";
  String pic = "";
  String dob = "";
  String routename = "";
  String vihicla="";
  String shiftname="";
  String shiftintime="";
  String shiftouttime="";

  @override
  void initState() {
    super.initState();
    Apicall();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Appcolors.primary,
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text(
          "Profile",
          style: TextStyle(
              fontFamily: "OpenSans", color: Appcolors.white, fontSize: 20),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                // showAlertDialog(context);
              },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Icon(Icons.notifications_none),
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 90, top: 40),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Appcolors.primary,
                            width: 3.0,
                            style: BorderStyle.solid),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Appcolors.white,
                        radius: 17.0,
                        child: ClipRRect(
                          child: Image.asset(
                            Appimages.bus,
                            height: 200,
                            width: 200,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile_details(
                                  name,email,contactno ,address ,pic
                                    )));
                        print("Add details");
                      },
                      child: Container(
                          margin: const EdgeInsets.only(left: 75, top: 90),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Icon(Icons.edit)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(contactno,
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),

            Container(
              width: double.infinity,
              child: Text(
                email,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Color.fromARGB(255, 170, 170, 170),
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              width: double.infinity,
              child: Text(
                address,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Color.fromARGB(255, 170, 170, 170),
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              width: double.infinity,
              child: Text(
                routename,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Color.fromARGB(255, 170, 170, 170),
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              width: double.infinity,
              child: Text(
                vihicla,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Color.fromARGB(255, 170, 170, 170),
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(child: Text(
                    shiftname,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),),
                  Text(
                    "$shiftintime ${"-"} $shiftouttime" ,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: DottedLine(
                direction: Axis.horizontal,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 4.0,
                dashColor: Color.fromARGB(255, 170, 170, 170),
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            ),

            // Container(
            //   margin: EdgeInsets.only(
            //     right: 285,
            //   ),
            //   child: Text(
            //     "Blood Group",
            //     style: TextStyle(
            //         color: Appcolors.black,
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Container(
            //   child: Text("${BloodGroup}"),
            //     padding: EdgeInsets.symmetric(vertical: 15),
            //     decoration: BoxDecoration(
            //       border: Border(
            //           bottom: BorderSide(width: 1, color: Colors.black)),
            //     )),
          ]),
        ),
      ),
    );
  }

  void Apicall() async {
    HttpService httpService = HttpService();
    SessionManagement sessionManagement = await SessionManagement();
    LoginModel profile = await sessionManagement.getModel("Driver");
    String token = profile.result.res.response.token;
    String driverid = profile.result.res.response.driverId;
    print(driverid);
    Profile response = await httpService.getprofiledata(token, driverid);
    Profile profiledetail = response;
    if (profiledetail.message == "Ok") {
      print(profiledetail.message);
      setState(() {
        name = response.result.driver[0].name;
        email = response.result.driver[0].email;
        contactno = response.result.driver[0].contactNo;
        address = response.result.driver[0].address;
        BloodGroup = response.result.driver[0].bloodGroup;
        vihicla=response.result.driver[0].vehicleNo.join(" ");
        id = response.result.driver[0].id;
        shiftname=response.result.driver[0].shiftName.join(" ");
        shiftintime=response.result.driver[0].shiftInTime.join(" ");
        shiftouttime=response.result.driver[0].shiftOutTime.join(" ");
        dob = response.result.driver[0].dob;
        routename = response.result.driver[0].routeName.join(" ");
        pic=response.result.driver[0].photo;
      });
      print(name);
      print(routename);
    } else {
      print("Data not found");
    }
  }
}
