import 'package:json_annotation/json_annotation.dart';
import 'package:ota/models/hotels/search_hotel_request.dart';

import 'responses/options.dart';
part 'hotel_details_request.g.dart';

@JsonSerializable()
class HotelDetailsRequest {
  String searchId;
  String hotelCode;
  String checkInDate;
  String checkOutDate;
  List<Rooms> rooms;
  String currency;
  String clientNationality;
  String tpa;
  String tpaName;
  List<Options> options;

  HotelDetailsRequest(
      {this.searchId,
      this.hotelCode,
      this.checkInDate,
      this.checkOutDate,
      this.rooms,
      this.currency,
      this.clientNationality,
      this.tpa,
      this.tpaName,
      this.options});
  factory HotelDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDetailsRequestToJson(this);
}

@JsonSerializable()
class Children {
  String childAge;

  Children({this.childAge});

  factory Children.fromJson(Map<String, dynamic> json) =>
      _$ChildrenFromJson(json);
  Map<String, dynamic> toJson() => _$ChildrenToJson(this);
}
