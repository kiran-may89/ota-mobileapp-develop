// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_look_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityLookUpResponse _$CityLookUpResponseFromJson(Map<String, dynamic> json) {
  return CityLookUpResponse(
    message: json['message'] as String,
    isError: json['isError'] as bool,
    result: (json['result'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..version = json['version'] as String;
}

Map<String, dynamic> _$CityLookUpResponseToJson(CityLookUpResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'message': instance.message,
      'isError': instance.isError,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    cityName: json['cityName'] as String,
    countryId: json['countryId'] as int,
    citiesCodes: (json['citiesCodes'] as List)
        ?.map((e) =>
            e == null ? null : CitiesCodes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
    uid: json['uid'] as String,
    createdBy: json['createdBy'] as String,
    createdDate: json['createdDate'] as String,
    updatedBy: json['updatedBy'],
    updatedDate: json['updatedDate'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'countryId': instance.countryId,
      'citiesCodes': instance.citiesCodes,
      'id': instance.id,
      'uid': instance.uid,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'updatedBy': instance.updatedBy,
      'updatedDate': instance.updatedDate,
    };

CitiesCodes _$CitiesCodesFromJson(Map<String, dynamic> json) {
  return CitiesCodes(
    isDeleted: json['isDeleted'] as bool,
    cityCode: json['cityCode'] as String,
    hotelTpaId: json['hotelTpaId'] as int,
    cityId: json['cityId'] as int,
    id: json['id'] as int,
    uid: json['uid'] as String,
    createdBy: json['createdBy'] as String,
    createdDate: json['createdDate'] as String,
    updatedBy: json['updatedBy'],
    updatedDate: json['updatedDate'] as String,
  );
}

Map<String, dynamic> _$CitiesCodesToJson(CitiesCodes instance) =>
    <String, dynamic>{
      'isDeleted': instance.isDeleted,
      'cityCode': instance.cityCode,
      'hotelTpaId': instance.hotelTpaId,
      'cityId': instance.cityId,
      'id': instance.id,
      'uid': instance.uid,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'updatedBy': instance.updatedBy,
      'updatedDate': instance.updatedDate,
    };
