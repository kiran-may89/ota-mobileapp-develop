// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) {
  return SignupRequest(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    phoneCode: json['phoneCode'] as String,
    passwordHash: json['passwordHash'] as String,
    country: json['country'] as String,
    profilePicture: json['profilePicture'] as String,
    dateOfBirth: json['dateOfBirth'] as String,
    street: json['street'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zip: json['zip'] as String,
    address: json['address'] as String,
    tenantId: json['tenantId'] as String,
  );
}

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'phoneCode': instance.phoneCode,
      'passwordHash': instance.passwordHash,
      'country': instance.country,
      'profilePicture': instance.profilePicture,
      'dateOfBirth': instance.dateOfBirth,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
      'address': instance.address,
      'tenantId': instance.tenantId,
    };
