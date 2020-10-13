
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/flights/airport_look_up_response.dart';
import 'package:ota/models/flights/flight_search_response_entity.dart';
import 'package:ota/models/flights/one_way_search_response.dart';

import 'package:ota/models/flights/airport_look_up_response.dart';
import 'package:ota/models/flights/search_flight_request.dart';
import 'package:ota/models/flights/requests/search_flights.dart';
import 'package:ota/models/flights/requests/search_flights_round.dart';
import 'package:ota/net/service/flight_service/flight_service.dart';
import 'package:ota/net/service/hotel/hotels_service.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/views/flights/flightResults.dart';

import '../base_view_model.dart';

class FlightSearch_Model extends BaseViewModel {
  AirportLookupResponse response;

  FlightService _flightService;

  DateTime firstDate;

  DateTime lastDate;

  bool startSearch = false;

  String selectedSource;

  String selectedDestination;

//
//  DatePeriod _selectedPeriod;

  final TextEditingController _startFromController = TextEditingController();

  bool _toggleDateVisible = true;

  double calenderHeight = 280;

  bool get toggleDateVisible => _toggleDateVisible;

  TextEditingController get startFromController => _startFromController;

  final TextEditingController _destinationController = TextEditingController();

  TextEditingController get destinationController => _destinationController;

  String flightType = "oneway";

  int adultCount = 1;

  int childCount = 0;

  int infantsCount = 0;

  int arrival_timing_value;

  int departure_timing_value;

  double cabinClassSelection = 0.0;

  String selectedCabinClass = "M";

  String cabinSelctionName = "Economy";

  String cabinImageUri = "assets/images/Economy.png";

  bool oneWay = true;


  String temp_FlyFrom;

  String temp_FlyFromCity;

  String FlyFrom;

  String FlyFromCity;

  String startDateMOnth  = "-";
  //= new DateFormat("dd-MMM").format(DateTime.now());

  String returnDateMonth = "-";

  String startDate ;
  //= DateFormat("dd/MM/yyyy").format(DateTime.now());

  String returnDate ;
  //= DateFormat("dd/MM/yyyy").format(DateTime.now());

  String temp_FlyToCity;

  String temp_FlyTo;

  String FlyToCity;

  String FlyTo;

  var tempSourceController;

  var tempDestinationController;

  var context;

  List cabin_class = ["Economy", "Economy-Premium", "Business", "First-Class"];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Widget> cabinClassImages = [
    Image.asset(
      'assets/images/Economy.png',
      height: 20,
    ),
    Image.asset(
      'assets/images/Economy-Premium.png',
      height: 20,
    ),
    Image.asset(
      'assets/images/business.png',
      height: 20,
    ),
    Image.asset(
      'assets/images/First-class.png',
      height: 20,
    ),
  ];




  getInstance() {
    _flightService = GetIt.instance<FlightService>();
  }

  void changeFlightType() {
    if (oneWay) {
      oneWay = false;
      flightType = "round";

      returnDate=null;


    } else {
      oneWay = true;
      flightType = "oneway";


      returnDate = null;
          //DateFormat("dd/MM/yyyy").format(DateTime.now());

    }

    //startDate = null;

    lastDate = null;
        //DateFormat("dd/MM/yyyy").format(DateTime.now());

   // startDateMOnth = "-";
        //new DateFormat("dd-MMM").format(DateTime.now());

    returnDateMonth = "-";




    notifyListeners();
  }

  void addChild() {
    childCount++;
    notifyListeners();
  }

  void removeChild() {
    if (childCount != 0) childCount--;
    notifyListeners();
  }

  void addAdult() {
    adultCount++;
    notifyListeners();
  }

  void removeAdult() {
    if (adultCount != 0) adultCount--;
    notifyListeners();
  }

  void addInfant() {
    infantsCount++;
    notifyListeners();
  }

  void removeInfant() {
    if (infantsCount != 0) infantsCount--;
    notifyListeners();
  }

  void changeCabinSelection(double newValue) {
    cabinClassSelection = newValue;

    switch (newValue.toInt()) {
      case 0:
        selectedCabinClass = "M";

        cabinSelctionName = "Economy";

        cabinImageUri = "assets/images/Economy.png";

        break;

      case 1:
        selectedCabinClass = "W";

        cabinSelctionName = "Economy-Premium";

        cabinImageUri = "assets/images/Economy-Premium.png";

        break;

      case 2:
        selectedCabinClass = "C";

        cabinSelctionName = "Business";

        cabinImageUri = "assets/images/business.png";

        break;

      case 3:
        selectedCabinClass = "F";

        cabinSelctionName = "First-Class";

        cabinImageUri = "assets/images/First-class.png";

        break;
    }

    print(selectedCabinClass);

    notifyListeners();
  }

