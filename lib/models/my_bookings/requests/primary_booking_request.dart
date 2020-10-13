import 'dart:convert';

class PrimaryBookingRequest {
  PrimaryBookingRequest({
    this.userId,
    this.tenantId,
    this.type,
  });

  String userId;
  String tenantId;
  int type;

  factory PrimaryBookingRequest.fromJson(String str) => PrimaryBookingRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrimaryBookingRequest.fromMap(Map<String, dynamic> json) => PrimaryBookingRequest(
    userId: json["userId"],
    tenantId: json["tenantId"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "tenantId": tenantId,
    "type": type,
  };
}
