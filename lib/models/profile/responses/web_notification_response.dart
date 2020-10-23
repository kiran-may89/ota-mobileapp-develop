class WebNotificationResponse {
  WebNotificationResponse({
    this.message,
    this.isError,
    this.result,
  });

  String message;
  bool isError;
  List<Result> result;

  factory WebNotificationResponse.fromMap(
          Map<String, dynamic> json) =>
      WebNotificationResponse(
        message: json["message"],
        isError: json["isError"],
        result: List<Result>.from(json["result"]
            .map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "isError": isError,
        "result": List<dynamic>.from(
            result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    this.id,
    this.uid,
    this.message,
    this.type,
    this.typeValue,
    this.isRead,
    this.isDeleted,
    this.createdDate,
  });

  int id;
  String uid;
  String message;
  int type;
  String typeValue;
  bool isRead;
  bool isDeleted;
  String createdDate;

  factory Result.fromMap(
          Map<String, dynamic> json) =>
      Result(
        id: json["id"],
        uid: json["uid"],
        message: json["message"],
        type: json["type"],
        typeValue: json["typeValue"],
        isRead: json["isRead"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uid": uid,
        "message": message,
        "type": type,
        "typeValue": typeValue,
        "isRead": isRead,
        "isDeleted": isDeleted,
        "createdDate": createdDate,
      };
}
