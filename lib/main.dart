import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)
  );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FSBStatus drawerStatus;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.indigo[900],
      body: FoldableSidebarBuilder(
        drawerBackgroundColor: Colors.indigo[900],
        drawer: CustomDrawer(closeDrawer: (){
          setState(() {
            drawerStatus = FSBStatus.FSB_CLOSE;
          });
        },),
        screenContents: FirstScreen(),
        status: drawerStatus,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.menu,color: Colors.white,),
          onPressed: () {
            setState(() {
              drawerStatus = drawerStatus == FSBStatus.FSB_OPEN ? FSBStatus.FSB_CLOSE : FSBStatus.FSB_OPEN;
            });
          }),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[900],
      child: Center(child: Text("Flutter Foldable Navigation Sidebar",style: TextStyle(fontSize: 20,color: Colors.white),),),
    );
  }
}


class CustomDrawer extends StatelessWidget {

  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.blueAccent,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Container(
              width: double.infinity,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Icon(Icons.person,color: Colors.white,size: 100,),
                  Text("Sam",style: TextStyle(color: Colors.white70),)
                ],
              ),
              ),
          SizedBox(height: 10,),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.event,color: Colors.indigo[900],),
            title: Text(
              "Events",
              style: TextStyle(color: Colors.indigo[900]),
            ),
          ),
          SizedBox(height: 10,),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.payment_rounded,color: Colors.indigo[900],),
            title: Text(
              "Payments",
              style: TextStyle(color: Colors.indigo[900]),
            ),
          ),
          SizedBox(height: 10,),
           ListTile(
            onTap: (){},
            leading: Icon(Icons.notifications,color: Colors.indigo[900],),
            title: Text(
              "Notifications",
              style: TextStyle(color: Colors.indigo[900]),
            ),
          ),
          SizedBox(height: 10,),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.settings_rounded,color: Colors.indigo[900],),
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.indigo[900]),
            ),
          ),
          SizedBox(height: 10,),
           ListTile(
            onTap: (){},
            leading: Icon(Icons.logout_rounded,color: Colors.indigo[900],),
            title: Text(
              "Log Out",
              style: TextStyle(color: Colors.indigo[900]),
            ),
          ),
        ],
      ),
    );
  }
}



