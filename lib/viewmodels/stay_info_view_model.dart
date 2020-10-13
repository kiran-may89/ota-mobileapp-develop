import 'dart:convert';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/models/hotels/responses/room_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/hotels/payments/request/reservation_request.dart';
import 'package:ota/models/hotels/payments/request/hotel_traveller_details.dart';
import 'package:ota/models/hotels/payments/request/reservation_request.dart' as HotelRoom;
import 'package:ota/models/hotels/payments/request/hotel_payment_model.dart';
import 'package:ota/models/hotels/payments/request/payment_request.dart' as HotelPaymentRequest;
import 'package:ota/models/hotels/payments/request/card.dart' as HotelCard;
import 'package:ota/models/hotels/requests/rate_checker_request.dart';
import 'package:ota/models/hotels/responses/rate_check_response.dart';
import 'package:ota/models/hotels/responses/hotel_details_response.result.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/net/service/hotel/hotels_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/utils/utils.dart';
import 'package:ota/models/hotels/requests/hotel_summary.dart';
import 'package:ota/viewmodels/base_view_model.dart';

class StayInfoViewModel extends BaseViewModel {
  HotelDetailsResponseResult hotel;
  int selectedCountry = 0;
  int selectGroup;
  int totalAdults = 0;
  int totalChilds = 0;
  HotelPaymentModel _hotelPaymentModel;

  GlobalKey<FormState> formKey = GlobalKey();

  List<String> genders = ["Mr.", "Mrs.", "Miss."];

  List<PassengerModel> passengers = [PassengerModel(1, 0, "")];



  CommonService _commonService;

  List<CountryCodesResponseResult> codesResponseEntity;
  bool isLoading = true;
  HotelService _hotelService;
  RoomOption selectedRoom;
  StayInfoViewModel(this.hotel, this.selectGroup) {

    _hotelPaymentModel = new HotelPaymentModel();
    _commonService = GetIt.instance<CommonService>();
    _hotelService = GetIt.instance<HotelService>();
    selectedRoom = hotel.hotel.roomOption[selectGroup];
    generateTotalGuests();
    getCountryCodes();
  }

  void getCountryCodes() async {
    if (SessionManager.getInstance().getCountryCodes == null) {
      var response = await _commonService.getCountryCodes();
      codesResponseEntity = response.result;
    } else {
      codesResponseEntity = SessionManager.getInstance().getCountryCodes;
    }

    if (hotel.hotel.roomOption[selectGroup].roomRateType == "recheck") {
      RoomOption roomOption = hotel.hotel.roomOption[selectGroup];
      RateCheckerRequest rateCheckerRequest = RateCheckerRequest(
          groupOptionId: roomOption.groupOptionId,
          hotelCode: hotel.hotel.hotelCode,
          hotelRating: hotel.hotel.starRating.toInt(),
          options: roomOption.options,
          searchId: hotel.searchId,
          tpa: roomOption.tpa,
          tpaName: roomOption.tpaName);
      var rateCheck = await _hotelService.getRateCheck(rateCheckerRequest);
      if (rateCheck.result != null) {
        selectedRoom = rateCheck.result;
      }
    }
    isLoading = false;
    notifyListeners();
  }

  String get summaryInfo {
    HotelSummary info = HotelSummary(
        address: hotel.hotel.address,
        checkInDate: converHotelDate(hotel.checkIn),
        checkOutDate: converHotelDate(hotel.checkOut),
        image: hotel.hotel.images[0],
        name: hotel.hotel.name,
        selcectRooms: "${selectedRoom.rooms.length} Rooms, $totalAdults Adults,$totalChilds Children",
        provider: hotel.hotel.tpaName,
        serviceType: "HTL");
    return jsonEncode(info.toJson());
  }

