import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/models/activity/prebooking_response_entity.dart';
import 'package:ota/models/activity/request/activity_booking_request.dart';
import 'package:ota/models/activity/request/activity_details_data.dart';
import 'package:ota/models/activity/request/activity_questions_data.dart';
import 'package:ota/models/activity/request/activity_traveller_data.dart';
import 'package:ota/models/activity/request/pre_booking_request.dart';
import 'package:ota/models/activity/request/search_activity_request.dart' as pax;
import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/flights/validation_model.dart';
import 'package:ota/net/service/activity/activity_service.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/net/service/delegate.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_results_data.dart';

class ActivityTravellerModel extends ChangeNotifier {
  ActivityDetailsData activityDetailsData;
  List<ValidationModel> contentFilledList = List();
  ActivityService _activityService;

  bool passengerExpanded = true;

  bool guestExpanded = false;

  bool loading = true;

  List<String> designationList = ["Mr", "Mrs", "Miss"];

  String  _selectedDesignation = "Mr";
  String get selectedDesignation => _selectedDesignation;

  List<pax.Paxes> paxes = List();

  PrebookingResponseEntity prebookingResponseEntity;

  CountryCodesResponseResult countryResult;

  CountryCodesResponseResult countryCodeResults;

  CommonService _commonService;

  String country;

  int selectedCountry = 0;

  var firstName = new TextEditingController();

  var lastName = new TextEditingController();

  var Email = new TextEditingController();

  var address = new TextEditingController();

  var pinCode = new TextEditingController();
  var countryCode;

  var countryName;

  String telephoneCode;

  PhoneNumber phoneNumber;

  CommonService commonService;

  SessionManager sessionManager;

  FlightResultsData flightResultsData;

  List<CountryCodesResponseResult> countryCodes;

  List<CountryCodesResponseResult> tempCountryCodes;

  var guest_firstName = new TextEditingController();

  var guest_lastName = new TextEditingController();

  var guest_age = new TextEditingController();

  var guestType = new TextEditingController();

  List<String> guest_first_name = List();

  List<String> guest_last_name = List();

  List<String> guest_type = List();
  List<bool> guestList = List();
  List<bool> passangerList = List();
  Delegate _delegate;
  ActivityTravellerModel(this.activityDetailsData,Delegate delegate) {

   _delegate =delegate;


    paxes = activityDetailsData.fullDetailsData.fullDetailsRequest.paxes;

    guest_age.text = paxes.first.age;



    _activityService = GetIt.instance<ActivityService>();



    sessionManager = SessionManager.getInstance();

    commonService = GetIt.instance<CommonService>();

    phoneNumber = PhoneNumber(isoCode: 'UAE');

    if (sessionManager.getCountryCodes == null) {
      getCountryCodes();
    } else {
      countryCodes = sessionManager.getCountryCodes;
      tempCountryCodes = countryCodes;
      loading = false;
    }





//    phoneNumber.text = "9933445588";
//
//    firstName.text = "tester";
//
//    lastName.text = "t";
//
//    Email.text = "test@test.com";
//
//    address.text = "testaddress";
//
//    pinCode.text = "3322444";
//    countryCode = "IN";
//
//    countryName = "India";
//
//    telephoneCode = "91";
//
//    guest_firstName.text = "tester";
//
//    guest_lastName.text = "t";
//
//    guest_age.text = "55";
//
//    guestType.text = "ADULT";


    guest_first_name =  List.generate(
        activityDetailsData.fullDetailsData.age.length,
    (index) =>"");

    guest_last_name =  List.generate(
        activityDetailsData.fullDetailsData.age.length,
            (index) =>"");

    guest_type = List<String>.generate(activityDetailsData.fullDetailsData.age.length, (i) => "ADULT");

    guestList = List<bool>.generate(activityDetailsData.fullDetailsData.age.length, (i) => false);

   passangerList.add(false);
  }

  CountryCodesResponseEntity codesResponseEntity;

  expandDetails(int index,int passengerType,) {
    if (passengerType == 0) {
      for(int i =0 ;i<guestList.length;i++)

        guestList[i] = false;

     passangerList[0] =true;


    }  else {
      for(int i =0 ;i<guestList.length;i++)
          if(i!=index)
        guestList[i] = false;

          passangerList[0] =false;

      guestList[index]=true;
    }

    notifyListeners();
  }

