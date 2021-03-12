import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nic_ro_plant_project/Utils/Style.dart';

import 'Screens/WalkThroughScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String tag = '/SplashScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationPage() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SDWalkThroughScreen(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF076ACF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 105,
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text(
                "NIC Ro Plant",
                style: secondaryTextStyle(
                  size: 25,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
