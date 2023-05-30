import 'dart:async';

import 'package:dropikmed001/Model/Failed.dart';
import 'package:dropikmed001/Services/Apiclass.dart';
import 'package:dropikmed001/Services/sessionmanagement.dart';

import 'package:dropikmed001/screens/Navigation_screen.dart';
import 'package:dropikmed001/screens/Password_confirm_screen.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:dropikmed001/utils/AppImages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/login_model.dart';
import '../Services/firebaseService.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController _phonenumberController = TextEditingController();
  String devicetoken = "";
  bool isLoading=false;
  bool contcterror=false;
  @override
  void initState() {
    super.initState();
    getdevicetoken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
              child: Stack(
            children: [
              Container(
                child: Image.asset(Appimages.background),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Image.asset(Appimages.bus),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 390, left: 0),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 30,
                          color: Appcolors.black,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.05)),
                margin: EdgeInsets.only(top: 470, right: 25, left: 25),
                child: TextField(
                  controller: _phonenumberController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: " Enter your mobile number",
                    errorText: contcterror?"":null
                  ),
                  keyboardType: TextInputType.phone,
                  autofocus: false,
                ),
              ),
              SizedBox(
                height: 39,
              ),
              Container(
                width: double.maxFinite,
                // alignment: Alignment.center,
                margin: EdgeInsets.only(top: 590, right: 40, left: 40),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(00, 50),
                      primary: Color(0xFFec9c24),
                    ),
                    onPressed: () {
                      //CheckLogin(_phonenumberController.text,devicetoken,"devicedetail",true);
                     if(_phonenumberController.text.trim().isNotEmpty){
                       setState(() {
                         isLoading=true;
                       });
                       logincheck(_phonenumberController.text, devicetoken, "devicedetail", true);

                     }else{
                       setState(() {
                         _phonenumberController.text.trim().isEmpty?contcterror=true:contcterror=false;
                       });
                     }
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 20,
                          color: Appcolors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans'),
                    )),
              )
            ],
          )),
        ],
      ),
    );
  }

  void Checklogin(String username,String deviceid,String Devicedetail,bool isfrommobile) async{
    HttpService api=  HttpService();
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    dynamic login= await api.checkLogin(username,deviceid,Devicedetail,isfrommobile);
    print(login["isSuccess"]);
    if(login["isSuccess"]==true){
      SessionManagement sessionManagement=SessionManagement();
      await sharedPreferences.setBool("Login", true);
      bool setlogin=await sharedPreferences.setBool("Login", true);
      LoginModel logindata=LoginModel.fromJson(login);
      sessionManagement.CreateSession(logindata);
      firebaseservices().getNumberandVerify(username, context);
      Fluttertoast.showToast(msg: logindata.message,toastLength: Toast.LENGTH_LONG);
      setState(() {
        isLoading=false;
      });
      if(setlogin==true){
        Timer( Duration(seconds: 2),
                ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>password_confirm_screen()))
        );
      }else{
        Timer( Duration(seconds: 2),
                ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationScreen()))
        );
      }

    }else{
      Failed fail=Failed.fromJson(login);
      Fluttertoast.showToast(msg: fail.message,toastLength: Toast.LENGTH_SHORT);
      print(fail.message);
      setState(() {
        isLoading=false;
      });
    }
  }

  void getdevicetoken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = await preferences.getString("Token");
    devicetoken = token!;
    print("GET DEVICE TOKEN");
    print(devicetoken);
    setState(() {
      devicetoken = token;
    });
  }



  void logincheck(String username, String deviceid, String Devicedetail, bool isfrommobile) async {
    HttpService api = HttpService();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    dynamic login =
    await api.checkLogin(username, deviceid, Devicedetail, isfrommobile);
    print(login["isSuccess"]);
    if (login["isSuccess"] == true) {
      SessionManagement sessionManagement = SessionManagement();
      await sharedPreferences.setBool("Login", true);
      bool setlogin = await sharedPreferences.setBool("Login", true);
      LoginModel logindata = LoginModel.fromJson(login);
      sessionManagement.CreateSession(logindata);
      Fluttertoast.showToast(
          msg: logindata.message, toastLength: Toast.LENGTH_LONG);
      if (setlogin == true) {
        Timer(
            Duration(seconds: 2),
                () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => password_confirm_screen())));
      } else {
        Timer(
            Duration(seconds: 2),
                () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => NavigationScreen())));
      }
    } else {
      Fluttertoast.showToast(
          msg: "Something went wrong try again", toastLength: Toast.LENGTH_SHORT);
    }
  }
}