  @override
  void initialise() {
//    _firstDate = DateTime.now().subtract(Duration(days: 45));
//    _lastDate = DateTime.now().add(Duration(days: 45));
//
//    DateTime selectedPeriodStart = DateTime.now().subtract(Duration(days: 0));
//    DateTime selectedPeriodEnd = DateTime.now().add(Duration(days: 0));
//    _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);
  }

//  DateTime get lastDate => _lastDate;
//
//  DateTime get firstDate => _firstDate;
//
//  DatePeriod get selectedPeriod => _selectedPeriod;

  void setFromAirport(AirportCodes suggestion) {
//    _startFromController.text =
//        suggestion.airportCode + "-" + suggestion.airportName;
    startFromController.text = null;
    selectedSource =  suggestion.airportCode + "-" + suggestion.airportName;

    FlyFrom = suggestion.airportCode;
    FlyFromCity = suggestion.airportName;

    setSourceTemp();


  }

  void setDestinationAirport(AirportCodes suggestion) {
//    _destinationController.text =
//        suggestion.airportCode + "-" + suggestion.airportName;
    destinationController.text = null;
    selectedDestination = suggestion.airportCode + "-" + suggestion.airportName;
    FlyTo = suggestion.airportCode;
    FlyToCity = suggestion.airportName;

    setDestinationTemp();



   notifyListeners();
  }

  Future<AirportLookupResponse> getAirports(String query) async {

    AirportLookupResponse airportLookupResponse;

    getInstance();


    airportLookupResponse = await _flightService.getAirports(query);


    return airportLookupResponse;

  }

//  FirstClass= "F"
//  Economy = "M"
//  Economy_premium = "W"
//  Business = "C"
//

//  void setSelectedTimerPeriod(DatePeriod period) {
//    _selectedPeriod = period;
////    requestDto.checkInDate = period.start.toIso8601String();
////    requestDto.checkOutDate = period.end.toIso8601String();
//
//    print(DateFormat("dd/MM/yyyy").format(DateTime.now()));
//    print(DateFormat("dd/MM/yyyy").format(DateTime.now()));
//
//    print(period.start);
//    print(period.end);
//    notifyListeners();
//
//    final arrivalTime = DateFormat("yyyy-MM-dd HH:mm:ss")
//        .parse(period.start.toString(), true)
//        .toLocal();
//
//    print(DateFormat("dd/MM/yyyy").format(period.start));
//
//    print(DateFormat("dd/MM/yyyy").format(period.end));
//
//    startDate = DateFormat("dd/MM/yyyy").format(period.start);
//
//    returnDate = DateFormat("dd/MM/yyyy").format(period.end);
//
//    startDateMOnth = new DateFormat("dd-MMM").format(period.start);
//
//    returnDateMonth = new DateFormat("dd-MMM").format(period.end);
//
//    notifyListeners();
//  }

  String getConvertedTime(String convertTime) {
    final parsedTime = DateTime.parse(convertTime).toUtc();

    String time = parsedTime.toLocal().toString();

    final dateTime =
    DateFormat("yyyy-MM-dd HH:mm:ss").parse(time, true).toLocal();

    print(dateTime);

    final convertedTime = new DateFormat("hh:mm").format(dateTime);

    return convertedTime;
  }

  String getConvertedDate(String convertDate) {
    final parsedDate = DateTime.parse(convertDate).toUtc();

    String time = parsedDate.toLocal().toString();

    final dateTime =
    DateFormat("yyyy-MM-dd HH:mm:ss").parse(time, true).toLocal();

    final convertedDate = new DateFormat("dd-MMM").format(dateTime);

    return convertedDate;
  }

  String getTimeDifference(int seconds) {
    // Digital formatting, converting 0-9 time to 00-09
    String formatTime(int timeNum) {
      return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
    }
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    //int second = seconds % 60;
    return formatTime(hour) + " Hrs " + formatTime(minute) + " min ";
  }

