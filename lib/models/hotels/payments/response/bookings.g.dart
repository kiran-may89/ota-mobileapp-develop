// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bookings _$BookingsFromJson(Map<String, dynamic> json) {
  return Bookings(
    id: json['id'] as int,
    uid: json['uid'] as String,
    bookingId: json['bookingId'] as int,
    reservationNumber: json['reservationNumber'] as String,
    alternateTpaBookingId: json['alternateTpaBookingId'] as String,
    reservationDate: json['reservationDate'] as String,
    returnDate: json['returnDate'] as String,
    bookingDate: json['bookingDate'] as String,
    trackToken: json['trackToken'] as String,
    logToken: json['logToken'] as String,
    invoicePath: json['invoicePath'] as String,
    iterinaryPath: json['iterinaryPath'] as String,
    markupId: json['markupId'] as String,
    status: json['status'] as String,
    totalAmount: (json['totalAmount'] as num)?.toDouble(),
    totalAmountMarkup: (json['totalAmountMarkup'] as num)?.toDouble(),
    markup: (json['markup'] as num)?.toDouble(),
    otaTax: (json['otaTax'] as num)?.toDouble(),
    tpaAmount: (json['tpaAmount'] as num)?.toDouble(),
    tpaType: json['tpaType'] as int,
    tpa: json['tpa'] as String,
    serviceTypeId: json['serviceTypeId'] as int,
    serviceType: json['serviceType'] as String,
    serviceTypeCode: json['serviceTypeCode'] as String,
    provider: json['provider'] as String,
    couponId: json['couponId'] as String,
    isBookingModified: json['isBookingModified'] as bool,
    isBookingCancelled: json['isBookingCancelled'] as bool,
    isDeleted: json['isDeleted'] as bool,
    travellers: (json['travellers'] as List)
        ?.map((e) =>
            e == null ? null : Travellers.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bookingCancellation: json['bookingCancellation'] as String,
  );
}

Map<String, dynamic> _$BookingsToJson(Bookings instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'bookingId': instance.bookingId,
      'reservationNumber': instance.reservationNumber,
      'alternateTpaBookingId': instance.alternateTpaBookingId,
      'reservationDate': instance.reservationDate,
      'returnDate': instance.returnDate,
      'bookingDate': instance.bookingDate,
      'trackToken': instance.trackToken,
      'logToken': instance.logToken,
      'invoicePath': instance.invoicePath,
      'iterinaryPath': instance.iterinaryPath,
      'markupId': instance.markupId,
      'status': instance.status,
      'totalAmount': instance.totalAmount,
      'totalAmountMarkup': instance.totalAmountMarkup,
      'markup': instance.markup,
      'otaTax': instance.otaTax,
      'tpaAmount': instance.tpaAmount,
      'tpaType': instance.tpaType,
      'tpa': instance.tpa,
      'serviceTypeId': instance.serviceTypeId,
      'serviceType': instance.serviceType,
      'serviceTypeCode': instance.serviceTypeCode,
      'provider': instance.provider,
      'couponId': instance.couponId,
      'isBookingModified': instance.isBookingModified,
      'isBookingCancelled': instance.isBookingCancelled,
      'isDeleted': instance.isDeleted,
      'travellers': instance.travellers,
      'bookingCancellation': instance.bookingCancellation,
    };
