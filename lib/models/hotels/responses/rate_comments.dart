import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'rate_comments.g.dart';

@JsonSerializable()
class RateComments extends Equatable {
  final String paxComments;
  final String comments;

  RateComments({this.paxComments, this.comments});

  factory RateComments.fromJson(Map<String, dynamic> json) =>
      _$RateCommentsFromJson(json);
  Map<String, dynamic> toJson() => _$RateCommentsToJson(this);

  @override
  List<Object> get props => [this.paxComments, this.comments];
}
