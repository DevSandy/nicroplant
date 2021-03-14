import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nic_ro_plant_project/Screens/Home/Newcomplaint.dart';
import 'package:nic_ro_plant_project/Screens/Weeklysurvey.dart';
import 'package:nic_ro_plant_project/Utils/Colors.dart';
import 'package:nic_ro_plant_project/Utils/Style.dart';

import 'Home/SDDashboardScreen.dart';
import 'Home/SDProfileScreen.dart';

class SDHomePageScreen extends StatefulWidget {
  String selection;
  SDHomePageScreen(this.selection,);

  @override
  _SDHomePageScreenState createState() => _SDHomePageScreenState(selection);
}

class _SDHomePageScreenState extends State<SDHomePageScreen> {
  int _currentIndex = 0;
  String selection;
  _SDHomePageScreenState(this.selection);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    changeStatusColor(sdAppBackground);
    final tab = [
      SDDashboard(context,selection),
      Weeklysurvey(),
      sdPRofileScreen(),
    ];

    return SafeArea(
      child: Scaffold(
          backgroundColor: sdAppBackground,
          body: tab[_currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [BoxShadow(color: sdShadowColor, spreadRadius: 0, blurRadius: 2)],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                    Icons.home,
                      color: sdIconColor,
                      size: 30.0,
                    ),
                    activeIcon: Icon(
                      Icons.home,
                      color: sdPrimaryColor,
                      size: 30.0,
                    ),
                    // icon: Image.asset('images/smartDeck/images/sdhome.png', height: 28, width: 28, color: sdIconColor),
                    // activeIcon: Image.asset('images/smartDeck/images/sdhome.png', height: 28, width: 28, color: sdPrimaryColor),
                    title: Text('a'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.cancel,
                      color: sdIconColor,
                      size: 30.0,
                    ),
                    activeIcon: Icon(
                      Icons.cancel,
                      color: sdPrimaryColor,
                      size: 30.0,
                    ),
                    // icon: Image.asset('images/smartDeck/images/sdhome.png', height: 28, width: 28, color: sdIconColor),
                    // activeIcon: Image.asset('images/smartDeck/images/sdhome.png', height: 28, width: 28, color: sdPrimaryColor),
                    title: Text('a'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: sdIconColor,
                      size: 30.0,
                    ),
                    activeIcon: Icon(
                      Icons.person,
                      color: sdPrimaryColor,
                      size: 30.0,
                    ),
                    // icon: Image.asset('images/smartDeck/images/sdhome.png', height: 28, width: 28, color: sdIconColor),
                    // activeIcon: Image.asset('images/smartDeck/images/sdhome.png', height: 28, width: 28, color: sdPrimaryColor),
                    title: Text('a'),
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          )),
    );
  }
}
