import 'package:equatable/equatable.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/common/models/api_exception.dart';
import "result.dart";

class SignupResponse extends BaseModel {
  final String message;
  final bool isError;
  final Result result;
  ApiException apiException;
  SignupResponse({this.message, this.isError, this.result}) : super(message: message, isError: isError);

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
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
