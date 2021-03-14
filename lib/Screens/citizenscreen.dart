import 'package:flutter/material.dart';
import 'package:nic_ro_plant_project/Utils/Colors.dart';
import 'package:nic_ro_plant_project/Utils/Style.dart';
class citizenscreen extends StatefulWidget {
  @override
  _citizenscreenState createState() => _citizenscreenState();
}

class _citizenscreenState extends State<citizenscreen> {
  String _selection = "Select";
  final List<String> _items = ["Select",'Kolar', 'Banglore', 'Malur', 'Mysore'].toList();

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
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Text('  Select District',
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
          Row(
            children: <Widget>[
              Expanded(
                child: Text('  Select Taluk',
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
          Row(
            children: <Widget>[
              Expanded(
                child: Text('  Select Panchayat',
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
          Row(
            children: <Widget>[
              Expanded(
                child: Text('  Select Village',
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
          Row(
            children: <Widget>[
              Expanded(
                child: Text('  Select Waterplant',
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
          Row(
            children: <Widget>[
              Expanded(
                child: Text('  Select Problem',
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
          SizedBox(
            height: 45,
          ),
          SDButton(
            textContent: "Report",
            onPressed: () {
              // loginfun(usernamecontroller.text,passwordcontroller.text,_selection);
            },
          ),
        ],
      ),
    );
  }
}