  HotelPaymentModel get hotelPaymentModel {
    _hotelPaymentModel.reservationRequest = reservationRequest;
    _hotelPaymentModel.summaryInfo = summaryInfo;
    _hotelPaymentModel.paymentRequest = paymentRequest;
    _hotelPaymentModel.travellerDetails = travellerDetails;
    _hotelPaymentModel.serviceTypeCode = hotel.hotel.hotelCode;
    _hotelPaymentModel.tpaType = hotel.hotel.tpaName == "travellanda" ? 3 : 2; // 3 for travellanda and 2 for jeeti
    _hotelPaymentModel.provider = hotel.hotel.tpaName;

    _hotelPaymentModel.baseRate = selectedRoom.displayRateInfoWithMarkup.baseRate;
    _hotelPaymentModel.taxAndOtherCharges = selectedRoom.displayRateInfoWithMarkup.taxAndOtherCharges;
    _hotelPaymentModel.supplierBaseRate = selectedRoom.displayRateInfoWithMarkup.supplierBaseRate;
    _hotelPaymentModel.OTATax = selectedRoom.displayRateInfoWithMarkup.otaTax;
    _hotelPaymentModel.Markup = selectedRoom.displayRateInfoWithMarkup.markup;
    _hotelPaymentModel.totalAmount = selectedRoom.displayRateInfoWithMarkup.supplierTotalCost;
    _hotelPaymentModel.totalAmountMarkup = selectedRoom.displayRateInfoWithMarkup.totalPriceWithMarkup;
    _hotelPaymentModel.reservationDate = converHotelDate(hotel.checkIn);
    _hotelPaymentModel.returnDate = converHotelDate(hotel.checkOut);
    return _hotelPaymentModel;
  }

  List<HotelTravellerDetails> get travellerDetails {
    List<HotelTravellerDetails> travellerDetails = List();
    PassengerModel primary = passengers[0];
    passengers.forEach((element) {
      if (element.type < 3) {
        CountryCodesResponseResult codes = codesResponseEntity[element.selectedCountry];
        HotelTravellerDetails passenger = HotelTravellerDetails(
            firstname: element.firstName,
            lastname: element.lastName,
            phoneNumber: primary.phoneNumber,
            phoneNumberCode: codes.telephoneCode,
            isPrimary: element.type == 1,
            country: codes.name,
            nationality: codes.alpha2Code,
            email: primary.email,
            gender: genders[element.selectedGender] == "Mr" ? 1 : 2);
        travellerDetails.add(passenger);
      }
    });
    return travellerDetails;
  }

  HotelPaymentRequest.PaymentRequest get paymentRequest {
    HotelPaymentRequest.PaymentRequest payment = HotelPaymentRequest.PaymentRequest(
        userId: "e864dc35-3093-4a84-92c6-ac3e70d600ec",
        userType: "bc",
        amount: selectedRoom.displayRateInfoWithMarkup.totalPriceWithMarkup,
        currency: "SAR",
        orderType: "NORMAL",
        mode: "CARD");
    HotelCard.Card card = HotelCard.Card(expiry: HotelCard.Expiry(month: "12", year: "24"), number: "5123456789012346", securityCode: "255");
    payment.card = card;
    return payment;
  }

