import 'dart:convert';

import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:get_it/get_it.dart';

import 'package:ota/models/hotels/payments/request/card.dart';
import 'package:ota/models/hotels/responses/hotel_details_response.result.dart';
import 'package:ota/net/service/hotel/hotels_service.dart';
import 'package:ota/viewmodels/base_view_model.dart';
import 'package:ota/models/hotels/payments/request/hotel_payment_model.dart';
import 'package:ota/models/hotels/payments/response/HotelBookingResponse.dart';
import 'package:ota/models/hotels/payments/request/card.dart' as HotelCard;

class HotelPaymentViewModel extends BaseViewModel {
  HotelDetailsResponseResult hotel;
  HotelPaymentModel _paymentModel;
  int totalGuest = 0;
  int selectGroup;
  HotelService _service;
  bool _isCardMode = true;
  HotelCard.Card card;

  bool isCvvFocused = false;
  String holderName = "";

  HotelPaymentViewModel(this.hotel, this.selectGroup, this._paymentModel) {
    generateTotalGuests();
    _service = GetIt.instance<HotelService>();
    card = HotelCard.Card(expiry: Expiry());
  }

  get isCardMode => _isCardMode;

  void changeCardMode() {
    _isCardMode = !_isCardMode;
    notifyListeners();
  }

  @override
  void initialise() {}

  void generateTotalGuests() {
    hotel.hotel.roomOption[selectGroup].rooms.forEach((element) {
      totalGuest += element.noOfAdults;
    });
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    card.number = creditCardModel.cardNumber.replaceAll(" ", "");

    if (creditCardModel.expiryDate.isNotEmpty && creditCardModel.expiryDate.contains("/")) {
      card.expiry.month = creditCardModel.expiryDate.split("/")[0];
      card.expiry.year = creditCardModel.expiryDate.split("/")[1];
    }

    card.securityCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
    holderName = creditCardModel.cardHolderName;
    notifyListeners();
  }

  Future<HotelBookingResponse> bookHotel() async {
    _paymentModel.paymentRequest.card = card;
    HotelBookingResponse response = await _service.bookHotel(_paymentModel);
    print(jsonEncode(_paymentModel));
    return response;
  }
}
