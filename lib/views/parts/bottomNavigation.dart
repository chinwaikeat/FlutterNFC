import 'package:flutter/material.dart';
import 'package:nfc_for_phone/views/screens/message/messageScreen.dart';
import 'package:nfc_for_phone/views/screens/main/mainScreen.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation();
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigation> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      MainScreen(),
      MessageScreen(),
    ];

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        iconSize: 24.0,
        fixedColor: Colors.blue[800],
        //showSelectedLabels: true,
        //selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(const IconData(0xe904, fontFamily: 'icomoon')),
              title: Text("Main", style: TextStyle(fontSize: 12))),
          BottomNavigationBarItem(
              icon: Icon(const IconData(0xe901, fontFamily: 'icomoon')),
              title: Text("Message", style: TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}
