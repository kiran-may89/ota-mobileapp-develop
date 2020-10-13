

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:ota/models/flights/flight_booking_res.dart';
import 'package:ota/models/flights/flight_search_response.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_booking_data.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_travel_info_model.dart';

import 'data_models/flight_results_data.dart';

class FlightBookingStatusModel extends ChangeNotifier{


  FlightTravelInfoData flightTravelInfoData;

  FlightBookingRes flightBookingRes;

  FlightResultsData flightResultsData;



  FlightBookingStatusModel(this.flightTravelInfoData, this.flightBookingRes){


    flightResultsData = flightTravelInfoData.flightResultsData;

  }



  getSelectedAirLineImage(String airline,
      List<FlightSearchResponseAirlinesMeta> airlinesMeta) {
    Widget AirlineImage;

    for (int j = 0; j < airlinesMeta.length; j++) {

      if (airline == airlinesMeta[j].code) {

        AirlineImage =

            Container(child: Image.network(

              airlinesMeta[j].image128, height: 25, width: 25,),

              margin: EdgeInsets.only(left: 2, right: 2),

            );

      }

    }

    return AirlineImage;

  }




  String getTimeDifferenceByDate( String Departure,String Arrival){


    String formatTime(int timeNum) {
      return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
    }

    final parsedDepartureTime = DateTime.parse(Departure).toUtc();

    String time1 = parsedDepartureTime.toLocal().toString();

    final departureTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time1, true).toLocal();

    // print("departure  $departureTime");



    final parsedArrivalTime = DateTime.parse(Arrival).toUtc();

    String time2 = parsedArrivalTime.toLocal().toString();

    final arrivalTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time2, true).toLocal();

    // print("departure  $arrivalTime");






    var different=arrivalTime.difference(departureTime);

    // print("Difference${different.inSeconds}");

    var seconds = different.inSeconds;



    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    //int second = seconds % 60;
    return formatTime(hour) + " Hrs " + formatTime(minute) + " min ";







  }


  String getConvertedDate(String convertDate){

//    final parsedDate = DateTime.parse(convertDate).toUtc();
//
//    String time = parsedDate.toLocal().toString();

    final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(convertDate, false).toLocal();

    final convertedDate = new DateFormat("dd-MMM").format(dateTime);

    return convertedDate;

  }

  String getConvertedTime(String convertTime){

//    final parsedTime = DateTime.parse(convertTime).toUtc();
//
//    String time = parsedTime.toLocal().toString();

    final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(convertTime, false);

    final convertedTime = new DateFormat("HH:mm").format(dateTime);

    return convertedTime;


  }













}