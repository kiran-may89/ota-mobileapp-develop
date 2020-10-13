

import 'package:ota/models/activity/request/pre_booking_request.dart' as prebooking;

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:ota/models/flights/check_availability_response.dart';
import 'package:ota/models/flights/check_availability_response_entity.dart';
import 'package:ota/models/flights/flight_booking_response_entity.dart';
import 'package:ota/models/flights/flight_search_response.dart';
import 'package:ota/models/flights/flight_search_response_entity.dart';
import 'package:ota/models/flights/one_way_search_response.dart';
import 'package:ota/models/flights/requests/availablity_checking.dart';
import 'package:ota/models/flights/requests/flight_save_booking_request.dart';
import 'package:ota/models/flights/requests/flight_search_response.dart';
import 'package:ota/models/flights/search_flight_request.dart';
import 'package:ota/models/flights/requests/search_flights.dart';
import 'package:ota/models/flights/requests/search_flights_round.dart';
import 'package:ota/net/service/flight_service/flight_service.dart';
import 'package:ota/utils/strings.dart';

import 'data_models/flight_results_data.dart';

class FlightResultsModel  extends ChangeNotifier{

  SearchFlightsRequest _requestData;

  SearchFlightsRequest get requestData=>_requestData;

  FlightService  _flightService;


  String currency;

  List<FlightSearchResponseFlights> selectedList = List();

  CheckAvailability_Request checkAvailabilityRequest;

  FlightSearchResponseData flightSearchResponseData = FlightSearchResponseData();

  FlightSearchResponse flightSearchResponse = FlightSearchResponse();

  CheckAvailabilityResponse checkAvailabilityResponse = CheckAvailabilityResponse();

  List<FlightSearchResponseAirlinesFilters> airlineFilterList = List();

  List<FlightSearchResponseAirlinesFilters> selectedAirlineFilterList = List();

  bool loading = true;

  List<FlightSearchResponseFlights> flightList = [];

  List<bool> childSelectionList = [];

  List<bool> adultSelectionList = [];

  List<bool> infantSelectionList = [];

  List <Option>options  = List();

  String tpa;

  double fXRate;

  double taxAndOtherCharges;

  double baseRate;

  double totalPriceWithMarkup;

  int filterCount=0;

  int flightResultsCount=0;





  ///Round Trip Filter Variables
  String Return_arrival_timing_value;

  String Return_departure_timing_value ;

  var Return_Departure_FromRange ;

  var Return_Departure_ToRange;

  var Return_Arrival_FromRange ;

  var Return_Arrival_ToRange;

  var Return_StopsFilterCount;

  String Return_StopFilterValue;


  ///OneWay Filter Variables
  String arrival_timing_value;

  String departure_timing_value ;

  var Departure_FromRange ;

  var Departure_ToRange;

  var Arrival_FromRange ;

  var Arrival_ToRange;

  var StopsFilterCount;

  String StopFilterValue;



  bool Price_Filter = false;

  bool Departure_Filter = false;

  bool Arrival_Filter  = false;

  bool Stops_Filter = false;

  bool Airlines_Filter = false;

  bool Filter_Applied = false;


  bool Return_Departure_Filter = false;

  bool Return_Arrival_Filter  = false;

  bool Return_Stops_Filter = false;

  bool Return_Airlines_Filter = false;


  bool oneWayFilter =false;

  bool roundTripFilter =false;



  bool Filter_Destination = true;



  var dob = TextEditingController();
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var passport = TextEditingController();
  var passportexpiry = TextEditingController();
  var email = TextEditingController();
  var country = TextEditingController();

  var dob_formated;

  var passport_expiry_formatted;

  bool nonStopFilter = false;

  bool oneStopFilter = false;

  bool onePlusFilter = false;

  bool returnNonStopFilter = false;

  bool returnOneStopFilter = false;

  bool returnOnePlusFilter = false;

  FlightResultsModel(this._requestData){

    _flightService = GetIt.instance<FlightService>();
    print(_requestData.oneway);
    print(requestData.locale);
    getFlightsList();
  }

