

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:ota/models/flights/flight_booking_res.dart';
import 'package:ota/models/flights/flight_booking_response_entity.dart';
import 'package:ota/models/flights/flight_savebooking_response.dart';
import 'package:ota/models/flights/requests/flight_booking_request.dart';
import 'package:ota/models/flights/requests/flight_save_booking_request.dart';
import 'package:ota/net/service/delegate.dart';
import 'package:ota/net/service/flight_service/flight_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_booking_data.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/summary_info.dart' as summary;
import 'package:ota/views/flights/flight_booking.dart';

import 'data_models/flight_travel_info_model.dart';

class FlightCCModel extends ChangeNotifier{


  TextEditingController cardNumber = TextEditingController();

  TextEditingController expiryDate =  MaskedTextController(mask: '00/00');

  TextEditingController cardHolderName = TextEditingController();

  TextEditingController cvvCode = TextEditingController();

  FlightService  _flightService;
  Delegate _delegate;

  bool isCvvFocused = false;

  String bookingId;


  FlightSaveBookingRequest flightSaveBookingRequest;

  FlightBookingRequest flightBookingRequest;

  FlightBookingRes fligthBookingRes;


  FlightTravelInfoData flightTravelInfoData;

  FlightCCModel(this.flightTravelInfoData,Delegate delegate){

    _flightService = GetIt.instance<FlightService>();
    _delegate =delegate;
  }


  FlightSaveBookingResponse flightSaveBookingResponse = FlightSaveBookingResponse();


  Future<FlightSaveBookingResponse> saveBooking() async {

    flightSaveBookingRequest = flightTravelInfoData.flightSaveBookingRequest;

    print(jsonEncode(flightSaveBookingRequest.toJson()));

    var json = jsonEncode(flightSaveBookingRequest.toJson());

    flightSaveBookingResponse = await _flightService.saveBooking(flightSaveBookingRequest);

    if(flightSaveBookingResponse.isError)
      _delegate.onError("Booking failed ,please try another flight",false,"assets/images/flights.png");
    print(flightSaveBookingResponse.message);

    return flightSaveBookingResponse;

  }

  cardDetailsChanged(){

    notifyListeners();

  }
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    cardNumber.text = creditCardModel.cardNumber.replaceAll(" ", "");

    if (creditCardModel.expiryDate.isNotEmpty && creditCardModel.expiryDate.contains("/")) {
      expiryDate.text = creditCardModel.expiryDate;
    }

