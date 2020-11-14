import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/common/models/api_exception.dart';
import 'package:ota/models/common/models/response_exception.dart';
import "result.dart";

//class SignupResponse extends BaseModel {
//  final String message;
//  final bool isError;
//  final Result result;
//  ApiException apiException;
//  SignupResponse({this.message, this.isError, this.result}) : super(message: message, isError: isError);
//
//  factory SignupResponse.fromJson(Map<String, dynamic> json) {
//    return SignupResponse(
//      message: json['message'],
//      isError: json['isError'],
//      result: json['result'] != null ? new Result.fromJson(json['result']) : null,
//      //apiException : json['responseException'] != null ? new ResponseException.fromJson(json['responseException']) : null,
//    );
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['message'] = this.message;
//    data['isError'] = this.isError;
//    if (this.result != null) {
//      data['result'] = this.result.toJson();
//    }
//    return data;
//  }
//
//  @override
//  List<Object> get props => [this.message, this.isError, this.result];
//}

class SignupResponse  extends BaseModel {
  SignupResponse({
    this.message,
    this.isError,
    this.result,
    this.responseException,
  });

  String message;
  bool isError;
  Result result;
  ResponseException responseException;

  factory SignupResponse.fromMap(
          Map<String, dynamic> json) =>
      SignupResponse(
        message: json["message"],
        isError: json["isError"],
        result: json["result"]!=null? Result.fromMap(json["result"]):null,
        responseException: json['responseException'] != null ? new ResponseException.fromJson(json['responseException']) : null,

      );
//
//  Map<String, dynamic> toMap() => {
//        "message": message,
//        "isError": isError,
//        "result": result.toMap(),
//        "responseException":  json['responseException'] != null ? new ResponseException.fromJson(json['responseException']) : null,
//      };
}

//class ResponseException {
//  ResponseException({
//    this.exceptionMessage,
//    this.validationErrors,
//  });
//
//  String exceptionMessage;
//  List<ValidationError> validationErrors;
//
//  factory ResponseException.fromMap(
//          Map<String, dynamic> json) =>
//      ResponseException(
//        exceptionMessage:
//            json["exceptionMessage"],
//        validationErrors:
//            List<ValidationError>.from(json[
//                    "validationErrors"]
//                .map((x) =>
//                    ValidationError.fromMap(x))),
//      );
//
//  Map<String, dynamic> toMap() => {
//        "exceptionMessage": exceptionMessage,
//        "validationErrors": List<dynamic>.from(
//            validationErrors
//                .map((x) => x.toMap())),
//      };
//}

//class ValidationError {
//  ValidationError({
//    this.field,
//    this.message,
//  });
//
//  String field;
//  String message;
//
//  factory ValidationError.fromMap(
//          Map<String, dynamic> json) =>
//      ValidationError(
//        field: json["field"],
//        message: json["message"],
//      );
//
//  Map<String, dynamic> toMap() => {
//        "field": field,
//        "message": message,
//      };
//}

class Result {
  Result({
    this.lockoutEnd,
    this.twoFactorEnabled,
    this.phoneNumberConfirmed,
    this.phoneNumber,
    this.emailConfirmed,
    this.email,
    this.id,
    this.lockoutEnabled,
    this.accessFailedCount,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.profilePicture,
    this.country,
    this.address,
    this.tenantId,
    this.roleId,
    this.phoneCode,
  });

  dynamic lockoutEnd;
  bool twoFactorEnabled;
  bool phoneNumberConfirmed;
  String phoneNumber;
  bool emailConfirmed;
  String email;
  String id;
  bool lockoutEnabled;
  int accessFailedCount;
  String firstName;
  String lastName;
  dynamic dateOfBirth;
  dynamic profilePicture;
  String country;
  String address;
  String tenantId;
  dynamic roleId;
  String phoneCode;

  factory Result.fromMap(
          Map<String, dynamic> json) =>
      Result(
        lockoutEnd: json["lockoutEnd"],
        twoFactorEnabled:
            json["twoFactorEnabled"],
        phoneNumberConfirmed:
            json["phoneNumberConfirmed"],
        phoneNumber: json["phoneNumber"],
        emailConfirmed: json["emailConfirmed"],
        email: json["email"],
        id: json["id"],
        lockoutEnabled: json["lockoutEnabled"],
        accessFailedCount:
            json["accessFailedCount"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"],
        profilePicture: json["profilePicture"],
        country: json["country"],
        address: json["address"],
        tenantId: json["tenantId"],
        roleId: json["roleId"],
        phoneCode: json["phoneCode"],
      );

  Map<String, dynamic> toMap() => {
        "lockoutEnd": lockoutEnd,
        "twoFactorEnabled": twoFactorEnabled,
        "phoneNumberConfirmed":
            phoneNumberConfirmed,
        "phoneNumber": phoneNumber,
        "emailConfirmed": emailConfirmed,
        "email": email,
        "id": id,
        "lockoutEnabled": lockoutEnabled,
        "accessFailedCount": accessFailedCount,
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
        "profilePicture": profilePicture,
        "country": country,
        "address": address,
        "tenantId": tenantId,
        "roleId": roleId,
        "phoneCode": phoneCode,
      };
}
