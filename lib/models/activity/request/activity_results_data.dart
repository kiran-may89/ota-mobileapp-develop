import 'package:ota/models/activity/request/fill_details_request.dart';
import 'package:ota/views/activities/fulldetails_data.dart';

class ActivityResultsData{

  FullDetailsData fullDetailsData;

  TravelDetails travelDetails;

  String correlationId;

  ActivityResultsData({this.fullDetailsData,this.travelDetails,this.correlationId});


}