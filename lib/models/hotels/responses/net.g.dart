// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Net _$NetFromJson(Map<String, dynamic> json) {
  return Net(
    name: json['name'] as String,
    included: json['included'] as bool,
    currency: json['currency'] as String,
    amountType: json['amountType'] as String,
    amount: (json['amount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$NetToJson(Net instance) => <String, dynamic>{
      'name': instance.name,
      'included': instance.included,
      'currency': instance.currency,
      'amountType': instance.amountType,
      'amount': instance.amount,
    };
