import 'package:ota/models/flights/flight_search_response.dart';

class SummaryInfo {
  String serviceType;
  String flightType;
  String selectedCabins;
  String reservationDate;
  String returnDate;
  List<FlightSearchResponseFlights> flight;
  String provider;

  SummaryInfo({this.serviceType, this.flightType, this.selectedCabins, this.reservationDate, this.returnDate, this.flight, this.provider});

  SummaryInfo.fromJson(Map<String, dynamic> json) {
    serviceType = json['serviceType'];
    flightType = json['flight_type'];
    selectedCabins = json['selected_cabins'];
    reservationDate = json['reservationDate'];
    returnDate = json['returnDate'];
    if (json['flight'] != null) {
      flight = new List<FlightSearchResponseFlights>();
      json['flight'].forEach((v) { flight.add(new FlightSearchResponseFlights.fromJson(v)); });
    }
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceType'] = this.serviceType;
    data['flight_type'] = this.flightType;
    data['selected_cabins'] = this.selectedCabins;
    data['reservationDate'] = this.reservationDate;
    data['returnDate'] = this.returnDate;
    if (this.flight != null) {
      data['flight'] = this.flight.map((v) => v.toJson()).toList();
    }
    data['provider'] = this.provider;
    return data;
  }
}