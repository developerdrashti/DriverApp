// import 'package:dropikmed001/utils/AppColors.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// class Messsage_detail extends StatefulWidget {
//   const Messsage_detail({Key? key}) : super(key: key);
//
//   @override
//   State<Messsage_detail> createState() => _Messsage_detailState();
// }
//
// class _Messsage_detailState extends State<Messsage_detail> {
//   String? _chosenValue2;
//
//   TextEditingController timeinput = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(
//       backgroundColor: Appcolors.primary,
//       title: Text(
//         "Message",
//         style:
//         TextStyle(fontWeight: FontWeight.bold, fontFamily: 'OpenSana'),
//       ),
//     ),
//
//         body:
//
//         SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: double.maxFinite,
//                 height: 60,
//                 margin: EdgeInsets.all(20),
//                 padding: EdgeInsets.only(top: 10,left:20,right: 20,bottom: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.withOpacity(0.08),
//                   borderRadius:
//                   BorderRadius.circular(
//                       12.0),
//
//                 ),
//                 child: DropdownButtonFormField<String>(
//                   hint: Text('Please select'),
//                   items: <String>[
//                     'Break Down',
//                     'Puncher',
//                     'Accident',
//
//                   ].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: new Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (Value) {
//                     setState(() {
//                       _chosenValue2 = Value;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(height: 30,),
//               Center(
//                 child: Container(
//                   width: double.maxFinite,
//                   height: 50,
//                   margin: EdgeInsets.symmetric(
//                     horizontal: 20,
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey.withOpacity(0.05)),
//                   child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 30,
//                       ),
//                       child: TextFormField(
//                         controller: timeinput,
//                         decoration: InputDecoration(
//                           labelText: "Time",
//                           suffixIcon: Icon(Icons.timer),
//                         ),
//                         readOnly: true,
//                         onTap: () async {
//                           TimeOfDay? pickedTime = await showTimePicker(
//                             initialTime: TimeOfDay.now(),
//                             context: context,
//                           );
//
//                           if (pickedTime != null) {
//                             print(pickedTime.format(context));
//                             DateTime parsedTime = DateFormat.jm()
//                                 .parse(pickedTime.format(context).toString());
//
//                             print(parsedTime);
//                             String formattedTime =
//                             DateFormat('HH:mm:ss').format(parsedTime);
//                             print(formattedTime);
//
//                             setState(() {
//                               timeinput.text = formattedTime;
//                             });
//                           } else {
//                             print("Time is not selected");
//                           }
//                         },
//                       )),
//                 ),
//               ),
//               SizedBox(height: 30,),
//               Container(
//                 width: double.maxFinite,
//                 height: 150,
//                 margin: EdgeInsets.symmetric(
//                   horizontal: 20,
//                 ),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.grey.withOpacity(0.05)),
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.only(top: 10),
//                     hintText: "Remarks",
//                   ),
//                   keyboardType: TextInputType.text,
//                   autofocus: false,
//                 ),
//               ),
//
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                     margin: EdgeInsets.only(left: 20, right: 20,top: 200),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(20))),
//                     height: 50,
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: Size(00, 50),
//                         primary: Color(0xFFec9c24),
//                       ),
//                        onPressed: () {
//                       //   Adddriverleave(_itemSelected!.id,_itemSelected1!.id,"function leave");
//                         // setState(() {
//                         //   Navigator.push(
//                         //       context,
//                         //       MaterialPageRoute(
//                         //           builder: (context) => Profile_details()));
//                         // }
//                         // );
//                       },
//                       child: Text(
//                         "        Save        ",
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Appcolors.white,
//                             fontWeight: FontWeight.w600,
//                             fontFamily: 'OpenSans'),
//                       ),
//                     )),
//               ),
//             ]),
//         ),
//     );
//
//
//
//
//
//
//
//   }
// }
import 'package:dropikmed001/Model/AddMessagetype.dart';
import 'package:dropikmed001/Model/Messagetype.dart';
import 'package:dropikmed001/Model/login_model.dart';
import 'package:dropikmed001/Services/Apiclass.dart';
import 'package:dropikmed001/Services/sessionmanagement.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Messsage_detail extends StatefulWidget {
  const Messsage_detail({Key? key}) : super(key: key);

  @override
  State<Messsage_detail> createState() => _Messsage_detailState();
}

class _Messsage_detailState extends State<Messsage_detail> {
  String? _chosenValue2;

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
    getdatamessagetype();
    // getAllCategory();

    //  print("abcd${fetchdetils}");
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
                    hint: Text(''),
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
                      if (_formKey.currentState!.validate()) {
                        if (message.text.isNotEmpty) {
                          AddMessagetype(_itemSelected!.messageType,
                              timeinput.text, message.text)
                              .whenComplete(() {
                            Navigator.pop(context);
                          });
                        }

                        print("working");
                      } else {
                        print("Not Woring");
                      }
                      // AddMessagetype(_itemSelected!.messageType, timeinput.text,
                      //     message.text);
                      //   Adddriverleave(_itemSelected!.id,_itemSelected1!.id,"function leave");
                      // setState(() {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => Profile_details()));
                      // }
                      // );
                    },
                    child: Text(
                      "        SAVE        ",
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
    String? token = leave.result.res.response.token;
    Messagetype? country = await httpService.getMessagetype(token);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
      _dropdownItems = country.messageTypes;
      _itemSelected = _dropdownItems.first;
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

  Future<void> AddMessagetype(
      String messagetype, String time, String message) async {
    print("add Driver message");
    HttpService api = HttpService();
    SessionManagement sessionManagement = await SessionManagement();
    LoginModel addleave = await sessionManagement.getModel("Driver");
    String? token = addleave.result.res.response.token;
    String driverid = addleave.result.res.response.driverId;
    print(token);

    AddMessageType login = await api.AddMessagetype(
        token,
        driverid,
        _itemSelected!.id.toString(),
        message,
        time,
        "63d3c385299f832bb7042045",
        "63d3c385299f832bb7042045",
        true.toString(),
        false.toString());
    print(login.message);
    if (login.message == "Ok") {
      print("update data successfully");
      Fluttertoast.showToast(
          msg: "Message Add successfully", toastLength: Toast.LENGTH_LONG);
    } else {
      Fluttertoast.showToast(
          msg: "Message not Add", toastLength: Toast.LENGTH_LONG);
    }
  }
}
