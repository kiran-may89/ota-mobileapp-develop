import 'package:equatable/equatable.dart';
import 'package:ota/models/hotels/responses/options.dart';

class RateCheckerRequest extends Equatable {
  final String searchId;
  final String groupOptionId;
  final int tpa;
  final String tpaName;
  final List<Options> options;
  final String hotelCode;
  final int hotelRating;

  RateCheckerRequest(
      {this.searchId,
      this.groupOptionId,
      this.tpa,
      this.tpaName,
      this.options,
      this.hotelCode,
      this.hotelRating});

  factory RateCheckerRequest.fromJson(Map<String, dynamic> json) {
    return RateCheckerRequest(
      searchId: json['searchId'],
      groupOptionId: json['groupOptionId'],
      tpa: json['tpa'],
      tpaName: json['tpaName'],
      options: json['options'] != null
          ? json['options'].map((v) => new Options.fromJson(v)).toList()
          : null,
      hotelCode: json['hotelCode'],
      hotelRating: json['hotelRating'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchId'] = this.searchId;
    data['groupOptionId'] = this.groupOptionId;
    data['tpa'] = this.tpa;
    data['tpaName'] = this.tpaName;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    data['hotelCode'] = this.hotelCode;
    data['hotelRating'] = this.hotelRating;
    return data;
  }

  @override
  List<Object> get props => [
        this.searchId,
        this.groupOptionId,
        this.tpa,
        this.tpaName,
        this.options,
        this.hotelCode,
        this.hotelRating
      ];
}
