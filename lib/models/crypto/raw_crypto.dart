import 'dart:convert';

RawCrypto rawCryptoFromJson(String str) => RawCrypto.fromJson(json.decode(str));

String rawCryptoToJson(RawCrypto data) => json.encode(data.toJson());

class RawCrypto {
  RawCrypto({
    this.result,
  });

  String result;

  factory RawCrypto.fromJson(Map<String, dynamic> json) => RawCrypto(
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
  };
}
