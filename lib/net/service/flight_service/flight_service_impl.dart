


import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ota/models/flights/airport_look_up_response.dart';
import 'package:ota/models/flights/check_availability_response.dart';
import 'package:ota/models/flights/check_availability_response_entity.dart';
import 'package:ota/models/flights/flight_booking_res.dart';
import 'package:ota/models/flights/flight_booking_response_entity.dart';
import 'package:ota/models/flights/flight_savebooking_response.dart';
import 'package:ota/models/flights/flight_search_response.dart';
import 'package:ota/models/flights/flight_search_response_entity.dart';
import 'package:ota/models/flights/one_way_search_response.dart';
import 'package:ota/models/flights/requests/flight_search_response.dart';
import 'package:ota/models/flights/requests/search_flights.dart';
import 'package:ota/net/service/flight_service/flight_service.dart';
import 'package:ota/utils/constants.dart';
import 'package:ota/utils/strings.dart';


class FlightServiceImpl extends FlightService{

  Dio apiConnector;
  final String _AIRPORT_LOOKUP = "common/api/v1/LookupIATACodes/AutoCompleteSearch";

  final String _SEARCH_FLIGHTS = "flights/api/v1/Aggregate/MobileSearch";

  final String _CHECK_AVAILABILITY = "flights/api/v1/Aggregate/CheckAvailabulity";

  final String _SAVE_BOOKING = "flights/api/v1/Aggregate/SaveBooking";

  final String _BOOK_FLIGHT = "bookings/api/v1/booking/flights";



  FlightServiceImpl(this.apiConnector);



  @override
  Future<AirportLookupResponse> getAirports(String query) async {

    Map<String, dynamic> params =Map();
    params['qry'] = query;

    try {
      Response response = await apiConnector
          .get(_AIRPORT_LOOKUP, queryParameters: params);

      var data = response.data;

      print("DATA$data");

      AirportLookupResponse result = AirportLookupResponse.fromJson(data);

      print("RESULT${result.result}");

      return result;
    }catch (error, stacktrace) {

      AirportLookupResponse results = AirportLookupResponse();

      print(results.message);
      if(error is DioError){
        results.setException(error: error);
      }

      return results;
    }




  }

  @override
  Future<FlightSearchResponseData> getFlights( body) async {


    try {
      Response response = await apiConnector
          .post(_SEARCH_FLIGHTS, data: jsonEncode(body.toJson()));




      var data = response.data;

      var correlationId = response.headers.value('X-Correlation-ID');



      FlightSearchResponse results = FlightSearchResponse.fromJson(data);

      FlightSearchResponseData flightSearchResponseData = FlightSearchResponseData(correlationId:correlationId,flightSearchResponse:results);





      return flightSearchResponseData;

    } catch (error, stacktrace) {

      FlightSearchResponse results = FlightSearchResponse();
      print(results.responseException.toString());
      results.isError = true;
      print(error.toString());




      FlightSearchResponseData flightSearchResponseData = FlightSearchResponseData(correlationId:"",flightSearchResponse:results);



      return flightSearchResponseData;
    }


  }

  @override
  Future<CheckAvailabilityResponse> checkFlightAvailability(body) async {


    try {
      Response response = await apiConnector
          .post(_CHECK_AVAILABILITY, data: jsonEncode(body.toJson()));




      var data = response.data;



      CheckAvailabilityResponse results = CheckAvailabilityResponse.fromJson(data);



      return results;

    } catch (error, stacktrace) {

      CheckAvailabilityResponse results = CheckAvailabilityResponse();

      print(results.responseException.toString());

      print(error.toString());


      return results;
    }


  }

  @override
  Future<FlightSaveBookingResponse> saveBooking(body) async {





    try {
      Response response = await apiConnector
          .post(_SAVE_BOOKING, data: jsonEncode(body.toJson()));



      var data = response.data;


      FlightSaveBookingResponse results = FlightSaveBookingResponse.fromJson(data);



      return results;

    } catch (error, stacktrace) {

      FlightSaveBookingResponse results = FlightSaveBookingResponse();

      print(results.message);

      print(results.responseException.toString());

      print(error.toString());
      //results.setException(error: error);

      return results;
    }




  }

  @override
  Future<FlightBookingRes> bookFlight(body) async {



    try {
      Response response = await apiConnector
          .post(_BOOK_FLIGHT, data: jsonEncode(body.toJson()));



      var data = response.data;


      FlightBookingRes results = FlightBookingRes.fromJson(data);



      return results;

    } catch (error, stacktrace) {

      FlightBookingRes results = FlightBookingRes();

      print(results.message);

      print(results.responseException.toString());

      print(error.toString());
      //results.setException(error: error);

      return results;
    }




  }

}