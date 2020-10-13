// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomOption _$RoomOptionFromJson(Map<String, dynamic> json) {
  return RoomOption(
    groupOptionId: json['groupOptionId'] as String,
    supportsCancellation: json['supportsCancellation'] as bool,
    supportsAmendment: json['supportsAmendment'] as bool,
    rooms: (json['rooms'] as List)
        ?.map(
            (e) => e == null ? null : Rooms.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    roomRateType: json['roomRateType'] as String,
    rateComments: json['rateComments'] == null
        ? null
        : RateComments.fromJson(json['rateComments'] as Map<String, dynamic>),
    totalPrice: (json['totalPrice'] as num)?.toDouble(),
    displayRateInfoWithMarkup: json['displayRateInfoWithMarkup'] == null
        ? null
        : DisplayRateInfoWithMarkup.fromJson(
            json['displayRateInfoWithMarkup'] as Map<String, dynamic>),
    discountApplied: (json['discountApplied'] as num)?.toDouble(),
    dealName: json['dealName'] as String,
    hasPromotions: json['hasPromotions'] as bool,
    paymentType:
        (json['paymentType'] as List)?.map((e) => e as String)?.toList(),
    otherInclusions:
        (json['otherInclusions'] as List)?.map((e) => e as String)?.toList(),
    nonRefundable: json['nonRefundable'] as bool,
    includesWifi: json['includesWifi'] as String,
    includesBoarding: json['includesBoarding'] as bool,
    boardingDetails:
        (json['boardingDetails'] as List)?.map((e) => e as String)?.toList(),
    creditDeduction: json['creditDeduction'] as String,
    priceDetails: json['priceDetails'] == null
        ? null
        : PriceDetails.fromJson(json['priceDetails'] as Map<String, dynamic>),
    priceDetailsWithMarkup: json['priceDetailsWithMarkup'] == null
        ? null
        : PriceDetailsWithMarkup.fromJson(
            json['priceDetailsWithMarkup'] as Map<String, dynamic>),
    cancellationPolicy: json['cancellationPolicy'] == null
        ? null
        : CancellationPolicy.fromJson(
            json['cancellationPolicy'] as Map<String, dynamic>),
    panRequired: json['panRequired'] as bool,
    tpa: json['tpa'] as int,
    tpaName: json['tpaName'] as String,
    options: (json['options'] as List)
        ?.map((e) =>
            e == null ? null : Options.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RoomOptionToJson(RoomOption instance) =>
    <String, dynamic>{
      'groupOptionId': instance.groupOptionId,
      'supportsCancellation': instance.supportsCancellation,
      'supportsAmendment': instance.supportsAmendment,
      'rooms': instance.rooms,
      'roomRateType': instance.roomRateType,
      'rateComments': instance.rateComments,
      'totalPrice': instance.totalPrice,
      'displayRateInfoWithMarkup': instance.displayRateInfoWithMarkup,
      'discountApplied': instance.discountApplied,
      'dealName': instance.dealName,
      'hasPromotions': instance.hasPromotions,
      'paymentType': instance.paymentType,
      'otherInclusions': instance.otherInclusions,
      'nonRefundable': instance.nonRefundable,
      'includesWifi': instance.includesWifi,
      'includesBoarding': instance.includesBoarding,
      'boardingDetails': instance.boardingDetails,
      'creditDeduction': instance.creditDeduction,
      'priceDetails': instance.priceDetails,
      'priceDetailsWithMarkup': instance.priceDetailsWithMarkup,
      'cancellationPolicy': instance.cancellationPolicy,
      'panRequired': instance.panRequired,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
      'options': instance.options,
    };
