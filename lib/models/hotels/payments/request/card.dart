
import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class Card {
  Expiry expiry;
  String number;
  String securityCode;

  Card({
    this.expiry,
    this.number,
    this.securityCode});


  Map<String, dynamic> toJson()=>_$CardToJson(this);
  factory Card.fromJson(Map<String, dynamic> json)=> _$CardFromJson(json);
  bool isCardValidated(){
    return (number != null && number.isNotEmpty && securityCode!= null && securityCode.isNotEmpty && expiry != null && expiry.month != null
        && expiry.month.isNotEmpty && expiry.year != null && expiry.year.isNotEmpty);
  }

}
@JsonSerializable()
class Expiry {
  String month;
  String year;

  Expiry({
    this.month,
    this.year});

  Map<String, dynamic> toJson()=>_$ExpiryToJson(this);
  factory Expiry.fromJson(Map<String, dynamic> json)=> _$ExpiryFromJson(json);

}