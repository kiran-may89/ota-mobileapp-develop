import 'package:equatable/equatable.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/common/models/api_exception.dart';

class OtpVerifyResponse extends BaseModel {
  final String message;
  final bool isError;
  final Result result;
  ApiException apiException;

  OtpVerifyResponse({this.message, this.isError, this.result}) : super(message: message, isError: isError);

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
    return OtpVerifyResponse(
      message: json['message'],
      isError: json['isError'],
      result: json['result'] != null ? new Result.fromJson(json['result']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['isError'] = this.isError;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }

  @override
  List<Object> get props => [this.message, this.isError, this.result];
}

class Result extends Equatable {
  final bool isValid;
  final bool isError;

  Result({this.isValid, this.isError});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      isValid: json['isValid'],
      isError: json['isError'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isValid'] = this.isValid;
    data['isError'] = this.isError;
    return data;
  }

  @override
  List<Object> get props => [this.isValid, this.isError];
}
