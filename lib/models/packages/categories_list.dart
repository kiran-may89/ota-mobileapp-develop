class CategoriesList {
  CategoriesList({
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
  List<Result> result;

  factory CategoriesList.fromMap(
          Map<String, dynamic> json) =>
      CategoriesList(
        version: json["version"],
        message: json["message"],
        isError: json["isError"],
        responseException:
            json["responseException"],
        result: List<Result>.from(json["result"]
            .map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "version": version,
        "message": message,
        "isError": isError,
        "responseException": responseException,
        "result": List<dynamic>.from(
            result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    this.entityId,
    this.name,
    this.shortName,
    this.description,
    this.isDeleted,
    this.id,
    this.uid,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.createdAtUtc,
    this.updatedAtUtc,
  });

  int entityId;
  String name;
  String shortName;
  String description;
  dynamic isDeleted;
  int id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String createdAtUtc;
  String updatedAtUtc;

  factory Result.fromMap(
          Map<String, dynamic> json) =>
      Result(
        entityId: json["entity_id"],
        name: json["name"],
        shortName: json["short_name"],
        description: json["description"],
        isDeleted: json["is_deleted"],
        id: json["id"],
        uid: json["uid"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        updatedBy: json["updatedBy"],
        updatedDate: json["updatedDate"],
        createdAtUtc: json["createdAtUTC"],
        updatedAtUtc: json["updatedAtUTC"],
      );

  Map<String, dynamic> toMap() => {
        "entity_id": entityId,
        "name": name,
        "short_name": shortName,
        "description": description,
        "is_deleted": isDeleted,
        "id": id,
        "uid": uid,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "updatedBy": updatedBy,
        "updatedDate": updatedDate,
        "createdAtUTC": createdAtUtc,
        "updatedAtUTC": updatedAtUtc,
      };
}
