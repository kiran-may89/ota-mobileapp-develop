import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'display_rate_info_with_markup.g.dart';

@JsonSerializable()
class DisplayRateInfoWithMarkup extends Equatable {
  final double totalPriceWithMarkup;
  final double baseRate;
  final double taxAndOtherCharges;
  final double otaTax;
  final double markup;
  final double supplierBaseRate;
  final double supplierTotalCost;
  final String currency;

  DisplayRateInfoWithMarkup(
      {this.totalPriceWithMarkup,
      this.baseRate,
      this.taxAndOtherCharges,
      this.otaTax,
      this.markup,
      this.supplierBaseRate,
      this.supplierTotalCost,
      this.currency});

  factory DisplayRateInfoWithMarkup.fromJson(Map<String, dynamic> json) =>
      _$DisplayRateInfoWithMarkupFromJson(json);
  Map<String, dynamic> toJson() => _$DisplayRateInfoWithMarkupToJson(this);

  @override
  List<Object> get props => [
        this.totalPriceWithMarkup,
        this.baseRate,
        this.taxAndOtherCharges,
        this.otaTax,
        this.markup,
        this.supplierBaseRate,
        this.supplierTotalCost,
        this.currency
      ];
}
