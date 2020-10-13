

import 'package:json_annotation/json_annotation.dart';
import 'package:ota/models/hotels/payments/response/bookings.dart';
import 'package:ota/models/hotels/payments/response/contact.dart';
part 'result.g.dart';

@JsonSerializable()
class Result {

  int id;
  String uid;
  String bookingId;
  String userId;
  String userType;
  String tenantId;
  String correlationId;
  double totalAmount;
  double totalAmountMarkup;
  double markup;
  double otaTax;
  double totalRefundAmount;
  double totalRefundAmountmarkup;
  String paymentMode;
  String paymentTransactionId;
  String ibanNumber;
  String status;
  String visaRequestId;
  String visaLink;
  String preVisaReference;
  bool isDeleted;
  List<Bookings> bookings;
  Contact contact;

  String paymentDetails;
	String visaStatus;

	Result({this.id, this.uid, this.bookingId, this.userId, this.userType, this.tenantId, this.correlationId, this.totalAmount, this.totalAmountMarkup, this.markup, this.otaTax, this.totalRefundAmount, this.totalRefundAmountmarkup, this.paymentMode, this.paymentTransactionId, this.ibanNumber, this.status, this.visaRequestId, this.visaLink, this.preVisaReference, this.isDeleted, this.bookings, this.contact, this.paymentDetails, this.visaStatus});

	Map<String, dynamic> toJson()=>_$ResultToJson(this);
	factory Result.fromJson(Map<String, dynamic> json)=> _$ResultFromJson(json);
}
