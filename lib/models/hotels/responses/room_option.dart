import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'net.dart';
import "rooms.dart";
import "display_rate_info_with_markup.dart";
import "cancellation_policy.dart";
import "options.dart";
import "rate_comments.dart";
import "price_details.dart";
import "price_details_with_markup.dart";
part 'room_option.g.dart';

@JsonSerializable()
class RoomOption extends Equatable {
  final String groupOptionId;
  final bool supportsCancellation;
  final bool supportsAmendment;
  final List<Rooms> rooms;
  final String roomRateType;
  final RateComments rateComments;
  final double totalPrice;
  final DisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  final double discountApplied;
  final String dealName;
  final bool hasPromotions;

  final List<String> paymentType;
  final List<String> otherInclusions;
  final bool nonRefundable;
  final String includesWifi;
  final bool includesBoarding;
  final List<String> boardingDetails;
  final String creditDeduction;
  final PriceDetails priceDetails;
  final PriceDetailsWithMarkup priceDetailsWithMarkup;
  final CancellationPolicy cancellationPolicy;
  final bool panRequired;
  final int tpa;
  final String tpaName;
  final List<Options> options;

  RoomOption(
      {this.groupOptionId,
      this.supportsCancellation,
      this.supportsAmendment,
      this.rooms,
      this.roomRateType,
      this.rateComments,
      this.totalPrice,
      this.displayRateInfoWithMarkup,
      this.discountApplied,
      this.dealName,
      this.hasPromotions,
      this.paymentType,
      this.otherInclusions,
      this.nonRefundable,
      this.includesWifi,
      this.includesBoarding,
      this.boardingDetails,
      this.creditDeduction,
      this.priceDetails,
      this.priceDetailsWithMarkup,
      this.cancellationPolicy,
      this.panRequired,
      this.tpa,
      this.tpaName,
      this.options});

  factory RoomOption.fromJson(Map<String, dynamic> json) => _$RoomOptionFromJson(json);
  Map<String, dynamic> toJson() => _$RoomOptionToJson(this);
  @override
  List<Object> get props => [
        this.groupOptionId,
        this.supportsCancellation,
        this.supportsAmendment,
        this.rooms,
        this.roomRateType,
        this.rateComments,
        this.totalPrice,
        this.displayRateInfoWithMarkup,
        this.discountApplied,
        this.dealName,
        this.hasPromotions,
        this.paymentType,
        this.otherInclusions,
        this.nonRefundable,
        this.includesWifi,
        this.includesBoarding,
        this.boardingDetails,
        this.creditDeduction,
        this.priceDetails,
        this.priceDetailsWithMarkup,
        this.cancellationPolicy,
        this.panRequired,
        this.tpa,
        this.tpaName,
        this.options
      ];
}
