import 'package:equatable/equatable.dart';

class User extends Equatable  {
	final int nbf;
	final int exp;
	final String iss;
	final List<String> aud;
	final String clientId;
	final String sub;
	final int authTime;
	final String idp;
	final String name;
	final String firstName;
	final String lastName;
	final String phoneNumber;
	final String email;
	final String tenantId;
	final String userType;
	final String role;
	final List<String> scope;
	final List<String> amr;

	User({this.nbf, this.exp, this.iss, this.aud, this.clientId, this.sub, this.authTime, this.idp, this.name, this.firstName, this.lastName, this.phoneNumber, this.email, this.tenantId, this.userType, this.role, this.scope, this.amr});

	factory User.fromJson(Map<String, dynamic> json) {
		return User(
			nbf: json['nbf'],
			exp: json['exp'],
			iss: json['iss'],
			aud: json['aud'].cast<String>(),
			clientId: json['client_id'],
			sub: json['sub'],
			authTime: json['auth_time'],
			idp: json['idp'],
			name: json['name'],
			firstName: json['FirstName'],
			lastName: json['LastName'],
			phoneNumber: json['PhoneNumber'],
			email: json['Email'],
			tenantId: json['TenantId'],
			userType: json['UserType'],
			role: json['role'],
			scope: json['scope'].cast<String>(),
			amr: json['amr'].cast<String>(),
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['nbf'] = this.nbf;
		data['exp'] = this.exp;
		data['iss'] = this.iss;
		data['aud'] = this.aud;
		data['client_id'] = this.clientId;
		data['sub'] = this.sub;
		data['auth_time'] = this.authTime;
		data['idp'] = this.idp;
		data['name'] = this.name;
		data['FirstName'] = this.firstName;
		data['LastName'] = this.lastName;
		data['PhoneNumber'] = this.phoneNumber;
		data['Email'] = this.email;
		data['TenantId'] = this.tenantId;
		data['UserType'] = this.userType;
		data['role'] = this.role;
		data['scope'] = this.scope;
		data['amr'] = this.amr;
		return data;
	}

	@override
	List<Object> get props => [
		this.nbf,
		this.exp,
		this.iss,
		this.aud,
		this.clientId,
		this.sub,
		this.authTime,
		this.idp,
		this.name,
		this.firstName,
		this.lastName,
		this.phoneNumber,
		this.email,
		this.tenantId,
		this.userType,
		this.role,
		this.scope,
		this.amr
	];
}
