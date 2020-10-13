import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ota/models/common/models/api_exception.dart';
import 'package:ota/models/hotels/payments/response/result.dart';
import 'package:ota/models/common/models/api_exception.dart';
import '../../../base_model.dart';
part 'HotelBookingResponse.g.dart';

@JsonSerializable()
class HotelBookingResponse extends BaseModel {
  String version;
  String message;
  bool isError;
  @JsonKey(ignore: true)
  ApiException responseException;
  Result result;
  @override
  setException({DioError error}) {
    super.setException(error: error);
    if (error.type == DioErrorType.RESPONSE && error.response.statusCode != 500) {
      try {
        responseException = ApiException.fromJson(error.response.data);
      } catch (e, s) {}
    }
  }

  HotelBookingResponse({this.version, this.message, this.isError, this.responseException, this.result})
      : super(version: version, message: message, isError: isError);
  Map<String, dynamic> toJson() => _$HotelBookingResponseToJson(this);
  factory HotelBookingResponse.fromJson(Map<String, dynamic> json) => _$HotelBookingResponseFromJson(json);
}
