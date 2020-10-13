// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_show_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoShowFee _$NoShowFeeFromJson(Map<String, dynamic> json) {
  return NoShowFee(
    currency: json['currency'] as String,
    amountType: json['amountType'],
  );
}

Map<String, dynamic> _$NoShowFeeToJson(NoShowFee instance) => <String, dynamic>{
      'currency': instance.currency,
      'amountType': instance.amountType,
    };
