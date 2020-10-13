// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancellation_policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancellationPolicy _$CancellationPolicyFromJson(Map<String, dynamic> json) {
  return CancellationPolicy(
    cancelByDate: json['cancelByDate'] as String,
    policyText: json['policyText'] as String,
    policies: (json['policies'] as List)
        ?.map((e) =>
            e == null ? null : Policies.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    underCancellation: json['underCancellation'] as bool,
    amountType: json['amountType'] as String,
    noShowFee: json['noShowFee'] == null
        ? null
        : NoShowFee.fromJson(json['noShowFee'] as Map<String, dynamic>),
    tpa: json['tpa'] as int,
    tpaName: json['tpaName'] as String,
    options: json['options'] as String,
  );
}

Map<String, dynamic> _$CancellationPolicyToJson(CancellationPolicy instance) =>
    <String, dynamic>{
      'cancelByDate': instance.cancelByDate,
      'policyText': instance.policyText,
      'policies': instance.policies,
      'underCancellation': instance.underCancellation,
      'amountType': instance.amountType,
      'noShowFee': instance.noShowFee,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
      'options': instance.options,
    };
