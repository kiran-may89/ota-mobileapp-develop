import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import "net.dart";
part 'price_details_with_markup.g.dart';

@JsonSerializable()
class PriceDetailsWithMarkup extends Equatable {
  final List<Net> net;

  PriceDetailsWithMarkup({this.net});

  factory PriceDetailsWithMarkup.fromJson(Map<String, dynamic> json) =>
      _$PriceDetailsWithMarkupFromJson(json);
  Map<String, dynamic> toJson() => _$PriceDetailsWithMarkupToJson(this);

  @override
  List<Object> get props => [this.net];
}
