import 'package:ota/models/activity/request/activity_booking_request.dart';
import 'package:ota/models/activity/request/activity_booking_request.dart';
import 'package:ota/models/activity/request/fill_details_request.dart';
import 'package:ota/models/activity/small_details_response_entity.dart';

import '../full_details_response.dart';
import '../small_details_response.dart';
import 'activity_answers.dart';

class ActivityTravellerData{


  String  provider;

  List<SmallDetailsResponseModalities> selectedModalityDetails;

  String correlationId;

  FullDetailsRequest requestData;

  String options;

  String tenentId;

  TravelDetails travelDetails;

  SmallDetailsResponseTotalAmountWithMarkup totalAmountWithMarkup;

  List<ActivityTravellerDetails>travellerList ;

  String activityName;

  String duration;

  String Currency;

  String selectedModalityDate;

  List<QuestionData> questions;

  List<Answers> answers;

  FullDetailsResponseImages image;

  ActivityTravellerData({this.options,this.travellerList,this.travelDetails,this.totalAmountWithMarkup,
    this.tenentId,this.requestData,this.activityName,this.duration,this.Currency,this.correlationId,
    this.provider, this.selectedModalityDetails,this.selectedModalityDate,this.answers,this.questions,this.image});


//
//  class QuestionData {
//  String code;
//  String text;
//  String required;
//
//  QuestionData({this.code, this.text,this.required});
//
//  QuestionData.fromJson(Map<String, dynamic> json) {
//  code =     json['code'];
//  text =     json['text'];
//  required = json['required'];
//
//  }
//
//  Map<String, dynamic> toJson() {
//  final Map<String, dynamic> data = new Map<String, dynamic>();
//  data['code'] = this.code;
//  data['text'] = this.text;
//  data['required'] = this.required;
//
//  return data;
//  }
//  }







}