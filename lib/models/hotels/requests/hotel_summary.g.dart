// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelSummary _$HotelSummaryFromJson(Map<String, dynamic> json) {
  return HotelSummary(
    serviceType: json['serviceType'] as String,
    checkInDate: json['checkInDate'] as String,
    checkOutDate: json['checkOutDate'] as String,
    name: json['name'] as String,
    address: json['address'] as String,
    selcectRooms: json['selcectRooms'] as String,
    image: json['image'] as String,
    checkInTime: json['checkInTime'] as String,
    checkOutTime: json['checkOutTime'] as String,
    provider: json['provider'] as String,
  );
}

Map<String, dynamic> _$HotelSummaryToJson(HotelSummary instance) =>
    <String, dynamic>{
      'serviceType': instance.serviceType,
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'name': instance.name,
      'address': instance.address,
      'selcectRooms': instance.selcectRooms,
      'image': instance.image,
      'checkInTime': instance.checkInTime,
      'checkOutTime': instance.checkOutTime,
      'provider': instance.provider,
    };
