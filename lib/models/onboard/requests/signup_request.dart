import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest extends Equatable {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String phoneCode;
  String passwordHash;
  String country;
  String profilePicture;
  String dateOfBirth;
  String street;
  String city;
  String state;
  String zip;
  String address;
  String tenantId;

  SignupRequest(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.phoneCode,
      this.passwordHash,
      this.country,
      this.profilePicture,
      this.dateOfBirth,
      this.street,
      this.city,
      this.state,
      this.zip,
      this.address,
      this.tenantId = "00000000-0000-0000-0000-000000000001"});

  @override
  List<Object> get props => [
        this.firstName,
        this.lastName,
        this.email,
        this.phoneNumber,
        this.passwordHash,
        this.country,
        this.profilePicture,
        this.dateOfBirth,
        this.street,
        this.city,
        this.state,
        this.zip,
        this.address,
        this.tenantId
      ];

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
  factory SignupRequest.fromJson(Map<String, dynamic> json) => _$SignupRequestFromJson(json);
}
