import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nic_ro_plant_project/Modelclasses/Loginmodel.dart';
import 'package:nic_ro_plant_project/Screens/Home/SDDashboardScreen.dart';
import 'package:nic_ro_plant_project/Screens/SDHomePageScreen.dart';
import 'package:nic_ro_plant_project/Utils/Colors.dart';
import 'package:nic_ro_plant_project/Utils/Style.dart';
import 'package:http/http.dart' as http;
import 'package:nic_ro_plant_project/Utils/Variables.dart';
import 'package:nic_ro_plant_project/Utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'citizenscreen.dart';


class SDLoginScreen extends StatefulWidget {
  @override
  _SDLoginScreenState createState() => _SDLoginScreenState();
}

class _SDLoginScreenState extends State<SDLoginScreen> {
  final List<String> _items = ['PDO', 'CEO', 'EO', 'AEE'].toList();

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  String _selection = "Select";
  @override
  void initState() {
    _selection = _items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    changeStatusColor(sdAppBackground);
    final dropdownMenuOptions = _items
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item))
    )
        .toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: sdAppBackground,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Manage water plants \nanywhere and anytime',
                    style: boldTextStyle(size: 25),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Sign in to your account',
                    style: secondaryTextStyle(size: 16),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: size.width,
                    decoration: boxDecorations(
                      showShadow: true,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text('  Select Role',
                                  style: boldTextStyle(size: 16)),
                            ),
                            Container(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    value: _selection,
                                    items: dropdownMenuOptions,
                                    onChanged: (s) {
                                      setState(() {
                                        _selection = s;
                                      });
                                    }
                                )
                              ),
                            )
                          ],
                        ),
                        TextField(
                          controller: usernamecontroller,
                          cursorColor: sdTextSecondaryColor.withOpacity(0.2),
                          cursorWidth: 1,
                          autocorrect: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Username',
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
                                  hintText: 'Password',
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
                  SizedBox(
                    height: 45,
                  ),
                  SDButton(
                    textContent: "SIGN IN",
                    onPressed: () {
                      loginfun(usernamecontroller.text,passwordcontroller.text,_selection);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        persistentFooterButtons: <Widget>[
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).copyWith().size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Are u a common citizen ?',
                  style: secondaryTextStyle(),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => citizenscreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Click here !',
                    style: boldTextStyle(size: 14, textColor: sdPrimaryColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> loginfun(String username,String password,String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response =
    await http.post(
      constants.login,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'role': role,
      }),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      if(Loginmodel.fromJson(jsonDecode(response.body)).msg[0].statuslogin==true){
        prefs.setString('username', username);
        Variables.username=username;
        Variables.role=role;
        prefs.setString('password', password);
        prefs.setString('role', role);
        prefs.setString('distrct', Loginmodel.fromJson(jsonDecode(response.body)).msg[0].district);
        prefs.setString('taluk', Loginmodel.fromJson(jsonDecode(response.body)).msg[0].taluk);
        prefs.setString('panchayat', Loginmodel.fromJson(jsonDecode(response.body)).msg[0].panchayt);
        prefs.setString('uid', Loginmodel.fromJson(jsonDecode(response.body)).msg[0].uid.toString());
        prefs.setBool('islogedin', true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SDHomePageScreen( role)));
      }else{
        Fluttertoast.showToast(
            msg: "Login failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      return Loginmodel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}
