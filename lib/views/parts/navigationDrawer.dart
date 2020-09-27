import 'package:flutter/material.dart';
import 'package:nfc_for_phone/views/screens/message/messageScreen.dart';
import 'package:nfc_for_phone/views/screens/main/mainScreen.dart';
import 'package:nfc_for_phone/views/screens/login/login.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer();
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  int index =0;
  List<Widget> list = [
      MainScreen(),
      MessageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Navigation Drawer"),
        ),
        body: list[index],
        drawer:MyDrawer(onTap: (ctx, i){
          setState(() {
              index = i;
              Navigator.pop(ctx);
          });
        } ,),
        )
    );  
  }
}


 class MyDrawer extends StatelessWidget{
   final Function onTap;

   MyDrawer({
     this.onTap
   });

    @override
    Widget build(BuildContext context){
      return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('lib/assets/img/userProfile.png'),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Test User', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
                      SizedBox(height: 15,),
                      Text('testuser@gmail.com', style: TextStyle(color: Colors.white, fontSize: 12),

                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Main'),
                onTap: ()=> onTap(context,0),
              ),
              Divider(height: 1,),
               ListTile(
                leading: Icon(Icons.message),
                title: Text('Message'),
                onTap: ()=> onTap(context,1),
              ),
              Divider(height: 1,),
               ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Log Out'),
                onTap: ()=> {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()))
                },
              )
            ]
          ),
        ),
      );
    }
  }