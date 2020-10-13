// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotel _$HotelFromJson(Map<String, dynamic> json) {
  return Hotel(
    name: json['name'] as String,
    hotelCode: json['hotelCode'] as String,
    geolocation: json['geolocation'] == null
        ? null
        : Geolocation.fromJson(json['geolocation'] as Map<String, dynamic>),
    starRating: (json['starRating'] as num)?.toDouble(),
    address: json['address'] as String,
    description: json['description'] as String,
    cityCode: json['cityCode'] as String,
    images: (json['images'] as List)?.map((e) => e as String)?.toList(),
    facilities: (json['facilities'] as List)?.map((e) => e as String)?.toList(),
    roomOption: (json['roomOption'] as List)
        ?.map((e) =>
            e == null ? null : RoomOption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    phoneNumber: json['phoneNumber'] as String,
    countryFacilities:
        (json['countryFacilities'] as List)?.map((e) => e as String)?.toList(),
    isRoomSpecific: json['isRoomSpecific'] as bool,
    minRate: (json['minRate'] as num)?.toDouble(),
    rooms: (json['rooms'] as List)
        ?.map(
            (e) => e == null ? null : Rooms.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tpa: json['tpa'] as int,
    tpaName: json['tpaName'] as String,
    options: (json['options'] as List)
        ?.map((e) =>
            e == null ? null : Options.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'name': instance.name,
      'hotelCode': instance.hotelCode,
      'geolocation': instance.geolocation,
      'starRating': instance.starRating,
      'address': instance.address,
      'description': instance.description,
      'cityCode': instance.cityCode,
      'images': instance.images,
      'facilities': instance.facilities,
      'roomOption': instance.roomOption,
      'phoneNumber': instance.phoneNumber,
      'countryFacilities': instance.countryFacilities,
      'isRoomSpecific': instance.isRoomSpecific,
      'minRate': instance.minRate,
      'rooms': instance.rooms,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
      'options': instance.options,
    };
