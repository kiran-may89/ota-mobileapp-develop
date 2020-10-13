import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ota/models/hotels/responses/rooms.dart';
import "geolocation.dart";
import "room_option.dart";
import "options.dart";
part 'hotel.g.dart';

@JsonSerializable()
class Hotel extends Equatable {
  final String name;
  final String hotelCode;
  final Geolocation geolocation;
  final double starRating;
  final String address;
  final String description;
  final String cityCode;
  final List<String> images;
  final List<String> facilities;
  final List<RoomOption> roomOption;
  final String phoneNumber;
  final List<String> countryFacilities;

  final bool isRoomSpecific;
  final double minRate;

  final List<Rooms> rooms;
  final int tpa;
  final String tpaName;
  final List<Options> options;

  Hotel(
      {this.name,
      this.hotelCode,
      this.geolocation,
      this.starRating,
      this.address,
      this.description,
      this.cityCode,
      this.images,
      this.facilities,
      this.roomOption,
      this.phoneNumber,
      this.countryFacilities,

      this.isRoomSpecific,
      this.minRate,

      this.rooms,
      this.tpa,
      this.tpaName,
      this.options});
  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
  @override
  List<Object> get props => [
        this.name,
        this.hotelCode,
        this.geolocation,
        this.starRating,
        this.address,
        this.description,
        this.cityCode,
        this.images,
        this.facilities,
        this.roomOption,
        this.phoneNumber,
        this.countryFacilities,

        this.isRoomSpecific,
        this.minRate,

        this.rooms,
        this.tpa,
        this.tpaName,
        this.options
      ];
}
