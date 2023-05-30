import 'package:dropikmed001/Model/AddDriverLeave.dart';
import 'package:dropikmed001/Model/Drivermapping.dart';
import 'package:dropikmed001/Model/Leavetype.dart';
import 'package:dropikmed001/Model/login_model.dart';
import 'package:dropikmed001/Model/shifttype.dart';
import 'package:dropikmed001/Services/Apiclass.dart';
import 'package:dropikmed001/Services/sessionmanagement.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'Leave.dart';
import 'Navigation_screen.dart';

class Today_Leave extends StatefulWidget {




  @override
  State<Today_Leave> createState() => _Today_LeaveState();
}

class _Today_LeaveState extends State<Today_Leave> {
  String? _chosenValue1;
  String? _chosenValue2;
  String shiftid="";
  String vehicalid="";
  String updatedby="";
  bool backgroundNotification = true;
  int drodownvl = 0;
  var notificationmessege;
  int shift = 1;
  bool Reasonvalidation = false;
  var type;
  var resons;
  LeaveType? fetchdetils;
  ShiftType? fetchdetil;
  List<DropdownMenuItem<String>>? items1 = [];
  List<DropdownMenuItem<String>>? items2 = [];
  String? token;
  List<LeaveTypeElement> _dropdownItems = [];
  LeaveTypeElement? _itemSelected;
  List<DropdownMenuItem<LeaveTypeElement>>? _dropdownMenuItems;
  List<ShiftTypeElement> _dropdownItems1 = [];
  ShiftTypeElement? _itemSelected1;
  List<DropdownMenuItem<ShiftTypeElement>>? _dropdownMenuItems1;
  TextEditingController Reson = TextEditingController();
  String date=DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setdata();
    getdataForshift();
    // getAllCategory();
    getdataForleave();
    //  print("abcd${fetchdetils}");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
              padding:
                  EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    hint: Text('Please select'),
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                    ),
                    value: type == null ? _itemSelected : type,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _itemSelected = value as LeaveTypeElement?;
                      });
                    }),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shift != 1
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
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
                shift !=1
                    ? Container(
                        width: double.maxFinite,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.only(
                            top: 10, left: 20, right: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              hint: Text('Please select'),
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
                          horizontal: 30, vertical: 15),
                      child: Text(
                        "Reason",
                        style: TextStyle(
                            color: Appcolors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 150,
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.05),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: Reson,
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
                SizedBox(
                  height: 100,
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
                          primary: Color(0xFFec9c24),
                        ),
                        onPressed: () {
                          shift==true?Addleavewithshift(_itemSelected!.id,_itemSelected1!.id,Reson.text,date,date):Addleavewithoutshift(_itemSelected!.id,_itemSelected1!.id,Reson.text,date,date);


                        },
                        child: Text(
                           "Submit",

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
          ]),
    );
  }

  void getdataForleave() async {
    HttpService httpService = HttpService();
    SessionManagement sessionManagement = SessionManagement();
    LoginModel leave = await sessionManagement.getModel("Driver");
    final token = leave.result.res.response.token;
    LeaveType? country = await httpService.getLeavetype();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          _dropdownItems = country!.leaveTypes;
          _itemSelected = _dropdownItems.first;
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

  void getdataForshift() async {
    HttpService httpService = HttpService();
    SessionManagement sessionManagement = SessionManagement();
    LoginModel leave = await sessionManagement.getModel("Driver");
    String? token = leave.result.res.response.token;
    ShiftType? country = await httpService.getShiftType(token);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          _dropdownItems1 = country!.shiftTypes;
          _itemSelected1 = _dropdownItems1.first;
          _dropdownMenuItems1 = buildDropDownMenuItems1(_dropdownItems1);
          shift = country.shiftTypes.length;
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

  void Addleavewithshift(String leavetype,String shifttype,String reson,String startdate,String enddate)async {
    print("add member leave");
    print("add with shift");
    HttpService api=  HttpService();
    SessionManagement sessionManagement=await SessionManagement();
    LoginModel addleave=await sessionManagement.getModel("Driver");
    String token= addleave.result.res.response.token;
    String driverid=addleave.result.res.response.driverId; // Replace this with your DateTime object
    DateTime dateTime = DateTime.parse("03-05-2023 00:00:00.000"); // Replace this with your DateTime object
    String formattedDateTime = DateFormat('yyyy-MM-dd').format(dateTime);
    print("sdata print");
    print(formattedDateTime);
    print(token);
    AddDriverLeave login= await api.AddDriverleave(token,driverid,shiftid,_itemSelected!.id,formattedDateTime,formattedDateTime,Reson.text,"","","","","",driverid,driverid);
    if(login.message=="Ok"){
      Fluttertoast.showToast(msg: "Leave Add successfully",toastLength: Toast.LENGTH_LONG);
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LeaveScreen())).whenComplete(() => ApiCall());
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationScreen(selectIndex:2)), (route) => false);

    }else{
      Fluttertoast.showToast(msg: "Leave not Add",toastLength: Toast.LENGTH_LONG);
    }

  }
  void Addleavewithoutshift(String leavetype,String shifttype,String reson,String startrdate,String enddate)async {
    print("add member leave");
    print("add member leave");
    print("add member leave");
    HttpService api=  HttpService();
    SessionManagement sessionManagement=await SessionManagement();
    LoginModel addleave=await sessionManagement.getModel("Member");
    String token= addleave.result.res.response.token;
    String driverid=addleave.result.res.response.driverId;
    print(token);
    DateTime dateTime1 = DateFormat('dd-MM-yyyy').parse(startrdate); // Replace this with your DateTime object
    String STARTDATE = DateFormat('yyyy-MM-dd').format(dateTime1);
    print("sdata print");
    print(STARTDATE);
    DateTime dateTime = DateFormat('dd-MM-yyyy').parse(enddate); // Replace this with your DateTime object
    String ENDDATE = DateFormat('yyyy-MM-dd').format(dateTime);
    print("sdata printABCDEFGTHG<SD<C:<:<C:LX<");
    print(token);
    print(driverid);
    print(shiftid);
    print(_itemSelected!.id);
    print(STARTDATE);
    print(ENDDATE);
    print(Reson.text);
    print(updatedby);
    AddDriverLeave login= await api.AddDriverleave(token,driverid,_itemSelected1!.id,_itemSelected!.id,STARTDATE,ENDDATE,Reson.text,"","","","","",driverid,driverid);

    if(login.message=="Ok"){
      print("update data successfully");
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveScreen())).whenComplete(() => ApiCall());
      Fluttertoast.showToast(msg: "Leave Add successfully",toastLength: Toast.LENGTH_LONG);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationScreen(selectIndex:2)), (route) => false);
    }else{
      Fluttertoast.showToast(msg: "Leave not Add",toastLength: Toast.LENGTH_LONG);
    }

  }



  void setdata()async {
    print("jfglrjfwkjdlxm,mx c,mdhiehfdnckxmzc,xz x.,jdleskjdmc ");
    SessionManagement session=await SessionManagement();
    Mappingdriver map=await session.getmodelMap("Map");
    print(map);
    setState(() {
      shiftid=map.result.driverDefaultMapping[0].shiftTypeId;
      updatedby=map.result.driverDefaultMapping[0].vehicleRegId;
    });
    print(shiftid);
    print(vehicalid);

  }

}
