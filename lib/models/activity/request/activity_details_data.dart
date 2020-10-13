import 'package:ota/models/activity/full_details_response_entity.dart';
import 'package:ota/models/activity/request/activity_answers.dart';
import 'package:ota/models/activity/small_details_response_entity.dart';
import 'package:ota/views/activities/fulldetails_data.dart';

import '../full_details_response.dart';
import '../small_details_response.dart';
import 'fill_details_request.dart';

class ActivityDetailsData{

  String  provider;

  List<SmallDetailsResponseModalities> selectedModalityDetails;

  String activityName;

  String correlationId;

  FullDetailsData fullDetailsData;

  List<QuestionData> questions;

  List<Answers> answers;

  String rateKey ;

  SmallDetailsResponseTotalAmountWithMarkup totalAmountWithMarkup;

  TravelDetails travelDetails;

  String currency;

  String duration;

  List<SmallDetailsResponseOptions> options;

  String modalitySelectedDate;

  FullDetailsResponseImages image;

  ActivityDetailsData({this.fullDetailsData,this.questions,this.rateKey,this.totalAmountWithMarkup,this.provider,this.modalitySelectedDate,
    this.travelDetails,this.currency,this.duration,this.options,this.activityName,this.answers,this.correlationId,this.selectedModalityDetails,this.image});


}