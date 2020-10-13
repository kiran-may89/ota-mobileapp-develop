

import 'package:json_annotation/json_annotation.dart';
import 'package:ota/models/hotels/payments/response/travellers.dart';
part 'bookings.g.dart';
@JsonSerializable()
class Bookings {

  int id;
  String uid;
  int bookingId;
  String reservationNumber;
  String alternateTpaBookingId;
  String reservationDate;
  String returnDate;
  String bookingDate;
  String trackToken;
  String logToken;
  String invoicePath;
  String iterinaryPath;
  String markupId;
  String status;
  double totalAmount;
  double totalAmountMarkup;
  double markup;
  double otaTax;
  double tpaAmount;
  int tpaType;
  String tpa;
  int serviceTypeId;
  String serviceType;
  String serviceTypeCode;
  String provider;
	String couponId;
  bool isBookingModified;
  bool isBookingCancelled;
  bool isDeleted;
  List<Travellers> travellers;
  String bookingCancellation;

	Bookings({this.id, this.uid, this.bookingId, this.reservationNumber, this.alternateTpaBookingId, this.reservationDate, this.returnDate, this.bookingDate, this.trackToken, this.logToken, this.invoicePath, this.iterinaryPath, this.markupId, this.status, this.totalAmount, this.totalAmountMarkup, this.markup, this.otaTax, this.tpaAmount, this.tpaType, this.tpa, this.serviceTypeId, this.serviceType, this.serviceTypeCode, this.provider, this.couponId, this.isBookingModified, this.isBookingCancelled, this.isDeleted, this.travellers, this.bookingCancellation});

	Map<String, dynamic> toJson()=>_$BookingsToJson(this);
	factory Bookings.fromJson(Map<String, dynamic> json)=> _$BookingsFromJson(json);
}
