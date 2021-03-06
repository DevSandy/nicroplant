import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/geolocation.dart';
import 'package:nic_ro_plant_project/Modelclasses/Weeklysurveymodel.dart';
import 'package:nic_ro_plant_project/Utils/Variables.dart';
import 'package:nic_ro_plant_project/Utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Weeklysurvey extends StatefulWidget {

  @override
  _WeeklysurveyState createState() => _WeeklysurveyState();
}

class _WeeklysurveyState extends State<Weeklysurvey> {

  String _selectedId;
  String latitude = '00.00000';
  String longitude = '00.00000';

  Future<Weeklysurveymodel> futureAlbum;
  List<village> villages = [];

  @override
  void initState() {
    super.initState();
    futureAlbum = getweeklysurvellist();
    _getCurrentLocation();

  }

  Widget villageDetailCard(village) {
    return GestureDetector(
      onLongPress: (){
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: village.reportstatus ? Colors.green : Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 30.0,
                    height: 100.0,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(village.name,
                      style: TextStyle (
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                    Text(village.plantname,
                      style: TextStyle (
                          color: Colors.white,
                          fontSize: 12
                      ),
                    )
                  ],

                ),
                if (village.reportstatus==false) ...[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: FlatButton(
                      height: 10,
                      minWidth: 10,
                      child:Icon(Icons.check),
                      onPressed: () {
                        setState(() {
                          village.reportstatus = true;
                        });
                        print("marked as good");
                        hitapitopostgood(village.name,village.plantname,village.plantid);
                        // print(village.issueid);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: FlatButton(
                      height: 10,
                      minWidth: 10,
                      child: Icon(Icons.cancel_presentation),
                      onPressed: () {
                        showdialogforreason(village.name,village.plantname,village.plantid);
                        setState(() {
                          village.reportstatus= true;
                        });
                        print("marked as not good");
                      },
                    ),
                  ),
                ]
                else ...[
                  Container(
                    margin: EdgeInsets.only(left: 80),
                    child: FlatButton(
                      height: 10,
                      minWidth: 10,
                      child: Icon(Icons.cancel_presentation,color: Colors.white,),
                      onPressed: () {
                        showdialogforreason(village.name,village.plantname,village.plantid);
                        print("marked as not good");
                      },
                    ),
                  ),
                ]
              ],
            ),

          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("????????????????????????????????? ???????????? ?????????????????? ?????????????????????"),),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child:  FutureBuilder<Weeklysurveymodel>(
        future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                  child: Column(
                      children: [
                        Column(
                            children: villages.map((p) {
                              return villageDetailCard(p);
                            }).toList()
                        )
                      ]
                  )
              );
            }else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          }
        )


      ),
    );
  }



  Future<Weeklysurveymodel> getweeklysurvellist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response =
    await http.post(
      constants.getweeklysurveylist,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': prefs.getString('username'),
        'password': prefs.getString('password'),
        'role': prefs.getString('role'),
        'district': prefs.getString('district'),
        'taluk': prefs.getString('taluk'),
        'panchayat': prefs.getString('panchayat'),
        'uid': prefs.getString('uid'),
      }),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      for(int i = 0 ;i<Weeklysurveymodel.fromJson(jsonDecode(response.body)).msg.length; i++){
        print(Weeklysurveymodel.fromJson(jsonDecode(response.body)).msg[i].villagename+"hahhahh");
        villages.add(village(name: Weeklysurveymodel.fromJson(jsonDecode(response.body)).msg[i].villagename, plantname: Weeklysurveymodel.fromJson(jsonDecode(response.body)).msg[i].plantname,reportstatus: Weeklysurveymodel.fromJson(jsonDecode(response.body)).msg[i].status,plantid: Weeklysurveymodel.fromJson(jsonDecode(response.body)).msg[i].plantid));
      }
      return Weeklysurveymodel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void _onValueChange(String value) {
    setState(() {
      _selectedId = value;
      print(value);
    });
  }

  void showdialogforreason(name, plantname, plantid) {
    Variables.villagename = name;
    Variables.plantname = plantname;
    Variables.plantid = plantid;
    print(name+plantname+plantid);
    showDialog(
        context: context,
        child: new MyDialog(
          onValueChange: _onValueChange,
          initialValue: _selectedId,
        ));
  }

  Future<void> hitapitopostgood(name, plantname, plantid) async {

    final response =
        await http.post(
      constants.surveycomplete,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "plantid":plantid
      }),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Successfully sent",
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

  _getCurrentLocation() async {
    Geolocation.enableLocationServices().then((result) {
      // Request location
      // print(result);
    }).catchError((e) {
      // Location Services Enablind Cancelled
      // print(e);
    });

    Geolocation.currentLocation(accuracy: LocationAccuracy.best)
        .listen((result) {
      if (result.isSuccessful) {
        setState(() {
          Variables.latitude = result.location.latitude.toString();
          Variables.longitude = result.location.longitude.toString();
        });
      }
    });
  }

}
class village {
  String name;
  String plantname;
  String plantid;
  int ticketid;
  bool reportstatus;

  village({this.name,this.plantname,this.reportstatus,this.plantid,this.ticketid});
}

class MyDialog extends StatefulWidget {
  const MyDialog({this.onValueChange, this.initialValue});

  final String initialValue;
  final void Function(String) onValueChange;

  @override
  State createState() => new MyDialogState();
}

class MyDialogState extends State<MyDialog> {
  String _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.initialValue;
  }

  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("???????????? ????????????"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.pop(context, null);
            },
            child: Text('Cancel'),
          ),
          FlatButton(
            onPressed: () {
              //hit api to send problem list to db
              hitapitopostissue(Variables.plantid, Variables.plantname, Variables.villagename,_selectedId);
              print(_selectedId);
              Navigator.pop(context);
              // print(problemlist);
            },
            child: Text('Done'),
          ),
        ],
      content: Row(
        children: [
            new Container(
                padding: const EdgeInsets.all(5.0),
                child: new DropdownButton<String>(
                  hint: const Text("Pick a issue"),
                  value: _selectedId,
                  onChanged: (String value) {
                    setState(() {
                      _selectedId = value;
                    });
                    widget.onValueChange(value);
                  },
                  items: <String>[
                    '???????????????????????? ???????????? ??????????????????????????????',
                    '???????????????????????? ?????????????????? ??????????????????',
                    '????????????????????? ??????????????????',
                    '????????????????????? ??????????????????',
                    '????????????????????? ???????????? ??????????????????????????????',
                    '??????????????? ???????????????????????? ??????????????????',
                    '??????????????? ?????????????????????????????????',
                    '??????????????? ??????????????????????????? ??????????????????',
                    '???????????????????????? ??????????????????',
                    '??????????????? ??????????????????',
                    '??????????????? ???????????? ???????????????????????????',
                    '???????????????????????? ????????????????????? ????????????',
                    '?????????',
                    'Three',
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                )

            ),
          ],
      )


    );
  }

  Future<void> hitapitopostissue(String plantid, String plantname, String villagename, String issue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response =
        await http.post(
      constants.addticket,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "issue_type" : issue,
        "createdby" : prefs.getString('uid'),
        "plant_name" : plantname,
        "lattitude" : Variables.latitude,
        "longitude" : Variables.longitude,
        "plantid" : plantid
      }),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Issue created",
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