// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceDetails _$PriceDetailsFromJson(Map<String, dynamic> json) {
  return PriceDetails(
    net: (json['net'] as List)
        ?.map((e) => e == null ? null : Net.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PriceDetailsToJson(PriceDetails instance) =>
    <String, dynamic>{
      'net': instance.net,
    };