  SearchFlightsRequest getRequestData() {

    SearchFlightsRequest commonRequestData = SearchFlightsRequest(
      adults: adultCount,
      children: childCount,
      infants: infantsCount,
      dateFrom: startDate,
      dateTo: oneWay?startDate:returnDate,
      flightType: flightType,
      monthFrom: startDateMOnth,
      monthTo: returnDateMonth,
      locale: "en",
      curr: "SAR",
      selectedCabins: selectedCabinClass,
      cabinSelection_name: cabinSelctionName,
      cabinImageUri: cabinImageUri,
      maxStopovers: "",
      vehicleType: "aircraft",
      flyFrom: FlyFrom,
      flyTo: FlyTo,
      flyfromCity: FlyFromCity,
      flyToCity: FlyToCity,
      sort: "price",
      oneway: oneWay,
      returnFrom: returnDate,
      returnTo: returnDate,
    );
    print(commonRequestData.toJson());

    return commonRequestData;

  }




  void upDestinationDate(DateTime date) {

    firstDate = date;

    startDate = DateFormat("dd/MM/yyyy").format(date);

    startDateMOnth = new DateFormat("dd-MMM").format(date);
    if(flightType == "oneway"){
      toggleCalender();
    }

    notifyListeners();
  }




  void upReturnDate(DateTime _return) {

    lastDate = _return;
    returnDate = DateFormat("dd/MM/yyyy").format(_return);

    returnDateMonth = new DateFormat("dd-MMM").format(_return);
    toggleCalender();
    notifyListeners();
  }




  bool validateData(GlobalKey<ScaffoldState> scaffoldKey ) {

    SnackBar snackBar;



    if(FlyFrom==null||FlyFrom==""){

      snackBar = SnackBar(content:Text("Please Select Source",style: CustomStyles.medium16.copyWith(color: CustomColors.White),),
        backgroundColor: CustomColors.BackGround,
      );

      scaffoldKey.currentState.showSnackBar(snackBar);
      return false;

    }else if(FlyTo ==null||FlyTo ==""){

      snackBar = SnackBar(content: Text("Select Destination",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
        backgroundColor: CustomColors.BackGround,
      );

      scaffoldKey.currentState.showSnackBar(snackBar);

      return false;

    }else if(startDate==null||startDate==""){

      print("StartDatexcecutesd");


      snackBar = SnackBar(content: Text("Select Start Date",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
        backgroundColor: CustomColors.BackGround,);

      scaffoldKey.currentState.showSnackBar(snackBar);

      print("StartDatexcecutesd");

      return false;


    }else if(!oneWay&&(returnDate==null||returnDate=="")){

//      print("StartDatexcecutesd2");
//
//      print(returnDate);
//
//      if(returnDate==null||returnDate==""){
//
//        continue;
//
//      } else if(returnDate==null||returnDate==""){

      print("StartDatexcecutesd2");


      snackBar = SnackBar(content: Text("Select Return Date",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
        backgroundColor: CustomColors.BackGround,);

      scaffoldKey.currentState.showSnackBar(snackBar);

      print("StartDatexcecutesd2");

      return false;


      //  }



    }else if(adultCount+childCount+infantsCount==0){

      snackBar = SnackBar(content: Text("Please Add Travellers",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
        backgroundColor: CustomColors.BackGround,);

      scaffoldKey.currentState.showSnackBar(snackBar);

      return false;

    }else{
      return true;
    }
  }

  void toggleCalender() {
    _toggleDateVisible = !_toggleDateVisible;
    calenderHeight  = _toggleDateVisible?280:0;
    notifyListeners();
  }

  void swapCities() {

    FlyFromCity   = temp_FlyToCity;

    FlyToCity  = temp_FlyFromCity;


    FlyTo =  temp_FlyFrom ;

    FlyFrom = temp_FlyTo;


    selectedDestination =  tempSourceController;

    selectedSource = tempDestinationController;


    setSourceTemp();
    setDestinationTemp();

    notifyListeners();

  }

  void setSourceTemp() {
    temp_FlyFrom = FlyFrom;
    temp_FlyFromCity = FlyFromCity;
    tempSourceController = selectedSource;

  }

  void setDestinationTemp() {

    temp_FlyTo  = FlyTo;
    temp_FlyToCity  = FlyToCity;
    tempDestinationController = selectedDestination;
  }

  void clearSelectedDates() {

    startDate = DateFormat("dd/MM/yyyy").format(DateTime.now());

    returnDate =  DateFormat("dd/MM/yyyy").format(DateTime.now());;

    startDateMOnth = new DateFormat("dd-MMM").format(DateTime.now());

    returnDateMonth = DateFormat("dd-MMM").format(DateTime.now());

    firstDate = DateTime.now();

    lastDate = null;

    notifyListeners();


  }

  void dataChanged(String text){

    if(text.length==3||text.length>3){
        startSearch = true;
    }else{
      startSearch =false;
    }


    notifyListeners();
  }

  void cancelSearch() {
    startSearch =false;
    notifyListeners();
  }


}
