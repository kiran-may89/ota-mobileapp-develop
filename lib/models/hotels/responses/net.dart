import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'net.g.dart';

@JsonSerializable()
class Net extends Equatable {
  final String name;
  final bool included;
  final String currency;
  final String amountType;
  final double amount;

  Net({this.name, this.included, this.currency, this.amountType, this.amount});

  factory Net.fromJson(Map<String, dynamic> json) => _$NetFromJson(json);
  Map<String, dynamic> toJson() => _$NetToJson(this);

  @override
  List<Object> get props =>
      [this.name, this.included, this.currency, this.amountType, this.amount];
}
