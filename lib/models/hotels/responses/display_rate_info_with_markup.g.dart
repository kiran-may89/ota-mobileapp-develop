// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_rate_info_with_markup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisplayRateInfoWithMarkup _$DisplayRateInfoWithMarkupFromJson(
    Map<String, dynamic> json) {
  return DisplayRateInfoWithMarkup(
    totalPriceWithMarkup: (json['totalPriceWithMarkup'] as num)?.toDouble(),
    baseRate: (json['baseRate'] as num)?.toDouble(),
    taxAndOtherCharges: (json['taxAndOtherCharges'] as num)?.toDouble(),
    otaTax: (json['otaTax'] as num)?.toDouble(),
    markup: (json['markup'] as num)?.toDouble(),
    supplierBaseRate: (json['supplierBaseRate'] as num)?.toDouble(),
    supplierTotalCost: (json['supplierTotalCost'] as num)?.toDouble(),
    currency: json['currency'] as String,
  );
}

Map<String, dynamic> _$DisplayRateInfoWithMarkupToJson(
        DisplayRateInfoWithMarkup instance) =>
    <String, dynamic>{
      'totalPriceWithMarkup': instance.totalPriceWithMarkup,
      'baseRate': instance.baseRate,
      'taxAndOtherCharges': instance.taxAndOtherCharges,
      'otaTax': instance.otaTax,
      'markup': instance.markup,
      'supplierBaseRate': instance.supplierBaseRate,
      'supplierTotalCost': instance.supplierTotalCost,
      'currency': instance.currency,
    };
