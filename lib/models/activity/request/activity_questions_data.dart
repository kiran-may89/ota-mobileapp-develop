import 'package:ota/models/activity/full_details_response_entity.dart';
import 'package:ota/models/activity/request/activity_answers.dart';
import 'package:ota/models/activity/request/fill_details_request.dart';
import 'package:ota/models/activity/small_details_response_entity.dart';
import 'package:ota/views/activities/fulldetails_data.dart';

import '../small_details_response.dart';

class ActivityQuestionsData{


  FullDetailsData fullDetailsData;

  List<Answers> answers;

  String rateKey ;

  SmallDetailsResponseTotalAmountWithMarkup totalAmountWithMarkup;

  TravelDetails travelDetails;

  String Duration;

  String Currency;

  List Options;

  String activityName;

  ActivityQuestionsData({this.fullDetailsData,this.answers,this.travelDetails,this.totalAmountWithMarkup,this.rateKey,this.Duration,
    this.Currency,this.Options,this.activityName
  });

}