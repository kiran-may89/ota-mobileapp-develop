import 'package:json_annotation/json_annotation.dart';
part 'place.g.dart';

@JsonSerializable()
class Place {
  Result result;
  String status;

  Place({this.result, this.status});

  Map<String, dynamic> toJson()=>_$PlaceToJson(this);
  factory Place.fromJson(Map<String, dynamic> json)=> _$PlaceFromJson(json);
}

@JsonSerializable()
class Result {
  Geometry geometry;

  Result({this.geometry});
  Map<String, dynamic> toJson()=>_$ResultToJson(this);
  factory Result.fromJson(Map<String, dynamic> json)=> _$ResultFromJson(json);
}

@JsonSerializable()
class Geometry {
  Location location;
  Viewport viewport;

  Geometry({this.location, this.viewport});
  Map<String, dynamic> toJson()=>_$GeometryToJson(this);
  factory Geometry.fromJson(Map<String, dynamic> json)=> _$GeometryFromJson(json);
}

@JsonSerializable()
class Viewport {
  Northeast northeast;
  Southwest southwest;

  Viewport({this.northeast, this.southwest});
  Map<String, dynamic> toJson()=>_$ViewportToJson(this);
  factory Viewport.fromJson(Map<String, dynamic> json)=> _$ViewportFromJson(json);
}

@JsonSerializable()
class Southwest {
  double lat;
  double lng;

  Southwest({this.lat, this.lng});
  Map<String, dynamic> toJson()=>_$SouthwestToJson(this);
  factory Southwest.fromJson(Map<String, dynamic> json)=> _$SouthwestFromJson(json);
}

@JsonSerializable()
class Northeast {
  double lat;
  double lng;

  Northeast({this.lat, this.lng});

  Map<String, dynamic> toJson()=>_$NortheastToJson(this);
  factory Northeast.fromJson(Map<String, dynamic> json)=> _$NortheastFromJson(json);
}

@JsonSerializable()
class Location {
  double lat;
  double lng;

  Location({this.lat, this.lng});

  Map<String, dynamic> toJson()=>_$LocationToJson(this);
  factory Location.fromJson(Map<String, dynamic> json)=> _$LocationFromJson(json);
}
