// To parse this JSON data, do
//
//     final fbGraphModel = fbGraphModelFromJson(jsonString);

import 'dart:convert';

FbGraphModel fbGraphModelFromJson(String str) => FbGraphModel.fromJson(json.decode(str));

String fbGraphModelToJson(FbGraphModel data) => json.encode(data.toJson());

class FbGraphModel {
  FbGraphModel({
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.id,
  });

  String name;
  String firstName;
  String lastName;
  String email;
  String id;

  factory FbGraphModel.fromJson(Map<String, dynamic> json) => FbGraphModel(
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "id": id,
  };
}
