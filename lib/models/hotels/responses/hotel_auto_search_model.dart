

import 'dart:convert';



class HotelAutoSearchModel {
  HotelAutoSearchModel({
    this.version,
    this.message,
    this.isError,
    this.responseException,
    this.result,
  });

  dynamic version;
  String message;
  bool isError;
  dynamic responseException;
  List<City> result;

  factory HotelAutoSearchModel.fromJson(Map<String, dynamic> json) =>
      HotelAutoSearchModel(
        version: json["version"],
        message: json["message"],
        isError: json["isError"],
        responseException: json["responseException"],
        result:
            List<City>.from(json["result"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "message": message,
        "isError": isError,
        "responseException": responseException,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class City {
  City({
    this.id,
    this.isCity,
    this.name,
  });

  String id;
  bool isCity;
  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        isCity: json["isCity"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isCity": isCity,
        "name": name,
      };
}
