
import 'package:json_annotation/json_annotation.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/common/models/api_exception.dart';

part 'airport_look_up_response.g.dart';

@JsonSerializable()

class AirportLookupResponse extends BaseModel{
  String message;
  bool isError;
  List<AirportCodes> result;

  AirportLookupResponse({this.message, this.isError, this.result});


  factory AirportLookupResponse.fromJson(Map<String, dynamic> json)=> _$AirportLookupResponseFromJson(json);


  Map<String, dynamic> toJson()=>_$AirportLookupResponseToJson(this);



}


@JsonSerializable()
class AirportCodes {
  String airportCode;
  String city;
  String state;
  String airportName;
  bool isDeleted;
  int id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  String updatedDate;

  AirportCodes(
      {this.airportCode,
        this.city,
        this.state,
        this.airportName,
        this.isDeleted,
        this.id,
        this.uid,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  Map<String, dynamic> toJson()=>_$AirportCodesToJson(this);

  factory AirportCodes.fromJson(Map<String, dynamic> json)=> _$AirportCodesFromJson(json);

}