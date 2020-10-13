// To parse this JSON data, do
//
//     final externalAuthRequestModel = externalAuthRequestModelFromJson(jsonString);

import 'dart:convert';

ExternalAuthRequestModel externalAuthRequestModelFromJson(String str) => ExternalAuthRequestModel.fromJson(json.decode(str));

String externalAuthRequestModelToJson(ExternalAuthRequestModel data) => json.encode(data.toJson());

class ExternalAuthRequestModel {
  ExternalAuthRequestModel({
    this.email,
    this.externalUserId,
    this.externalProvider,
    this.givenName,
    this.surName,
    this.name,
    this.clientId="ab4f5e65329b8958e67414018fb0fff62b313c13f880c75c3f1dab70a7e9d482",
    this.clientSecret="b34cc8c43f00337975120acb09c575c9fa450bb72777d2d1f7483f63a5213e3c",
  });

  String email;
  String externalUserId;
  String externalProvider;
  String givenName;
  String surName;
  String name;
  String clientId ;
  String clientSecret;

  factory ExternalAuthRequestModel.fromJson(Map<String, dynamic> json) => ExternalAuthRequestModel(
    email: json["email"],
    externalUserId: json["externalUserId"],
    externalProvider: json["externalProvider"],
    givenName: json["givenName"],
    surName: json["surName"],
    name: json["name"],
    clientId: json["clientId"],
    clientSecret: json["clientSecret"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "externalUserId": externalUserId,
    "externalProvider": externalProvider,
    "givenName": givenName,
    "surName": surName,
    "name": name,
    "clientId": clientId,
    "clientSecret": clientSecret,
  };
}
