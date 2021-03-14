// To parse this JSON data, do
//
//     final complaintdetaillistmodel = complaintdetaillistmodelFromJson(jsonString);

import 'dart:convert';

Complaintdetaillistmodel complaintdetaillistmodelFromJson(String str) => Complaintdetaillistmodel.fromJson(json.decode(str));

String complaintdetaillistmodelToJson(Complaintdetaillistmodel data) => json.encode(data.toJson());

class Complaintdetaillistmodel {
  Complaintdetaillistmodel({
    this.createdBy,
    this.createdDate,
    this.district,
    this.lattitude,
    this.longitude,
    this.maintainedBy,
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
  String maintainedBy;
  String panchayat;
  int plantId;
  String plantName;
  String solvedDate;
  int status;
  String taluk;
  int ticketId;
  String ticketType;

  factory Complaintdetaillistmodel.fromJson(Map<String, dynamic> json) => Complaintdetaillistmodel(
    createdBy: json["created_by"],
    createdDate: json["created_date"],
    district: json["district"],
    lattitude: json["lattitude"],
    longitude: json["longitude"],
    maintainedBy: json["maintained_by"],
    panchayat: json["panchayat"],
    plantId: json["plant_id"],
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
    "maintained_by": maintainedBy,
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
