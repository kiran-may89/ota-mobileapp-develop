
import 'package:flutter/material.dart';


class SupportedCurrencyResponse {
  SupportedCurrencyResponse({
    this.message,
    this.isError,
    this.result,
  });

  String message;
  bool isError;
  List<SupportedCurrencyResult> result;

  factory SupportedCurrencyResponse.fromMap(
          Map<String, dynamic> json) =>
      SupportedCurrencyResponse(
        message: json["message"],
        isError: json["isError"],
        result: List<SupportedCurrencyResult>.from(json["result"]
            .map((x) => SupportedCurrencyResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "isError": isError,
        "result": List<dynamic>.from(
            result.map((x) => x.toMap())),
      };
}

class SupportedCurrencyResult {
  SupportedCurrencyResult({
    this.country,
    this.flagUrl,
    this.symbol,
    this.currencyCode,
  });

  String country;
  String flagUrl;
  String symbol;
  String currencyCode;

  factory SupportedCurrencyResult.fromMap(
          Map<String, dynamic> json) =>
      SupportedCurrencyResult(
        country: json["country"],
        flagUrl: json["flagUrl"],
        symbol: json["symbol"] == null
            ? null
            : json["symbol"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toMap() => {
        "country": country,
        "flagUrl": flagUrl,
        "symbol": symbol == null ? null : symbol,
        "currencyCode": currencyCode,
      };
}
