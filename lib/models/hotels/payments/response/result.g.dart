// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    id: json['id'] as int,
    uid: json['uid'] as String,
    bookingId: json['bookingId'] as String,
    userId: json['userId'] as String,
    userType: json['userType'] as String,
    tenantId: json['tenantId'] as String,
    correlationId: json['correlationId'] as String,
    totalAmount: (json['totalAmount'] as num)?.toDouble(),
    totalAmountMarkup: (json['totalAmountMarkup'] as num)?.toDouble(),
    markup: (json['markup'] as num)?.toDouble(),
    otaTax: (json['otaTax'] as num)?.toDouble(),
    totalRefundAmount: (json['totalRefundAmount'] as num)?.toDouble(),
    totalRefundAmountmarkup:
        (json['totalRefundAmountmarkup'] as num)?.toDouble(),
    paymentMode: json['paymentMode'] as String,
    paymentTransactionId: json['paymentTransactionId'] as String,
    ibanNumber: json['ibanNumber'] as String,
    status: json['status'] as String,
    visaRequestId: json['visaRequestId'] as String,
    visaLink: json['visaLink'] as String,
    preVisaReference: json['preVisaReference'] as String,
    isDeleted: json['isDeleted'] as bool,
    bookings: (json['bookings'] as List)
        ?.map((e) =>
            e == null ? null : Bookings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    contact: json['contact'] == null
        ? null
        : Contact.fromJson(json['contact'] as Map<String, dynamic>),
    paymentDetails: json['paymentDetails'] as String,
    visaStatus: json['visaStatus'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'bookingId': instance.bookingId,
      'userId': instance.userId,
      'userType': instance.userType,
      'tenantId': instance.tenantId,
      'correlationId': instance.correlationId,
      'totalAmount': instance.totalAmount,
      'totalAmountMarkup': instance.totalAmountMarkup,
      'markup': instance.markup,
      'otaTax': instance.otaTax,
      'totalRefundAmount': instance.totalRefundAmount,
      'totalRefundAmountmarkup': instance.totalRefundAmountmarkup,
      'paymentMode': instance.paymentMode,
      'paymentTransactionId': instance.paymentTransactionId,
      'ibanNumber': instance.ibanNumber,
      'status': instance.status,
      'visaRequestId': instance.visaRequestId,
      'visaLink': instance.visaLink,
      'preVisaReference': instance.preVisaReference,
      'isDeleted': instance.isDeleted,
      'bookings': instance.bookings,
      'contact': instance.contact,
      'paymentDetails': instance.paymentDetails,
      'visaStatus': instance.visaStatus,
    };
