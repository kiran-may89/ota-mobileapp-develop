import 'package:json_annotation/json_annotation.dart';

import 'card.dart';
part 'payment_request.g.dart';
@JsonSerializable()
class PaymentRequest {
  String userId;
  String userType;
  double amount;
  String currency;
  String orderType;
  String mode;
  Card card;

  PaymentRequest({
      this.userId, 
      this.userType, 
      this.amount, 
      this.currency, 
      this.orderType, 
      this.mode, 
      this.card});



  Map<String, dynamic> toJson()=>_$PaymentRequestToJson(this);
  factory PaymentRequest.fromJson(Map<String, dynamic> json)=> _$PaymentRequestFromJson(json);
}



