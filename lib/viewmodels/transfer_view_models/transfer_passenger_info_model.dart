import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/transfers/requests/reservation_request.dart';
import 'package:ota/models/transfers/requests/transfer_place_order_request1.dart';
import 'package:ota/models/transfers/requests/transfer_summary_info.dart';
import 'package:ota/models/transfers/requests/transfers_passenger_data.dart';
import 'package:ota/models/transfers/data_model/search_transfer_data.dart';
import 'package:ota/models/transfers/search_transfer_response_entity.dart';
import 'package:ota/models/transfers/search_transfers_response.dart';
import 'package:ota/models/transfers/transfer_place_order_response_entity.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/net/service/transfers/transfer_results_data.dart';
import 'package:ota/net/service/transfers/transfer_service.dart';
import 'package:ota/prefs/session_manager.dart';

class TransferPassengerModel extends ChangeNotifier {
  bool loading = true;

  SessionManager sessionManager;

  List<CountryCodesResponseResult> _countryCodes;

  TransferService _transferService;


  var searchCountry = TextEditingController();

  SearchTransferData requestData;

  int selectedCountry = 0;


  String startTrainOrFlightNumber;

  String startTerminalOrCarriageNumber;

  String finishTrainOrFlightNumber;

  String finishTerminalOrCarriageNumber;

  CommonService commonService;

  PhoneNumber phoneNumber ;

  var firstName = new TextEditingController();

  var lastName = new TextEditingController();

  var email = new TextEditingController();

  var countryCode;

//  var countryName  = TextEditingController();

  var telephoneCode;

  var countryName;

  bool expandDetails = false;

  DateTime tempDate;

  String destinationDate;

  String pickUpDate;


  String destinationTime;

  String pickUpTime;

  String formattedDestinationTime;

  String formattedPickUpTime;

  String phoneNumberWithCode;


  List<int> passengerCount;

  int passengers;

  get getDestinationDate => destinationDate!=null?destinationDate:null;


  String getEmail() {
    return email.text.length > 0 ? email.text : null;
  }

  String getName() {
    return firstName.text.length > 0 ? firstName.text : null;
  }

  List<Vechile> selectedVehicleData = [];

  TransferResultsData transferResultsData;

  TransferPassengerModel(this.transferResultsData) {

    selectedVehicleData = transferResultsData.selectedVehicleData;

    requestData = transferResultsData.requestData;

    _transferService = GetIt.instance<TransferService>();

    phoneNumber = PhoneNumber(isoCode: 'UAE');

    commonService = GetIt.instance<CommonService>();

    sessionManager = SessionManager.getInstance();

    passengerCount =  List<int>.generate(selectedVehicleData.first.carClass.capacity, (i) => i + 1);

    if (sessionManager.getCountryCodes == null) {
      getCountryCodes();
    } else {
      _countryCodes = sessionManager.getCountryCodes;
      loading = false;
    }

  }

  CountryCodesResponseEntity codesResponseEntity;

  TransferPlaceOrderResponseEntity transferPlaceOrderResponseEntity = TransferPlaceOrderResponseEntity();

  Future<TransferPlaceOrderResponseEntity> placeTransferOrder() async {

    TransferPlaceOrderRequest transferPlaceOrderRequest;

    transferPlaceOrderRequest = TransferPlaceOrderRequest(

      tenantId: SessionManager.getInstance().getUser.tenantId,

      currency: requestData.currency,

      lang: "en",

      trips: getTrips(),
    );

    print(jsonEncode(transferPlaceOrderRequest.toJson()));

    transferPlaceOrderResponseEntity = await _transferService.placeOrder(transferPlaceOrderRequest);

    return transferPlaceOrderResponseEntity;
  }

  getTrips() {
    List<Trips> tripsList = List();

    print(selectedVehicleData.first.finishPlace.typeTitle);

    Trips trip = Trips(


        startLocation: StartLocation(
          terminalNumber:
          selectedVehicleData.first.startPlace.terminal.isNotEmpty&&
              selectedVehicleData.first.startPlace.typeTitle=="Airport"?startTerminalOrCarriageNumber:"0",
          address: requestData.pichUpPlace,
          flightNumber: selectedVehicleData.first.startPlace.terminal.isNotEmpty&&
              selectedVehicleData.first.startPlace.typeTitle=="Airport"?startTrainOrFlightNumber:"0",
          location: "${requestData.startPoint.lat},${requestData.startPoint.lng}",
          time: (pickUpDate+" "+formattedPickUpTime),
          trainCarriageNumber: selectedVehicleData.first.startPlace.terminal.isNotEmpty&&
              selectedVehicleData.first.startPlace.typeTitle!="Airport"?startTerminalOrCarriageNumber:"0",

          trainNumber: selectedVehicleData.first.startPlace.terminal.isNotEmpty&&
              selectedVehicleData.first.startPlace.typeTitle!="Airport"?startTrainOrFlightNumber:"0",
        ),
        finishLocation: StartLocation(
          terminalNumber: selectedVehicleData.first.finishPlace.terminal.isNotEmpty&&
              selectedVehicleData.first.startPlace.typeTitle=="Airport"?finishTerminalOrCarriageNumber:"0",
          address: requestData.dropPlace,

          flightNumber: selectedVehicleData.first.finishPlace.terminal.isNotEmpty&&
              selectedVehicleData.first.startPlace.typeTitle=="Airport"?finishTrainOrFlightNumber:"0",

          location: "${requestData.finishPoint.lat},${requestData.finishPoint.lng}",

          time: selectedVehicleData.first.finishPlace.terminal.isEmpty?
          (pickUpDate+" "+formattedPickUpTime):(destinationDate+" "+formattedDestinationTime),

          trainCarriageNumber: selectedVehicleData.first.finishPlace.terminal.isNotEmpty&&
              selectedVehicleData.first.startPlace.typeTitle!="Airport"?finishTerminalOrCarriageNumber:"0",

          trainNumber: selectedVehicleData.first.finishPlace.terminal.isNotEmpty&&
              selectedVehicleData.first.startPlace.typeTitle!="Airport"?finishTrainOrFlightNumber:"0",

        ),

        additionalLocation: [],
        passengers: getPassengerList(),
        passengersNumber: 1,
        textTablet: "",
        comment: "",
        additionalChangeItinerary: 1,
        additionalWait: 1,
        fareOnTollRoad: 1,
        sendParams: SendParams(),
        isRoundTrip: !requestData.oneWay,
        tpa: selectedVehicleData.first.tpa,
        tpaName: selectedVehicleData.first.tpaName,
        options: selectedVehicleData.first.options,

    );

    tripsList.add(trip);

    return tripsList;
  }

