class ChangePasswordRequest {
  ChangePasswordRequest({
    this.oldPassword,
    this.password,
    this.confirmPassword,
  });

  String oldPassword;
  String password;
  String confirmPassword;

  factory ChangePasswordRequest.fromMap(
          Map<String, dynamic> json) =>
      ChangePasswordRequest(
        oldPassword: json["oldPassword"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toMap() => {
        "oldPassword": oldPassword,
        "password": password,
        "confirmPassword": confirmPassword,
      };
}
