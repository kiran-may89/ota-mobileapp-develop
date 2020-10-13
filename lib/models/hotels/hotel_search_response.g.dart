// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelSearchResponse _$HotelSearchResponseFromJson(Map<String, dynamic> json) {
  return HotelSearchResponse(
    version: json['version'] as String,
    message: json['message'] as String,
    isError: json['isError'] as bool,
    responseException: json['responseException'],
    result: json['result'] == null
        ? null
        : HotelResult.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HotelSearchResponseToJson(
        HotelSearchResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'message': instance.message,
      'isError': instance.isError,
      'responseException': instance.responseException,
      'result': instance.result,
    };

HotelResult _$HotelResultFromJson(Map<String, dynamic> json) {
  return HotelResult(
    searchId: json['search_Id'] as String,
    totalHotels: json['totalHotels'] as int,
    totalRooms: json['totalRooms'] as int,
    totalNights: json['totalNights'] as int,
    totalChildren: json['totalChildren'] as int,
    totalAdults: json['totalAdults'] as int,
    checkIn: json['checkIn'] as String,
    checkOut: json['checkOut'] as String,
    hotels: (json['hotels'] as List)
        ?.map(
            (e) => e == null ? null : Hotel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HotelResultToJson(HotelResult instance) =>
    <String, dynamic>{
      'search_Id': instance.searchId,
      'totalHotels': instance.totalHotels,
      'totalRooms': instance.totalRooms,
      'totalNights': instance.totalNights,
      'totalChildren': instance.totalChildren,
      'totalAdults': instance.totalAdults,
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
      'hotels': instance.hotels,
    };