   void changeChildSelection(int i){

    if(childSelectionList[i]){
      childSelectionList[i] = false;

    }else{
      childSelectionList[i] =true;
    }
    notifyListeners();
  }

  void changeInfantSelection(int i){

    if(infantSelectionList[i]){
      infantSelectionList[i] = false;

    }else{
      infantSelectionList[i] =true;
    }
    notifyListeners();
  }

  void changeAdultSelection(int i){

    if(adultSelectionList[i]){
      adultSelectionList[i] = false;

    }else{
      adultSelectionList[i] =true;
    }
    notifyListeners();
  }



  updateFlightCount(int length){

    flightResultsCount = length;
    //notifyListeners();

  }


  cardDetailsChanged(){

    notifyListeners();

  }




//  void changeStopSelection(String value) {
//
//    StopFilterValue = value;
//      switch (value) {
//        case 'one':
//          StopsFilterCount = 1;
//          break;
//        case 'zero':
//          StopsFilterCount = 0;
//          break;
//        case 'onePlus':
//          StopsFilterCount = 2;
//          break;
//
//      }
//      print(StopsFilterCount);
//      notifyListeners();//Debug the choice in console
//
//  }
//
//  void changeReturnStopSelection(String value) {
//
//    Return_StopFilterValue = value;
//    switch (value) {
//      case 'one':
//        Return_StopsFilterCount = 1;
//        break;
//      case 'zero':
//        Return_StopsFilterCount = 0;
//        break;
//      case 'onePlus':
//        Return_StopsFilterCount = 2;
//        break;
//
//    }
//    print(Return_StopsFilterCount);
//    notifyListeners();//Debug the choice in console
//
//  }

   changePriceFilterType()  {


    if(Price_Filter){
      Price_Filter=false;
      notifyListeners();

    }else{

      Price_Filter=true;
      notifyListeners();


    }
   // sortPrices();

  }

  changeFilterType()  {

    if(Filter_Destination){
      Filter_Destination=false;
      notifyListeners();

    }else{

      Filter_Destination=true;
      notifyListeners();


    }


  }



//
//  void test(){
//
//
//    var date2 = DateFormat.Hm().parse("06:00");
//
//    print(date2);
//
//    final parsedTime = DateTime.parse("2020-08-23T06:10:00Z").toUtc();
//
//    String time = parsedTime.toLocal().toString();
//
//    final dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time, true).toLocal();
//
//
//    final convertedTime = new DateFormat("HH:mm").format(dateTime);
//
//    var date1 = DateFormat.Hm().parse(convertedTime);
//
//    print(date1);
//
//    print(date2.isBefore(date1));
//
//
//  }



  void changeDepartureTiming(String value){

    if(departure_timing_value == value){

      departure_timing_value = null;
    }else{
      departure_timing_value= value;


      switch(departure_timing_value){

        case strings.time_00_06 :

         Departure_FromRange =  DateFormat.Hm().parse("00:00");
         Departure_ToRange = DateFormat.Hm().parse("06:00");
         break;

        case strings.time_06_12 :

          Departure_FromRange =  DateFormat.Hm().parse("06:00");
          Departure_ToRange = DateFormat.Hm().parse("12:00");
          break;

        case strings.time_12_18 :

          Departure_FromRange =  DateFormat.Hm().parse("12:00");
          Departure_ToRange = DateFormat.Hm().parse("18:00");
          break;

        case strings.time_18_00 :

          Departure_FromRange =  DateFormat.Hm().parse("18:00");
          Departure_ToRange = DateFormat.Hm().parse("00:00");
          break;

      }

    }

    notifyListeners();

   // print(departure_timing_value);
  }

