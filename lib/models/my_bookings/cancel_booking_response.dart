// To parse this JSON data, do
//
//     final bookingCancelResponse = bookingCancelResponseFromMap(jsonString);

import 'dart:convert';

class BookingCancelResponse {
  BookingCancelResponse({
    this.version,
    this.message,
    this.isError,
    this.responseException,
    this.result,
  });

  dynamic version;
  dynamic message;
  bool isError;
  ResponseException responseException;
  dynamic result;

  factory BookingCancelResponse.fromJson(String str) => BookingCancelResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingCancelResponse.fromMap(Map<String, dynamic> json) => BookingCancelResponse(
    version: json["version"],
    message: json["message"],
    isError: json["isError"] == null ? null : json["isError"],
    responseException: json["responseException"] == null ? null : ResponseException.fromMap(json["responseException"]),
    result: json["result"],
  );

  Map<String, dynamic> toMap() => {
    "version": version,
    "message": message,
    "isError": isError == null ? null : isError,
    "responseException": responseException == null ? null : responseException.toMap(),
    "result": result,
  };
}

class ResponseException {
  ResponseException({
    this.exceptionMessage,
    this.details,
    this.referenceErrorCode,
    this.referenceDocumentLink,
    this.validationErrors,
  });

  String exceptionMessage;
  dynamic details;
  dynamic referenceErrorCode;
  dynamic referenceDocumentLink;
  dynamic validationErrors;

  factory ResponseException.fromJson(String str) => ResponseException.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseException.fromMap(Map<String, dynamic> json) => ResponseException(
    exceptionMessage: json["exceptionMessage"] == null ? null : json["exceptionMessage"],
    details: json["details"],
    referenceErrorCode: json["referenceErrorCode"],
    referenceDocumentLink: json["referenceDocumentLink"],
    validationErrors: json["validationErrors"],
  );

  Map<String, dynamic> toMap() => {
    "exceptionMessage": exceptionMessage == null ? null : exceptionMessage,
    "details": details,
    "referenceErrorCode": referenceErrorCode,
    "referenceDocumentLink": referenceDocumentLink,
    "validationErrors": validationErrors,
  };
}
