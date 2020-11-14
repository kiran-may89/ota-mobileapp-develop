import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ota/utils/strings.dart';

import 'common/models/api_exception.dart';

class BaseModel extends Equatable {
  String version;
  String message;
  bool isError;
  int _errorCode;
  String _errorMessage = "";

  BaseModel({this.version, this.message, this.isError});

  factory BaseModel.fromJson(Map<String, dynamic> json) {

    return BaseModel(version: json['version'], message: json['message'], isError: json['isError']);

  }

  setException({DioError error}) {
    isError = true;
    _handleError(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        _errorMessage = strings.request_error_cancel;
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        _errorMessage = strings.request_error_time_out;
        break;
      case DioErrorType.DEFAULT:
        _errorMessage = strings.request_error_defalut;
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        _errorMessage = strings.request_error_receive_time_out;
        break;
      case DioErrorType.RESPONSE:
        _errorMessage = "${strings.request_error_invalid_status_code} ${error.response.statusCode}";
        break;
      case DioErrorType.SEND_TIMEOUT:
        _errorMessage = strings.request_error_receive_time_out_send;
        break;
    }
    return _errorMessage;
  }

  @override
  List<Object> get props => [];
}