  hideDetails(int passengerType, int index) {
    if (passengerType == 0) {
        passangerList[0] = false;
    }
    else {

    guestList[index] = false;
    }


    notifyListeners();
  }

  areDetailsVisible(int index, int type) {

    if (type == 0) {
      return passangerList[0];
    } else  {

      return guestList[index];


    }
  }
  void expandPassenger() {
    if (passengerExpanded) {
      passengerExpanded = false;
    } else {
      passengerExpanded = true;
    }

    notifyListeners();
  }

  void expandGuest() {
    if (guestExpanded) {
      guestExpanded = false;
    } else {
      guestExpanded = true;
    }

    notifyListeners();
  }

  void getCountryCodes() async {
    var result = await commonService.getCountryCodes();
    countryCodes = result.result;
    tempCountryCodes = countryCodes;
    state = false;
  }

  set state(bool value) {
    loading = value;
    notifyListeners();
  }

  void changeSelectedCountry(selection) {
    countryResult = selection;
    print(countryResult.name);

    countryName = countryResult.name;

    countryCode = countryResult.currencyCode;
    notifyListeners();
  }

  void onCountryCodeChanged(PhoneNumber value) {
    for (int i = 0; i < countryCodes.length; i++) {
      if ("+" + countryCodes[i].telephoneCode == phoneNumber.dialCode) {
        selectedCountry = i;
        telephoneCode = countryCodes[selectedCountry].telephoneCode;
        country = countryCodes[selectedCountry].name;
        countryCode = countryCodes[selectedCountry].alpha2Code;


        break;
      }
    }
    phoneNumber  = value;


  }

  void changeSelected(newValue) {
    _selectedDesignation = newValue;
    notifyListeners();
  }

  Future<PrebookingResponseEntity> placeOrder() async {
    PreBookingRequest preBookingRequest = PreBookingRequest(
        tpaName: activityDetailsData.fullDetailsData.fullDetailsRequest.tpaName,
        tpa: activityDetailsData.fullDetailsData.fullDetailsRequest.tpa,
        language: activityDetailsData.fullDetailsData.fullDetailsRequest.language,
        clientReference: firstName.text,
        holder: getHolder(),
        options: activityDetailsData.options,
        activities: getActivities());

    print(jsonEncode(preBookingRequest.toJson()));

    prebookingResponseEntity = await _activityService.getPreBooking(preBookingRequest);
    if(prebookingResponseEntity.isError) {
      _delegate.onError("Something Went Wrong, Please Try Again..", false,

          "assets/images/event.png");
    return null;
    }
    print(prebookingResponseEntity.toJson());

    return prebookingResponseEntity;
  }

  getHolder() {
    String mailDate = DateFormat("yyyy-MM-dd").format(DateTime.now().add(Duration(days: 1)));

    Holder holder = Holder(
      address: address.text,
      country: countryCode,
      email: Email.text,
      name: firstName.text,
      title: _selectedDesignation,
      surname: lastName.text,
      mailing: true,
      mailUpdDate: mailDate,
      telephones: getTelephones(),
      zipCode: pinCode.text,
    );

    return holder;
  }

  getTelephones() {
    List<String> telephone = List();

    print(phoneNumber.parseNumber());

    telephone.add(phoneNumber.parseNumber());

    return telephone;
  }

  getActivities() {
    List<Activities> activity = List();
    Activities activities = Activities(
        rateKey: activityDetailsData.rateKey,
        to: activityDetailsData.modalitySelectedDate,
        from: activityDetailsData.modalitySelectedDate,
        paxes: getPaxes(),
        answers: activityDetailsData.answers,
        preferedLanguage: activityDetailsData.fullDetailsData.fullDetailsRequest.language,
        serviceLanguage: activityDetailsData.fullDetailsData.fullDetailsRequest.language);
    activity.add(activities);
    return activity;
  }

  getPaxes() {





    List<Paxes> pax = List();



        activityDetailsData.fullDetailsData.age.asMap().forEach((key, value) {
          print( guest_last_name[key]);


          print(guest_first_name[key]);

          print(value.toString());
          print(guest_type[key]);

      Paxes paxes = Paxes(surname: guest_last_name[key], name: guest_first_name[key], age: value.toString(), type:guest_type[key] );

      pax.add(paxes);

      print(paxes);
      print(pax);

    });

//    activityQuestionsData.fullDetailsData.age.asMap().forEach((key, value) { });
//
//    Paxes paxes = Paxes(surname: guest_lastName.text, name: guest_lastName.text, age: guest_age.text, type: guestType.text);
//
//    pax.add(paxes);

    return pax;
  }

