// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
    expiry: json['expiry'] == null
        ? null
        : Expiry.fromJson(json['expiry'] as Map<String, dynamic>),
    number: json['number'] as String,
    securityCode: json['securityCode'] as String,
  );
}

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'expiry': instance.expiry,
      'number': instance.number,
      'securityCode': instance.securityCode,
    };

Expiry _$ExpiryFromJson(Map<String, dynamic> json) {
  return Expiry(
    month: json['month'] as String,
    year: json['year'] as String,
  );
}

Map<String, dynamic> _$ExpiryToJson(Expiry instance) => <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
    };
