// To parse this JSON data, do
//
//     final weeklysurveyreportmodel = weeklysurveyreportmodelFromJson(jsonString);

import 'dart:convert';

Weeklysurveyreportmodel weeklysurveyreportmodelFromJson(String str) => Weeklysurveyreportmodel.fromJson(json.decode(str));

String weeklysurveyreportmodelToJson(Weeklysurveyreportmodel data) => json.encode(data.toJson());

class Weeklysurveyreportmodel {
  Weeklysurveyreportmodel({
    this.msg,
  });

  List<Msg> msg;

  factory Weeklysurveyreportmodel.fromJson(Map<String, dynamic> json) => Weeklysurveyreportmodel(
    msg: List<Msg>.from(json["msg"].map((x) => Msg.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
  };
}

class Msg {
  Msg({
    this.lastSurveyDate,
    this.plantid,
    this.plantname,
    this.status,
    this.villagename,
  });

  String lastSurveyDate;
  int plantid;
  String plantname;
  bool status;
  String villagename;

  factory Msg.fromJson(Map<String, dynamic> json) => Msg(
    lastSurveyDate: json["last_survey_date"],
    plantid: json["plantid"],
    plantname: json["plantname"],
    status: json["status"],
    villagename: json["villagename"],
  );

  Map<String, dynamic> toJson() => {
    "last_survey_date": lastSurveyDate,
    "plantid": plantid,
    "plantname": plantname,
    "status": status,
    "villagename": villagename,
  };
}
