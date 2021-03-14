import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:nic_ro_plant_project/Screens/Weeklysurvey.dart';
import 'package:nic_ro_plant_project/Utils/Colors.dart';
import 'package:nic_ro_plant_project/Utils/Style.dart';

import '../Weeklysurveyreport.dart';
import 'Addwaterplant.dart';
import 'Newcomplaint.dart';
import 'Solvedcomplaints.dart';
import 'Unsolvedcomplaints.dart';
List<String> activelist=[];

List<String> dashboarditemsPDO = [
  "ವಾರಕ್ಕೊಮ್ಮೆ ಘಟಕದ ಸ್ಥಿತಿ ದಾಖಲಿಸಿ",
  "ವಾರಕ್ಕೊಮ್ಮೆ ಘಟಕದ ಸ್ಥಿತಿ \nದಾಖಲಿಸಿದ ವಿವರ",
  "ದೂರು ದಾಖಲಿಸು",
  "ಬಾಕಿ ಇರುವ ದೂರುಗಳ ವಿವರ",
  "ಪರಿಹರಿಸಿರುವ ದೂರುಗಳ ವಿವರ",
  "ನೀರಿನ ಘಾಟಕಾ ಸೇರಿಸಿ"
];

List<String> dashboarditemsCEO = [
  "ಜಿಲ್ಲಾ ಅಂಕಿಅಂಶಗಳು",
  "ಬಾಕಿ ಇರುವ ದೂರುಗಳ ವಿವರ",
  "ಪರಿಹರಿಸಿರುವ ದೂರುಗಳ ವಿವರ",
];

List<String> dashboarditemsEO = [
  "ಬಾಕಿ ಇರುವ ದೂರುಗಳ ವಿವರ",
  "ಪರಿಹರಿಸಿರುವ ದೂರುಗಳ ವಿವರ",
];

List<String> dashboarditemsAEE = [
  "ವಾರಕ್ಕೊಮ್ಮೆ ಘಟಕದ ಸ್ಥಿತಿ ದಾಖಲಿಸಿ",
  "ವಾರಕ್ಕೊಮ್ಮೆ ಘಟಕದ ಸ್ಥಿತಿ \nದಾಖಲಿಸಿದ ವಿವರ",
  "ದೂರು ದಾಖಲಿಸು",
  "ಬಾಕಿ ಇರುವ ದೂರುಗಳ ವಿವರ",
  "ಪರಿಹರಿಸಿರುವ ದೂರುಗಳ ವಿವರ",
];

Widget SDDashboard(BuildContext context, String selection) {
  if(selection=="PDO"){
    activelist = dashboarditemsPDO;
  }else if(selection=="CEO"){
     activelist = dashboarditemsCEO;
  }
  else if(selection=="EO"){
     activelist = dashboarditemsEO;
  }
  else if(selection=="AEE"){
    activelist = dashboarditemsAEE;
  }
  changeStatusColor(sdPrimaryColor);
  return new Scaffold(
      appBar: new AppBar(title: new Text("ಡ್ಯಾಶ್‌ಬೋರ್ಡ್"),),
      body: new Column(
        children: <Widget>[
          new Expanded(
              child: new ListView.builder(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.vertical,
                  itemCount: activelist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if(selection=="PDO"){
                          if(index==0){
                            print("0");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Weeklysurvey(),
                              ),
                            );
                          }
                          if(index==1){
                            print("1");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Weeklysurveyreport(),
                              ),
                            );
                          }
                          if(index==2){
                            print("2");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Weeklysurvey(),
                              ),
                            );
                          }
                          if(index==3){
                            print("3");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Unsolvedcomplaints(),
                              ),
                            );
                          }
                          if(index==4){
                            print("4");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Solvedcomplaints(),
                              ),
                            );
                          }
                          if(index==5){
                            print("5");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Addwaterplant(),
                              ),
                            );
                          }
                          // activelist = dashboarditemsPDO;
                        }else if(selection=="CEO"){
                          if(index==0){
                            print("0");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // builder: (context) => Districtreport(),
                              ),
                            );
                          }
                          if(index==1){
                            print("1");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Unsolvedcomplaints(),
                              ),
                            );
                          }
                          if(index==2){
                            print("2");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Solvedcomplaints(),
                              ),
                            );
                          }
                        }
                        else if(selection=="EO"){
                          if(index==0){
                            print("0");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Solvedcomplaints(),
                              ),
                            );
                          }
                          if(index==1){
                            print("1");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Unsolvedcomplaints(),
                              ),
                            );
                          }

                        }
                        else if(selection=="AEE"){
                          if(index==0){
                            print("0");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Weeklysurvey(),
                              ),
                            );
                          }
                          if(index==1){
                            print("1");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Weeklysurveyreport(),
                              ),
                            );
                          }
                          if(index==2){
                            print("2");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Weeklysurvey(),
                              ),
                            );
                          }
                          if(index==3){
                            print("3");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Unsolvedcomplaints(),
                              ),
                            );
                          }
                          if(index==4){
                            print("4");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Solvedcomplaints(),
                              ),
                            );
                          }
                        }

                      },
                      child: Container(
                        width: 180.0,
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: boxDecoration(
                          radius: 8,
                          spreadRadius: 1,
                          blurRadius: 4,
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.blueAccent],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              activelist[index],
                              style: secondaryTextStyle(textColor: Colors.white, size: 20),
                            ),

                            Material
                              (
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(24.0),
                                child: Center
                                  (
                                    child: Padding
                                      (
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(Icons.arrow_forward, color: Colors.white, size: 30.0),
                                    )
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  }),
          )
        ],
      )
  );
}
