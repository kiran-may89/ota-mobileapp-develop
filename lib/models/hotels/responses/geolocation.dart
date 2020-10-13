import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part "geolocation.g.dart";

@JsonSerializable()
class Geolocation extends Equatable {
  final double longitude;
  final double latitude;

  Geolocation({this.longitude, this.latitude});

  factory Geolocation.fromJson(Map<String, dynamic> json) =>
      _$GeolocationFromJson(json);
  Map<String, dynamic> toJson() => _$GeolocationToJson(this);

  @override
  List<Object> get props => [this.longitude, this.latitude];
}
