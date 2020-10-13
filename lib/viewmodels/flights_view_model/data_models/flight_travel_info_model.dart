
import 'package:ota/models/flights/requests/flight_booking_request.dart';
import 'package:ota/models/flights/requests/flight_save_booking_request.dart';

import 'flight_results_data.dart';

class FlightTravelInfoData{


  FlightSaveBookingRequest flightSaveBookingRequest;

  List<TravellerDetails> traveldetails;

  FlightResultsData flightResultsData;

  FlightTravelInfoData({this.flightSaveBookingRequest, this.traveldetails,
      this.flightResultsData});


}
