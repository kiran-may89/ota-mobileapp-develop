import 'package:equatable/equatable.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/common/models/api_exception.dart';

class SendOtpResponse extends BaseModel {
  final String message;
  final bool isError;
  final String result;
  ApiException apiException;

  SendOtpResponse({this.message, this.isError, this.result}) : super(message: message, isError: isError);

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) {
    return SendOtpResponse(
      message: json['message'],
      isError: json['isError'],
      result: json['result'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['isError'] = this.isError;
    data['result'] = this.result;
    return data;
  }

  @override
  List<Object> get props => [this.message, this.isError, this.result];
}
