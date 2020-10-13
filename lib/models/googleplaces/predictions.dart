import 'package:json_annotation/json_annotation.dart';
part 'predictions.g.dart';

@JsonSerializable()
class Predictions {
  List<Prediction> predictions;
  String status;

  Predictions({
      this.predictions, 
      this.status});


  Map<String, dynamic> toJson()=>_$PredictionsToJson(this);
  factory Predictions.fromJson(Map<String, dynamic> json)=> _$PredictionsFromJson(json);
}
@JsonSerializable()
class Prediction {
  String description;
  String id;
  @JsonKey(name: 'matched_substrings')
  List<MatchedSubstrings> matchedSubstrings;
  @JsonKey(name: 'place_id')
  String placeId;
  String reference;
  @JsonKey(name: 'structured_formatting')
  Structuredformating structuredFormatting;
  List<Terms> terms;
  List<String> types;

  Prediction({
      this.description, 
      this.id, 
      this.matchedSubstrings, 
      this.placeId, 
      this.reference, 
      this.structuredFormatting, 
      this.terms, 
      this.types});

  Map<String, dynamic> toJson()=>_$PredictionToJson(this);
  factory Prediction.fromJson(Map<String, dynamic> json)=> _$PredictionFromJson(json);

}
@JsonSerializable()
class Terms {
  int offset;
  String value;

  Terms({
      this.offset, 
      this.value});

  Map<String, dynamic> toJson()=>_$TermsToJson(this);
  factory Terms.fromJson(Map<String, dynamic> json)=> _$TermsFromJson(json);
}
@JsonSerializable()
class Structuredformating {
  @JsonKey(name: 'main_text')
  String mainText;
  @JsonKey(name:'main_text_matched_substrings')
  List<MainTextMatchedSubstrings> mainTextMatchedSubstrings;
  @JsonKey(name: 'secondary_text')
  String secondaryText;

  Structuredformating({
      this.mainText,
      this.mainTextMatchedSubstrings,
      this.secondaryText});
  Map<String, dynamic> toJson()=>_$StructuredformatingToJson(this);
  factory Structuredformating.fromJson(Map<String, dynamic> json)=> _$StructuredformatingFromJson(json);


}
@JsonSerializable()
class MainTextMatchedSubstrings {
  int length;
  int offset;

  MainTextMatchedSubstrings({
      this.length,
      this.offset});


  Map<String, dynamic> toJson()=>_$MainTextMatchedSubstringsToJson(this);
  factory MainTextMatchedSubstrings.fromJson(Map<String, dynamic> json)=> _$MainTextMatchedSubstringsFromJson(json);
}
@JsonSerializable()
class MatchedSubstrings {
  int length;
  int offset;

  MatchedSubstrings({
      this.length, 
      this.offset});

  Map<String, dynamic> toJson()=>_$MatchedSubstringsToJson(this);
  factory MatchedSubstrings.fromJson(Map<String, dynamic> json)=> _$MatchedSubstringsFromJson(json);

}