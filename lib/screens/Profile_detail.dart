import 'dart:convert';
import 'dart:io';

import 'package:dropikmed001/Model/Profile.dart';
import 'package:dropikmed001/Model/UpdateProfile.dart';
import 'package:dropikmed001/Model/login_model.dart';
import 'package:dropikmed001/Services/Apiclass.dart';
import 'package:dropikmed001/Services/sessionmanagement.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:dropikmed001/utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Navigation_screen.dart';
import 'Profile.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/AppColors.dart';
import 'package:path/path.dart' as path;

class Profile_details extends StatefulWidget {
  var name;var email;var contact;var address;var image;
  Profile_details(this.name, this.email, this.contact, this.address,this.image);
  @override
  State<Profile_details> createState() => _Profile_detailsState();
}

class _Profile_detailsState extends State<Profile_details> {
  final _formkey = GlobalKey<FormState>();
  File? galleryFile;
  bool nameValidation = false;
  bool moblieValidation = false;
  bool emailValidation = false;
  bool addressValidation = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController contactnocontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController bloodgroupcontroller = TextEditingController();
  String image="http://3.26.113.171:8080/member/image/";
  String _base64Image="";
  String Selectedimage="";
  String ImageName ="";
  String binart="";
  String profile="";
  String imagepath = "";
  bool NAME=false;
  bool EMAIL=false;
  bool ADDRESS=false;
  @override
  void initState() {
    super.initState();

    dataset();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text(
          "Profile Details",
          style: TextStyle(
              fontFamily: "OpenSans", color: Appcolors.white, fontSize: 20),
        ),
      ),
      body: Stack(children: [
        Column(
          children: [
            Expanded(
                child: Container(
              color: Appcolors.primary,
            )),
            Expanded(
                child: Container(
              color: Appcolors.white,
            ))
          ],
        ),
        SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Stack(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 80),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Appcolors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  margin: EdgeInsets.only(top: 100, bottom: 10),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 100),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 40, left: 20),
                                          child: Text(
                                            " Name",
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 16),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          height: 50,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: nameValidation == true
                                                      ? Colors.red
                                                      : Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey
                                                  .withOpacity(0.05)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                setState(() {
                                                  nameValidation = true;
                                                });
                                                return null;
                                              }
                                              return null;
                                            },
                                            controller: namecontroller,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(top: 10),
                                              hintText: "${widget.name}",
                                            ),
                                            keyboardType: TextInputType.text,
                                            autofocus: false,
                                          ),
                                        ),

                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 40, left: 20),
                                          child: Text(
                                            " E-Mail",
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 16),
                                          ),
                                        ),
                                        Container(
                                          width: double.maxFinite,
                                          height: 50,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: emailValidation == true
                                                      ? Colors.red
                                                      : Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey
                                                  .withOpacity(0.05)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                setState(() {
                                                  emailValidation = true;
                                                });
                                                return null;
                                              }
                                              return null;
                                            },
                                            controller: emailcontroller,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(top: 10),
                                              hintText: "${widget.email}",
                                            ),
                                            keyboardType: TextInputType.text,
                                            autofocus: false,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 40, left: 22),
                                          child: Text(
                                            "Address",
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 16),
                                          ),
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
                                                  color:
                                                      addressValidation == true
                                                          ? Colors.red
                                                          : Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey
                                                  .withOpacity(0.05)),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                setState(() {
                                                  addressValidation = true;
                                                });
                                                return null;
                                              }
                                              return null;
                                            },
                                            controller: addresscontroller,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.only(top: 10),
                                              hintText: "${widget.address}",
                                            ),
                                            keyboardType: TextInputType.text,
                                            autofocus: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))),
                          GestureDetector(
                            onTap: (){
                              _showPicker(context: context);
                            },
                            child: galleryFile==null?Container(
                              margin: const EdgeInsets.only(left: 0,top: 20),
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Appcolors.primary,
                                    width: 3.0,
                                    style: BorderStyle.solid),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(160)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Appcolors.primary.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 25,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 16.0,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child:Image.network("", height: 200,
                                      width: 200,)

                                ),
                              ),

                            ):Container(
                              margin: const EdgeInsets.only(left: 0,top: 20),
                              height: 180,
                              width: 180,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Appcolors.primary,
                                    width: 3.0,
                                    style: BorderStyle.solid),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(160)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Appcolors.primary.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 25,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 16.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child:
                                  Image.file(galleryFile!,height: 200,width: 200,

                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
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
                onPressed: (){
                  //Navigator.push(context,MaterialPageRoute(builder: (context)=>EditStudentsDetails()));
                  if(namecontroller.text.trim().isNotEmpty && emailcontroller.text.trim().isNotEmpty && addresscontroller.text.trim().isNotEmpty){
                    updateprofile(namecontroller.text,emailcontroller.text,addresscontroller.text,bloodgroupcontroller.text,);
                  }else{
                    setState(() {
                      namecontroller.text.trim().isEmpty?NAME=true:NAME=false;
                      emailcontroller.text.trim().isEmpty?EMAIL=true:EMAIL=false;
                      addresscontroller.text.trim().isEmpty?ADDRESS=true:ADDRESS=false;
                    });
                  }
                },
                child: Text(
                  "        UPDATE        ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Appcolors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans'),
                ),
              )),
        ),
      ]),
    );
  }

  void updateprofile(String name,String Email,String address,String bloodgroup,) async {
    print("UPDATED PROFILE");
    HttpService api = HttpService();
    SessionManagement sessionManagement = await SessionManagement();
    LoginModel updateprofile = await sessionManagement.getModel("Driver");
    String token = updateprofile.result.res.response.token;
    String memberid = updateprofile.result.res.response.driverId;
    UpdateProfile update = await api.updateprofile(token,memberid,Selectedimage,ImageName,bloodgroup,name,Email);
    print(update.message);
    if (update.message == "Ok") {
      print(update.message);
      // Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
      Fluttertoast.showToast(
          msg: update.message!, toastLength: Toast.LENGTH_LONG);
    } else {
      Fluttertoast.showToast(msg: "notupdated", toastLength: Toast.LENGTH_LONG);
    }
  }

  void dataset() async {
    setState(() {
      namecontroller.text = widget.name!;
      contactnocontroller.text = widget.contact!;
      emailcontroller.text = widget.email!;
      addresscontroller.text = widget.address!;
    });
    //print(name);
  }

  void _showPicker({required BuildContext context,}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery,);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void getImage(ImageSource imageSource) async {
    var pickedFile = await ImagePicker().pickImage(
      source: imageSource,
    );

    if (pickedFile != null) {
      // imgFile= pickedFile as File;
      final imageName = path.basename(pickedFile.path);
      galleryFile = File(pickedFile.path);
      // base64Image = imgFile.path;
      _base64Image = base64Encode(galleryFile!.readAsBytesSync());
      print('imgFile path: $galleryFile');
      debugPrint('base64Image: $_base64Image');
      //selectedImagePath.value = pickedFile.path;
      setState(() {
        imagepath=pickedFile.path;
        Selectedimage=base64Encode(galleryFile!.readAsBytesSync());
        ImageName=path.basename(pickedFile.path);
         namecontroller.text=Selectedimage;
      });
      print("print selecte dimage data");
      print(Selectedimage);
      print(ImageName);

      // update();
    } else {

    }
  }
}
