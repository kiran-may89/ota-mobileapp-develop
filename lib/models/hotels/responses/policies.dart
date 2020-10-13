import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'policies.g.dart';

@JsonSerializable()
class Policies extends Equatable {
  final String from;
  final String amountType;
  final double amountValue;
  final double amountValueWithMarkup;
  final double percent;
  final String currency;
  final int nights;
  final String allowedCancellation;

  Policies(
      {this.from, this.amountType, this.amountValue, this.amountValueWithMarkup, this.percent, this.currency, this.nights, this.allowedCancellation});

  factory Policies.fromJson(Map<String, dynamic> json) => _$PoliciesFromJson(json);
  Map<String, dynamic> toJson() => _$PoliciesToJson(this);

  @override
  List<Object> get props =>
      [this.from, this.amountType, this.amountValue, this.amountValueWithMarkup, this.percent, this.currency, this.nights, this.allowedCancellation];
}
