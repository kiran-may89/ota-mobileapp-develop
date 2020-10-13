// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predictions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Predictions _$PredictionsFromJson(Map<String, dynamic> json) {
  return Predictions(
    predictions: (json['predictions'] as List)
        ?.map((e) =>
            e == null ? null : Prediction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$PredictionsToJson(Predictions instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
      'status': instance.status,
    };

Prediction _$PredictionFromJson(Map<String, dynamic> json) {
  return Prediction(
    description: json['description'] as String,
    id: json['id'] as String,
    matchedSubstrings: (json['matched_substrings'] as List)
        ?.map((e) => e == null
            ? null
            : MatchedSubstrings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    placeId: json['place_id'] as String,
    reference: json['reference'] as String,
    structuredFormatting: json['structured_formatting'] == null
        ? null
        : Structuredformating.fromJson(
            json['structured_formatting'] as Map<String, dynamic>),
    terms: (json['terms'] as List)
        ?.map(
            (e) => e == null ? null : Terms.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    types: (json['types'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PredictionToJson(Prediction instance) =>
    <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
      'matched_substrings': instance.matchedSubstrings,
      'place_id': instance.placeId,
      'reference': instance.reference,
      'structured_formatting': instance.structuredFormatting,
      'terms': instance.terms,
      'types': instance.types,
    };

Terms _$TermsFromJson(Map<String, dynamic> json) {
  return Terms(
    offset: json['offset'] as int,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'offset': instance.offset,
      'value': instance.value,
    };

Structuredformating _$StructuredformatingFromJson(Map<String, dynamic> json) {
  return Structuredformating(
    mainText: json['main_text'] as String,
    mainTextMatchedSubstrings: (json['main_text_matched_substrings'] as List)
        ?.map((e) => e == null
            ? null
            : MainTextMatchedSubstrings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    secondaryText: json['secondary_text'] as String,
  );
}

Map<String, dynamic> _$StructuredformatingToJson(
        Structuredformating instance) =>
    <String, dynamic>{
      'main_text': instance.mainText,
      'main_text_matched_substrings': instance.mainTextMatchedSubstrings,
      'secondary_text': instance.secondaryText,
    };

MainTextMatchedSubstrings _$MainTextMatchedSubstringsFromJson(
    Map<String, dynamic> json) {
  return MainTextMatchedSubstrings(
    length: json['length'] as int,
    offset: json['offset'] as int,
  );
}

Map<String, dynamic> _$MainTextMatchedSubstringsToJson(
        MainTextMatchedSubstrings instance) =>
    <String, dynamic>{
      'length': instance.length,
      'offset': instance.offset,
    };

MatchedSubstrings _$MatchedSubstringsFromJson(Map<String, dynamic> json) {
  return MatchedSubstrings(
    length: json['length'] as int,
    offset: json['offset'] as int,
  );
}

Map<String, dynamic> _$MatchedSubstringsToJson(MatchedSubstrings instance) =>
    <String, dynamic>{
      'length': instance.length,
      'offset': instance.offset,
    };
