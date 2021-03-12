import 'package:flutter/material.dart';

import '../Weeklysurvey.dart';
class Newcomplaint extends StatefulWidget {
  @override
  _NewcomplaintState createState() => _NewcomplaintState();
}

class _NewcomplaintState extends State<Newcomplaint> {
  // List<village> villages = [
  //   village(name: 'ಅಲಂಬಾಡಿ', plantname: "ಅಲಂಬಾಡಿ ನೀರಿನ ಘಾಟಕಾ",reportstatus: false, issueid:1),
  //   village(name: 'ಅಲಂಬಾಡಿ', plantname: "ಅಲಂಬಾಡಿ ನೀರಿನ ಘಾಟಕಾ",reportstatus: true, issueid:2),
  //   village(name: 'ಅಲಂಬಾಡಿ', plantname: "ಅಲಂಬಾಡಿ ನೀರಿನ ಘಾಟಕಾ",reportstatus: false, issueid:3),
  //   village(name: 'ಅಲಂಬಾಡಿ', plantname: "ಅಲಂಬಾಡಿ ನೀರಿನ ಘಾಟಕಾ",reportstatus: false, issueid:4),
  //   village(name: 'ಅಲಂಬಾಡಿ', plantname: "ಅಲಂಬಾಡಿ ನೀರಿನ ಘಾಟಕಾ",reportstatus: true, issueid:5),
  //   village(name: 'ಅಲಂಬಾಡಿ', plantname: "ಅಲಂಬಾಡಿ ನೀರಿನ ಘಾಟಕಾ",reportstatus: false, issueid:6),
  //   village(name: 'ಅಲಂಬಾಡಿ', plantname: "ಅಲಂಬಾಡಿ ನೀರಿನ ಘಾಟಕಾ",reportstatus: true, issueid:7),
  // ];

  Widget villageDetailCard(village) {
    return GestureDetector(
      onLongPress: (){
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: village.reportstatus ? Colors.redAccent : Colors.blueAccent,
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
                    margin: EdgeInsets.only(left: 80),
                    child: FlatButton(
                      height: 10,
                      minWidth: 10,
                      child: Icon(Icons.cancel_presentation),
                      onPressed: () {
                        showdialogforreason(village.issueid);
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
                        showdialogforreason(village.issueid);
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
      appBar: AppBar(title: Text("ದೂರು ದಾಖಲಿಸು"),),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: SingleChildScrollView(
            child: Column(
                children: [
                  // Column(
                  //     children: villages.map((p) {
                  //       return villageDetailCard(p);
                  //     }).toList()
                  // )
                ]
            )
        ),

      ),
    );
  }
  Future<Map<String, bool>> showdialogforreason(issueid) async {
    Map<String, bool> problemlist = {
      'ಘಾಟಕದಿಂದ ನೀರು ಬರುತ್ತಿಲ್ಲ': false, 'ಸ್ಮಾರ್ಟ್ ಕಾರ್ಡ್ ಸಮಸ್ಯೆ': false, 'ಆಪರೇಟರ್ ಸಮಸ್ಯೆ': false, 'ಏಜೆನ್ಸಿ ಸಮಸ್ಯೆ': false,
      'ಘಾಟಕಾಗೆ ನೀರು ಬರುತ್ತಿಲ್ಲ': false, 'ನೀರಿನ ಗುಣಮಟ್ಟದ ಸಮಸ್ಯೆ': false, 'ಘಾಟಕಾ ಮುಚ್ಚಲಾಗಿದೆ': false,
      'ನಾಣ್ಯ ಪೆಟ್ಟಿಗೆಯ ಸಮಸ್ಯೆ': false,
      'ವಿದ್ಯುತ್ ಸಮಸ್ಯೆ': false,
      'ಕಟ್ಟಡ ಸಮಸ್ಯೆ': false,
      'ಕಡಿಮೆ ನೀರು ಬರುತ್ತಿದೆ': false,
      'ಘಾಟಕಕ್ಕೆ ದುರಸ್ತಿ ಬೇಕು': false,
      'ಇತರ': false,
    };
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text('ಕಾರಣ ಹೇಳಿ',
                  style: TextStyle(
                      color: Colors.black87
                  ),),
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
                      print(issueid);
                      print(problemlist);
                      Navigator.pop(context, problemlist);
                    },
                    child: Text('Done'),
                  ),
                ],
                content: Container(
                  width: double.minPositive,
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: problemlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      String _key = problemlist.keys.elementAt(index);
                      return CheckboxListTile(
                        value: problemlist[_key],
                        title: Text(_key),
                        onChanged: (val) {
                          setState(() {
                            print(issueid);
                            problemlist[_key] = val;
                            print(problemlist);
                          });
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        });
  }

}
