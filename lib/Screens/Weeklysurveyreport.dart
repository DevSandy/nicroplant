import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nic_ro_plant_project/Modelclasses/Weeklysurveyreportmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:nic_ro_plant_project/Utils/constants.dart';


class Weeklysurveyreport extends StatefulWidget {
  @override
  _WeeklysurveyreportState createState() => _WeeklysurveyreportState();
}



class _WeeklysurveyreportState extends State<Weeklysurveyreport> {

  List<DataRow> rowslist = [];
  Future<Weeklysurveyreportmodel> futureAlbum;


  @override
  void initState() {
    super.initState();
    futureAlbum = getweeklysurveyreport();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('ವಾರಕ್ಕೊಮ್ಮೆ ಘಟಕದ ಸ್ಥಿತಿ ದಾಖಲಿಸಿದ ವಿವರ'),
          ),
          body: FutureBuilder<Weeklysurveyreportmodel>(
          future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: <Widget>[
                  DataTable(
                      columns: [
                        DataColumn(label: Text(
                            'ಗ್ರಾಮ',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                        )),
                        DataColumn(label: Text(
                            'ಘಾಟಕಾ',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                        )),
                        DataColumn(label: Text(
                            'ದಿನಾಂಕ',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                        )),
                      ],
                      rows: rowslist
                  ),
                ]);
              }else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }
          ),

      ),
    );
  }


  Future<Weeklysurveyreportmodel> getweeklysurveyreport() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response =
    await http.post(
      constants.surveyhistory,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "panchayat":prefs.getString('panchayat'),
        "uid":prefs.getString('uid')
      }),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      for(int i=0;i<Weeklysurveyreportmodel.fromJson(jsonDecode(response.body)).msg.length;i++){
        rowslist.add(
          DataRow(cells: [
            DataCell(Text(Weeklysurveyreportmodel.fromJson(jsonDecode(response.body)).msg[i].villagename)),
            DataCell(Text(Weeklysurveyreportmodel.fromJson(jsonDecode(response.body)).msg[i].plantname)),
            DataCell(Text(Weeklysurveyreportmodel.fromJson(jsonDecode(response.body)).msg[i].lastSurveyDate)),
          ]),
        );
      }

      return Weeklysurveyreportmodel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


}