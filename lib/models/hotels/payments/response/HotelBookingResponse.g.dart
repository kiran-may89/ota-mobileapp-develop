// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HotelBookingResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelBookingResponse _$HotelBookingResponseFromJson(Map<String, dynamic> json) {
  return HotelBookingResponse(
    version: json['version'] as String,
    message: json['message'] as String,
    isError: json['isError'] as bool,
    result: json['result'] == null
        ? null
        : Result.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HotelBookingResponseToJson(
        HotelBookingResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'message': instance.message,
      'isError': instance.isError,
      'result': instance.result,
    };
