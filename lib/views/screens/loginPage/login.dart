import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var idControler = new TextEditingController();
  var passControler = new TextEditingController();
  var answer = new TextEditingController();
  var currentLanguage = "";
  List<String> countryName = [];
  var selectedCountryCode = "";
  var countryList;
  var phoneCountryCode;
  var countryCode;
  var userId = "";

  var csrfNameKey = "";
  var csrfValueKey = "";
  var csrfName = "";
  var csrfValue = "";

  bool _loading = false;
  bool runCookies = false;
  bool _validatePassword = false;
  bool _validateUserName = false;
  bool getDataLoading = true;
  bool idIsEmpty = true;
  bool passwordIsEmpty = true;
  bool displayMode = true;
  bool langaugeChange = false;

  int theriGroupVakue = 0;

  Map<String, String> headers = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var body;

    final Map<int, Widget> logoWidgets = <int, Widget>{
      0: Text("Email Login", style: TextStyle(fontSize: 14)),
      1: Text("Phone No Login", style: TextStyle(fontSize: 14)),
    };

    body = new SingleChildScrollView(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new SizedBox(
            height: 20.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.only(top: 20),
                icon: Icon(
                  Icons.language,
                  size: 35,
                ),
                onPressed: () {},
              ),
              new SizedBox(
                width: 10.0,
              ),
            ],
          ),
          new Container(
              child: new Image(
            image: AssetImage('lib/assets/img/logo.png'),
            width: 150,
            height: 150,
          )),
          new SizedBox(
            height: 15.0,
          ),
          new Text(
            "Welcome",
            style: new TextStyle(fontSize: 22.0),
          ),
          new SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(22.0))),
            child: Center(
                child: Container(
                    width: 230,
                    alignment: Alignment(0.0, 0.0),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: CupertinoSegmentedControl(
                            selectedColor: Color(0xFF31468a),
                            borderColor: Color(0xFF31468a),
                            groupValue: theriGroupVakue,
                            onValueChanged: (changeFromGroupValue) {
                              setState(() {
                                theriGroupVakue = changeFromGroupValue;

                                displayMode = !displayMode;
                                if (displayMode == true) {
                                  if (userId.contains("@") &&
                                      userId.contains(".com")) {
                                    idIsEmpty = false;
                                    idControler.text = userId;
                                  } else {
                                    idIsEmpty = true;
                                    idControler.text = "";
                                  }
                                } else if (displayMode == false) {
                                  if (userId.contains("@") &&
                                      userId.contains(".com")) {
                                    idIsEmpty = true;
                                    idControler.text = "";
                                  } else {
                                    idIsEmpty = false;
                                    idControler.text = userId;
                                  }

                                  if (userId == "") {
                                    idIsEmpty = true;
                                    idControler.text = "";
                                  }
                                }
                              });
                            },
                            children: logoWidgets,
                          ),
                        ),
                      ],
                    ))),
          ),
          new SizedBox(
            height: 20.0,
          ),
          displayMode
              ? Container(
                  height: 180,
                  child: Column(
                    children: <Widget>[
                      new SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        padding: EdgeInsets.only(left: 15, right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3)
                            ]),
                        child: TextField(
                          controller: idControler,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.person_outline,
                              color: Colors.lightBlue[800],
                            ),
                            hintText: _validateUserName
                                ? "User Name Empty"
                                : "Hint User Nmae",
                            hintStyle: _validateUserName
                                ? TextStyle(fontSize: 14, color: Colors.red)
                                : TextStyle(fontSize: 14),
                            counterText: "",
                            suffixIcon: idIsEmpty
                                ? null
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        idControler.clear();
                                        idIsEmpty = true;
                                      });
                                    },
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(40.0)),
                                        color: Colors.grey[300],
                                      ),
                                      margin: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 9,
                                          bottom: 9),
                                      child: Icon(
                                        Icons.clear,
                                        size: 13,
                                      ),
                                    ),
                                  ),
                          ),
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                idIsEmpty = true;
                              });
                            } else {
                              setState(() {
                                idIsEmpty = false;
                              });
                            }
                          },
                          cursorColor: Colors.blue[900],
                        ),
                      ),
                      new SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        padding: EdgeInsets.only(left: 15, right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3)
                            ]),
                        child: TextField(
                          controller: passControler,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock_outline,
                                color: Colors.lightBlue[800],
                                size: 20,
                              ),
                              hintText: _validatePassword
                                  ? "Password Empty"
                                  : "Hint Password",
                              hintStyle: _validatePassword
                                  ? TextStyle(fontSize: 14, color: Colors.red)
                                  : TextStyle(fontSize: 14),
                              counterText: "",
                              suffixIcon: passwordIsEmpty
                                  ? null
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          passControler.clear();
                                          passwordIsEmpty = true;
                                        });
                                      },
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(40.0)),
                                          color: Colors.grey[300],
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 9,
                                            bottom: 9),
                                        child: Icon(
                                          Icons.clear,
                                          size: 13,
                                        ),
                                      ),
                                    )),
                          obscureText: true,
                          cursorColor: Colors.blue[900],
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                passwordIsEmpty = true;
                              });
                            } else {
                              setState(() {
                                passwordIsEmpty = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: EdgeInsets.only(left: 18, right: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3)
                            ]),
                        height: 45,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: selectedCountryCode,
                            onChanged: (String newValue) {
                              setState(() {
                                this.selectedCountryCode = newValue;
                                for (int i = 0; i < countryList.length; i++) {
                                  if (selectedCountryCode.split(" (+")[0] ==
                                      countryList[i]["name"]) {
                                    phoneCountryCode = countryList[i]["phone"];
                                    countryCode = countryList[i]["iso_code_2"];
                                  }
                                }
                              });
                            },
                            items: countryName
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      new SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        padding: EdgeInsets.only(left: 15, right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3)
                            ]),
                        child: TextField(
                          controller: idControler,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.person_outline,
                              color: Colors.lightBlue[800],
                            ),
                            hintText: _validateUserName
                                ? "Phone No Empty"
                                : "Hint Phone No",
                            hintStyle: _validateUserName
                                ? TextStyle(fontSize: 14, color: Colors.red)
                                : TextStyle(fontSize: 14),
                            counterText: "",
                            suffixIcon: idIsEmpty
                                ? null
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        idControler.clear();
                                        idIsEmpty = true;
                                      });
                                    },
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(40.0)),
                                        color: Colors.grey[300],
                                      ),
                                      margin: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 9,
                                          bottom: 9),
                                      child: Icon(
                                        Icons.clear,
                                        size: 13,
                                      ),
                                    ),
                                  ),
                          ),
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                idIsEmpty = true;
                              });
                            } else {
                              setState(() {
                                idIsEmpty = false;
                              });
                            }
                          },
                          cursorColor: Colors.blue[900],
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      new SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        padding: EdgeInsets.only(left: 15, right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3)
                            ]),
                        child: TextField(
                          controller: passControler,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock_outline,
                                color: Colors.lightBlue[800],
                                size: 20,
                              ),
                              hintText: _validatePassword
                                  ? "Login Password Empty"
                                  : "Hint Password",
                              hintStyle: _validatePassword
                                  ? TextStyle(fontSize: 14, color: Colors.red)
                                  : TextStyle(fontSize: 14),
                              counterText: "",
                              suffixIcon: passwordIsEmpty
                                  ? null
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          passControler.clear();
                                          passwordIsEmpty = true;
                                        });
                                      },
                                      child: Container(
                                        decoration: new BoxDecoration(
                                          borderRadius: new BorderRadius.all(
                                              new Radius.circular(40.0)),
                                          color: Colors.grey[300],
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 9,
                                            bottom: 9),
                                        child: Icon(
                                          Icons.clear,
                                          size: 13,
                                        ),
                                      ),
                                    )),
                          obscureText: true,
                          cursorColor: Colors.blue[900],
                          onChanged: (value) {
                            if (value.isEmpty) {
                              setState(() {
                                passwordIsEmpty = true;
                              });
                            } else {
                              setState(() {
                                passwordIsEmpty = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
          new SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                if (passControler.text.isEmpty && idControler.text.isEmpty) {
                  setState(() {
                    _validatePassword = true;
                    _validateUserName = true;
                  });
                } else if (idControler.text.isEmpty) {
                  setState(() {
                    _validateUserName = true;
                  });
                } else if (passControler.text.isEmpty) {
                  setState(() {
                    _validatePassword = true;
                  });
                } else {
                  if (getDataLoading == false) {
                  } else {
                    AlertDialog dialog = new AlertDialog(
                      content: new Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("* Error",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                          ]),
                    );
                    showDialog(context: context, child: dialog);
                  }
                }
              },
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )),
          new SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {},
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.lightBlue[700],
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )),
          new SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text("Forget Password",
                    style:
                        new TextStyle(fontSize: 14.0, color: Colors.black54)),
              )
            ],
          ),
        ],
      ),
    );

    return new WillPopScope(
        //onWillPop: () => Future.value(false),
        onWillPop: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        },
        child: Scaffold(
            body: new Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: new DecorationImage(
                image: AssetImage('lib/assets/img/background.png'),
                fit: BoxFit.fill),
          ),
          //child: _loading ? loader(body) : body,
          child: body,
        )));
  }
}
