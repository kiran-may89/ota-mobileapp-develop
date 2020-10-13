// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelDetailsResponse _$HotelDetailsResponseFromJson(Map<String, dynamic> json) {
  return HotelDetailsResponse(
    version: json['version'] as String,
    message: json['message'] as String,
    isError: json['isError'] as bool,
    responseException: json['responseException'] as String,
    result: json['result'] == null
        ? null
        : HotelDetailsResponseResult.fromJson(
            json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HotelDetailsResponseToJson(
        HotelDetailsResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'message': instance.message,
      'isError': instance.isError,
      'responseException': instance.responseException,
      'result': instance.result,
    };