  String get reservationRequest {
    ReservationRequest _reservationRequest = ReservationRequest();
    _reservationRequest.searchId = hotel.searchId;
    _reservationRequest.hotelCode = hotel.hotel.hotelCode;
    _reservationRequest.cityCode = hotel.hotel.cityCode;
    _reservationRequest.groupOptionId = selectedRoom.groupOptionId;
    _reservationRequest.referenceorName = passengers[0].firstName;
    List<HotelRoom.Rooms> rooms = List();
    selectedRoom.rooms.forEach((element) {
      HotelRoom.Rooms room =
          new HotelRoom.Rooms(groupRoomId: element.roomId, options: selectedRoom.options, tpa: selectedRoom.tpa, tpaName: selectedRoom.tpaName);

      List<Adults> adults = List();
      List<Childs> childs = List();
      passengers.forEach((element) {
        if (room.groupRoomId == element.groupId) {
          if (element.type == 2) {
            Adults ad = Adults(title: genders[element.selectedGender], firstName: element.firstName, lastName: element.lastName);
            adults.add(ad);
          } else if (element.type == 3) {
            Childs ch = Childs(title: genders[element.selectedGender], firstName: element.firstName, lastName: element.lastName, age: element.age);
            childs.add(ch);
          }
        }
        room.adults = adults;
        room.childs = childs;
      });

      rooms.add(room);
    });

    RoomGrp roomGrp = RoomGrp(tpa: selectedRoom.tpa, tpaName: selectedRoom.tpaName, options: hotel.hotel.options, rooms: rooms);
    _reservationRequest.roomGrp = roomGrp;
    PassengerModel passengerModel = passengers[0];
    CountryCodesResponseResult codes = codesResponseEntity[passengerModel.selectedCountry];
    LeadPassenger leadPassenger = LeadPassenger(
        title: genders[passengerModel.selectedGender],
        lastName: passengerModel.lastName,
        firstName: passengerModel.firstName,
        email: passengerModel.email,
        phoneNumber: passengerModel.phoneNumber,
        clientNationality: codes.alpha2Code);
    _reservationRequest.leadPassenger = leadPassenger;
    _reservationRequest.checkInDate = hotel.checkIn;
    _reservationRequest.checkOutDate = hotel.checkOut;

    _reservationRequest.tpaName = hotel.hotel.tpaName;
    _reservationRequest.tpa = hotel.hotel.tpa;
    _reservationRequest.options = hotel.hotel.options;

    return jsonEncode(_reservationRequest);
  }

  int selectedGender = 0;

  @override
  void initialise() {}

  void generateTotalGuests() {
    selectedRoom.rooms.forEach((element) {
      List<PassengerModel> adultList = List<PassengerModel>.generate(element.noOfAdults, (index) => PassengerModel(2, (index + 1), element.roomId));
      List<PassengerModel> ChildList = List<PassengerModel>.generate(element.noOfChildren, (index) => PassengerModel(3, (index + 1), element.roomId));
      passengers.insertAll(passengers.length, adultList);
      passengers.insertAll(passengers.length, ChildList);

      totalAdults += element.noOfAdults;
      totalChilds += element.noOfChildren;
    });
  }

  void openInvalidPassengers() {
    bool isFlipped = false;
    passengers.forEach((element) {
      if (!element.isValid()) {
        element.isFlipped = true;
        isFlipped = true;
      }
    });
    if (isFlipped) {
      notifyListeners();
    }
  }

  bool vadlidatePassengers() {
    bool isvalid = true;
    passengers.forEach((element) {
      if (!element.isValid()) {
        isvalid = false;
      }
    });
    return isvalid;
  }

  void onGenderChanged(int value) {
    selectedGender = value;
    notifyListeners();
  }

  void enabledEditMode(PassengerModel value) async {
    value.isFlipped = !value.isFlipped;
    passengers.forEach((element) {
      if (element.id != value.id) {
        element.isFlipped = false;
      }
    });
    notifyListeners();
  }



  void enableNext(PassengerModel pasenger) {
    int index = passengers.indexOf(pasenger) + 1;
    pasenger.isFlipped = false;
    if (index < passengers.length) {
      passengers[index].isFlipped = true;
    }

    notifyListeners();
  }

  void onCountryCodeChanged(String value) {}
}

class PassengerModel {
  int selectedGender = 0;
  int id;

  // 1 - Primary , 2- General , 3- Child
  int type;
  bool isFlipped = false;

  String groupId;
  String firstName, lastName, email;
  String phoneNumber;
  PhoneNumber intlPhoneNumber = PhoneNumber(
    isoCode: 'UAE',
  );
  String age;

  int selectedCountry = 0;
  bool phoneNumberValidated = false;
  bool isValid() {
    bool generalValidation = ((firstName != null && firstName.isNotEmpty) && (lastName != null && lastName.isNotEmpty));
    if (type == 1) {
      generalValidation = (email != null && email.isNotEmpty) && (phoneNumberValidated);
    }
    if (type == 3) {
      generalValidation = (age != null && age.isNotEmpty);
    }
    return generalValidation;
  }

  PassengerModel(this.type, this.id, this.groupId) {}
}