  getPassengerList() {
    Passengers passengers = Passengers(phone: phoneNumberWithCode, email: email.text, name: firstName.text);
    List<Passengers> passengerList = List();
    passengerList.add(passengers);
    return passengerList;
  }



  getArgumentData() {
    print(transferResultsData.correlationId);
    TransferPassengerData transferPassengerData =
    TransferPassengerData(
        selectedVehicleData: selectedVehicleData,
        requestData: requestData,
        reservationRequest: getReservationRequestData(),
        travellerDetails: getTravellerDetails(),
        summaryInfo: getSummaryInfo(),
        correlationId: transferResultsData.correlationId
    );
    return transferPassengerData;
  }



  getReservationRequestData() {
    ReservationRequestData reservationRequest;

    reservationRequest = ReservationRequestData(
      tpaName: selectedVehicleData.first.tpaName,
      tpa: selectedVehicleData.first.tpa,
      options: selectedVehicleData.first.options,
      transaction: transferPlaceOrderResponseEntity.result.result.first.transaction,
    );

    return reservationRequest;
  }



  getTravellerDetails() {
    List<TravellerDetails> travellereDetailsList = [];

    TravellerDetails travellerDetails = TravellerDetails(
        firstname: firstName.text,
        lastname: lastName.text,
        gender: 0,
        dob: "2020-07-20T13:27:59.789Z",
        phoneNumber: phoneNumberWithCode,
        phoneNumberCode: telephoneCode,
        email: email.text,
        country: countryName,
        nationality: countryCode,
        countryCode: countryCode,
        address: "",
        passport: "",
        passportExpirationDate: "2020-07-20T13:27:59.789Z",
        isPrimary: true,
        relation: ""
    );
    travellereDetailsList.add(travellerDetails);

    return travellereDetailsList;
  }



  void getCountryCodes() async {
    var result = await commonService.getCountryCodes();
    _countryCodes = result.result;
    state = false;
  }

  set state(bool value) {
    loading = value;
    notifyListeners();
  }



  void changeCountryCodeSelection(String value) {
    for (int i = 0; i < _countryCodes.length; i++) {
      if ("+" + _countryCodes[i].telephoneCode == value) {
        selectedCountry = i;
        telephoneCode = _countryCodes[i].telephoneCode;
        countryCode = _countryCodes[i].alpha2Code;
        countryName  = _countryCodes[i].name;

        break;
      }
    }

  }


  List<CountryCodesResponseResult> get countryCodes => sessionManager.getCountryCodes;

   showDetails() {

    if(expandDetails){
      expandDetails = false;
    }else{
      expandDetails = true;
    }
    notifyListeners();

  }

  void setPassengerCount(newValue) {

    passengers = newValue;

    notifyListeners();
  }

  dataChanged(String value) {

    firstName.text = value;

    notifyListeners();
  }

  void setSelectedDate( String selectionType) {

    var date =   DateFormat("yyyy-MM-dd").format(tempDate);

    if(selectionType=="destination"){

      destinationDate =  date;

    }else{

      pickUpDate = date;

    }




     notifyListeners();


  }

  void setTempDate(DateTime selectedDate) {

    tempDate = selectedDate;
    notifyListeners();

  }

  void setTime(String time, String selectionType, String formattedTime) {

    if(selectionType=="destination"){

      destinationTime =  time;

      formattedDestinationTime = formattedTime;

    }else{

      pickUpTime = time;

      formattedPickUpTime = formattedTime;

    }

    notifyListeners();

  }

  void changeTrainFlightNumber(String value, String stopType) {

    if(stopType=="start"){

    startTrainOrFlightNumber = value;


    }else{

    finishTrainOrFlightNumber = value;

    }



  }

  getSummaryInfo() {

     TransferSummaryInfo transferSummaryInfo = TransferSummaryInfo(
       serviceType: "TRF",
       trips: getTrips(),
       carClass: selectedVehicleData.first.carClass,
       provider: selectedVehicleData.first.tpaName,
       pickUpDate: pickUpDate,
       pickUpTime: formattedPickUpTime,
       code: null
     );
     return transferSummaryInfo;
  }

  void setCarriageTerminalNumber(newValue, String type) {

     if(type=="start"){
       startTerminalOrCarriageNumber = newValue;

     }else{

       finishTerminalOrCarriageNumber = newValue;


     }
     notifyListeners();



  }



}
