import 'package:json_annotation/json_annotation.dart';

part 'search_hotel_request.g.dart';

@JsonSerializable()
class SearchHotelRequest {
  String tenantId;
  List<String> cityIds;
  String checkInDate;
  String checkOutDate;
  String clientNationality;

  List<Rooms> rooms;
  List<RoomPaxes> roomPaxes;

  @JsonKey(ignore: true)
  String city;
  bool isCity;

  SearchHotelRequest(
      {this.tenantId = "00000000-0000-0000-0000-000000000001",
      this.cityIds,
      this.checkInDate,
      this.checkOutDate,
      this.clientNationality = "SA",
      this.roomPaxes,
      this.isCity,
      this.rooms});



  factory SearchHotelRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchHotelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHotelRequestToJson(this);
}

@JsonSerializable()
class Rooms {
  int adultCnt;
  List<Children> children;

  Rooms({this.adultCnt, this.children});

  factory Rooms.fromJson(Map<String, dynamic> json) => _$RoomsFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsToJson(this);
}

@JsonSerializable()
class Children {
  int childAge;

  Children({this.childAge});

  factory Children.fromJson(Map<String, dynamic> json) =>
      _$ChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);
}

@JsonSerializable()
class RoomPaxes {
  int adultCnt;
  List<Children> children;
  int rooms = 1;

  RoomPaxes({this.adultCnt, this.children, this.rooms = 1});

  factory RoomPaxes.fromJson(Map<String, dynamic> json) =>
      _$RoomPaxesFromJson(json);

  Map<String, dynamic> toJson() => _$RoomPaxesToJson(this);
}
