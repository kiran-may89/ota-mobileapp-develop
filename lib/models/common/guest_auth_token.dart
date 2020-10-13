import 'package:equatable/equatable.dart';

class GuestAuthToken extends Equatable {
  final String message;
  final bool isError;
  final String result;

  GuestAuthToken({this.message, this.isError, this.result});

  factory GuestAuthToken.fromJson(Map<String, dynamic> json) {
    return GuestAuthToken(
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
