

class UpdateProfileRequest {
  UpdateProfileRequest({
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.phoneNumber,
    this.country,
    this.address,
  });

  String firstName;
  String lastName;
  String dateOfBirth;
  String phoneNumber;
  String country;
  String address;

  factory UpdateProfileRequest.fromMap(
          Map<String, dynamic> json) =>
      UpdateProfileRequest(
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"],
        phoneNumber: json["phoneNumber"],
        country: json["country"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
        "phoneNumber": phoneNumber,
        "country": country,
        "address": address,
      };
}
