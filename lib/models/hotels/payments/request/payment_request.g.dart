// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) {
  return PaymentRequest(
    userId: json['userId'] as String,
    userType: json['userType'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    currency: json['currency'] as String,
    orderType: json['orderType'] as String,
    mode: json['mode'] as String,
    card: json['card'] == null
        ? null
        : Card.fromJson(json['card'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userType': instance.userType,
      'amount': instance.amount,
      'currency': instance.currency,
      'orderType': instance.orderType,
      'mode': instance.mode,
      'card': instance.card,
    };
