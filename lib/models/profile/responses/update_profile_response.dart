

class UpdateProfileResponse {
  UpdateProfileResponse({
    this.message,
    this.isError,
    this.result,
  });

  String message;
  bool isError;
  String result;

  factory UpdateProfileResponse.fromMap(
          Map<String, dynamic> json) =>
      UpdateProfileResponse(
        message: json["message"],
        isError: json["isError"],
        result: json["result"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "isError": isError,
        "result": result,
      };
}
