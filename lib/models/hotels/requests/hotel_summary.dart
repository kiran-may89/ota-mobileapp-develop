import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part "hotel_summary.g.dart";

@JsonSerializable()
class HotelSummary extends Equatable {
  final String serviceType;
  final String checkInDate;
  final String checkOutDate;
  final String name;
  final String address;
  final String selcectRooms;
  final String image;
  final String checkInTime;
  final String checkOutTime;
  final String provider;

  HotelSummary(
      {this.serviceType,
      this.checkInDate,
      this.checkOutDate,
      this.name,
      this.address,
      this.selcectRooms,
      this.image,
      this.checkInTime,
      this.checkOutTime,
      this.provider});

  Map<String, dynamic> toJson() => _$HotelSummaryToJson(this);
  factory HotelSummary.fromJson(Map<String, dynamic> json) => _$HotelSummaryFromJson(json);
  @override
  List<Object> get props => [
        this.serviceType,
        this.checkInDate,
        this.checkOutDate,
        this.name,
        this.address,
        this.selcectRooms,
        this.image,
        this.checkInTime,
        this.checkOutTime,
        this.provider
      ];
}
