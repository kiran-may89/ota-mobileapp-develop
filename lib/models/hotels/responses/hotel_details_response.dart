import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'hotel_details_response.result.dart';
part 'hotel_details_response.g.dart';

@JsonSerializable()
class HotelDetailsResponse extends Equatable {
  String version;
  String message;
  bool isError;
  String responseException;
  HotelDetailsResponseResult result;

  HotelDetailsResponse({this.version, this.message, this.isError, this.responseException, this.result});

  factory HotelDetailsResponse.fromJson(Map<String, dynamic> json) => _$HotelDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDetailsResponseToJson(this);

  @override
  List<Object> get props => [this.version, this.message, this.isError, this.responseException, this.result];
}
