import 'dart:convert';

import 'package:dropikmed001/Model/AddDriverLeave.dart';
import 'package:dropikmed001/Model/Leavetype.dart';
import 'package:dropikmed001/Model/SingleDriverleavedetail.dart';
import 'package:dropikmed001/Model/UpdateDriverleave.dart';
import 'package:dropikmed001/Model/shifttype.dart';
import 'package:dropikmed001/Services/Apiclass.dart';
import 'package:dropikmed001/Services/sessionmanagement.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../Model/login_model.dart';
import 'Leave.dart';
import 'Navigation_screen.dart';

class planedupdate extends StatefulWidget {

  var id;
  var shift;
  var leave;
  planedupdate(this.id,this.shift,this.leave);
  @override
  State<planedupdate> createState() => _planedupdateState();
}

class _planedupdateState extends State<planedupdate> {
  TextEditingController reson = TextEditingController();
  Driver? singlelist_leave ;
  String? _chosenValue3;
  String? _chosenValue4;
  String? _chosenValue5;
  bool backgroundNotification = true;
  int drodownvl = 0;
  var notificationmessege;
  bool shift = false;
  bool validation1 = false;
  bool validation2 = false;
  bool validation3 = false;
  LeaveType? fetchdetils;
  ShiftType? fetchdetil;
  List<DropdownMenuItem<String>>? items1 = [];
  List<DropdownMenuItem<String>>? items2 = [];
  String token="";
  List<LeaveTypeElement> _dropdownItems = [];
  LeaveTypeElement? _itemSelected;
  List<DropdownMenuItem<LeaveTypeElement>>? _dropdownMenuItems;
  List<ShiftTypeElement> _dropdownItems1 = [];
  ShiftTypeElement? _itemSelected1;
  List<DropdownMenuItem<ShiftTypeElement>>? _dropdownMenuItems1;
  final _formkey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  TextEditingController enddateinput = TextEditingController();
  bool isLoading=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setdataleave();
    getdataForshift();
    // getAllCategory();
    getdataForleave();
    //  print("abcd${fetchdetils}");
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "Leave Type",
                    style: TextStyle(
                        color: Appcolors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans'),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        hint: Text(widget.leave),
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_drop_down,
                        ),
                        value: _itemSelected,
                        items: _dropdownMenuItems,
                        onChanged: (value) {
                          setState(() {
                            _itemSelected = value as LeaveTypeElement?;
                          });
                        }),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 10),
                  child: Text(
                    "Start Date",
                    style: TextStyle(
                        color: Appcolors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: 50,
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: validation3 == true
                                    ? Colors.red
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.05)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  setState(() {
                                    validation3 = true;
                                  });
                                  return null;
                                }
                                return null;
                              },
                              controller: dateinput,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.date_range,
                                  color: Appcolors.black,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 15),
                                hintText: " Select start date",
                              ),
                              keyboardType: TextInputType.phone,
                              autofocus: false,
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(
                                        2000), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  print(pickedDate);
                                  String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                                  print(formattedDate);

                                  setState(() {
                                    dateinput.text = formattedDate;
                                  });
                                } else {
                                  print("Date is not selected");
                                }
                              },
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, top: 10),
                        child: Text(
                          "End Date",
                          style: TextStyle(
                              color: Appcolors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: 50,
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: validation1 == true
                                        ? Colors.red
                                        : Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(0.05)),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      setState(() {
                                        validation1 = true;
                                      });
                                      return null;
                                    }
                                    return null;
                                  },
                                  controller: enddateinput,
                                  decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.red)),
                                    suffixIcon: Icon(
                                      Icons.date_range,
                                      color: Appcolors.black,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 15),
                                    hintText: " Select End date",
                                  ),
                                  keyboardType: TextInputType.phone,
                                  autofocus: false,
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(pickedDate);
                                      String formattedDate =
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickedDate);
                                      print(formattedDate);

                                      setState(() {
                                        enddateinput.text = formattedDate;
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                )),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              shift == true
                                  ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 14),
                                child: Text(
                                  "Shift Type",
                                  style: TextStyle(
                                      color: Appcolors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'OpenSans'),
                                ),
                              )
                                  : Text(""),
                              shift == true
                                  ? Container(
                                width: double.maxFinite,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 11),
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      hint: Text(widget.shift),
                                      isExpanded: true,
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                      value: _itemSelected1,
                                      items: _dropdownMenuItems1,
                                      onChanged: (value) {
                                        setState(() {
                                          _itemSelected1 = value;
                                        });
                                      }),
                                ),
                              )
                                  : Text(""),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    child: Text(
                                      "Reason",
                                      style: TextStyle(
                                          color: Appcolors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'OpenSans'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    height: 100,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: validation2 == true
                                                ? Colors.red
                                                : Colors.transparent),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.withOpacity(0.05)),
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                    child: TextField(
                                      controller: reson,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(top: 10),
                                        hintText: "Reason",
                                      ),
                                      keyboardType: TextInputType.text,
                                      autofocus: false,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20))),
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(00, 50),
                                    primary: Color(0xFFec9c24),
                                  ),
                                  onPressed: () async {
                                    updateleave(dateinput.text,enddateinput.text,reson.text);

                                  },
                                  child: Text(


                                    "        Submit        ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Appcolors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'OpenSans'),
                                  ),
                                )),
                          ),
                        ],
                      )
                    ])
              ]),
        ));
  }

  void getdataForleave() async {
    HttpService httpService = HttpService();
    SessionManagement sessionManagement = SessionManagement();
    LoginModel leave = await sessionManagement.getModel("Driver");
    String? token = leave.result.res.response.token;
    LeaveType? country = await httpService.getLeavetype();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
      _dropdownItems = country!.leaveTypes;
     // _itemSelected = _dropdownItems.first;
      _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
      setState(() {});
    }));
  }

  List<DropdownMenuItem<LeaveTypeElement>> buildDropDownMenuItems(
      List listItems) {
    List<DropdownMenuItem<LeaveTypeElement>> items = [];
    for (LeaveTypeElement listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(
            listItem.name,
          ),
        ),
      );
    }
    return items;
  }
  void updateleave(String startdate,String enddate,String reson) async {
    HttpService api = HttpService();
    SessionManagement sessionManagement = await SessionManagement();
    LoginModel updateprofile = await sessionManagement.getModel("Driver");
    String token = updateprofile.result.res.response.token;
    String memberid = updateprofile.result.res.response.driverId;
    DateTime dateTime1 = DateFormat('dd-MM-yyyy').parse(startdate); // Replace this with your DateTime object
    String STARTDATE = DateFormat('yyyy-MM-dd').format(dateTime1);
    print("sdata print");
    print(STARTDATE);
    DateTime dateTime = DateFormat('dd-MM-yyyy').parse(enddate); // Replace this with your DateTime object
    String ENDDATE = DateFormat('yyyy-MM-dd').format(dateTime);
    print("sdata printABCDEFGTHG<SD<C:<:<C:LX<");
    print(STARTDATE);
    Updatedriverleave update = await api.updateDriverleave(token, widget.id,STARTDATE,ENDDATE,reson,_itemSelected1!.id,_itemSelected!.id);
    print(update.message);
    if (update.message == "Ok") {
      setState(() {
      });
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationScreen(selectIndex: 2,)), (route) => false);
      Fluttertoast.showToast(
          msg: update.message, toastLength: Toast.LENGTH_LONG);
    } else {
      Fluttertoast.showToast(msg: "notupdated", toastLength: Toast.LENGTH_LONG);
    }
  }

  void setdataleave() async {

    HttpService httpService = HttpService();
    SessionManagement sessionManagment = SessionManagement();
    LoginModel login=await sessionManagment.getModel("Driver");
    String token=login.result.res.response.token;
    SingleDriverleavedetail country = await httpService.getleavedata(token,widget.id);
    print("set single driver list");
    print(country.message);
    if(country.message=="Ok"){
      print("ASDFGHJKLZXCVBNMQWERTYUIOP");
      // SingleDriverleavedetail teacher = SingleDriverleavedetail.fromJson(country);
      setState((){
        singlelist_leave=country.driver;
        reson.text=singlelist_leave!.reason;
        String StartDate=DateFormat('dd-MM-yyyy').format(singlelist_leave!.startDate);
        String EtartDate=DateFormat('dd-MM-yyyy').format(singlelist_leave!.endDate);
        dateinput.text=StartDate;
        enddateinput.text=EtartDate;

        isLoading=false;
        print(singlelist_leave!.reason);
        print(singlelist_leave!.shiftTypeId);
        print(singlelist_leave!.shiftTypeId);
      });
    } else{
      setState((){
        isLoading=false;

      });
    }


  }

  void getdataForshift() async {
    HttpService httpService = HttpService();
    SessionManagement sessionManagement = SessionManagement();
    LoginModel leave = await sessionManagement.getModel("Driver");
    String? token = leave.result.res.response.token;
    ShiftType? country = await httpService.getShiftType(token);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
      _dropdownItems1 = country!.shiftTypes;
     // _itemSelected1 = _dropdownItems1.first;
      _dropdownMenuItems1 = buildDropDownMenuItems1(_dropdownItems1);
      shift = leave.result.res.isMultiShift;
      setState(() {});
    }));
  }

  List<DropdownMenuItem<ShiftTypeElement>> buildDropDownMenuItems1(
      List listItems) {
    List<DropdownMenuItem<ShiftTypeElement>> items = [];
    for (ShiftTypeElement listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(
            listItem.name,
          ),
        ),
      );
    }
    return items;
  }


}
