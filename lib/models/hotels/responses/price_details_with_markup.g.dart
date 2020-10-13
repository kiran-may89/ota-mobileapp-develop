// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_details_with_markup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceDetailsWithMarkup _$PriceDetailsWithMarkupFromJson(
    Map<String, dynamic> json) {
  return PriceDetailsWithMarkup(
    net: (json['net'] as List)
        ?.map((e) => e == null ? null : Net.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PriceDetailsWithMarkupToJson(
        PriceDetailsWithMarkup instance) =>
    <String, dynamic>{
      'net': instance.net,
    };
