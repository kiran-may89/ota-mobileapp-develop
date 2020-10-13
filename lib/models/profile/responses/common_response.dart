

class CommonResponse {
CommonResponse({
this.version,
this.message,
this.isError,
this.responseException,
this.result,
});

dynamic version;
String message;
bool isError;
dynamic responseException;
bool result;

factory CommonResponse.fromMap(Map<String, dynamic> json) => CommonResponse(
version: json["version"],
message: json["message"],
isError: json["isError"],
responseException: json["responseException"],
result: json["result"],
);

Map<String, dynamic> toMap() => {
"version": version,
"message": message,
"isError": isError,
"responseException": responseException,
"result": result,
};
}