  void changeArrivalTiming(String value){

    if(arrival_timing_value == value){

      arrival_timing_value = null;

    }else{
      arrival_timing_value= value;


      switch(arrival_timing_value){

        case strings.time_00_06 :

          Arrival_FromRange =  DateFormat.Hm().parse("00:00");
          Arrival_ToRange = DateFormat.Hm().parse("06:00");
          break;

        case strings.time_06_12 :

          Arrival_FromRange =  DateFormat.Hm().parse("06:00");
          Arrival_ToRange = DateFormat.Hm().parse("12:00");
          break;

        case strings.time_12_18 :

          Arrival_FromRange =  DateFormat.Hm().parse("12:00");
          Arrival_ToRange = DateFormat.Hm().parse("18:00");
          break;

        case strings.time_18_00 :

          Arrival_FromRange =  DateFormat.Hm().parse("18:00");
          Arrival_ToRange = DateFormat.Hm().parse("00:00");
          break;

      }

    }

    notifyListeners();

   // print(arrival_timing_value);
  }



  void R_changeDepartureTiming(String value){

    if(Return_departure_timing_value == value){

      Return_departure_timing_value = null;
    }else{
      Return_departure_timing_value= value;


      switch(Return_departure_timing_value){

        case strings.time_00_06 :

          Return_Departure_FromRange =  DateFormat.Hm().parse("00:00");
          Return_Departure_ToRange = DateFormat.Hm().parse("06:00");
          break;

        case strings.time_06_12 :

          Return_Departure_FromRange =  DateFormat.Hm().parse("06:00");
          Return_Departure_ToRange = DateFormat.Hm().parse("12:00");
          break;

        case strings.time_12_18 :

          Return_Departure_FromRange =  DateFormat.Hm().parse("12:00");
          Return_Departure_ToRange = DateFormat.Hm().parse("18:00");
          break;

        case strings.time_18_00 :

          Return_Departure_FromRange =  DateFormat.Hm().parse("18:00");
          Return_Departure_ToRange = DateFormat.Hm().parse("00:00");
          break;

      }

    }

    notifyListeners();

    print(Return_departure_timing_value);
  }

  void R_changeArrivalTiming(String value){

    if(Return_arrival_timing_value == value){

      Return_arrival_timing_value = null;

    }else{
      Return_arrival_timing_value= value;


      switch(Return_arrival_timing_value){

        case strings.time_00_06 :

          Return_Arrival_FromRange =  DateFormat.Hm().parse("00:00");
          Return_Arrival_ToRange = DateFormat.Hm().parse("06:00");
          break;

        case strings.time_06_12 :

          Return_Arrival_FromRange =  DateFormat.Hm().parse("06:00");
          Return_Arrival_ToRange = DateFormat.Hm().parse("12:00");
          break;

        case strings.time_12_18 :

          Return_Arrival_FromRange =  DateFormat.Hm().parse("12:00");
          Return_Arrival_ToRange = DateFormat.Hm().parse("18:00");
          break;

        case strings.time_18_00 :

          Return_Arrival_FromRange =  DateFormat.Hm().parse("18:00");
          Return_Arrival_ToRange = DateFormat.Hm().parse("00:00");
          break;

      }

    }

    notifyListeners();

    print(Return_arrival_timing_value);
  }








  void _setloading(bool value) {
    loading = value;
    notifyListeners();
  }


  Future<FlightSearchResponseData> getFlightsList() async {

    SearchFlights searchFlights;
    SearchFlightsRound searchFlightsRound;


    if(_requestData.flightType=="oneway") {
      searchFlights = SearchFlights(
          adults: _requestData.adults.toString(),
          children: _requestData.children.toString(),
          infants: _requestData.infants.toString(),
          dateFrom: _requestData.dateFrom,
          dateTo: _requestData.dateTo,
          flightType: _requestData.flightType,
          locale: _requestData.locale,
          curr: _requestData.curr,
          selectedCabins: _requestData.selectedCabins,
          maxStopovers: _requestData.maxStopovers,
          vehicleType: _requestData.vehicleType,
          flyFrom: _requestData.flyFrom,
          flyTo: _requestData.flyTo,
          partnerMarket: "",
          sort: _requestData.sort
      );
    }else{

      searchFlightsRound = SearchFlightsRound(
        adults: _requestData.adults.toString(),
        children: _requestData.children.toString(),
        infants: _requestData.infants.toString(),
        dateFrom: _requestData.dateFrom,
        dateTo: _requestData.dateTo,
        flightType: _requestData.flightType,
        locale: _requestData.locale,
        curr: _requestData.curr,
        selectedCabins: _requestData.selectedCabins,
        maxStopovers: _requestData.maxStopovers,
        vehicleType: _requestData.vehicleType,
        flyFrom: _requestData.flyFrom,
        flyTo: _requestData.flyTo,
        partnerMarket: "",
        sort: _requestData.sort,
        returnFrom:_requestData.returnFrom ,
        returnTo: _requestData.returnTo ,
      );

    }





    flightSearchResponseData = await _flightService.getFlights(_requestData.flightType=="oneway"?searchFlights:searchFlightsRound);

    flightSearchResponse =  flightSearchResponseData.flightSearchResponse;


    if(!flightSearchResponse.isError){
      setData();
    }


    _setloading(false);

  }

