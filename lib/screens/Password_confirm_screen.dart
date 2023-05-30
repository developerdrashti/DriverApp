import 'dart:async';

import 'package:dropikmed001/Services/firebaseService.dart';
import 'package:dropikmed001/screens/Dashboard_screen.dart';
import 'package:dropikmed001/screens/Navigation_screen.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:dropikmed001/utils/AppImages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:telephony/telephony.dart';

class password_confirm_screen extends StatefulWidget {
  String? VerificationToken;
  String? phoneNumber;

  password_confirm_screen(
      {super.key, this.VerificationToken, this.phoneNumber});

  @override
  State<password_confirm_screen> createState() =>
      _password_confirm_screenState();
}

class _password_confirm_screenState extends State<password_confirm_screen> {
  Timer? _timer;
  TextEditingController _otpController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Telephony telephony = Telephony.instance;
  String? smscode;
  int secondss = 120;
  bool isshow = false;
  bool enableBtn = false;
  void callFUncation() {
    if (isshow == true) {
      firebaseservices().getResendOTPfn(widget.phoneNumber.toString(), context);
    } else {
      print("Value null wait ");
    }
  }

  @override
  void initState() {
    autofillsms();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (enableBtn == false) {
        setState(() {
          secondss--;
          if (secondss == 0) {
            setState(() {
              enableBtn = true;

              callFUncation();
            });
          }
        });
      } else {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  height: 40,
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 370, left: 0),
                    child: Center(
                      child: Text(
                        "OTP Verify",
                        style: TextStyle(
                            fontSize: 30,
                            color: Appcolors.black,
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                SizedBox(height: 20),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 430),
                    child: Text(
                      "please Enter The Verification Code \n               Send Your Mobile",
                      style: TextStyle(
                          color: Appcolors.darkblack,
                          fontSize: 16,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w600),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 500),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: PinCodeTextField(
                    length: 6,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeColor: Appcolors.primary,
                        inactiveColor: Appcolors.primary,
                        selectedColor: Appcolors.primary),

                    obscureText: false,
                    controller: _otpController,
                    keyboardType: TextInputType.phone,

                    animationType: AnimationType.slide,
                    animationDuration: Duration(milliseconds: 400),

                    // Pass it here
                    onChanged: (value) {
                      setState(() {
                        smscode = value;
                      });
                    },
                    appContext: context,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: 580, right: 40, left: 40),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(00, 50),
                        primary: Color(0xFFec9c24),
                      ),
                      onPressed: () async {
                        OTPVERIFY();
                        print("otpverify");
                      },
                      child: Center(
                        child: Text(
                          "VERIFY",
                          style: TextStyle(
                              fontSize: 20,
                              color: Appcolors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'OpenSans'),
                        ),
                      )),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 700),
                    child: InkWell(
                        onTap: () {
                          // setState(() {
                          //   isshow = false;
                          //   seconds = 29;
                          // });
                          // firebaseservices().getNumberandVerify(
                          //     widget.phoneNumber.toString(), context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont Receive the OTP?',
                                style: TextStyle(
                                  color: Appcolors.black,
                                )),
                            enableBtn == false
                                ? Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2, color: Appcolors.black)),
                                    child: Text(
                                      '${secondss}',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        _timer?.isActive;
                                        secondss = 120;
                                        enableBtn = false;
                                        isshow = true;
                                      });
                                    },
                                    child: Text(
                                      'Resend The OTP',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                          ],
                        ))),
                // Container(
                //     alignment: Alignment.center,
                //     margin: EdgeInsets.only(top: 700),
                //     child: InkWell(
                //       onTap: () {
                //         firebaseservices().getNumberandVerify(
                //             widget.phoneNumber.toString(), context);
                //       },
                //       child: RichText(
                //         text: TextSpan(
                //             text: 'Dont Receive the OTP?',
                //             style: TextStyle(
                //               color: Appcolors.black,
                //             ),
                //             children: [
                //               isshow == true
                //                   ? TextSpan(
                //                       text: 'Resend The OTP',
                //                       style: TextStyle(color: Colors.blue),
                //                     )
                //                   : TextSpan(
                //                       text: '$seconds',
                //                       style: TextStyle(color: Colors.blue),
                //                     )
                //             ]),
                //       ),
                //     )),
              ],
            )),
          ],
        ),
      ),
    );
  }

  void autofillsms() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print(message.address);
        print(message.body);
        print(message.date);
        print(
            "messege address :${message.address},, messege body : ${message.body}, , messsage.date ${message.date}");
        setState(() {});

        String sms = message.body.toString();
        print("SMS IS(-$sms-)");

        String otpcode = sms.replaceAll(new RegExp(r'[^0-9]'), '');
        print("otpcode IS(-$otpcode-)");

        String result = otpcode.substring(0, otpcode.length - 2);
        int modifiedNumber = int.parse(result);

        setState(() {
          _otpController.text = modifiedNumber.toString();
        });
      },
      listenInBackground: false,
    );
  }

  void OTPVERIFY()async {
    print("Verifycode");
    firebaseservices().otpVerifyFn(
        widget.VerificationToken.toString(),
        _otpController.text,
        context);

    print("${_otpController.text}");

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => NavigationScreen()));
  }
}
