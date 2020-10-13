import 'package:json_annotation/json_annotation.dart';

import 'hotel_traveller_details.dart';
import 'payment_request.dart';

part 'hotel_payment_model.g.dart';

@JsonSerializable()
class HotelPaymentModel {
  String userId;
  String tenantId;
  String userType;
  String correlationId;
  String reservationRequest;
  PaymentRequest paymentRequest;
  List<HotelTravellerDetails> travellerDetails;
  String ibanNumber;
  int paymentMode;
  int tpaType;
  int serviceId;
  String serviceTypeCode;
  String provider;
  double baseRate;
  double taxAndOtherCharges;
  double supplierBaseRate;
  double OTATax;
  double Markup;
  double totalAmount;
  double totalAmountMarkup;
  bool supportCancellation;
  String returnDate;
  String reservationDate;
  String summaryInfo;

  HotelPaymentModel(
      {this.userId = "e864dc35-3093-4a84-92c6-ac3e70d600ec", // need to change
      this.tenantId = "00000000-0000-0000-0000-000000000001", // need to change
      this.userType = "bc", // need to change
      this.correlationId = "56f2b107-ec46-4dbc-9864-47f99d47e721", // need to change
      this.reservationRequest,
      this.summaryInfo,
      this.paymentRequest,
      this.travellerDetails,
      this.ibanNumber,
      this.paymentMode = 1, // change later
      this.tpaType,
      this.serviceId = 0, //change later
      this.serviceTypeCode,
      this.provider,
      this.baseRate,
      this.taxAndOtherCharges,
      this.supplierBaseRate,
      this.OTATax,
      this.Markup,
      this.totalAmount,
      this.totalAmountMarkup,
      this.returnDate,
      this.reservationDate,
      this.supportCancellation = false});

  Map<String, dynamic> toJson() => _$HotelPaymentModelToJson(this);
  factory HotelPaymentModel.fromJson(Map<String, dynamic> json) => _$HotelPaymentModelFromJson(json);
}
