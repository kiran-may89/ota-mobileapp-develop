// To parse this JSON data, do
//
//     final primaryBookingRequest = primaryBookingRequestFromMap(jsonString);

import 'dart:convert';

class PrimaryBookingRequest {
  PrimaryBookingRequest({
    this.userId,
    this.tenantId,
    this.reservationNumber,
    this.firstname,
    this.lastname,
    this.phonenumber,
    this.email,
    this.type,
  });

  String userId;
  String tenantId;
  String reservationNumber;
  String firstname;
  String lastname;
  String phonenumber;
  String email;
  int type;

  factory PrimaryBookingRequest.fromJson(String str) => PrimaryBookingRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrimaryBookingRequest.fromMap(Map<String, dynamic> json) => PrimaryBookingRequest(
    userId: json["userId"] == null ? null : json["userId"],
    tenantId: json["tenantId"] == null ? null : json["tenantId"],
    reservationNumber: json["reservationNumber"] == null ? null : json["reservationNumber"],
    firstname: json["firstname"] == null ? null : json["firstname"],
    lastname: json["lastname"] == null ? null : json["lastname"],
    phonenumber: json["phonenumber"] == null ? null : json["phonenumber"],
    email: json["email"] == null ? null : json["email"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId == null ? null : userId,
    "tenantId": tenantId == null ? null : tenantId,
    "reservationNumber": reservationNumber == null ? null : reservationNumber,
    "firstname": firstname == null ? null : firstname,
    "lastname": lastname == null ? null : lastname,
    "phonenumber": phonenumber == null ? null : phonenumber,
    "email": email == null ? null : email,
    "type": type == null ? null : type,
  };
}
