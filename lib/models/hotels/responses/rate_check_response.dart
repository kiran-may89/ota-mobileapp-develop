import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import "room_option.dart";
part 'rate_check_response.g.dart';

@JsonSerializable()
class RateCheckResponse extends Equatable {
  String version;
  String message;
  bool isError;
  String responseException;
  RoomOption result;

  RateCheckResponse(
      {this.version,
      this.message,
      this.isError,
      this.responseException,
      this.result});
  factory RateCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$RateCheckResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RateCheckResponseToJson(this);

  @override
  List<Object> get props => [
        this.version,
        this.message,
        this.isError,
        this.responseException,
        this.result
      ];
}
