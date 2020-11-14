class ChangePasswordResponse {
ChangePasswordResponse({
this.message,
this.isError,
this.result,
});

String message;
bool isError;
String result;

factory ChangePasswordResponse.fromMap(Map<String, dynamic> json) => ChangePasswordResponse(
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