// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travellers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Travellers _$TravellersFromJson(Map<String, dynamic> json) {
  return Travellers(
    id: json['id'] as int,
    uid: json['uid'] as String,
    bookingId: json['bookingId'] as int,
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    gender: json['gender'] as int,
    dob: json['dob'] as String,
    phoneNumber: json['phoneNumber'] as String,
    phoneNumberCode: json['phoneNumberCode'] as String,
    email: json['email'] as String,
    country: json['country'] as String,
    countryCode: json['countryCode'] as String,
    address: json['address'] as String,
    passport: json['passport'] as String,
    passportExpirationDate: json['passportExpirationDate'] as String,
    relation: json['relation'] as String,
    nationality: json['nationality'] as String,
    visaFee: json['visaFee'] as String,
    visaFeeReference: json['visaFeeReference'] as String,
    isDeleted: json['isDeleted'] as bool,
  );
}

Map<String, dynamic> _$TravellersToJson(Travellers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'bookingId': instance.bookingId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'gender': instance.gender,
      'dob': instance.dob,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberCode': instance.phoneNumberCode,
      'email': instance.email,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'address': instance.address,
      'passport': instance.passport,
      'passportExpirationDate': instance.passportExpirationDate,
      'relation': instance.relation,
      'nationality': instance.nationality,
      'visaFee': instance.visaFee,
      'visaFeeReference': instance.visaFeeReference,
      'isDeleted': instance.isDeleted,
    };
