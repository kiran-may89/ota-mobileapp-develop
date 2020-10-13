// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    id: json['id'] as String,
    uid: json['uid'] as String,
    bookingMasterId: json['bookingMasterId'] as int,
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
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'bookingMasterId': instance.bookingMasterId,
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
    };
