import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nic_ro_plant_project/Screens/SDLoginScreen.dart';
import 'package:nic_ro_plant_project/Utils/Colors.dart';
import 'package:nic_ro_plant_project/Utils/Style.dart';
import 'package:nic_ro_plant_project/Utils/Variables.dart';
import 'package:shared_preferences/shared_preferences.dart';


class sdPRofileScreen extends StatefulWidget {
  @override
  _sdPRofileScreenState createState() => _sdPRofileScreenState();
}

class _sdPRofileScreenState extends State<sdPRofileScreen> {
  // List<charts.Series<Task, String>> _taskPieData;

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  _generateData() {
    var taskData = [
      Task(task: 'Completed', value: 82.0, color: Colors.blue),
      Task(task: 'On going', value: 22.0, color: Colors.deepOrangeAccent),
    ];

    // _taskPieData.add(
    //   charts.Series(
    //     data: taskData,
    //     domainFn: (Task task, _) => task.task,
    //     measureFn: (Task task, _) => task.value,
    //     colorFn: (Task task, _) => charts.ColorUtil.fromDartColor(task.color),
    //     id: 'Montlhy',
    //   ),
    // );
  }

  @override
  void initState() {
    super.initState();
    // _taskPieData = List<charts.Series<Task, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {

    changeStatusColor(sdPrimaryColor);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 320,
              width: size.width,
              padding: EdgeInsets.only(top: 25, right: 10),
              color: sdPrimaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();

                        prefs.setString('username', "");
                        Variables.username="";
                        Variables.role="";
                        prefs.setString('password', "");
                        prefs.setString('role', "");
                        prefs.setString('distrct', "");
                        prefs.setString('taluk', "");
                        prefs.setString('panchayat', "");
                        prefs.setString('uid', "");
                        prefs.setBool('islogedin', null);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SDLoginScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    height: 80,
                    width: 80,
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(40),
                    //   child: FadeInImage(
                    //     fit: BoxFit.cover,
                    //     placeholder: AssetImage(
                    //       'Loading',
                    //     ),
                    //     // image: Image.network(
                    //     //   'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
                    //     //   height: 35,
                    //     //   width: 10,
                    //     // ).image,
                    //   ),
                    // ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      Variables.username,
                      style: boldTextStyle(textColor: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      Variables.role,
                      style: secondaryTextStyle(
                        size: 12,
                        textColor: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 320.00 - 50,
                      ),
                      padding: EdgeInsets.all(20),
                      decoration: boxDecoration(
                        radius: 8,
                        backGroundColor: Colors.white,
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Solved',
                            style: boldTextStyle(
                                textColor: Colors.black, size: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '98',
                            style: boldTextStyle(
                              textColor: Colors.green.withOpacity(0.8),
                              size: 26,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 320.00 - 50,
                      ),
                      padding: EdgeInsets.all(20),
                      decoration: boxDecoration(
                          radius: 8,
                          backGroundColor: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Unsolved',
                            style: boldTextStyle(
                                textColor: Colors.black, size: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '67',
                            style: boldTextStyle(
                              textColor:
                                  sdSecondaryColorYellow.withOpacity(0.7),
                              size: 26,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: 320.00 + 100, bottom: 25, left: 16, right: 16),
                padding: EdgeInsets.only(
                  top: 5,
                  left: 15,
                  right: 15,
                ),
                decoration: boxDecorations(
                  showShadow: true,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Change password',
                              style: boldTextStyle(size: 16)),
                        ),


                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[

                                  ],
                                ),
                                TextField(
                                  controller: usernamecontroller,
                                  cursorColor: sdTextSecondaryColor.withOpacity(0.2),
                                  cursorWidth: 1,
                                  autocorrect: true,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: 'Old Password',
                                    hintStyle: secondaryTextStyle(
                                        textColor:
                                        sdTextSecondaryColor.withOpacity(0.6)),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 16, bottom: 16, top: 16, right: 16),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                ),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: TextField(
                                        controller: passwordcontroller,
                                        obscureText: true,
                                        cursorColor:
                                        sdTextSecondaryColor.withOpacity(0.2),
                                        cursorWidth: 1,
                                        decoration: InputDecoration(
                                          hintText: 'New Password',
                                          hintStyle: secondaryTextStyle(
                                            textColor:
                                            sdTextSecondaryColor.withOpacity(0.6),
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 16, bottom: 16, top: 16, right: 16),
                                        ),
                                      ),
                                    ),
                                  ],

                                ),

                              ],
                            ),

                          ),
                        ),

                      ],
                    ),

                    SizedBox(
                      height: 45,
                    ),
                    SDButton(
                      textContent: "Change",
                      onPressed: () {
                        // loginfun(usernamecontroller.text,passwordcontroller.text,_selection);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

class Task {
  String task;
  double value;
  Color color;

  Task({this.task, this.value, this.color});
}
