import 'package:json_annotation/json_annotation.dart';
import 'package:ota/models/hotels/responses/options.dart';

part 'reservation_request.g.dart';

@JsonSerializable()
class ReservationRequest {
  String searchId;
  String hotelCode;
  dynamic cityCode;
  String groupOptionId;
  String referenceorName;
  RoomGrp roomGrp;
  LeadPassenger leadPassenger;
  String checkInDate;
  String checkOutDate;
  String paymentMode;
  int tpa;
  String tpaName;
  List<Options> options;

  ReservationRequest(
      {this.searchId,
      this.hotelCode,
      this.cityCode,
      this.groupOptionId,
      this.referenceorName,
      this.roomGrp,
      this.leadPassenger,
      this.checkInDate,
      this.checkOutDate,
      this.paymentMode = "AT_WEB",
      this.tpa,
      this.tpaName,
      this.options});

  Map<String, dynamic> toJson() => _$ReservationRequestToJson(this);
  factory ReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$ReservationRequestFromJson(json);
}

@JsonSerializable()
class LeadPassenger {
  String title;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String clientNationality;

  LeadPassenger(
      {this.title,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.clientNationality});

  Map<String, dynamic> toJson() => _$LeadPassengerToJson(this);
  factory LeadPassenger.fromJson(Map<String, dynamic> json) =>
      _$LeadPassengerFromJson(json);
}

@JsonSerializable()
class RoomGrp {
  List<Rooms> rooms;
  int tpa;
  String tpaName;
  List<Options> options;

  RoomGrp({this.rooms, this.tpa, this.tpaName, this.options});

  Map<String, dynamic> toJson() => _$RoomGrpToJson(this);
  factory RoomGrp.fromJson(Map<String, dynamic> json) =>
      _$RoomGrpFromJson(json);
}

@JsonSerializable()
class Rooms {
  String groupRoomId;
  List<Adults> adults;
  List<Childs> childs;
  int tpa;
  String tpaName;
  List<Options> options;

  Rooms(
      {this.groupRoomId,
      this.adults,
      this.childs,
      this.tpa,
      this.tpaName,
      this.options});

  Map<String, dynamic> toJson() => _$RoomsToJson(this);
  factory Rooms.fromJson(Map<String, dynamic> json) => _$RoomsFromJson(json);
}

@JsonSerializable()
class Childs {
  String title;
  String firstName;
  String lastName;
  String age;

  Childs({this.title, this.firstName, this.lastName, this.age});
  Map<String, dynamic> toJson() => _$ChildsToJson(this);
  factory Childs.fromJson(Map<String, dynamic> json) => _$ChildsFromJson(json);
}

@JsonSerializable()
class Adults {
  String title;
  String firstName;
  String lastName;

  Adults({this.title, this.firstName, this.lastName});

  Map<String, dynamic> toJson() => _$AdultsToJson(this);
  factory Adults.fromJson(Map<String, dynamic> json) => _$AdultsFromJson(json);
}
