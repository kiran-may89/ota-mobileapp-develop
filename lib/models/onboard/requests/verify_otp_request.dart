import 'package:equatable/equatable.dart';

class VerifyOtpRequest extends Equatable {
  final String otp;
  final String referenceId;

  VerifyOtpRequest({this.otp, this.referenceId});

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    return VerifyOtpRequest(
      otp: json['otp'],
      referenceId: json['referenceId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['referenceId'] = this.referenceId;
    return data;
  }

  @override
  List<Object> get props => [this.otp, this.referenceId];
}
