// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    this.email,
    this.password,
    this.clientId ="ab4f5e65329b8958e67414018fb0fff62b313c13f880c75c3f1dab70a7e9d482",
    this.clientSecret =  "b34cc8c43f00337975120acb09c575c9fa450bb72777d2d1f7483f63a5213e3c",
  });

  String email;
  String password;
  String clientId;
  String clientSecret;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    email: json["email"],
    password: json["password"],
    clientId: json["clientId"],
    clientSecret: json["clientSecret"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "clientId": clientId,
    "clientSecret": clientSecret,
  };
}
