// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationRequest _$ReservationRequestFromJson(Map<String, dynamic> json) {
  return ReservationRequest(
    searchId: json['searchId'] as String,
    hotelCode: json['hotelCode'] as String,
    cityCode: json['cityCode'],
    groupOptionId: json['groupOptionId'] as String,
    referenceorName: json['referenceorName'] as String,
    roomGrp: json['roomGrp'] == null
        ? null
        : RoomGrp.fromJson(json['roomGrp'] as Map<String, dynamic>),
    leadPassenger: json['leadPassenger'] == null
        ? null
        : LeadPassenger.fromJson(json['leadPassenger'] as Map<String, dynamic>),
    checkInDate: json['checkInDate'] as String,
    checkOutDate: json['checkOutDate'] as String,
    paymentMode: json['paymentMode'] as String,
    tpa: json['tpa'] as int,
    tpaName: json['tpaName'] as String,
    options: (json['options'] as List)
        ?.map((e) =>
            e == null ? null : Options.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReservationRequestToJson(ReservationRequest instance) =>
    <String, dynamic>{
      'searchId': instance.searchId,
      'hotelCode': instance.hotelCode,
      'cityCode': instance.cityCode,
      'groupOptionId': instance.groupOptionId,
      'referenceorName': instance.referenceorName,
      'roomGrp': instance.roomGrp,
      'leadPassenger': instance.leadPassenger,
      'checkInDate': instance.checkInDate,
      'checkOutDate': instance.checkOutDate,
      'paymentMode': instance.paymentMode,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
      'options': instance.options,
    };

LeadPassenger _$LeadPassengerFromJson(Map<String, dynamic> json) {
  return LeadPassenger(
    title: json['title'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    clientNationality: json['clientNationality'] as String,
  );
}

Map<String, dynamic> _$LeadPassengerToJson(LeadPassenger instance) =>
    <String, dynamic>{
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'clientNationality': instance.clientNationality,
    };

RoomGrp _$RoomGrpFromJson(Map<String, dynamic> json) {
  return RoomGrp(
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

Map<String, dynamic> _$RoomGrpToJson(RoomGrp instance) => <String, dynamic>{
      'rooms': instance.rooms,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
      'options': instance.options,
    };

Rooms _$RoomsFromJson(Map<String, dynamic> json) {
  return Rooms(
    groupRoomId: json['groupRoomId'] as String,
    adults: (json['adults'] as List)
        ?.map((e) =>
            e == null ? null : Adults.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    childs: (json['childs'] as List)
        ?.map((e) =>
            e == null ? null : Childs.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tpa: json['tpa'] as int,
    tpaName: json['tpaName'] as String,
    options: (json['options'] as List)
        ?.map((e) =>
            e == null ? null : Options.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RoomsToJson(Rooms instance) => <String, dynamic>{
      'groupRoomId': instance.groupRoomId,
      'adults': instance.adults,
      'childs': instance.childs,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
      'options': instance.options,
    };

Childs _$ChildsFromJson(Map<String, dynamic> json) {
  return Childs(
    title: json['title'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    age: json['age'] as String,
  );
}

Map<String, dynamic> _$ChildsToJson(Childs instance) => <String, dynamic>{
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
    };

Adults _$AdultsFromJson(Map<String, dynamic> json) {
  return Adults(
    title: json['title'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
  );
}

Map<String, dynamic> _$AdultsToJson(Adults instance) => <String, dynamic>{
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
