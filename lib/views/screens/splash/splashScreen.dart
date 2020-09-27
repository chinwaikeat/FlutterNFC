import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nfc_for_phone/views/screens/login/login.dart';
import 'package:package_info/package_info.dart';
//import 'package:nfc_for_phone/views/parts/bottomNavigation.dart';
import 'package:nfc_for_phone/views/parts/navigationDrawer.dart';
import 'package:nfc_for_phone/views/screens/login.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String latestVer = '';
  String projectVer = '';
  String projectVersion = "";
  var firstTimeRun;
  var updateContent = "";
  var userId = "";
  var currentLanguage = "";
  var updateMessage;

  Map<String, String> headers = {};

  getApplicationVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    projectVersion = packageInfo.version;
    setState(() {
      projectVer = projectVersion;
    });
  }

  validatePage() {
    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => BottomNavigation())));
    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => NavigationDrawer())));
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  void initState() {
    super.initState();
    getApplicationVersion();
    validatePage();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      decoration: BoxDecoration(
        image: new DecorationImage(
            image: AssetImage('lib/assets/img/background.png'),
            fit: BoxFit.fill),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
              child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 5),
                  child: Image(
                    image: AssetImage('lib/assets/img/logo.png'),
                    height: MediaQuery.of(context).size.width / 1.8,
                    width: MediaQuery.of(context).size.width / 1.8,
                  ))),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: new Text("VRB V" + projectVer,
                      style: new TextStyle(fontSize: 12.0, color: Colors.grey)),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
