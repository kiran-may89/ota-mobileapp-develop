// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelDetailsRequest _$HotelDetailsRequestFromJson(Map<String, dynamic> json) {
  return HotelDetailsRequest(
    searchId: json['searchId'] as String,
    hotelCode: json['hotelCode'] as String,
    checkInDate: json['checkInDate'] as String,
    checkOutDate: json['checkOutDate'] as String,
    rooms: (json['rooms'] as List)
        ?.map(
            (e) => e == null ? null : Rooms.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    currency: json['currency'] as String,
    clientNationality: json['clientNationality'] as String,
    tpa: json['tpa'] as String,
    tpaName: json['tpaName'] as String,
    options: (json['options'] as List)
        ?.map((e) =>
            e == null ? null : Options.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HotelDetailsRequestToJson(
        HotelDetailsRequest instance) =>
    <String, dynamic>{
      'searchId': instance.searchId,
      'hotelCode': instance.hotelCode,
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'rooms': instance.rooms,
      'currency': instance.currency,
      'clientNationality': instance.clientNationality,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
      'options': instance.options,
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) {
  return Children(
    childAge: json['childAge'] as String,
  );
}

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'childAge': instance.childAge,
    };
