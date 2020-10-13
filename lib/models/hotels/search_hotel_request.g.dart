// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hotel_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHotelRequest _$SearchHotelRequestFromJson(Map<String, dynamic> json) {
  return SearchHotelRequest(
    tenantId: json['tenantId'] as String,
    cityIds: (json['cityIds'] as List)?.map((e) => e as String)?.toList(),
    checkInDate: json['checkInDate'] as String,
    checkOutDate: json['checkOutDate'] as String,
    clientNationality: json['clientNationality'] as String,
    roomPaxes: (json['roomPaxes'] as List)
        ?.map((e) =>
            e == null ? null : RoomPaxes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isCity: json['isCity'] as bool,
    rooms: (json['rooms'] as List)
        ?.map(
            (e) => e == null ? null : Rooms.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchHotelRequestToJson(SearchHotelRequest instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'cityIds': instance.cityIds,
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'clientNationality': instance.clientNationality,
      'rooms': instance.rooms,
      'roomPaxes': instance.roomPaxes,
      'isCity': instance.isCity,
    };

Rooms _$RoomsFromJson(Map<String, dynamic> json) {
  return Rooms(
    adultCnt: json['adultCnt'] as int,
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : Children.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RoomsToJson(Rooms instance) => <String, dynamic>{
      'adultCnt': instance.adultCnt,
      'children': instance.children,
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) {
  return Children(
    childAge: json['childAge'] as int,
  );
}

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'childAge': instance.childAge,
    };

RoomPaxes _$RoomPaxesFromJson(Map<String, dynamic> json) {
  return RoomPaxes(
    adultCnt: json['adultCnt'] as int,
    children: (json['children'] as List)
        ?.map((e) =>
            e == null ? null : Children.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rooms: json['rooms'] as int,
  );
}

Map<String, dynamic> _$RoomPaxesToJson(RoomPaxes instance) => <String, dynamic>{
      'adultCnt': instance.adultCnt,
      'children': instance.children,
      'rooms': instance.rooms,
    };
