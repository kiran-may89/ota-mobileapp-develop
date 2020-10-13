// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_check_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateCheckResponse _$RateCheckResponseFromJson(Map<String, dynamic> json) {
  return RateCheckResponse(
    version: json['version'] as String,
    message: json['message'] as String,
    isError: json['isError'] as bool,
    responseException: json['responseException'] as String,
    result: json['result'] == null
        ? null
        : RoomOption.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RateCheckResponseToJson(RateCheckResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'message': instance.message,
      'isError': instance.isError,
      'responseException': instance.responseException,
      'result': instance.result,
    };