    cvvCode.text = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
    cardHolderName.text = creditCardModel.cardHolderName;
    notifyListeners();
  }

  Future<FlightBookingRes>bookFlight() async{

   var request =  getRequest();


fligthBookingRes = await _flightService.bookFlight(request);
if(fligthBookingRes.isError)
  _delegate.onError("Booking failed ,please try another flight",true,"assets/images/flights.png");


  // print(jsonEncode(fligthBookingRes.toJson()));






  }

  getRequest() {

    flightBookingRequest =
        FlightBookingRequest(
          tenantId: SessionManager.getInstance().getUser.tenantId,
          userId: SessionManager.getInstance().getUser.sub,
          supportCancellation: false,
          ibanNumber: null,
          reservationRequest: getReservationRequest(),
          travellerDetails: flightTravelInfoData.traveldetails,
          correlationId: flightTravelInfoData.flightResultsData.correlationId.toString(),
          paymentMode: 1,
          userType: "bc",
          reservationNumber: flightSaveBookingResponse.result.bookingId.toString(),
          reservationDate: DateFormat("MM/dd/yyyy").format(DateFormat("dd/MM/yyyy").parse(flightTravelInfoData.flightResultsData.requestData.dateFrom)),
          returnDate: flightTravelInfoData.flightResultsData.requestData.flightType=="oneway"?null:DateFormat("MM/dd/yyyy").format(DateFormat("dd/MM/yyyy").parse(flightTravelInfoData.flightResultsData.requestData.dateTo)),
          paymentRequest: getPaymentRequest(),
          serviceId: 3,
          provider: flightTravelInfoData.flightResultsData.tpa,
          serviceTypeCode: getServiceCode(),
          summaryInfo: getSummaryInfo(),
          oTATax: flightTravelInfoData.flightResultsData.selectedList.first.displayRateInfoWithMarkup.otaTax.toString(),
          baseRate: flightTravelInfoData.flightResultsData.selectedList.first.displayRateInfoWithMarkup.baseRate.toString(),
          taxAndOtherCharges: flightTravelInfoData.flightResultsData.selectedList.first.displayRateInfoWithMarkup.taxAndOtherCharges.toString(),
          markup: flightTravelInfoData.flightResultsData.selectedList.first.displayRateInfoWithMarkup.markup.toString(),
          supplierBaseRate: flightTravelInfoData.flightResultsData.selectedList.first.displayRateInfoWithMarkup.supplierBaseRate.toString(),
          tpaType: 1,
          totalAmount: flightTravelInfoData.flightResultsData.selectedList.first.displayRateInfoWithMarkup.supplierTotalCost.toString(),
          totalAmountMarkup: flightTravelInfoData.flightResultsData.selectedList.first.displayRateInfoWithMarkup.totalPriceWithMarkup.toString(),
    
        );


    print(jsonEncode(flightBookingRequest.toJson()));
    var json =  jsonEncode(flightBookingRequest.toJson());
    return flightBookingRequest;


  }

  getPaymentRequest() {


    PaymentRequest paymentRequest = PaymentRequest(
        userType: "bc",
      userId: SessionManager.getInstance().getUser.sub,
        currency: flightTravelInfoData.flightResultsData.currency,
        amount:flightTravelInfoData.flightResultsData.totalPriceWithMarkup.toString(),
        mode:"CARD",
        orderType:"NORMAL",
        card:

        Card(
        expiry: Expiry(
        month:
        expiryDate.text.substring(0,2),
        year:
        expiryDate.text.substring(3,5),
        ),
        number: cardNumber.text,
        securityCode: cvvCode.text
        ),

    );


    return paymentRequest;




  }

  getServiceCode() {


    var service_code  = flightTravelInfoData.flightResultsData.selectedList.first.airlinesMeta.first.name+"-"+flightTravelInfoData.flightResultsData.selectedList.first.route.first.flightNo.toString();



return service_code;


  }

  getSummaryInfo() {


   summary.SummaryInfo summaryInfo =
    summary.SummaryInfo(provider: flightTravelInfoData.flightResultsData.tpa,
                            returnDate:flightTravelInfoData.flightResultsData.requestData.flightType=="oneway"?null:DateFormat("MM/dd/yyyy").format(DateFormat("dd/MM/yyyy").parse(flightTravelInfoData.flightResultsData.requestData.dateTo)),
                            reservationDate: DateFormat("MM/dd/yyyy").format(DateFormat("dd/MM/yyyy").parse(flightTravelInfoData.flightResultsData.requestData.dateFrom)),
                             flight: flightTravelInfoData.flightResultsData.selectedList,
                              flightType:flightTravelInfoData.flightResultsData.requestData.flightType,
                               selectedCabins:flightTravelInfoData.flightResultsData.requestData.selectedCabins,
                                 serviceType:"FLT");



return jsonEncode(summaryInfo.toJson());


  }

  getReservationRequest() {


    //ReservationRequest request = ReservationRequest(tpa:flightTravelInfoData.flightResultsData.tpa,options: flightTravelInfoData.flightResultsData.options);

   return flightSaveBookingResponse.result.toJson();


  }

  getArguments() {

    FlightBookingData flightBookingData = FlightBookingData(flightBookingRes: fligthBookingRes, flightTravelInfoData: flightTravelInfoData);


        return flightBookingData;

  }







}