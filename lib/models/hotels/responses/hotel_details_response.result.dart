import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'hotel.dart';
part 'hotel_details_response.result.g.dart';

@JsonSerializable()
class HotelDetailsResponseResult extends Equatable {
  String searchId;
  String checkIn;
  String checkOut;
  Hotel hotel;

  HotelDetailsResponseResult(
      {this.searchId, this.checkIn, this.checkOut, this.hotel});

  factory HotelDetailsResponseResult.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailsResponseResultFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDetailsResponseResultToJson(this);

  @override
  List<Object> get props =>
      [this.searchId, this.checkIn, this.checkOut, this.hotel];
}
