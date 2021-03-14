import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nic_ro_plant_project/Modelclasses/Complaintdetaillistmodel.dart';
import 'package:nic_ro_plant_project/Utils/Colors.dart';
import 'package:nic_ro_plant_project/Utils/Style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:nic_ro_plant_project/Utils/constants.dart';


class complaintdetails extends StatefulWidget {
  String issueid;
  bool issolved;
  complaintdetails(this.issueid, this.issolved);

  @override
  _complaintdetailsState createState() => _complaintdetailsState(issueid,issolved);
}

class _complaintdetailsState extends State<complaintdetails> {
  String issueid;
  bool issolved;
  Future<Complaintdetaillistmodel> futureAlbum;

  _complaintdetailsState(this.issueid,this.issolved);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = getcomplaintdetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ದೂರುಗಳ ವಿವರ'),),
      body: FutureBuilder<Complaintdetaillistmodel>(
    future: futureAlbum,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return       Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Text("ದೂರಿನ ವಿವರ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Row(
                    children: [
                      Text("ದೂರು ಸಂಖ್ಯೆ : ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                      Text(snapshot.data.ticketId.toString(),textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,),),
                    ],
                  ),              ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Row(
                    children: [
                      Text("ಗ್ರಾಮ ಪಂಚಾಯಿತಿ : ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                      Text(snapshot.data.panchayat,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Row(
                    children: [
                      Text("Taluk : ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                      Text(snapshot.data.taluk,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Row(
                    children: [
                      Text("ಕುಡಿಯುವ ನೀರು ಘಾಟಕಾ: ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                      Text(snapshot.data.plantName,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Row(
                    children: [
                      Text("ಸಮಸ್ಯೆ: ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                      Text(snapshot.data.ticketType,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Row(
                    children: [
                      Text("ಘಟಕಾಧ ನಿರ್ವಾಹನೆ: ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                      Text(snapshot.data.maintainedBy,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Row(
                    children: [
                      Text("ದೂರು ದಿನಾಂಕ: ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                      Text(snapshot.data.createdDate,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Row(
                    children: [
                      Text("ದೂರು solve ದಿನಾಂಕ: ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),),
                      Text(snapshot.data.solvedDate,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18,),),
                    ],
                  ),
                ),
              ),
              issolved ? RaisedButton(
                color: sdPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 1,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "back",
                  textAlign: TextAlign.center,
                  style: boldTextStyle(
                      size: 16,
                      textColor: Colors.white,
                      letterSpacing: 2),
                ),
              ):RaisedButton(
                color: sdPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 1,
                onPressed: () async {
                  //hitsolve
                  await solveapi(issueid);
                  Navigator.pop(context);
                },
                child: Text(
                  "Solve problem",
                  textAlign: TextAlign.center,
                  style: boldTextStyle(
                      size: 16,
                      textColor: Colors.white,
                      letterSpacing: 2),
                ),
              )

            ],
          ),
        );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
    }
      ),


    );
  }


  Future<Complaintdetaillistmodel> getcomplaintdetail() async {
    print("haha"+issueid);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response =
    await http.post(
      constants.getticketdetails,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "ticket_id":issueid
      }),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      return Complaintdetaillistmodel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<void> solveapi(String issueid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response =
    await http.post(
      constants.solveticket,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "ticket_id" : issueid,
      }),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Issue solved",
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
