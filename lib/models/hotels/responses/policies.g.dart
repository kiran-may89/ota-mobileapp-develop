// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Policies _$PoliciesFromJson(Map<String, dynamic> json) {
  return Policies(
    from: json['from'] as String,
    amountType: json['amountType'] as String,
    amountValue: (json['amountValue'] as num)?.toDouble(),
    amountValueWithMarkup: (json['amountValueWithMarkup'] as num)?.toDouble(),
    percent: (json['percent'] as num)?.toDouble(),
    currency: json['currency'] as String,
    nights: json['nights'] as int,
    allowedCancellation: json['allowedCancellation'] as String,
  );
}

Map<String, dynamic> _$PoliciesToJson(Policies instance) => <String, dynamic>{
      'from': instance.from,
      'amountType': instance.amountType,
      'amountValue': instance.amountValue,
      'amountValueWithMarkup': instance.amountValueWithMarkup,
      'percent': instance.percent,
      'currency': instance.currency,
      'nights': instance.nights,
      'allowedCancellation': instance.allowedCancellation,
    };
