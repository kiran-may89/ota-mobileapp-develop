import 'package:equatable/equatable.dart';

class RelationsList extends Equatable{
  RelationsList({
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
  List<RelationResult> result;

  factory RelationsList.fromMap(
          Map<String, dynamic> json) =>
      RelationsList(
        version: json["version"],
        message: json["message"],
        isError: json["isError"],
        responseException:
            json["responseException"],
        result: List<RelationResult>.from(json["result"]
            .map((x) => RelationResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "version": version,
        "message": message,
        "isError": isError,
        "responseException": responseException,
        "result": List<dynamic>.from(
            result.map((x) => x.toMap())),
      };

  @override
  // TODO: implement props
  List<Object> get props => [this.version, this.message, this.isError, this.responseException, this.result];
}

class RelationResult {
  RelationResult({
    this.id,
    this.uid,
    this.userid,
    this.firstName,
    this.lastName,
    this.dob,
    this.gender,
    this.nationality,
    this.phoneNumber,
    this.phoneCountryCode,
    this.passportNumber,
    this.passportExpiry,
    this.email,
    this.country,
    this.location,
    this.countryCode,
    this.relation,
    this.isDeleted,
  });

  int id;
  String uid;
  String userid;
  String firstName;
  String lastName;
  String dob;
  int gender;
  String nationality;
  String phoneNumber;
  int phoneCountryCode;
  String passportNumber;
  String passportExpiry;
  String email;
  String country;
  String location;
  String countryCode;
  String relation;
  bool isDeleted;

  factory RelationResult.fromMap(
          Map<String, dynamic> json) =>
      RelationResult(
        id: json["id"],
        uid: json["uid"],
        userid: json["userid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dob: json["dob"],
        gender: json["gender"],
        nationality: json["nationality"],
        phoneNumber: json["phoneNumber"],
        phoneCountryCode:
            json["phoneCountryCode"],
        passportNumber: json["passportNumber"],
        passportExpiry: json["passportExpiry"],
        email: json["email"],
        country: json["country"],
        location: json["location"],
        countryCode: json["countryCode"],
        relation: json["relation"],
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uid": uid,
        "userid": userid,
        "firstName": firstName,
        "lastName": lastName,
        "dob": dob,
        "gender": gender,
        "nationality": nationality,
        "phoneNumber": phoneNumber,
        "phoneCountryCode": phoneCountryCode,
        "passportNumber": passportNumber,
        "passportExpiry": passportExpiry,
        "email": email,
        "country": country,
        "location": location,
        "countryCode": countryCode,
        "relation": relation,
        "isDeleted": isDeleted,
      };
}
