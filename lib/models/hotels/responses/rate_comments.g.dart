// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_comments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateComments _$RateCommentsFromJson(Map<String, dynamic> json) {
  return RateComments(
    paxComments: json['paxComments'] as String,
    comments: json['comments'] as String,
  );
}

Map<String, dynamic> _$RateCommentsToJson(RateComments instance) =>
    <String, dynamic>{
      'paxComments': instance.paxComments,
      'comments': instance.comments,
    };
