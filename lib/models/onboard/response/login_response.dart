
import 'dart:convert';
import 'package:ota/models/common/models/api_exception.dart';
LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.message,
    this.isError,
    this.result,
  });

  String message;
  bool isError;
  Credential result;
  ApiException apiException;
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    message: json["message"],
    isError: json["isError"],
    result: Credential.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "isError": isError,
    "result": result.toJson(),
  };
}

class Credential {
  Credential({
    this.accesToken,
    this.idToken,
    this.refreshToken,
    this.expiresIn,
  });

  String accesToken;
  dynamic idToken;
  String refreshToken;
  int expiresIn;

  factory Credential.fromJson(Map<String, dynamic> json) => Credential(
    accesToken: json["accesToken"],
    idToken: json["idToken"],
    refreshToken: json["refreshToken"],
    expiresIn: json["expiresIn"],
  );

  Map<String, dynamic> toJson() => {
    "accesToken": accesToken,
    "idToken": idToken,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
  };
}
