// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_details_response.result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelDetailsResponseResult _$HotelDetailsResponseResultFromJson(
    Map<String, dynamic> json) {
  return HotelDetailsResponseResult(
    searchId: json['searchId'] as String,
    checkIn: json['checkIn'] as String,
    checkOut: json['checkOut'] as String,
    hotel: json['hotel'] == null
        ? null
        : Hotel.fromJson(json['hotel'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HotelDetailsResponseResultToJson(
        HotelDetailsResponseResult instance) =>
    <String, dynamic>{
      'searchId': instance.searchId,
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
      'hotel': instance.hotel,
    };
