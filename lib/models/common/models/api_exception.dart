import 'package:equatable/equatable.dart';
import "response_exception.dart";

class ApiException extends Equatable {
  final ResponseException responseException;

  ApiException({this.responseException});

  factory ApiException.fromJson(Map<String, dynamic> json) {
    return ApiException(
      responseException: json['responseException'] != null ? new ResponseException.fromJson(json['responseException']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responseException != null) {
      data['responseException'] = this.responseException.toJson();
    }
    return data;
  }

  @override
  List<Object> get props => [this.responseException];
}
