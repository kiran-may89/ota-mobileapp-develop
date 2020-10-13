
import 'package:json_annotation/json_annotation.dart';
part 'contact.g.dart';
@JsonSerializable()
class Contact {

  String id;
  String uid;
  int bookingMasterId;
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

	Contact({this.id, this.uid, this.bookingMasterId, this.firstname, this.lastname, this.gender, this.dob, this.phoneNumber, this.phoneNumberCode, this.email, this.country, this.countryCode, this.address, this.passport, this.passportExpirationDate, this.relation, this.nationality, this.visaFee, this.visaFeeReference});


	Map<String, dynamic> toJson()=>_$ContactToJson(this);
	factory Contact.fromJson(Map<String, dynamic> json)=> _$ContactFromJson(json);
}
