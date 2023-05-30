//
// // import 'package:dropikmed001/utils/AppColors.dart';
// import 'dart:convert';
//
// import 'package:dropikmed001/Model/Leavetype.dart';
// import 'package:dropikmed001/Services/Apiclass.dart';
// import 'package:dropikmed001/screens/Planned_screen.dart';
// import 'package:dropikmed001/screens/Today_screen.dart';
// import 'package:dropikmed001/utils/AppColors.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';
//
// import '../Model/shifttype.dart';
//
//
//
// class Leave_detail extends StatefulWidget {
//   const Leave_detail({Key? key}) : super(key: key);
//
//   @override
//   State<Leave_detail> createState() => _Leave_detailState();
// }
//
// class _Leave_detailState extends State<Leave_detail>
//     with SingleTickerProviderStateMixin {
//   late
//   final _tabController = TabController(length: 2, vsync: this);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//          backgroundColor: Appcolors.primary,
//
//         title: const Text('Leave'),actions: [
//         GestureDetector(
//             onTap: () {
//               //Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
//               // showAlertDialog(context);
//             },
//             child: Padding(
//               padding: EdgeInsets.all(20),
//               child: Icon(Icons.notifications_none),
//             ))
//       ],
//         bottom: TabBar(
//
//           indicatorSize: TabBarIndicatorSize.tab,
//           padding: EdgeInsets.all(2),
//           indicator: BoxDecoration(
//               color: Appcolors.white, borderRadius: BorderRadius.circular(15)),
//           // splashBorderRadius: BorderRadius.circular(20),
//           labelColor: Appcolors.primary,
//           // dividerColor: Appcolors.primary,
//
//           overlayColor: MaterialStateProperty.all(Appcolors.white),
//           unselectedLabelColor: Appcolors.black,
//           controller: _tabController,
//           tabs: <Widget>[
//             Tab(
//               text: 'Today',
//             ),
//             Tab(
//               text: 'Planed',
//             ),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           Today_Leave(),
//           planed(),
//
//           // Center(
//           //   child: Text("enter second page class"),
//           // ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//

import 'package:dropikmed001/screens/Planned_screen.dart';
import 'package:dropikmed001/screens/Today_screen.dart';
import 'package:dropikmed001/screens/Todayupdatescreen.dart';
import 'package:dropikmed001/screens/planupdatescreen.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:flutter/material.dart';

class Leave_detailupdate extends StatefulWidget {
  var id;
  var reson;
  var enddate;var startdate;
  var shift;
  var leave;
  Leave_detailupdate(this.id,this.reson,this.enddate,this.startdate,this.shift,this.leave);



  @override
  State<StatefulWidget> createState() => _Leave_detailupdateState();
}

class _Leave_detailupdateState extends State<Leave_detailupdate> {
  var selectindex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.startdate==widget.enddate?0:1,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Appcolors.primary,
            title: Text(
              'Leave Detail',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: "OpenSans",
                  fontSize: 20),
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
          body: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Appcolors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TabBar(
                    labelColor: Appcolors.primary,
                    unselectedLabelColor: Appcolors.black,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 2,
                            color: Appcolors.primary), // Creates border
                        color: Colors.white), //

                    tabs: [
                      Tab(
                        child: Text(
                          "Today",
                        ),
                      ),
                      Tab(text: "Planed")
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    Today_LeaveUpdate(widget.id,widget.shift,widget.leave),
                    planedupdate(widget.id,widget.shift,widget.leave),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
