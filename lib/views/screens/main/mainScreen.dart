import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _supportsNFC = false;
  bool _reading = false;
  var testString = "";
  StreamSubscription<NDEFMessage> _stream;

  @override
  void initState() {
    super.initState();
    // Check if the device supports NFC reading
    NFC.isNDEFSupported.then((bool isSupported) {
      setState(() {
        _supportsNFC = isSupported;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_supportsNFC) {
      return RaisedButton(
        child: const Text("You device does not support NFC "),
        onPressed: null,
      );
    }

    return new Material(
        //onWillPop: () => Future.value(false),

        child: Scaffold(
            // appBar: PreferredSize(
            //     preferredSize: Size.fromHeight(45.0),
            //     child: new AppBar(
            //       title: Text(
            //         "Test Application For NFC",
            //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //       ),
            //       backgroundColor: Color(0xFF344789),
            //       elevation: 0.0,
            //       actions: <Widget>[
            //         new Icon(Icons.dashboard, color: Colors.transparent),
            //         new Icon(Icons.dashboard, color: Colors.transparent),
            //       ],
            //     )),
            body: new Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                        child:
                            Text(_reading ? "Stop reading" : "Start reading"),
                        onPressed: () {
                          if (_reading) {
                            _stream?.cancel();
                            setState(() {
                              _reading = false;
                            });
                          } else {
                            setState(() {
                              _reading = true;
                              // Start reading using NFC.readNDEF()
                              _stream = NFC
                                  .readNDEF(
                                once: true,
                                throwOnUserCancel: false,
                              )
                                  .listen((NDEFMessage message) {
                                testString = message.payload;
                                print("read NDEF message: ${message.payload}");
                              }, onError: (e) {
                                print("read NDEF message: ${e.toString()}");
                              });
                            });
                          }
                        }),
                    Text(
                      "text = " + testString,
                      style: TextStyle(color: Colors.grey[600]),
                    )
                  ],
                ))));
  }
}
