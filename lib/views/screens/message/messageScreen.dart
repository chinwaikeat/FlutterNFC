import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen();
  @override
  _MessageScreenState createState() => new _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool emptyNews = false;
  String token = "";
  var currentLanguage = " ";

  var newsList;
  int newsLength = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body;

    body = Scaffold(
        resizeToAvoidBottomPadding: false,
        // appBar: PreferredSize(
        //     preferredSize: Size.fromHeight(45.0),
        //     child: AppBar(
        //       brightness: Brightness.light,
        //       title: Text(
        //         "Message",
        //         style: TextStyle(
        //             fontSize: 18,
        //             color: Colors.black,
        //             fontWeight: FontWeight.bold),
        //       ),
        //       backgroundColor: Colors.white,
        //       centerTitle: true,
        //     )),
        body: new Container(
            child: ListView(
          children: <Widget>[
            Container(
              // padding: EdgeInsets.only(top: 300),
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: 280),
                        child: Column(children: <Widget>[
                          Text(
                            "Message Page",
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ]))
                  ]),
            )
          ],
        )));

    return new Material(
        type: MaterialType.transparency,
        child: new Container(
          child: body,
        ));
  }
}
