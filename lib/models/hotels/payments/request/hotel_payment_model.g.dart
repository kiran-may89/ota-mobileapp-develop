// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelPaymentModel _$HotelPaymentModelFromJson(Map<String, dynamic> json) {
  return HotelPaymentModel(
    userId: json['userId'] as String,
    tenantId: json['tenantId'] as String,
    userType: json['userType'] as String,
    correlationId: json['correlationId'] as String,
    reservationRequest: json['reservationRequest'] as String,
    summaryInfo: json['summaryInfo'] as String,
    paymentRequest: json['paymentRequest'] == null
        ? null
        : PaymentRequest.fromJson(
            json['paymentRequest'] as Map<String, dynamic>),
    travellerDetails: (json['travellerDetails'] as List)
        ?.map((e) => e == null
            ? null
            : HotelTravellerDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ibanNumber: json['ibanNumber'] as String,
    paymentMode: json['paymentMode'] as int,
    tpaType: json['tpaType'] as int,
    serviceId: json['serviceId'] as int,
    serviceTypeCode: json['serviceTypeCode'] as String,
    provider: json['provider'] as String,
    baseRate: (json['baseRate'] as num)?.toDouble(),
    taxAndOtherCharges: (json['taxAndOtherCharges'] as num)?.toDouble(),
    supplierBaseRate: (json['supplierBaseRate'] as num)?.toDouble(),
    OTATax: (json['OTATax'] as num)?.toDouble(),
    Markup: (json['Markup'] as num)?.toDouble(),
    totalAmount: (json['totalAmount'] as num)?.toDouble(),
    totalAmountMarkup: (json['totalAmountMarkup'] as num)?.toDouble(),
    returnDate: json['returnDate'] as String,
    reservationDate: json['reservationDate'] as String,
    supportCancellation: json['supportCancellation'] as bool,
  );
}

Map<String, dynamic> _$HotelPaymentModelToJson(HotelPaymentModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'tenantId': instance.tenantId,
      'userType': instance.userType,
      'correlationId': instance.correlationId,
      'reservationRequest': instance.reservationRequest,
      'paymentRequest': instance.paymentRequest,
      'travellerDetails': instance.travellerDetails,
      'ibanNumber': instance.ibanNumber,
      'paymentMode': instance.paymentMode,
      'tpaType': instance.tpaType,
      'serviceId': instance.serviceId,
      'serviceTypeCode': instance.serviceTypeCode,
      'provider': instance.provider,
      'baseRate': instance.baseRate,
      'taxAndOtherCharges': instance.taxAndOtherCharges,
      'supplierBaseRate': instance.supplierBaseRate,
      'OTATax': instance.OTATax,
      'Markup': instance.Markup,
      'totalAmount': instance.totalAmount,
      'totalAmountMarkup': instance.totalAmountMarkup,
      'supportCancellation': instance.supportCancellation,
      'returnDate': instance.returnDate,
      'reservationDate': instance.reservationDate,
      'summaryInfo': instance.summaryInfo,
    };