  String getConvertedTime(String convertTime){

//    final parsedTime = DateTime.parse(convertTime).toUtc();
//
//    String time = parsedTime.toLocal().toString();

    final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(convertTime, false);

    final convertedTime = new DateFormat("HH:mm").format(dateTime);

    return convertedTime;


  }

  String getConvertedDate(String convertDate){

//    final parsedDate = DateTime.parse(convertDate).toUtc();
//
//    String time = parsedDate.toLocal().toString();

    final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(convertDate, false).toLocal();

    final convertedDate = new DateFormat("dd-MMM").format(dateTime);

    return convertedDate;

  }

  String getTimeDifference( int seconds){

    print(seconds);


    String formatTime(int timeNum) {
      return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
    }

//    final parsedDepartureTime = DateTime.parse(Departure).toUtc();
//
//    String time1 = parsedDepartureTime.toLocal().toString();
//
//    final departureTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time1, true).toLocal();
//
//    print("departure  $departureTime");
//
//
//
//    final parsedArrivalTime = DateTime.parse(Arrival).toUtc();
//
//    String time2 = parsedArrivalTime.toLocal().toString();
//
//    final arrivalTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time2, true).toLocal();
//
//    print("departure  $arrivalTime");
//
//
//
//
//
//
//    var different=departureTime.difference(arrivalTime);
//
//    print("Difference${different.inSeconds}");
//
//    var seconds = different.inSeconds;



    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    //int second = seconds % 60;
    return formatTime(hour) + " Hrs " + formatTime(minute) + " min ";







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

  getAirLineImages(FlightSearchResponseFlights flightList) {

    List<Widget> AirlineImages = List();

    List<String> codes  = [""];

    for(int i = 0; i < flightList.route.length ;i++){



      for(int j =0 ; j<flightList.airlinesMeta.length; j++ ){


        if(flightList.route[i].airline==flightList.airlinesMeta[j].code){

          if(codes.contains(flightList.airlinesMeta[j].code.toString())) {

            print("Airline Already Exists");

          } else {
            AirlineImages.add(
                Container(child: Image.network(flightList.airlinesMeta[j].image128,height: 25,width: 25,),
                  margin: EdgeInsets.only(left: 2,right: 2),
                )
            );

            codes.add(flightList.airlinesMeta[j].code.toString());
          }

        }

      }

    }
    return AirlineImages;

  }

  getAirLineImagesRound(List<FlightSearchResponseRoute> FlightList, FlightSearchResponseFlights flight, int travel,) {



    List<Widget> AirlineImages = List();

    List<String> codes  = [""];

    for(int i = 0; i < FlightList.length ;i++) {

      print(FlightList[i].return__);

      if (FlightList[i].return__ == travel){

        for (int j = 0; j < flight.airlinesMeta.length; j++) {

          if (FlightList[i].airline == flight.airlinesMeta[j].code) {

            if (codes.contains(flight.airlinesMeta[j].code.toString())) {

              print("Airline Already Exists");

            } else {

              AirlineImages.add(

                  Container(child: Image.network(

                    flight.airlinesMeta[j].image128, height: 25, width: 25,),

                    margin: EdgeInsets.only(left: 2, right: 2),

                  )

              );

              codes.add(flight.airlinesMeta[j].code.toString());
            }
          }

        }
    }

    }
    return AirlineImages;

  }

  String formatNumber(String string) {
    final format = NumberFormat.decimalPattern('en');
    return format.format(double.parse(string));
  }

  Future<CheckAvailabilityResponse>checkFlightAvailability(FlightSearchResponseFlights flight) async {

    checkAvailabilityRequest = CheckAvailability_Request(
      children: requestData.children,
      adults: requestData.adults,
      infants: requestData.infants,
      currency: requestData.curr,
      bnum: requestData.adults+requestData.children+requestData.infants,
      pnum: requestData.adults+requestData.children+requestData.infants,
      tpa: flight.tpa,
      options: flight.options,
    );


    checkAvailabilityResponse = await _flightService.checkFlightAvailability(checkAvailabilityRequest);



    return checkAvailabilityResponse;



  }







    applyFilters(){

    oneWayFilter=false;
    roundTripFilter =false;
    filterCount = 0;
    Departure_Filter = false;
    Arrival_Filter = false;
    Stops_Filter =false;
    Return_Departure_Filter = false;
    Return_Arrival_Filter = false;
    Return_Stops_Filter=false;


    if(departure_timing_value!=null){

      Departure_Filter = true;

      filterCount++;

      oneWayFilter = true;

    }
    if(arrival_timing_value!=null){

      Arrival_Filter = true;

      filterCount++;

      oneWayFilter = true;

    }
    if(oneStopFilter||onePlusFilter||oneStopFilter){

      Stops_Filter =true;

      filterCount++;

      oneWayFilter =true;

    }if(selectedAirlineFilterList.isNotEmpty){

      filterCount++;

    }if(!requestData.oneway){

      if(Return_departure_timing_value!=null){

        Return_Departure_Filter = true;

        filterCount++;

        roundTripFilter  = true;

      }
      if(Return_arrival_timing_value!=null){

        Return_Arrival_Filter = true;

        filterCount++;

        roundTripFilter = true;

      }
      if(Return_StopsFilterCount!=null){

        Return_Stops_Filter =true;

        filterCount++;

        roundTripFilter = true;

      }


    }


    Filter_Applied =true;

    setData();

    notifyListeners();


  }

  clearFilters(){

    departure_timing_value = null;

    arrival_timing_value = null;

    Departure_Filter = false;

    Arrival_Filter = false;

    Stops_Filter =false;

    StopsFilterCount = null;

    StopFilterValue =null;

    selectedAirlineFilterList.clear();

    Return_departure_timing_value = null;

    Return_arrival_timing_value = null;

    Return_Departure_Filter = false;

    Return_Arrival_Filter = false;

    Return_Stops_Filter =false;

    Return_StopsFilterCount = null;

    Return_StopFilterValue =null;

    filterCount = 0;

    Filter_Applied =false;

     nonStopFilter = false;

     oneStopFilter = false;

     onePlusFilter = false;

     returnNonStopFilter = false;

     returnOneStopFilter = false;

     returnOnePlusFilter = false;

    setData();

    notifyListeners();

  }



  getLocalTimes(String times) {

    final parsedTime = DateTime.parse(times).toUtc();

    String time = parsedTime.toLocal().toString();

    final dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time, true).toLocal();


    final convertedTime = new DateFormat("HH:mm").format(dateTime);

    return DateFormat.Hm().parse(convertedTime);




  }

