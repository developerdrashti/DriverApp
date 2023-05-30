// import 'package:dropikmed001/utils/AppColors.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// class Change_Vehical extends StatefulWidget {
//   const Change_Vehical({Key? key}) : super(key: key);
//
//   @override
//   State<Change_Vehical> createState() => _Change_VehicalState();
// }
//
// class _Change_VehicalState extends State<Change_Vehical> {
//   TextEditingController timeinput =TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( appBar: AppBar(
//       backgroundColor: Appcolors.primary,
//       title: Text(
//         "Change_vehical",
//         style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'OpenSana'),
//       ),
//       actions: [
//         IconButton(onPressed: () {}, icon: Icon(Icons.notification_add))
//       ],
//     ),
//       body: Column(children: [Container(
//
//        margin: EdgeInsets.only(top: 10,right: 260),
//         child:  Text("Name",style: TextStyle(
//             color: Appcolors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             fontFamily: 'OpenSans'),
//         ),),
//
//
//
//         Container(
//           margin: EdgeInsets.all(15),
//           height: 50,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.grey.withOpacity(0.05)),
//
//           child: TextField(
//
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 10),
//               hintText: " Volvo Ac Bus",
//             ),
//             keyboardType: TextInputType.phone,
//             autofocus: false,
//           ),
//         ),
//         Container(
//
//           margin: EdgeInsets.only(top: 10,right: 180),
//           child:  Text("Vehicle Number",style: TextStyle(
//     color: Appcolors.black,
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'OpenSans'),
//     ),),
//
//
//
//         Container(
//           margin: EdgeInsets.all(15),
//           height: 50,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.grey.withOpacity(0.05)),
//
//           child: TextField(
//
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 10),
//               hintText: " MH 14 GJ 1234",
//             ),
//             keyboardType: TextInputType.phone,
//             autofocus: false,
//           ),
//         ),Container(
//
//           margin: EdgeInsets.only(top: 10,right: 250),
//           child:  Text("Time",style: TextStyle(
//               color: Appcolors.black,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               fontFamily: 'OpenSans'),
//           ),),
//
//
//
//
//                       Container(
//                       width: double.maxFinite,
//                       height: 50,
//                       margin: EdgeInsets.symmetric(
//                       horizontal: 20,
//                       ),
//                       decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.grey.withOpacity(0.05)),
//                       child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                       horizontal: 30,
//                       ),
//
//                         child:TextField(
//
//                           controller: timeinput,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.only(top: 10,right: 150),
//                             hintText: " Select Time",
//                           ),
//                         readOnly: true,
//                         onTap: () async {
//                         TimeOfDay? pickedTime =  await showTimePicker(
//                         initialTime: TimeOfDay.now(),
//                         context: context,
//                         );
//
//                         if(pickedTime != null ){
//                         print(pickedTime.format(context));
//                         DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
//
//                         print(parsedTime);
//                         String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
//                         print(formattedTime);
//                         setState(() {
//                         timeinput.text = formattedTime;
//                         });
//                         }else{
//                         print("Time is not selected");
//                         }
//                         },
//                         ),
//                         ),
//
//
//
//
//                         ),
//         Container(
//           width: double.maxFinite,
//           alignment: Alignment.center,
//           margin: EdgeInsets.only(top: 220, right: 40, left: 40),
//           child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(00, 50),
//                 primary: Color(0xFFec9c24),
//               ),
//               onPressed: () {
//                 // setState(() {
//                 //   Navigator.push(
//                 //       context,
//                 //       MaterialPageRoute(
//                 //           builder: (context) =>
//                 //               password_confirm_screen()));
//                 // });
//               },
//               child: Text(
//                 "                   Send                          ",
//                 style: TextStyle(
//                     fontSize: 20,
//                     color:
//                     Color.fromARGB(255, 255, 255, 255)),
//               )),
//         ),
//     ]));
//
//                       }
//                     }
