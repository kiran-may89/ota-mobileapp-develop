import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'rooms.g.dart';

@JsonSerializable()
class Rooms extends Equatable {
  final String roomId;
  final int noOfRooms;
  final int noOfChildren;
  final int noOfAdults;
  final String roomName;
  final double roomPrice;


  Rooms(
      {this.roomId,
      this.noOfRooms,
      this.noOfChildren,
      this.noOfAdults,
      this.roomName,
      this.roomPrice,
      });

  factory Rooms.fromJson(Map<String, dynamic> json) => _$RoomsFromJson(json);
  Map<String, dynamic> toJson() => _$RoomsToJson(this);

  @override
  List<Object> get props => [
        this.roomId,
        this.noOfRooms,
        this.noOfChildren,
        this.noOfAdults,
        this.roomName,
        this.roomPrice,

      ];
}
