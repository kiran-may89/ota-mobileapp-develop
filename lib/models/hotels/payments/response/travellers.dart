import 'package:json_annotation/json_annotation.dart';
part 'travellers.g.dart';
@JsonSerializable()
class Travellers {

  int id;
  String uid;
  int bookingId;
  String firstname;
  String lastname;
  int gender;
  String dob;
  String phoneNumber;
  String phoneNumberCode;
  String email;
  String country;
  String countryCode;
  String address;
  String passport;
  String passportExpirationDate;
  String relation;
  String nationality;
  String visaFee;
  String visaFeeReference;
  bool isDeleted;

	Travellers({this.id, this.uid, this.bookingId, this.firstname, this.lastname, this.gender, this.dob, this.phoneNumber, this.phoneNumberCode, this.email, this.country, this.countryCode, this.address, this.passport, this.passportExpirationDate, this.relation, this.nationality, this.visaFee, this.visaFeeReference, this.isDeleted});
	Map<String, dynamic> toJson()=>_$TravellersToJson(this);
	factory Travellers.fromJson(Map<String, dynamic> json)=> _$TravellersFromJson(json);

}
