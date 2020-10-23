import 'dart:convert';

class BookingCancelRequest {
  BookingCancelRequest({
    this.reservationNumber,
  });

  String reservationNumber;

  factory BookingCancelRequest.fromJson(String str) => BookingCancelRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingCancelRequest.fromMap(Map<String, dynamic> json) => BookingCancelRequest(
    reservationNumber: json["reservationNumber"] == null ? null : json["reservationNumber"],
  );

  Map<String, dynamic> toMap() => {
    "reservationNumber": reservationNumber == null ? null : reservationNumber,
  };
}
