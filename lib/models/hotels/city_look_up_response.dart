import 'package:json_annotation/json_annotation.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/common/models/api_exception.dart';
part 'city_look_up_response.g.dart';


@JsonSerializable()
class CityLookUpResponse extends BaseModel{
  String message;
  bool isError;
  List<Result> result;

  CityLookUpResponse({
      this.message, 
      this.isError, 
      this.result}):super(message:message,isError:isError);

  Map<String, dynamic> toJson()=>_$CityLookUpResponseToJson(this);
  factory CityLookUpResponse.fromJson(Map<String, dynamic> json)=> _$CityLookUpResponseFromJson(json);




}

@JsonSerializable()
class Result {
  String cityName;
  int countryId;
  List<CitiesCodes> citiesCodes;
  int id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  String updatedDate;

  Result({
      this.cityName, 
      this.countryId, 
      this.citiesCodes, 
      this.id, 
      this.uid, 
      this.createdBy, 
      this.createdDate, 
      this.updatedBy, 
      this.updatedDate});

  Map<String, dynamic> toJson()=>_$ResultToJson(this);
  factory Result.fromJson(Map<String, dynamic> json)=>_$ResultFromJson(json);

}

@JsonSerializable()
class CitiesCodes {
  bool isDeleted;
  String cityCode;
  int hotelTpaId;
  int cityId;
  int id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  String updatedDate;

  CitiesCodes({
      this.isDeleted, 
      this.cityCode, 
      this.hotelTpaId, 
      this.cityId, 
      this.id, 
      this.uid, 
      this.createdBy, 
      this.createdDate, 
      this.updatedBy, 
      this.updatedDate});

  Map<String, dynamic> toJson()=>_$CitiesCodesToJson(this);
 factory CitiesCodes.fromJson(Map<String, dynamic> json)=>_$CitiesCodesFromJson(json);

}