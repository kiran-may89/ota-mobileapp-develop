class AddFamilyMembersRequest {
  AddFamilyMembersRequest({
    this.userid,
    this.firstName,
    this.lastName,
    this.dob,
    this.gender,
    this.nationality,
    this.phoneNumber,
    this.phoneCountryCode,
    this.passportNumber,
    this.passportExpiry,
    this.email,
    this.countryCode,
    this.relation,
    this.country,
    this.location,
  });

  String userid;
  String firstName;
  String lastName;
  String dob;
  int gender;
  int nationality;
  String phoneNumber;
  String phoneCountryCode;
  String passportNumber;
  String passportExpiry;
  String email;
  String countryCode;
  String relation;
  String country;
  String location;

  factory AddFamilyMembersRequest.fromMap(
          Map<String, dynamic> json) =>
      AddFamilyMembersRequest(
        userid: json["userid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        dob: json["dob"],
        gender: json["gender"],
        nationality: json["nationality"],
        phoneNumber: json["phoneNumber"],
        phoneCountryCode:
            json["phoneCountryCode"],
        passportNumber: json["passportNumber"],
        passportExpiry: json["passportExpiry"],
        email: json["email"],
        countryCode: json["countryCode"],
        relation: json["relation"],
        country: json["country"],
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
        "userid": userid,
        "firstName": firstName,
        "lastName": lastName,
        "dob": dob,
        "gender": gender,
        "nationality": nationality,
        "phoneNumber": phoneNumber,
        "phoneCountryCode": phoneCountryCode,
        "passportNumber": passportNumber,
        "passportExpiry": passportExpiry,
        "email": email,
        "countryCode": countryCode,
        "relation": relation,
        "country": country,
        "location": location,
      };
}
