



import 'package:dio/dio.dart';
import 'package:ota/models/activity/activity_booking_response_entity.dart';
import 'package:ota/models/activity/activity_search_response.dart';
import 'package:ota/models/activity/activity_search_response1_entity.dart';
import 'package:ota/models/activity/activity_search_response_entity.dart';
import 'package:ota/models/activity/full_details_response.dart';
import 'package:ota/models/activity/full_details_response_entity.dart';
import 'package:ota/models/activity/prebooking_response_entity.dart';
import 'package:ota/models/activity/small_details_response.dart';
import 'package:ota/models/activity/small_details_response_entity.dart';
import 'package:ota/viewmodels/activities_view_models/data_models/activity_booking_data.dart';

abstract class  ActivityService{




  Future<ActivitySearchResponseData> getActivities(body);



  Future<FullDetailsResponse> getFullDetails(body);


  Future<SmallDetailsResponse> getSmallDetails(body);


  Future<PrebookingResponseEntity> getPreBooking(body);


  Future<ActivityBookingResponseEntity> bookActivity(body);






}