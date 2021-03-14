// To parse this JSON data, do
//
//     final complaintlistmodel = complaintlistmodelFromJson(jsonString);

import 'dart:convert';

Complaintlistmodel complaintlistmodelFromJson(String str) => Complaintlistmodel.fromJson(json.decode(str));

String complaintlistmodelToJson(Complaintlistmodel data) => json.encode(data.toJson());

class Complaintlistmodel {
  Complaintlistmodel({
    this.msg,
  });

  List<Msg> msg;

  factory Complaintlistmodel.fromJson(Map<String, dynamic> json) => Complaintlistmodel(
    msg: List<Msg>.from(json["msg"].map((x) => Msg.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": List<dynamic>.from(msg.map((x) => x.toJson())),
  };
}

class Msg {
  Msg({
    this.createdBy,
    this.createdDate,
    this.district,
    this.lattitude,
    this.longitude,
    this.panchayat,
    this.plantId,
    this.plantName,
    this.solvedDate,
    this.status,
    this.taluk,
    this.ticketId,
    this.ticketType,
  });

  String createdBy;
  String createdDate;
  String district;
  String lattitude;
  String longitude;
  String panchayat;
  String plantId;
  String plantName;
  String solvedDate;
  int status;
  String taluk;
  int ticketId;
  String ticketType;

  factory Msg.fromJson(Map<String, dynamic> json) => Msg(
    createdBy: json["created_by"],
    createdDate: json["created_date"],
    district: json["district"],
    lattitude: json["lattitude"],
    longitude: json["longitude"],
    panchayat: json["panchayat"],
    plantId: json["plant_id"].toString(),
    plantName: json["plant_name"],
    solvedDate: json["solved_date"],
    status: json["status"],
    taluk: json["taluk"],
    ticketId: json["ticket_id"],
    ticketType: json["ticket_type"],
  );

  Map<String, dynamic> toJson() => {
    "created_by": createdBy,
    "created_date": createdDate,
    "district": district,
    "lattitude": lattitude,
    "longitude": longitude,
    "panchayat": panchayat,
    "plant_id": plantId,
    "plant_name": plantName,
    "solved_date": solvedDate,
    "status": status,
    "taluk": taluk,
    "ticket_id": ticketId,
    "ticket_type": ticketType,
  };
}
