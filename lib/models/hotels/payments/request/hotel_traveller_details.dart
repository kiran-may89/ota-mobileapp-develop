import 'package:json_annotation/json_annotation.dart';
part 'hotel_traveller_details.g.dart';
@JsonSerializable()
class HotelTravellerDetails {
  String firstname;
  String lastname;
  int gender;
  String dob;
  String phoneNumber;
  String phoneNumberCode;
  String passport;
  String relation;
  String email;
  String address;
  bool isPrimary;
  String passportExpirationDate;
  String country;
  String nationality;

  HotelTravellerDetails({
      this.firstname, 
      this.lastname, 
      this.gender, 
      this.dob, 
      this.phoneNumber, 
      this.phoneNumberCode, 
      this.passport, 
      this.relation, 
      this.email, 
      this.address, 
      this.isPrimary, 
      this.passportExpirationDate, 
      this.country, 
      this.nationality});

  Map<String, dynamic> toJson()=>_$HotelTravellerDetailsToJson(this);
  factory HotelTravellerDetails.fromJson(Map<String, dynamic> json)=> _$HotelTravellerDetailsFromJson(json);

}