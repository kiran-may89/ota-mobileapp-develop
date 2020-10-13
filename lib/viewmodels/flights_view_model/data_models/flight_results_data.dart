



import 'package:ota/models/flights/flight_search_response.dart';
import 'package:ota/models/flights/search_flight_request.dart';
import 'package:ota/models/flights/check_availability_response.dart';
class FlightResultsData{



  SearchFlightsRequest requestData;

  List<FlightSearchResponseFlights> selectedList ;

  List<Option> options;

  String tpa;

  double fXRate;

  String currency;

  double taxAndOtherCharges;

  double baseRate;

  double totalPriceWithMarkup;

  String correlationId;

  FlightResultsData({this.requestData,this.selectedList, this.options, this.tpa, this.fXRate,
      this.taxAndOtherCharges, this.baseRate, this.totalPriceWithMarkup,this.correlationId,this.currency});


}