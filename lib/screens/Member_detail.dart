import 'package:dropikmed001/Model/memeberlist.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:dropikmed001/utils/AppImages.dart';
import 'package:flutter/material.dart';

class Member_Detail extends StatefulWidget {
  DriverMember? list_member;
  Member_Detail(this.list_member);

  @override
  State<Member_Detail> createState() => _Member_DetailState();
}

class _Member_DetailState extends State<Member_Detail> {
  TextEditingController pickupController = TextEditingController();
  TextEditingController dropController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  getdata() {
    pickupController.text = widget.list_member!.memberPickupLocation.toString();
    dropController.text = widget.list_member!.memberDropLocation.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text(
          "Member Detail",
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
      body:
      Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 0, top: 30),
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Appcolors.primary,
                      width: 3.0,
                      style: BorderStyle.solid),
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
                child: CircleAvatar(
                  backgroundColor: Appcolors.white,
                  radius: 16.0,
                  child: ClipRRect(
                    child: Image.asset(
                      Appimages.bus,
                      height: 170,
                      width: 170,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${widget.list_member!.memberName}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Appcolors.black,
                    fontFamily: 'OpenSans',
                    fontSize: 18),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "",
                style: TextStyle(
                    color: Appcolors.gray,
                    fontFamily: 'OpenSans',
                    fontSize: 12),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 240,
                ),
                child: Text(
                  "Contact No.",
                  style: TextStyle(
                      color: Appcolors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black)),
                  )),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 250,
                ),
                child: Text(
                  "Location",
                  style: TextStyle(
                      color: Appcolors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  child: Text(
                    "     ${widget.list_member!.memberPickupLocation}    <--------->    ${widget.list_member!.memberDropLocation}                    ",
                    style: TextStyle(
                      color: Appcolors.gray,
                    ),
                  ),

                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.black)),
                    )),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Pick up time",
                          style: TextStyle(
                              color: Appcolors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${widget.list_member!.pickUpTime}:00",
                          style: TextStyle(
                            color: Appcolors.gray,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Drop time",
                          style: TextStyle(
                              color: Appcolors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${widget.list_member!.dropTime}:00",
                          style: TextStyle(
                            color: Appcolors.gray,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black)),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 250,
                ),
                child: Text(
                  "Address",
                  style: TextStyle(
                      color: Appcolors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black)),
                  )),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 220,
                ),
                child: Text(
                  "Pending fees",
                  style: TextStyle(
                      color: Appcolors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black)),
                  )),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 250,
                ),
                child: Text(
                  "Paid fees",
                  style: TextStyle(
                      color: Appcolors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
