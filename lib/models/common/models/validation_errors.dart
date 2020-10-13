import 'package:equatable/equatable.dart';

class ValidationErrors extends Equatable  {
	final String field;
	final String message;

	ValidationErrors({this.field, this.message});

	factory ValidationErrors.fromJson(Map<String, dynamic> json) {
		return ValidationErrors(
			field: json['field'],
			message: json['message'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['field'] = this.field;
		data['message'] = this.message;
		return data;
	}

	@override
	List<Object> get props => [
		this.field,
		this.message
	];
}