  getArguemntData( ) {



    ActivityTravellerData activityTravellerData;

    activityTravellerData = ActivityTravellerData(
        selectedModalityDate: activityDetailsData.modalitySelectedDate,
        provider: activityDetailsData.provider,
        selectedModalityDetails: activityDetailsData.selectedModalityDetails,
        correlationId: activityDetailsData.correlationId,
        options: getOptions(),
        travelDetails: activityDetailsData.travelDetails,
        tenentId: SessionManager.getInstance().getUser.tenantId,
        totalAmountWithMarkup: activityDetailsData.totalAmountWithMarkup,
        travellerList: getTravellerDetails(),
        requestData: activityDetailsData.fullDetailsData.fullDetailsRequest,
        activityName: activityDetailsData.activityName,
        duration: activityDetailsData.duration,
        Currency: activityDetailsData.currency,
        answers: activityDetailsData.answers,
        questions: activityDetailsData.questions,
      image: activityDetailsData.image
    );

    return activityTravellerData;
  }

  getTravellerDetails() {
    List<ActivityTravellerDetails> travellersData = List();

    ActivityTravellerDetails activityTravellerDetails;

    activityTravellerDetails = ActivityTravellerDetails(
           email: Email.text,
           country: countryName,
           address: address.text,
           phoneNumber: phoneNumber.phoneNumber,
           visaFeeReference: "",
           visaFee: 0,
           relation: "",
           phoneNumberCode: telephoneCode,
           passport: "",
           passportExpirationDate: "2020-07-20T13:27:59.789Z",
           lastname: lastName.text,
           isPrimary: true,
           gender: 0,
           firstname: firstName.text,
           dob: "2020-07-20T13:27:59.789Z",
           countryCode: countryCode,nationality: countryCode);

//        email: "test@test.com",
//        country: "India",
//        address: "textaddress",
//        phoneNumber: "9335574646",
//        visaFeeReference: "",
//        visaFee: 0,
//        relation: "",
//        phoneNumberCode: "91",
//        passport: "",
//        passportExpirationDate: "2020-07-20T13:27:59.789Z",
//        lastname: "t",
//        isPrimary: true,
//        gender: 0,
//        firstname: "tester",
//        dob: "2020-07-20T13:27:59.789Z",
//        countryCode: "IN",
//        nationality: "IN");

    travellersData.add(activityTravellerDetails);

    return travellersData;
  }

  getOptions() {
//
//    List<dynamic> options = List();
//
//    prebookingResponseEntity.result.booking.options.forEach((element) {
//
//
//      print(element);
//
//
//
//
//    });
//
//
//    prebookingResponseEntity.result.booking.options.forEach((element) {
//
//
//      options.add(element);
//
//    });
//
//   ;
//
//
//
//    List<OptionsData> optiondata = List();
//
//
//    options.forEach((element) {
//
//      optiondata.add(element);
//
//    });

//  List<PrebookingResponseResultBookingOption> options = List();
//
//  options.to

    OptionsModified optionModified = OptionsModified(
        options: activityDetailsData.options,
        language: activityDetailsData.fullDetailsData.fullDetailsRequest.language,
        tpa: activityDetailsData.fullDetailsData.fullDetailsRequest.tpa,
        tpaName: activityDetailsData.fullDetailsData.fullDetailsRequest.tpaName,
        reference: prebookingResponseEntity.result.booking.options.first.value);

    return jsonEncode(optionModified.toJson());
  }

  void changeGuestFirstName(String value, int index) {
    guest_first_name[index] = value;

    notifyListeners();
  }

  void changeGuestLastName(String value, int index) {

    guest_last_name[index] = value;

    notifyListeners();

  }

  bool validate(GlobalKey<FormState> formKey) {

    passengerExpanded = true;
    guestExpanded = true;
    notifyListeners();


    return formKey.currentState.validate();


  }

  void expandAll() {

    passengerExpanded = true;
    guestExpanded = true;
    notifyListeners();

  }





}
