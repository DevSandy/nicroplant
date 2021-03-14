import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nic_ro_plant_project/Utils/Colors.dart';
import 'package:nic_ro_plant_project/Utils/Style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:nic_ro_plant_project/Utils/constants.dart';


class Addwaterplant extends StatefulWidget {
  @override
  _AddwaterplantState createState() => _AddwaterplantState();
}

class _AddwaterplantState extends State<Addwaterplant> {
  final villagecontroller = TextEditingController();
  final maintainercontroller = TextEditingController();
  final plantnamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("Add waterplant"),),
      body:    Container(
        width: size.width,
        decoration: boxDecorations(
          showShadow: true,
        ),
        child: Column(
          children: <Widget>[
            Spacer(),
            Text(
              'Add water plants \nanywhere and anytime',
              style: boldTextStyle(size: 25),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Add nOw !!',
              style: secondaryTextStyle(size: 16),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: villagecontroller,
              cursorColor: sdTextSecondaryColor.withOpacity(0.2),
              cursorWidth: 1,
              autocorrect: true,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Plant village',
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
            TextField(
              controller: maintainercontroller,
              cursorColor: sdTextSecondaryColor.withOpacity(0.2),
              cursorWidth: 1,
              autocorrect: true,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Plant maintainer',
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
            TextField(
              controller: plantnamecontroller,
              cursorColor: sdTextSecondaryColor.withOpacity(0.2),
              cursorWidth: 1,
              autocorrect: true,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Plant name',
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
            Spacer(),
            SDButton(
              textContent: "Add",
              onPressed: () {
                addwaterplant(villagecontroller.text,maintainercontroller.text,plantnamecontroller.text);
              },
            ),

          ],
        ),
      ),
    );
  }


  Future<void> addwaterplant(String village, String maintainer, String plantname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response =
    await http.post(
      constants.addwaterplant,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "plant_name" : plantname,
        "plant_village" : village,
        "district" : prefs.getString('distrct'),
        "taluk" : prefs.getString('taluk'),
        "panchayat" : prefs.getString('panchayat'),
        "uid": prefs.getString('uid'),
        "plant_maintainer" : maintainer
      }),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Successfull add",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return 1;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
