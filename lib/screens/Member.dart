import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropikmed001/Model/Drivermapping.dart';
import 'package:dropikmed001/Model/login_model.dart';
import 'package:dropikmed001/Model/memeberlist.dart';
import 'package:dropikmed001/screens/Member_detail.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:dropikmed001/utils/AppImages.dart';
import 'package:flutter/material.dart';
import '../Services/Apiclass.dart';
import '../Services/sessionmanagement.dart';

class Member extends StatefulWidget {
  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {
  List<DriverMember> list_member = [];
  String shiftid="";
  //bool isshow = false;
  @override
  void initState() {
    super.initState();
    setdata();
    //getmemberlist(shiftid);
    Apicall();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu),
          ),
          backgroundColor: Appcolors.primary,
          title: Text(
            "Member",
            style: TextStyle(
                fontFamily: "OpenSans", color: Appcolors.white, fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notification_add))
          ],
        ),
        body: Column(children: [
          // (list_member != null && list_member.isNotEmpty)
          //     ? Container(
          //   padding: EdgeInsets.all(10),
          //   margin: EdgeInsets.only(top: 20, right: 200),
          //   // child: Text(
          //   //   "Members",
          //   //   style: TextStyle(
          //   //       color: Appcolors.black,
          //   //       fontSize: 27,
          //   //       fontFamily: 'OpenSans',
          //   //       fontWeight: FontWeight.w400),
          //   // ),
          // )

          //Container(
          //   height: MediaQuery.of(context).size.height - 20,
          Expanded(
              flex: 1,
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list_member.length,

                  // itemCount: list_member.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Member_Detail(list_member[index])));
                      },
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 230, 228, 228),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(20), // Image border
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(20), // Image radius
                                    child: Image.network(
                                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(height: 10,),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "PickUp",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: Text(
                                        "<---------->",
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${list_member[index].dropTime}:00 AM",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Wrap(
                                  spacing:
                                      0, // Horizontal spacing between the wrapped children
                                  runSpacing:
                                      0, // Vertical spacing between the wrapped lines
                                  alignment: WrapAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_sharp,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                        Text(
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          " ${list_member[index].memberPickupLocation.length > 14 ? '${list_member[index].memberPickupLocation.substring(0, list_member[index].memberPickupLocation.length - 2)}...' : list_member[index].memberPickupLocation}",
                                          // '${list_member[index].memberPickupLocation}',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )),

                            // Expanded(
                            //   child: Text(
                            //     "<--------------->",
                            //     style: TextStyle(color: Colors.black38),
                            //   ),
                            // ),


                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${list_member[index].memberName}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(
                                    "Drop Off",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    " ${list_member[index].pickUpTime}:00",
                                    style: TextStyle(color: Colors.black),
                                  ),

                                  Wrap(
                                    spacing:
                                        0, // Horizontal spacing between the wrapped children
                                    runSpacing:
                                        0, // Vertical spacing between the wrapped lines
                                    alignment: WrapAlignment.start,
                                    children: [

                                      Row(

                                        children: [
                                          Icon(
                                            Icons.location_on_sharp,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          Text(
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            " ${list_member[index].memberDropLocation.length > 14 ? '${list_member[index].memberDropLocation.substring(0, list_member[index].memberDropLocation.length - 2)}...' : list_member[index].memberDropLocation}",
                                            // '${list_member[index].memberPickupLocation}',
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                    );
                  })

              // ListView.builder(
              //     physics: AlwaysScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: list_member.length,
              //     itemBuilder: (context, index) {
              //       return InkWell(
              //         onTap: () {

              //         },
              //         child: Container(
              //             margin: EdgeInsets.all(10),
              //             padding: EdgeInsets.all(10),
              //             decoration: BoxDecoration(
              //               color: Color.fromARGB(255, 230, 228, 228),
              //               borderRadius: BorderRadius.circular(20),
              //             ),
              //             child: Column(
              //               children: [
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                   children: [

              //                     SizedBox(
              //                       width: 50,
              //                     ),
              //                     Text(
              //                       "${list_member[index].memberName}",
              //                       style: TextStyle(
              //                           fontSize: 15,
              //                           fontWeight: FontWeight.w800),
              //                     ),
              //                   ],
              //                 ),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                   children: [
              //                     Column(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceEvenly,
              //                       children: [
              //                         Text(
              //                           "PickUp",
              //                           style: TextStyle(color: Colors.grey),
              //                         ),
              //                         Text(
              //                           "${list_member[index].dropTime}:00",
              //                           style: TextStyle(color: Colors.black),
              //                         ),
              //                       ],
              //                     ),
              //                     Text(
              //                       "<--------------->",
              //                       style: TextStyle(color: Colors.black38),
              //                     ),
              //                     Column(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceEvenly,
              //                       children: [
              //                         Text(
              //                           "Drop Off",
              //                           style: TextStyle(color: Colors.grey),
              //                         ),
              //                         Text(
              //                           " ${list_member[index].pickUpTime}:00",
              //                           style: TextStyle(color: Colors.black),
              //                         ),
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                   children: [
              //                     Wrap(
              //                       // direction: Axis.horizontal,

              //                       // direction: Axis.horizontal,
              //                       children: [
              //                         Icon(
              //                           Icons.location_on_sharp,
              //                           color: Colors.black,
              //                           size: 15,
              //                         ),
              //                         Text(
              //                           softWrap: true,
              //                           overflow: TextOverflow.ellipsis,
              //                           '${list_member[index].memberPickupLocation}',
              //                           style: TextStyle(fontSize: 13),
              //                         ),
              //                       ],
              //                     ),
              //                     SizedBox(
              //                       width: 10,
              //                     ),
              //                     Wrap(
              //                       //direction: Axis.horizontal,
              //                       children: [
              //                         Icon(
              //                           Icons.location_on_sharp,
              //                           color: Colors.black,
              //                           size: 15,
              //                         ),
              //                         Text(
              //                           softWrap: true,
              //                           overflow: TextOverflow.ellipsis,
              //                           '${list_member[index].memberDropLocation}',
              //                           style: TextStyle(fontSize: 13),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             )),
              //       );
              //     }),
              )
        ]));
  }
  void getmemberlist(String shiftid) async {
    HttpService httpService = HttpService();
    SessionManagement sessionManagment = SessionManagement();
    LoginModel login=await sessionManagment.getModel("Driver");
    String token=login.result.res.response.token;
    String driverid=login.result.res.response.driverId;
    MembersList country = await httpService.getdrivermemberlist(token,driverid,"64632f81902dfef7980de793");
    print(country.message);
    if(country.message=="Ok"){
     // MembersList teacher = MembersList.fromJson(country);
      setState((){
        list_member=country.driverMembers!;

      });
    } else{
      setState((){

      });
    }


  }

  Future<void> Apicall() async {
    print("get member data");
    HttpService api = HttpService();
    SessionManagement sessionManagement = SessionManagement();
    LoginModel login = await sessionManagement.getModel("Driver");
    String? token = login.result.res.response.token;
    print("TOKEN||${login.result.res.response.token}");
    String driverid = login.result.res.response.driverId;
    String ShiftId=shiftid;
    print("print the date for gry shift id");
    print(ShiftId);
    dynamic response = await api.getmember(token,driverid,ShiftId);
  //  http://3.26.113.171:8080/api/Mobile/getRouteMember?driId=6463501a01b5fd6aafaa531d&shiId=64632f81902dfef7980de793
    MembersList leave = response;
    if (leave.message == "Ok") {
      setState(() {
        list_member = leave.driverMembers;
        print("TEXT LENGHT:${list_member.first.memberDropLocation.length}");
        //  isshow = false;
      });
    } else {
      setState(() {
        // isshow = true;
      });
      print("data not retrive");
    }
  }

  void setdata() async{
    SessionManagement sessionManagement=SessionManagement();
    Mappingdriver map=await sessionManagement.getmodelMap("MAP");
    setState(() {
      shiftid=map.result.driverDefaultMapping[0].shiftTypeId;
    });
    print("objectobjectobjectobjectobjectobjectobject");
    print(shiftid);
  }
}
