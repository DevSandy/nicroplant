// To parse this JSON data, do
//
//     final loginmodel = loginmodelFromJson(jsonString);

import 'dart:convert';

Loginmodel loginmodelFromJson(String str) => Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
  Loginmodel({
    this.msg,
  });

  List<Msg> msg;

  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
    msg: List<Msg>.from(json["msg"].map((x) => Msg.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
  };
}

class Msg {
  Msg({
    this.username,
    this.password,
    this.role,
    this.district,
    this.taluk,
    this.panchayt,
    this.statuslogin,
    this.uid,
  });

  String username;
  String password;
  String role;
  String district;
  String taluk;
  String panchayt;
  int uid;
  bool statuslogin;

  factory Msg.fromJson(Map<String, dynamic> json) => Msg(
    username: json["username"],
    password: json["password"],
    role: json["role"],
    district: json["district"],
    taluk: json["taluk"],
    panchayt: json["panchayt"],
    statuslogin: json["statuslogin"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "role": role,
    "district": district,
    "taluk": taluk,
    "panchayt": panchayt,
    "statuslogin": statuslogin,
    "uid": uid,
  };
}
