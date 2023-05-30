import 'package:dropikmed001/Model/AddMessagetype.dart';
import 'package:dropikmed001/Model/MessageUpdate.dart';
import 'package:dropikmed001/Model/Messagetype.dart';
import 'package:dropikmed001/Model/login_model.dart';
import 'package:dropikmed001/Services/Apiclass.dart';
import 'package:dropikmed001/Services/sessionmanagement.dart';
import 'package:dropikmed001/screens/Message.dart';
import 'package:dropikmed001/screens/Navigation_screen.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Messagedetailupdatescrren extends StatefulWidget {
  var id;
  var messagetype;
  var time;
  var message;
  Messagedetailupdatescrren(this.id, this.message, this.messagetype, this.time);

  @override
  State<Messagedetailupdatescrren> createState() =>
      Messagedetailupdatescrrenstate();
}

class Messagedetailupdatescrrenstate extends State<Messagedetailupdatescrren> {
  String? _chosenValue2;
  String? token;
  TextEditingController timeinput = TextEditingController();
  TextEditingController message = TextEditingController();
  int drodownvl = 0;
  bool validation1 = false;
  Messagetype? fetchdetils;
  List<DropdownMenuItem<String>>? items1 = [];
  List<MessageType> _dropdownItems = [];
  MessageType? _itemSelected;
  List<DropdownMenuItem<MessageType>>? _dropdownMenuItems;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setdata();
    getdatamessagetype();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
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
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(right: 200, top: 30),
              child: Text(
                "Message Type",
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
              margin: EdgeInsets.only(right: 10, left: 17, top: 10),
              // padding:
              // EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    hint: Text(widget.message),
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                    ),
                    value: _itemSelected,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _itemSelected = value as MessageType?;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: double.maxFinite,
                height: 50,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.05)),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: TextFormField(
                      controller: timeinput,
                      decoration: InputDecoration(
                        labelText: "Time",
                        suffixIcon: Icon(Icons.timer),
                      ),
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                        );

                        if (pickedTime != null) {
                          print(pickedTime.format(context));
                          DateTime parsedTime = DateFormat.jm()
                              .parse(pickedTime.format(context).toString());

                          print(parsedTime);
                          String formattedTime =
                              DateFormat('HH:mm:ss').format(parsedTime);
                          print(formattedTime);

                          setState(() {
                            timeinput.text = formattedTime;
                          });
                        } else {
                          print("Time is not selected");
                        }
                      },
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.maxFinite,
              height: 150,
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: validation1 == true
                          ? Colors.red
                          : Colors.transparent),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.05)),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                maxLines: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    setState(() {
                      validation1 = true;
                    });
                    return null;
                  }
                  return null;
                },
                controller: message,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 10),
                  hintText: "Message",
                ),
                keyboardType: TextInputType.text,
                autofocus: false,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 170),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(20))),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(00, 50),
                      primary: Color(0xFFec9c24),
                    ),
                    onPressed: () {
                      updatemessage(_itemSelected!.id,timeinput.text,message.text);
                    },
                    child: Text(
                      " Update  ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Appcolors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans'),
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }

  void getdatamessagetype() async {
    HttpService httpService = HttpService();
    SessionManagement sessionManagement = SessionManagement();
    LoginModel leave = await sessionManagement.getModel("Driver");
    token = leave.result.res.response.token;
    print("MESSAGEUPDATE TOKEN |$token");
    Messagetype? country = await httpService.getMessagetype(token!);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          _dropdownItems = country.messageTypes;
         // _itemSelected = _dropdownItems.first;
          _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
          setState(() {});
        }));
  }

  List<DropdownMenuItem<MessageType>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<MessageType>> items = [];
    for (MessageType listItem in listItems) {
      items.add(
        DropdownMenuItem(
          value: listItem,
          child: Text(
            listItem.messageType,
          ),
        ),
      );
    }
    return items;
  }



  void setdata() async{
    setState(() {
      timeinput.text=widget.time;
      message.text=widget.messagetype;

    });
    print("PRINTDATE SET");
    print(widget.messagetype);
    print(widget.time);print(widget.message);
  }

  void updatemessage( String messagetype,String timeinput, String message) async {
    HttpService api = HttpService();
    SessionManagement sessionManagement = await SessionManagement();
    LoginModel updateprofile = await sessionManagement.getModel("Driver");
    String token = updateprofile.result.res.response.token;
    MessageUpdate update = await api.updateDrivermessage(token,widget.id,widget.messagetype,timeinput,message);
    print(update.message);
    if (update.message == "Ok") {
      setState(() {

      });
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Message_screen()));
      Fluttertoast.showToast(
          msg: update.message, toastLength: Toast.LENGTH_LONG);
    } else {
      Fluttertoast.showToast(msg: "notupdated", toastLength: Toast.LENGTH_LONG);
    }
  }
}