 sortPrices(){

    if (Price_Filter) {

      Comparator <FlightSearchResponseFlights> priceComparator = (
          a, b) => -a.displayRateInfoWithMarkup.totalPriceWithMarkup.compareTo(b.displayRateInfoWithMarkup.totalPriceWithMarkup);
     flightList.sort(priceComparator);



    } else {

      Comparator<FlightSearchResponseFlights> priceComparator = (
          a, b) => a.displayRateInfoWithMarkup.totalPriceWithMarkup.compareTo(b.displayRateInfoWithMarkup.totalPriceWithMarkup);
      flightList.sort(priceComparator);



    }

  }




   setData() {
     flightList = [];

     flightList.addAll(flightSearchResponse.result.flights);

     airlineFilterList =[];

     airlineFilterList.addAll(flightSearchResponse.result.airlinesFilters);

     if (Filter_Applied) {

       if (Departure_Filter) {
         flightList = flightList.where((results) {
           DateTime filterDate = getLocalTimes(results.onewayLocalDeparture.toString());

           return filterDate.isAfter(Departure_FromRange) &&
               filterDate.isBefore(Departure_ToRange);
         }).toList();
       }
       if (Arrival_Filter) {
         flightList = flightList.where((results) {
           DateTime filterDate = getLocalTimes(results.onewayLocalArrival.toString());
           return filterDate.isAfter(Arrival_FromRange) &&
               filterDate.isBefore(Arrival_ToRange);
         }).toList();
       }
       if (onePlusFilter) {
         flightList =
             flightList.where((results) => results.onewaystopsCount > 1)
                 .toList();
       }
       if (oneStopFilter) {
         flightList =
             flightList.where((results) => results.onewaystopsCount == 1)
                 .toList();
       }
       if (nonStopFilter) {
         flightList =
             flightList.where((results) => results.onewaystopsCount == 0)
                 .toList();
       }
       if (Return_Departure_Filter) {
         flightList = flightList.where((results) {
           DateTime filterDate = getLocalTimes(results.returnLocalDeparture.toString());

           return filterDate.isAfter(Return_Departure_FromRange) &&
               filterDate.isBefore(Return_Departure_ToRange);
         }).toList();
       }

       if (Return_Arrival_Filter) {

         flightList = flightList.where((results) {
           DateTime filterDate = getLocalTimes(results.returnLocalArrival.toString());

           return filterDate.isAfter(Return_Arrival_FromRange) &&
               filterDate.isBefore(Return_Arrival_ToRange);
         }).toList();
       }

       if (returnOnePlusFilter) {
         flightList =
             flightList.where((results) => results.returnwaystopsCount > 1)
                 .toList();
       }

       if (returnOneStopFilter) {
         flightList =
             flightList.where((results) => results.returnwaystopsCount == 1)
                 .toList();
       }

       if (returnNonStopFilter) {
         flightList =
             flightList.where((results) => results.returnwaystopsCount == 0)
                 .toList();
       }
       if(selectedAirlineFilterList.isNotEmpty){



         flightList =  flightList.where((element) {
           bool available = false;
           element.airlinesMeta.forEach((innerElement) {
             selectedAirlineFilterList.forEach((filterElement) {
               if (innerElement.name==filterElement.meta.name) {
                 available = true;
               }
             });
           });
           return available;
         }).toList();



       }





       notifyListeners();
     }
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



  getArguments() {

    FlightResultsData  flightResultsData =
    FlightResultsData(requestData: requestData,
                       correlationId: flightSearchResponseData.correlationId,
                       tpa: tpa,
                       options: options,
                       taxAndOtherCharges: taxAndOtherCharges,
                        baseRate: baseRate,
                        fXRate: fXRate,
                        selectedList: selectedList,
                        currency: currency,
                        totalPriceWithMarkup: totalPriceWithMarkup);

    return flightResultsData;

  }

  void changeStops(bool value, stopType) {

    if(stopType=='one'){

      oneStopFilter = value;

    }else if(stopType=='onePlus'){

      onePlusFilter = value;

    }else if(stopType=='zero'){

      nonStopFilter = value;

    }else if(stopType=='return_one'){

      returnOneStopFilter = value;

    }else if(stopType=='return_onePlus'){

      returnOnePlusFilter = value;

    }else if(stopType=='return_zero'){

      returnNonStopFilter = value;

    }
    notifyListeners();

   // setStopsFilter();

  }



  checkAppliedCategories(int index) {

      if (selectedAirlineFilterList.contains(airlineFilterList[index])) {
        return true;
      } else {
        return false;
      }


  }

  void filtersAddAndRemove(int index) {

    if (selectedAirlineFilterList.contains(airlineFilterList[index])) {
      selectedAirlineFilterList.remove(airlineFilterList[index]);
    } else {
      selectedAirlineFilterList.add(airlineFilterList[index]);
    }
    notifyListeners();

  }




}

