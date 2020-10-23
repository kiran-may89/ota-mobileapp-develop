


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/transfers/requests/credit_card_transfers_data.dart';
import 'package:ota/models/transfers/requests/reservation_request.dart';
import 'package:ota/models/transfers/requests/transfer_place_order_request1.dart';
import 'package:ota/models/transfers/requests/transfers_passenger_data.dart';
import 'package:ota/models/transfers/data_model/search_transfer_data.dart';
import 'package:ota/models/transfers/search_transfer_response_entity.dart';
import 'package:ota/models/transfers/search_transfers_response.dart';
import 'package:ota/models/transfers/transfer_booking_response.dart';
import 'package:ota/models/transfers/transfer_booking_response_entity.dart';
import 'package:ota/net/service/transfers/transfer_service.dart';
import 'package:ota/prefs/session_manager.dart';

class TransferCCModel extends ChangeNotifier{

  TransferService  _transferService;

  TextEditingController cardNumber = TextEditingController();

  TextEditingController expiryDate = MaskedTextController(mask: '00/00');

  TextEditingController cardHolderName = TextEditingController();

  TextEditingController cvvCode = TextEditingController();

  bool isCvvFocused = false;

  TransferBookingResponse transferBookingResponse = TransferBookingResponse();

  SearchTransferData  requestData;

  List<Vechile> selectedVehicleData = [];

  ReservationRequestData reservationRequestData ;


  List<TravellerDetails> travellerList  = [];


  TransferPassengerData transferPassengerData;

  BookingRequest bookingRequest ;


  TransferCCModel (this.transferPassengerData){
    requestData = transferPassengerData.requestData;

    selectedVehicleData = transferPassengerData.selectedVehicleData;

    reservationRequestData = transferPassengerData.reservationRequest;

    travellerList = transferPassengerData.travellerDetails;

    _transferService = GetIt.instance<TransferService>();
  }




//  void onCreditCardModelChange(CreditCardModel creditCardModel) {
//
//      cardNumber = creditCardModel.cardNumber;
//      expiryDate = creditCardModel.expiryDate;
//      cardHolderName = creditCardModel.cardHolderName;
//      cvvCode = creditCardModel.cvvCode;
//      isCvvFocused = creditCardModel.isCvvFocused;
//
//      notifyListeners();
//  }


  cardDetailsChanged(){

    notifyListeners();

  }




  getArgumentData() {



    print(jsonEncode(bookingRequest.toJson()));


    return bookingRequest;





  }

  getPaymentData() {

    PaymentRequest paymenRequest = PaymentRequest(
        bookingId: SessionManager.getInstance().getUser.tenantId,
        userId: SessionManager.getInstance().getUser.sub,
        userType: "bc",
        currency: selectedVehicleData.first.displayRateInfoWithMarkup.currency,
        amount: selectedVehicleData.first.displayRateInfoWithMarkup.totalPriceWithMarkup,
        orderType: "NORMAL",
        mode: "CARD",
        card: Card(
          expiry: Expiry(
            month:
            expiryDate.text.substring(0,2),
            year:
              expiryDate.text.substring(3,5),
          ),
        number: cardNumber.text,
        securityCode: cvvCode.text
      )



    );




     return paymenRequest;

  }

   getResrervationReques() {


    ReservationRequest reservationRequest = ReservationRequest(
      transaction: reservationRequestData.transaction,
      options: reservationRequestData.options,
      tpa: reservationRequestData.tpa,
      tpaName: reservationRequestData.tpaName
    );

    return jsonEncode(reservationRequest.toJson());


  }

  Future<TransferBookingResponse>bookTransfer() async {



    bookingRequest =  BookingRequest(
      fromLocation: transferPassengerData.requestData.pichUpPlace,
      toLocation:  transferPassengerData.requestData.dropPlace,
      flightorTrainNumber: null,
      terminalNumber: null,
      distance: 0,
      travelTime: 0,
      userId: SessionManager.getInstance().getUser.sub,
      tenantId: SessionManager.getInstance().getUser.tenantId,
      userType: "bc",
      apiKey: "00000000-0000-0000-0000-000000000001",
      correlationId: transferPassengerData.correlationId,
      summaryInfo: jsonEncode(transferPassengerData.summaryInfo.toJson()),
      reservationDate: transferPassengerData.summaryInfo.pickUpDate,
      returnDate: null,
      reservationRequest: getResrervationReques(),
      paymentRequest: getPaymentData(),
      travellerDetails: travellerList,
      ibanNumber: null,
      paymentMode: 1,
      tpaType: 4,
      serviceId: 4,
      serviceTypeCode: "",
      markup: selectedVehicleData.first.displayRateInfoWithMarkup.markup,
      oTATax: selectedVehicleData.first.displayRateInfoWithMarkup.otaTax,
      provider: selectedVehicleData.first.tpaName,
      baseRate: selectedVehicleData.first.displayRateInfoWithMarkup.baseRate,
      taxAndOtherCharges: selectedVehicleData.first.displayRateInfoWithMarkup.taxAndOtherCharges,
      supplierBaseRate: selectedVehicleData.first.displayRateInfoWithMarkup.supplierBaseRate,
      supportCancellation: false,
      totalAmount: selectedVehicleData.first.displayRateInfoWithMarkup.supplierTotalCost,
      totalAmountMarkup: selectedVehicleData.first.displayRateInfoWithMarkup.totalPriceWithMarkup,
    );

     transferBookingResponse  = await _transferService.bookTransfer(bookingRequest);

     print(transferBookingResponse.result.bookingId);

        return transferBookingResponse;

  }

  getResponse() {

    TransfersCCData transfersCCData = TransfersCCData(selectedVehicleData: selectedVehicleData,transferBookingResponse: transferBookingResponse);

    return transfersCCData;

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























}