import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/common/models/api_exception.dart';
import 'responses/room_option.dart';
import 'responses/geolocation.dart';
import 'responses/options.dart';
import 'responses/hotel.dart';
part 'hotel_search_response.g.dart';

@JsonSerializable()
class HotelSearchResponse extends BaseModel {
  dynamic responseException;
  @JsonKey(name: 'result')
  HotelResult result;

  HotelSearchResponse({String version, String message, bool isError, this.responseException, this.result})
      : super(message: message, isError: isError);

  factory HotelSearchResponse.fromJson(Map<String, dynamic> json) => _$HotelSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HotelSearchResponseToJson(this);
}

@JsonSerializable()
class HotelResult {
  @JsonKey(name: 'search_Id')
  String searchId;
  int totalHotels;
  int totalRooms;
  int totalNights;
  int totalChildren;
  int totalAdults;
  String checkIn;
  String checkOut;
  List<Hotel> hotels;

  HotelResult({
    this.searchId,
    this.totalHotels,
    this.totalRooms,
    this.totalNights,
    this.totalChildren,
    this.totalAdults,
    this.checkIn,
    this.checkOut,
    this.hotels,
  });

  factory HotelResult.fromJson(Map<String, dynamic> json) => _$HotelResultFromJson(json);
  Map<String, dynamic> toJson() => _$HotelResultToJson(this);
}
