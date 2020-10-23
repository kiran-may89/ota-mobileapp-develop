
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/activity/activity_booking_response_entity.dart';
import 'package:ota/models/activity/request/activity_booking_request.dart';
import 'package:ota/models/activity/request/activity_traveller_data.dart';
import 'package:ota/models/activity/request/booking_data.dart';
import 'package:ota/net/service/activity/activity_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/viewmodels/activities_view_models/data_models/activity_summary_info.dart';

class ActivityCCModel extends ChangeNotifier{



  TextEditingController cardNumber = TextEditingController();

  TextEditingController expiryDate = MaskedTextController(mask: '00/00');

  TextEditingController cardHolderName = TextEditingController();

  TextEditingController cvvCode = TextEditingController();

  bool isCvvFocused = false;

  ActivityTravellerData data;

  ActivityCCModel(this.data){


    _activityService = GetIt.instance<ActivityService>();
  }

  ActivityService _activityService;

  ActivityBookingResponseEntity activityBookingResponseEntity;




  cardDetailsChanged(){

    notifyListeners();

  }

  Future<ActivityBookingResponseEntity>bookTheActivity() async {


    ActivityBookingRequest activityBookingRequest;


    activityBookingRequest =
        ActivityBookingRequest(
          summaryInfo: getSummaryInfo(),
          reservationDate: data.selectedModalityDate,
          returnDate: null,
          travellerDetails: data.travellerList,
          tpaType: 5,
          totalAmountMarkup: data.totalAmountWithMarkup.displayRateInfoWithMarkup.totalPriceWithMarkup,
          totalAmount: data.totalAmountWithMarkup.displayRateInfoWithMarkup.supplierTotalCost,
          supplierBaseRate: data.totalAmountWithMarkup.displayRateInfoWithMarkup.supplierBaseRate,
          serviceTypeCode: "",
          serviceId: 5,
          provider: data.requestData.tpaName,
          paymentRequest: getPaymentRequest(),
          userType: "bc",
          userId: SessionManager.getInstance().getUser.sub,
          paymentMode: 1,
          markup: data.totalAmountWithMarkup.displayRateInfoWithMarkup.markup,
          ibanNumber: null,
          correlationId: data.correlationId,
          apiKey: data.tenentId,
          tenantId: data.tenentId,
          location: data.travelDetails.FromPlace,
          reservationRequest: data.options,
          baseRate: data.totalAmountWithMarkup.displayRateInfoWithMarkup.baseRate,
          oTATax: data.totalAmountWithMarkup.displayRateInfoWithMarkup.otaTax,
          taxAndOtherCharges: data.totalAmountWithMarkup.displayRateInfoWithMarkup.taxAndOtherCharges,
         );

          print(jsonEncode(activityBookingRequest.toJson()));



         activityBookingResponseEntity = await _activityService.bookActivity(activityBookingRequest);



return activityBookingResponseEntity;



  }

  getPaymentRequest() {

    PaymentRequest paymentRequest = PaymentRequest(
      bookingId: SessionManager.getInstance().getUser.tenantId,
       userId: SessionManager.getInstance().getUser.sub,
      userType: "bc",
        card: Card(
            expiry: Expiry(
                month: expiryDate.text.substring(0,2),
                year:expiryDate.text.substring(3,5),
            ),
            number: cardNumber.text,
            securityCode: cvvCode.text
        ),
      orderType: "NORMAL",
      mode: "CARD",
      amount: data.totalAmountWithMarkup.displayRateInfoWithMarkup.totalPriceWithMarkup,
      currency: data.totalAmountWithMarkup.displayRateInfoWithMarkup.currency
    );

    return paymentRequest;

  }

  getArgumentData() {

    BookingData bookingData = BookingData(activityName: data.activityName,travellerDetails: data.travellerList,
        totalAmountWithMarkup: data.totalAmountWithMarkup,
    currency: data.Currency,
    duration: data.duration,
    //bookingnumber: activityBookingResponseEntity.result.bookingId,
    activityBookingResponseEntity: activityBookingResponseEntity
    );



    return bookingData;
  }

  getSummaryInfo() {

    ActivitySummaryInfo activitySummaryInfo =
    ActivitySummaryInfo(
        provider: data.provider,
        serviceType: "ACT",
        activityName: data.activityName,
        fromLocationName:data.travelDetails.FromPlace,
        modalityDetails: data.selectedModalityDetails.first,
        selectedPersons: data.travellerList.length

    );

    return jsonEncode(activitySummaryInfo.toJson());

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