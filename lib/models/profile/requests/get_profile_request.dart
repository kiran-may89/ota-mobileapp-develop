// To parse this JSON data, do
//
//     final getProfileResponse = getProfileResponseFromMap(jsonString);

import 'dart:convert';

GetProfileResponse getProfileResponseFromMap(
        String str) =>
    GetProfileResponse.fromMap(json.decode(str));

String getProfileResponseToMap(
        GetProfileResponse data) =>
    json.encode(data.toMap());

class GetProfileResponse {
  GetProfileResponse({
    this.message,
    this.isError,
    this.result,
  });

  String message;
  bool isError;
  Result result;

  factory GetProfileResponse.fromMap(
          Map<String, dynamic> json) =>
      GetProfileResponse(
        message: json["message"],
        isError: json["isError"],
        result: Result.fromMap(json["result"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "isError": isError,
        "result": result.toMap(),
      };
}

class Result {
  Result({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.profilePicture,
    this.country,
    this.address,
    this.tenantId,
    this.city,
    this.state,
    this.zip,
    this.street,
    this.type,
    this.phoneCode,
    this.id,
    this.userName,
    this.normalizedUserName,
    this.email,
    this.normalizedEmail,
    this.emailConfirmed,
    this.passwordHash,
    this.securityStamp,
    this.concurrencyStamp,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.twoFactorEnabled,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.accessFailedCount,
  });

  String firstName;
  String lastName;
  String dateOfBirth;
  dynamic profilePicture;
  String country;
  String address;
  String tenantId;
  dynamic city;
  dynamic state;
  dynamic zip;
  dynamic street;
  int type;
  dynamic phoneCode;
  String id;
  String userName;
  String normalizedUserName;
  String email;
  String normalizedEmail;
  bool emailConfirmed;
  dynamic passwordHash;
  String securityStamp;
  String concurrencyStamp;
  String phoneNumber;
  bool phoneNumberConfirmed;
  bool twoFactorEnabled;
  dynamic lockoutEnd;
  bool lockoutEnabled;
  int accessFailedCount;

  factory Result.fromMap(
          Map<String, dynamic> json) =>
      Result(
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"],
        profilePicture: json["profilePicture"],
        country: json["country"],
        address: json["address"],
        tenantId: json["tenantId"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        street: json["street"],
        type: json["type"],
        phoneCode: json["phoneCode"],
        id: json["id"],
        userName: json["userName"],
        normalizedUserName:
            json["normalizedUserName"],
        email: json["email"],
        normalizedEmail: json["normalizedEmail"],
        emailConfirmed: json["emailConfirmed"],
        passwordHash: json["passwordHash"],
        securityStamp: json["securityStamp"],
        concurrencyStamp:
            json["concurrencyStamp"],
        phoneNumber: json["phoneNumber"],
        phoneNumberConfirmed:
            json["phoneNumberConfirmed"],
        twoFactorEnabled:
            json["twoFactorEnabled"],
        lockoutEnd: json["lockoutEnd"],
        lockoutEnabled: json["lockoutEnabled"],
        accessFailedCount:
            json["accessFailedCount"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
        "profilePicture": profilePicture,
        "country": country,
        "address": address,
        "tenantId": tenantId,
        "city": city,
        "state": state,
        "zip": zip,
        "street": street,
        "type": type,
        "phoneCode": phoneCode,
        "id": id,
        "userName": userName,
        "normalizedUserName": normalizedUserName,
        "email": email,
        "normalizedEmail": normalizedEmail,
        "emailConfirmed": emailConfirmed,
        "passwordHash": passwordHash,
        "securityStamp": securityStamp,
        "concurrencyStamp": concurrencyStamp,
        "phoneNumber": phoneNumber,
        "phoneNumberConfirmed":
            phoneNumberConfirmed,
        "twoFactorEnabled": twoFactorEnabled,
        "lockoutEnd": lockoutEnd,
        "lockoutEnabled": lockoutEnabled,
        "accessFailedCount": accessFailedCount,
      };
}
