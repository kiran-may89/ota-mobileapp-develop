
import 'dart:convert';
import 'package:ota/models/common/models/api_exception.dart';
class LoginResponse {
  LoginResponse({
    this.isError,
    this.responseException,
    this.message,
    this.result,
  });

  bool isError;
  ResponseException responseException;
  String message;
  Credential result;

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
    isError: json["isError"],
    responseException: json["responseException"]!=null?ResponseException.fromMap(json["responseException"]):null,
    message: json["message"],
    result: json["result"]!=null?Credential.fromMap(json["result"]):null,
  );

  Map<String, dynamic> toMap() => {
    "isError": isError,
    "responseException": responseException.toMap(),
    "message": message,
    "result": result.toMap(),
  };
}

class ResponseException {
  ResponseException({
    this.exceptionMessage,
  });

  String exceptionMessage;

  factory ResponseException.fromMap(Map<String, dynamic> json) => ResponseException(
    exceptionMessage: json["exceptionMessage"],
  );

  Map<String, dynamic> toMap() => {
    "exceptionMessage": exceptionMessage,
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

  factory Credential.fromMap(Map<String, dynamic> json) => Credential(
    accesToken: json["accesToken"],
    idToken: json["idToken"],
    refreshToken: json["refreshToken"],
    expiresIn: json["expiresIn"],
  );

  Map<String, dynamic> toMap() => {
    "accesToken": accesToken,
    "idToken": idToken,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
  };
}
