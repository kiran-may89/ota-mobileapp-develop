import 'package:equatable/equatable.dart';
import "validation_errors.dart";

class ResponseException extends Equatable {
  final String exceptionMessage;
  final List<dynamic> validationErrors;

  ResponseException({this.exceptionMessage, this.validationErrors});

  factory ResponseException.fromJson(Map<String, dynamic> json) {
    return ResponseException(
      exceptionMessage: json['exceptionMessage'],
      validationErrors: json['validationErrors'] != null ? json['validationErrors'].map((v) => new ValidationErrors.fromJson(v)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exceptionMessage'] = this.exceptionMessage;
    if (this.validationErrors != null) {
      data['validationErrors'] = this.validationErrors.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object> get props => [this.exceptionMessage, this.validationErrors];
}
