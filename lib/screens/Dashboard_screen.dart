import 'dart:async';

import 'package:dropikmed001/Model/Drivermapping.dart';
import 'package:dropikmed001/Model/Failed.dart';
import 'package:dropikmed001/Model/LatLng.dart';

import 'package:dropikmed001/Model/login_model.dart';
import 'package:dropikmed001/Services/Apiclass.dart';
import 'package:dropikmed001/Services/sessionmanagement.dart';
import 'package:dropikmed001/screens/Notification_scrren.dart';
import 'package:dropikmed001/utils/AppColors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dashboard_screen extends StatefulWidget {
  const Dashboard_screen({Key? key}) : super(key: key);

  @override
  State<Dashboard_screen> createState() => _Dashboard_screenState();
}

class _Dashboard_screenState extends State<Dashboard_screen> {
  Timer? refresh;
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(23.129318, 72.544884);
  static const LatLng destination = LatLng(23.129318, 72.544884);
  double? latvalue;
  // LocationData? currentLocation;

  // void getCurrentlocation() async {
  //   Location location = Location();

  //   location.getLocation().then((location) {
  //     currentLocation = location;
  //     setState(() {
  //       latvalue = currentLocation?.latitude;
  //       lngtvalue = currentLocation?.longitude;
  //     });
  //     print("lat value${latvalue}");
  //     print("lat value${lngtvalue}");
  //   });
  //   location.onLocationChanged.listen((newLoc) {
  //     currentLocation = newLoc;
  //     setState(() {});
  //   });
  // }

  double? lngtvalue;
  List<LatLng> polyCoordinates = [];
  List<Marker> getMarker = [];

  Future<void> _getNearByCars() async {
    var now = new DateTime.now().millisecondsSinceEpoch;

    getMarker.add(Marker(
      markerId: MarkerId('1'),
      position: latvalue != null ? LatLng(latvalue!, lngtvalue!) : destination,
      icon: BitmapDescriptor.defaultMarker,

      // infoWindow: InfoWindow(title: address, snippet: "go here"),
    ));
  }

  void getcurrent() {
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    StreamSubscription<Position> positionStream =
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      print(position.longitude);
      print(position.latitude);

      String long = position.longitude.toString();
      String lat = position.latitude.toString();
      print("currrent adres $long and $lat");
    });
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {});

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457
    print("Current data ${position.longitude}${position.latitude}");
    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      lngtvalue = position.longitude.toDouble();
      latvalue = position.latitude.toDouble();
      //refresh UI
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100,
    );

    StreamSubscription<Position> positionStream =
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      print(position.longitude);
      print(position.latitude);

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        lngtvalue = position.longitude.toDouble();
        latvalue = position.latitude.toDouble();
        _getNearByCars();
      });
    });
  }

  @override
  void initState() {
    Apicallmapping();
    checkGps();
    //  refresh = Timer.periodic(const Duration(seconds: 10), (_) => postLntLng());
    setdata();

    super.initState();
    //  getCurrentlocation();
  }

  List imageUrl = [
    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
    "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg",
    "https://cdn2.psychologytoday.com/assets/styles/manual_crop_1_91_1_1528x800/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=7lrLYx-B",
    "https://www.telegraph.co.uk/content/dam/royal-family/2022/11/28/TELEMMGLPICT000317879575_trans_NvBQzQNjv4BqA7N2CxnJWnYI3tCbVBgu9T0aesusvN1TE7a0ddd_esI.jpeg?imwidth=680",
  ];
  List profilename = [
    "drashti vekariya",
    'dhruvi gadhiya',
    'drashti hapani',
    'devani denisha'
  ];
  List starttiming = ["9:00", '10:30', '9:30', '9:00'];
  List endtiming = ["6:00", '7:30', '6:30', '6:00'];
  List placename = ["Gota Chokadi", 'Cross Road', 'Gota Chokadi', 'Cross Road'];
  String? drivername = "";
  String? drivernumber = "";
  String profiledriver = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text(
          "Dashboard",
          style: TextStyle(
              fontFamily: "OpenSans", color: Appcolors.white, fontSize: 20),
        ),
        leading: GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(Icons.menu),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
                // showAlertDialog(context);
              },
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Icon(Icons.notifications_none),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:Color.fromARGB(255, 230, 228, 228),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height:80,
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Appcolors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(Icons.bus_alert),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "8",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Pick up",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Appcolors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.login
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "8",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "In",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 80,
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Appcolors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.output),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "8",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Out",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Appcolors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.watch),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "8",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Wait",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'OpenSans'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: latvalue == null
                ? Center(
              child: CircularProgressIndicator(),
            )
                : GoogleMap(
              buildingsEnabled: true,
              myLocationEnabled: false,
              myLocationButtonEnabled: true,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                Factory<OneSequenceGestureRecognizer>(
                  // () => ScaleGestureRecognizer(),
                      () => HorizontalDragGestureRecognizer(),
                ),
              ].toSet(),
              zoomGesturesEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                  target: LatLng(latvalue!, lngtvalue!), zoom: 14.5),
              markers: getMarker.toSet(),
              onMapCreated: (mapcontroller) {
                _controller.complete(mapcontroller);
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: MediaQuery.of(context).size.height - 20,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: imageUrl.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 230, 228, 228),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(20), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(38), // Image radius
                              child: Image.network(imageUrl[index],
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 3, bottom: 1),
                                  child: Text(
                                    "${profilename[index]}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "PickUp",
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            "${starttiming[index]} AM",
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text("-----"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "Drop Off",
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            "${endtiming[index]} PM",
                                            style:
                                            TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 60),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on_sharp,
                                        size: 18,
                                        color: Appcolors.black,
                                      ),
                                      Text(
                                        "${placename[index]}",
                                        style:
                                        TextStyle(color: Appcolors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )),
        ]),
      ),
    );
  }

  void setdata() async {
    SessionManagement sessionManagement = SessionManagement();
    LoginModel driver = await sessionManagement.getModel('Driver');
    print(driver.result.res.response.token);
    setState(() {
      drivernumber = driver.result.res.response.contactNo;
      drivername = driver.result.res.response.id;
      // profiledriver = '052022';
    });
  }

  void postLntLng() async {
    HttpService api = HttpService();
    SessionManagement sessionManagement = await SessionManagement();
    LoginModel login = await sessionManagement.getModel("Driver");

    String? token = login.result.res.response.token;
    print(token);
    Latitudelongitude update = await api.AddLatlng(
      token,
      "63d3ae32299f832bb7041ff7",
      "$latvalue",
      "$lngtvalue",
      "200km/h",
      "45degree",
      "",
      "",
      "",
      "",
      "63d3b8cef66fc79998531b5b",
      "63d3b8cef66fc79998531b5b",
    );
    print(update.isSuccess);
  }

  void Apicallmapping() async{
    print("ASDFGHJKLZXCVBNM");
    HttpService api=  HttpService();
    SessionManagement sessionManagement=SessionManagement();
    LoginModel logindata = await sessionManagement.getModel('Driver');
    String token  = logindata.result.res.response.token;
    String driverid=logindata.result.res.response.driverId;
    String contct=logindata.result.res.response.contactNo;
    dynamic login= await api.Appmapping(token,contct,driverid);
    print("ABCDEFGHIJKLMN");
    print(login["isSuccess"]);
    print(login["isSuccess"]);
    if(login["isSuccess"]==true){
      Mappingdriver mapping=Mappingdriver.fromJson(login);
      sessionManagement.CreateSessionMap(mapping);
    }else{
      Failed fail=Failed.fromJson(login);
      print(fail.message);
    }
  }
}
