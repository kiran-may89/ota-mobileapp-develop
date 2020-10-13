import 'package:json_annotation/json_annotation.dart';
part 'no_show_fee.g.dart';

@JsonSerializable()
class NoShowFee {
  NoShowFee({
    this.currency,
    this.amountType,
  });

  String currency;
  dynamic amountType;

  factory NoShowFee.fromJson(Map<String, dynamic> json) => _$NoShowFeeFromJson(json);
  Map<String, dynamic> toJson() => _$NoShowFeeToJson(this);
}
