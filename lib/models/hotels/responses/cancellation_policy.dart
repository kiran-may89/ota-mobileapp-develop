import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'no_show_fee.dart';
import "policies.dart";
part 'cancellation_policy.g.dart';

@JsonSerializable()
class CancellationPolicy extends Equatable {
  final String cancelByDate;
  final String policyText;
  final List<Policies> policies;
  final bool underCancellation;
  final String amountType;
  final NoShowFee noShowFee;
  final int tpa;
  final String tpaName;
  final String options;

  CancellationPolicy(
      {this.cancelByDate,
      this.policyText,
      this.policies,
      this.underCancellation,
      this.amountType,
      this.noShowFee,
      this.tpa,
      this.tpaName,
      this.options});

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) => _$CancellationPolicyFromJson(json);
  Map<String, dynamic> toJson() => _$CancellationPolicyToJson(this);

  @override
  List<Object> get props => [
        this.cancelByDate,
        this.policyText,
        this.policies,
        this.underCancellation,
        this.amountType,
        this.noShowFee,
        this.tpa,
        this.tpaName,
        this.options
      ];
}
