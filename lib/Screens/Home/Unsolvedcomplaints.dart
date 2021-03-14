import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nic_ro_plant_project/Modelclasses/Complaintlistmodel.dart';
import 'package:nic_ro_plant_project/Screens/complaintdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:nic_ro_plant_project/Utils/constants.dart';


import '../Weeklysurvey.dart';
class Unsolvedcomplaints extends StatefulWidget {
  @override
  _UnsolvedcomplaintsState createState() => _UnsolvedcomplaintsState();
}

class _UnsolvedcomplaintsState extends State<Unsolvedcomplaints> {
  List<village> villages = [];
  Future<Complaintlistmodel> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getsolvedcomplaints();
  }

  Widget villageDetailCard(village) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => complaintdetails(village.ticketid.toString(),false)));
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
                Container(
                  margin: EdgeInsets.only(left: 80),
                  child: FlatButton(
                    height: 10,
                    minWidth: 10,
                    child:Icon(Icons.forward,color: Colors.white,),
                    // onPressed: () {
                    //   setState(() {
                    //     village.reportstatus = true;
                    //   });
                    //   print("marked as good");
                    //   setState(() {
                    //     village.reportstatus = false;
                    //   });
                    //   print(village.issueid);
                    // },
                  ),
                ),


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
      appBar: AppBar(title: Text(""),),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child:  FutureBuilder<Complaintlistmodel>(
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
        ),


      ),
    );
  }


  Future<Complaintlistmodel> getsolvedcomplaints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response =
    await http.post(
      constants.getalltickets,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_role": prefs.getString('role'),
        "uid":prefs.getString('uid'),
        "status": "0"
      }),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {

      for(int i=0;i<Complaintlistmodel.fromJson(jsonDecode(response.body)).msg.length;i++){
        villages.add(
          village(name: Complaintlistmodel.fromJson(jsonDecode(response.body)).msg[i].panchayat, plantname: Complaintlistmodel.fromJson(jsonDecode(response.body)).msg[i].plantName,plantid: Complaintlistmodel.fromJson(jsonDecode(response.body)).msg[i].plantId,reportstatus: true,ticketid: Complaintlistmodel.fromJson(jsonDecode(response.body)).msg[i].ticketId),
        );
      }
      return Complaintlistmodel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}
