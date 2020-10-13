import 'package:equatable/equatable.dart';

class SendOtpRequest extends Equatable {
  final String mobileNumber;
  final String context;
  final String subContext;
  final String contextId;
  final bool isArabic;
  final String placeHolders;

  SendOtpRequest(
      {this.mobileNumber, this.context = "registration", this.subContext = "send otp", this.contextId, this.isArabic = false, this.placeHolders});

  factory SendOtpRequest.fromJson(Map<String, dynamic> json) {
    return SendOtpRequest(
      mobileNumber: json['mobileNumber'],
      context: json['context'],
      subContext: json['subContext'],
      contextId: json['contextId'],
      isArabic: json['isArabic'],
      placeHolders: json['placeHolders'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNumber;
    data['context'] = this.context;
    data['subContext'] = this.subContext;
    data['contextId'] = this.contextId;
    data['isArabic'] = this.isArabic;
    data['placeHolders'] = this.placeHolders;
    return data;
  }

  @override
  List<Object> get props => [this.mobileNumber, this.context, this.subContext, this.contextId, this.isArabic, this.placeHolders];
}
