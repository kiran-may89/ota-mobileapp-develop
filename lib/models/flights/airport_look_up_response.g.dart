// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airport_look_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirportLookupResponse _$AirportLookupResponseFromJson(
    Map<String, dynamic> json) {
  return AirportLookupResponse(
    message: json['message'] as String,
    isError: json['isError'] as bool,
    result: (json['result'] as List)
        ?.map((e) =>
            e == null ? null : AirportCodes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..version = json['version'] as String;
}

Map<String, dynamic> _$AirportLookupResponseToJson(
        AirportLookupResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'message': instance.message,
      'isError': instance.isError,
      'result': instance.result,
    };

AirportCodes _$AirportCodesFromJson(Map<String, dynamic> json) {
  return AirportCodes(
    airportCode: json['airportCode'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    airportName: json['airportName'] as String,
    isDeleted: json['isDeleted'] as bool,
    id: json['id'] as int,
    uid: json['uid'] as String,
    createdBy: json['createdBy'] as String,
    createdDate: json['createdDate'] as String,
    updatedBy: json['updatedBy'],
    updatedDate: json['updatedDate'] as String,
  );
}

Map<String, dynamic> _$AirportCodesToJson(AirportCodes instance) =>
    <String, dynamic>{
      'airportCode': instance.airportCode,
      'city': instance.city,
      'state': instance.state,
      'airportName': instance.airportName,
      'isDeleted': instance.isDeleted,
      'id': instance.id,
      'uid': instance.uid,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'updatedBy': instance.updatedBy,
      'updatedDate': instance.updatedDate,
    };
