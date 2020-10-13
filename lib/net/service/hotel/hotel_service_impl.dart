import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:ota/models/hotels/city_look_up_response.dart';
import 'package:ota/models/hotels/hotel_details_request.dart';

import 'package:ota/models/hotels/hotel_search_response.dart';
import 'package:ota/models/hotels/payments/request/hotel_payment_model.dart';
import 'package:ota/models/hotels/payments/response/HotelBookingResponse.dart';
import 'package:ota/models/hotels/requests/rate_checker_request.dart';
import 'package:ota/models/hotels/responses/hotel_auto_search_model.dart';
import 'package:ota/models/hotels/responses/hotel_details_response.dart';
import 'package:ota/models/hotels/search_hotel_request.dart';
import 'package:ota/models/hotels/responses/rate_check_response.dart';
import 'package:ota/prefs/session_manager.dart';
import 'hotels_service.dart';
import 'package:ota/models/common/models/api_exception.dart';

class HotelServiceImpl extends HotelService {
  Dio apiConnector;

  final String _AGGREGATED_HOTEL_SEARCH = "hotels/api/v1/aggregatedHotel/aggregatedsearch";
  final String _CITY_LOOK_UP = "common/api/v1/LookupCitys/AutoCompleteSearch";
  final String _HOTEL_DETAILS = "hotels/api/v1/aggregatedHotel/hoteldetails";
  final String _HOTEL_BOOK = "bookings/api/v1/booking/hotels";
  final String _HOTEL_RECHECK = "hotels/api/v1/aggregatedHotel/recheckRate";
  final String _HOTEL_GET_AUTO_COMPLETE = "hotels/api/v1/aggregatedHotel/GetAutoComplete";

  HotelServiceImpl(this.apiConnector);

  @override
  Future<HotelSearchResponse> getHotels(SearchHotelRequest body) async {
    try {
      body.tenantId = SessionManager
          .getInstance()
          .getUser
          .tenantId;


      Response response = await apiConnector.post(
          _AGGREGATED_HOTEL_SEARCH, data: jsonEncode(body));
      var data = response.data;
      HotelSearchResponse results = HotelSearchResponse.fromJson(data);
      return results;
    } catch (error, stacktrace) {
      HotelSearchResponse results = HotelSearchResponse();
      results.isError = true;
      if (error is DioError) {
        results.setException(error: error);
      }

      return results;
    }
  }

  @override
  Future<CityLookUpResponse> getCities(String query) async {
    Map<String, dynamic> params = Map();
    params['qry'] = query;

    try {
      Response response = await apiConnector.get(
          _CITY_LOOK_UP, queryParameters: params);
      var data = response.data;
      CityLookUpResponse result = CityLookUpResponse.fromJson(response.data);

      return result;
    } catch (error, stacktrace) {
      CityLookUpResponse results = CityLookUpResponse();
      results.isError = true;
      if (error is DioError) {
        results.setException(error: error);
      }

      return results;
    }
  }

  @override
  Future<HotelDetailsResponse> getHotelDetails(HotelDetailsRequest params) async {
    try {
      Response response = await apiConnector.post(
          _HOTEL_DETAILS, data: jsonEncode(params));
      var data = response.data;
      HotelDetailsResponse results = HotelDetailsResponse.fromJson(data);
      return results;
    } catch (error, stacktrace) {
      HotelDetailsResponse results = HotelDetailsResponse();
      results.isError = true;
      if (error is DioError) {
        results.responseException = error.error.toString();
      }

      return results;
    }
  }

  @override
  Future<HotelBookingResponse> bookHotel(HotelPaymentModel params) async {
    try {
      Response response = await apiConnector.post(
          _HOTEL_BOOK, data: jsonEncode(params));
      var data = response.data;
      HotelBookingResponse results = HotelBookingResponse.fromJson(data);
      return results;
    } catch (error, stacktrace) {
      HotelBookingResponse results = HotelBookingResponse();
      results.isError = true;
      if (error is DioError) {
        results.setException(error: error);
      }

      return results;
    }
  }

  @override
  Future<RateCheckResponse> getRateCheck(RateCheckerRequest rateCheckerRequest) async {
    try {
      Response response = await apiConnector.post(
          _HOTEL_RECHECK, data: jsonEncode(rateCheckerRequest.toJson()));
      var data = response.data;
      RateCheckResponse results = RateCheckResponse.fromJson(data);
      return results;
    } catch (error, stacktrace) {
      RateCheckResponse results = RateCheckResponse();
      results.isError = true;
      if (error is DioError) {
        results.responseException = error.toString();
      }

      return results;
    }
  }

  @override
  Future<HotelAutoSearchModel> getAutoCompleteCities(String query) async {
    Map<String, dynamic> params = Map();
    params['qry'] = query;

    try {
      Response response = await apiConnector.get(
          _HOTEL_GET_AUTO_COMPLETE, queryParameters: params);
      var data = response.data;
      HotelAutoSearchModel result = HotelAutoSearchModel.fromJson(
          response.data);

      return result;
    } catch (error, stacktrace) {
      HotelAutoSearchModel results = HotelAutoSearchModel();
      results.isError = true;


      return results;
    }
  }
}