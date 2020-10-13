import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import "net.dart";
part 'price_details.g.dart';

@JsonSerializable()
class PriceDetails extends Equatable {
  final List<Net> net;

  PriceDetails({this.net});

  factory PriceDetails.fromJson(Map<String, dynamic> json) =>
      _$PriceDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PriceDetailsToJson(this);
  @override
  List<Object> get props => [this.net];
}
