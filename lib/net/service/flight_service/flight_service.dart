import 'package:ota/models/flights/airport_look_up_response.dart';
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


abstract class FlightService {


  Future<AirportLookupResponse> getAirports(String params);

  Future<FlightSearchResponseData> getFlights(body);

  Future<CheckAvailabilityResponse> checkFlightAvailability(body);

  Future<FlightSaveBookingResponse> saveBooking(body);

  Future<FlightBookingRes> bookFlight(body);

}

