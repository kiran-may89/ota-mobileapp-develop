import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'options.g.dart';

@JsonSerializable()
class Options extends Equatable {
  final String key;
  final String value;

  Options({this.key, this.value});

  factory Options.fromJson(Map<String, dynamic> json) =>
      _$OptionsFromJson(json);
  Map<String, dynamic> toJson() => _$OptionsToJson(this);

  @override
  List<Object> get props => [this.key, this.value];
}
