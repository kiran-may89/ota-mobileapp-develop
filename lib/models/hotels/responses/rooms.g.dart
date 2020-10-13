// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rooms _$RoomsFromJson(Map<String, dynamic> json) {
  return Rooms(
    roomId: json['roomId'] as String,
    noOfRooms: json['noOfRooms'] as int,
    noOfChildren: json['noOfChildren'] as int,
    noOfAdults: json['noOfAdults'] as int,
    roomName: json['roomName'] as String,
    roomPrice: (json['roomPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RoomsToJson(Rooms instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'noOfRooms': instance.noOfRooms,
      'noOfChildren': instance.noOfChildren,
      'noOfAdults': instance.noOfAdults,
      'roomName': instance.roomName,
      'roomPrice': instance.roomPrice,
    };
