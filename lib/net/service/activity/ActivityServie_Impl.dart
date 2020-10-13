



import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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

import 'activity_service.dart';

class ActivityService_Impl extends ActivityService{

  Dio apiConnector;

  final String _SEARCH_ACTIVITIES = "activities/api/v1/aggregatedActivity/aggregatedactivitysearch";

  final String _FULL_DETAILS = "activities/api/v1/aggregatedActivity/aggregatedactivitydetailsfull";

  final String _SMALL_DETAILS = "activities/api/v1/aggregatedActivity/aggregatedactivitydetailssmall";

  final String _PRE_BOOKING = "activities/api/v1/aggregatedActivity/aggregatedactivitybookingpreconfirm";

  final String _BOOKING = "bookings/api/v1/booking/activities";


  ActivityService_Impl(this.apiConnector);



  @override
  Future<ActivitySearchResponseData> getActivities(body) async {


    try {
      Response response = await apiConnector
          .post(_SEARCH_ACTIVITIES, data: jsonEncode(body.toJson()));

      var data = response.data;

      ActivitySearchResponse results = ActivitySearchResponse.fromJson(data);

      var correlationId = response.headers.value('X-Correlation-ID');


      ActivitySearchResponseData activitySearchResponseData  = ActivitySearchResponseData(correlationId:correlationId ,activitySearchResponse: results);

      return   activitySearchResponseData;

    } catch (error, stacktrace) {

      ActivitySearchResponse results = ActivitySearchResponse();

      print(results.responseException.toString());

      ActivitySearchResponseData activitySearchResponseData  = ActivitySearchResponseData(correlationId:"" ,activitySearchResponse: results);

      results.isError = true;

      print(error.toString());

      return activitySearchResponseData;
    }



  }

  @override
  Future<FullDetailsResponse> getFullDetails(body) async {



    try {
      Response response = await apiConnector
          .post(_FULL_DETAILS, data: jsonEncode(body.toJson()));

      var data = response.data;

      FullDetailsResponse results = FullDetailsResponse.fromJson(data);

      return results;

    } catch (error, stacktrace) {

      FullDetailsResponse results = FullDetailsResponse();

      print(results.responseException.toString());

      results.isError = true;
      print(error.toString());


      return results;
    }



  }



  @override
  Future<SmallDetailsResponse> getSmallDetails(body) async {



    try {
      Response response = await apiConnector
          .post(_SMALL_DETAILS, data: jsonEncode(body.toJson()));

      var data = response.data;

      SmallDetailsResponse results = SmallDetailsResponse.fromJson(data);

      return results;

    } catch (error, stacktrace) {

      SmallDetailsResponse results = SmallDetailsResponse();

      print(results.responseException.toString());

      results.isError = true;
      print(error.toString());


      return results;
    }



  }




  @override
  Future<PrebookingResponseEntity> getPreBooking(body) async {



    try {
      Response response = await apiConnector
          .post(_PRE_BOOKING, data: jsonEncode(body.toJson()));

      var data = response.data;

      PrebookingResponseEntity results = PrebookingResponseEntity();

      return results.fromJson(data);

    } catch (error, stacktrace) {

      PrebookingResponseEntity results = PrebookingResponseEntity();

      print(results.responseException.toString());

      results.isError = true;
      print(error.toString());


      return results;
    }


  }


  @override
  Future<ActivityBookingResponseEntity> bookActivity(body) async {


    try {
      Response response = await apiConnector
          .post(_BOOKING, data: jsonEncode(body.toJson()));

      var data = response.data;

      ActivityBookingResponseEntity results = ActivityBookingResponseEntity();

      return results.fromJson(data);

    } catch (error, stacktrace) {

      ActivityBookingResponseEntity results = ActivityBookingResponseEntity();

      print(results.responseException.toString());

      results.isError = true;
      print(error.toString());


      return results;
    }



  }







}