// To parse this JSON data, do
//
//     final weeklysurveymodel = weeklysurveymodelFromJson(jsonString);

import 'dart:convert';

Weeklysurveymodel weeklysurveymodelFromJson(String str) => Weeklysurveymodel.fromJson(json.decode(str));

String weeklysurveymodelToJson(Weeklysurveymodel data) => json.encode(data.toJson());

class Weeklysurveymodel {
  Weeklysurveymodel({
    this.msg,
  });

  List<Msg> msg;

  factory Weeklysurveymodel.fromJson(Map<String, dynamic> json) => Weeklysurveymodel(
    msg: List<Msg>.from(json["msg"].map((x) => Msg.fromJson(x))),
  );
  Map<String, dynamic> toJson() => {
    "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
  };
}

class Msg {
  Msg({
    this.villagename,
    this.plantname,
    this.status,
    this.plantid,
  });

  String villagename;
  String plantname;
  bool status;
  String plantid;

  factory Msg.fromJson(Map<String, dynamic> json) => Msg(
    villagename: json["villagename"],
    plantname: json["plantname"],
    status: json["status"],
    plantid: json["plantid"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "villagename": villagename,
    "plantname": plantname,
    "status": status,
    "plantid": plantid.toString(),
  };

}
