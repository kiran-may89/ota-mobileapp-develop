// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_traveller_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelTravellerDetails _$HotelTravellerDetailsFromJson(
    Map<String, dynamic> json) {
  return HotelTravellerDetails(
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    gender: json['gender'] as int,
    dob: json['dob'] as String,
    phoneNumber: json['phoneNumber'] as String,
    phoneNumberCode: json['phoneNumberCode'] as String,
    passport: json['passport'] as String,
    relation: json['relation'] as String,
    email: json['email'] as String,
    address: json['address'] as String,
    isPrimary: json['isPrimary'] as bool,
    passportExpirationDate: json['passportExpirationDate'] as String,
    country: json['country'] as String,
    nationality: json['nationality'] as String,
  );
}

Map<String, dynamic> _$HotelTravellerDetailsToJson(
        HotelTravellerDetails instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'gender': instance.gender,
      'dob': instance.dob,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberCode': instance.phoneNumberCode,
      'passport': instance.passport,
      'relation': instance.relation,
      'email': instance.email,
      'address': instance.address,
      'isPrimary': instance.isPrimary,
      'passportExpirationDate': instance.passportExpirationDate,
      'country': instance.country,
      'nationality': instance.nationality,
    };
