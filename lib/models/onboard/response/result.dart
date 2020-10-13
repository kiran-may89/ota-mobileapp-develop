import 'package:equatable/equatable.dart';

class Result extends Equatable  {
	final String lockoutEnd;
	final bool twoFactorEnabled;
	final bool phoneNumberConfirmed;
	final String phoneNumber;
	final bool emailConfirmed;
	final String email;
	final String id;
	final bool lockoutEnabled;
	final int accessFailedCount;
	final String firstName;
	final String lastName;
	final String dateOfBirth;
	final String profilePicture;
	final String country;
	final String address;
	final String tenantId;
	final String roleId;

	Result({this.lockoutEnd, this.twoFactorEnabled, this.phoneNumberConfirmed, this.phoneNumber, this.emailConfirmed, this.email, this.id, this.lockoutEnabled, this.accessFailedCount, this.firstName, this.lastName, this.dateOfBirth, this.profilePicture, this.country, this.address, this.tenantId, this.roleId});

	factory Result.fromJson(Map<String, dynamic> json) {
		return Result(
			lockoutEnd: json['lockoutEnd'],
			twoFactorEnabled: json['twoFactorEnabled'],
			phoneNumberConfirmed: json['phoneNumberConfirmed'],
			phoneNumber: json['phoneNumber'],
			emailConfirmed: json['emailConfirmed'],
			email: json['email'],
			id: json['id'],
			lockoutEnabled: json['lockoutEnabled'],
			accessFailedCount: json['accessFailedCount'],
			firstName: json['firstName'],
			lastName: json['lastName'],
			dateOfBirth: json['dateOfBirth'],
			profilePicture: json['profilePicture'],
			country: json['country'],
			address: json['address'],
			tenantId: json['tenantId'],
			roleId: json['roleId'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['lockoutEnd'] = this.lockoutEnd;
		data['twoFactorEnabled'] = this.twoFactorEnabled;
		data['phoneNumberConfirmed'] = this.phoneNumberConfirmed;
		data['phoneNumber'] = this.phoneNumber;
		data['emailConfirmed'] = this.emailConfirmed;
		data['email'] = this.email;
		data['id'] = this.id;
		data['lockoutEnabled'] = this.lockoutEnabled;
		data['accessFailedCount'] = this.accessFailedCount;
		data['firstName'] = this.firstName;
		data['lastName'] = this.lastName;
		data['dateOfBirth'] = this.dateOfBirth;
		data['profilePicture'] = this.profilePicture;
		data['country'] = this.country;
		data['address'] = this.address;
		data['tenantId'] = this.tenantId;
		data['roleId'] = this.roleId;
		return data;
	}

	@override
	List<Object> get props => [
		this.lockoutEnd,
		this.twoFactorEnabled,
		this.phoneNumberConfirmed,
		this.phoneNumber,
		this.emailConfirmed,
		this.email,
		this.id,
		this.lockoutEnabled,
		this.accessFailedCount,
		this.firstName,
		this.lastName,
		this.dateOfBirth,
		this.profilePicture,
		this.country,
		this.address,
		this.tenantId,
		this.roleId
	];
}
