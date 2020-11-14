import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/models/activity/activity_search_response.dart';
import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/flights/requests/flight_booking_request.dart';
import 'package:ota/models/flights/requests/flight_save_booking_request.dart';
import 'package:ota/models/flights/traveller_info_model.dart';
import 'package:ota/models/flights/validation_model.dart';
import 'package:ota/models/onboard/requests/signup_request.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_results_data.dart';

import 'data_models/flight_travel_info_model.dart';

class FlightPassengerInfoModel
    extends ChangeNotifier {
  CommonService commonService;

  // SignupRequest signupRequest;

  SessionManager sessionManager;
  TextEditingController demo= TextEditingController();

  FlightResultsData flightResultsData;

  List<CountryCodesResponseResult> countryCodes;

  List<CountryCodesResponseResult>
      tempCountryCodes;

  var searchCountry = TextEditingController();

  String formattedPhoneNumber = "";

  int selectedCountry = 0;

  bool _isloading = true;

  bool get isLoading => _isloading;

  PhoneNumber phoneNumber;
  PhoneNumber primaryDefaultPhoneNumber;

  int primaryMemberType;

  int primaryMemberIndex;




  /// for 2 api's savebooking and booking
  List<TravelInfoModel> adultSaveBookingDetails =
      List();


  List<TravelInfoModel> childSaveBookingDetails =
      List();

  List<TravelInfoModel> infantSaveBookingDetails =
      List();

  List<TravellerDetails> adultBookingDetails =
      List();

  List<TravellerDetails> childBookingDetails =
      List();

  List<TravellerDetails> infantBookingDetails =
      List();

  bool editPassenger = false;

  List<bool> showAdultDetails = List();

  List<bool> showChildDetails = List();

  List<bool> showInfantDetails = List();

  String emailId;

  String telephoneCode;

  String country;

  String countryCode;

  DateTime Dob;

  DateTime tempDate = DateTime.now();

  DateTime passportExpiryDate;

  FlightPassengerInfoModel(
      this.flightResultsData) {
    sessionManager = SessionManager.getInstance();

    commonService =
        GetIt.instance<CommonService>();


    phoneNumber = PhoneNumber(isoCode: 'UAE');
    if (sessionManager.getCountryCodes == null) {
      getCountryCodes();
    } else {
      countryCodes =
          sessionManager.getCountryCodes;
      tempCountryCodes = countryCodes;
      _isloading = false;
    }

    countryCodes.forEach((element) {
      if(element.telephoneCode == "91")
        primaryDefaultPhoneNumber = PhoneNumber(isoCode: element.alpha2Code,phoneNumber:SessionManager.getInstance().getUser.phoneNumber);

    });
    generateLists();
  }

  void reload(){notifyListeners();}
  void onCountryCodeChanged(PhoneNumber value) {
    for (int i = 0;
        i < countryCodes.length;
        i++) {
      if ("+" + countryCodes[i].telephoneCode ==
          phoneNumber.dialCode) {
        selectedCountry = i;
        telephoneCode =
            countryCodes[selectedCountry]
                .telephoneCode;
        country =
            countryCodes[selectedCountry].name;
        countryCode =
            countryCodes[selectedCountry]
                .alpha2Code;

        break;
      }
    }
    phoneNumber = value;
    setCountry();
    // signupRequest.country = countryCodes[selectedCountry].name;
    //notifyListeners();
  }

  //List<CountryCodesResponseResult> get countryCodes => sessionManager.getCountryCodes;

  void getCountryCodes() async {
    var result =
        await commonService.getCountryCodes();
    countryCodes = result.result;
    tempCountryCodes = countryCodes;
    state = false;
  }

  set state(bool value) {
    _isloading = value;
    notifyListeners();
  }

  void generateLists() {
    TravelInfoModel travelInfoModel;

    if (flightResultsData.requestData.adults !=
        0) {
      travelInfoModel = TravelInfoModel(
          name: "test",
          birthday: "1991-07-19T18:30:00.000Z",
          email: "info@tripshop.com",
          surname: "test",
          title: "ms",
          cardno: "5123456789012346",
          category: "adults",
          expiration: "2020-07-24T18:30:00.000Z",
          holdBags: null,
          nationality: "",
          phone: "+44 44857282842");

      adultSaveBookingDetails = List.generate(
          flightResultsData.requestData.adults,
          (index) => travelInfoModel);

      adultBookingDetails = List.generate(
          flightResultsData.requestData.adults,
          (index) => TravellerDetails(
              nationality: "",
              countryCode: "",
              dob: "",
              firstname: "",
              gender: 0,
              isPrimary:
                  index == 0 ? true : false,
              lastname: "",
              passportExpirationDate: "",
              passport: "",
              phoneNumberCode: "",
              relation: "",
              phoneNumber: "",
              address: "",
              country: "",
              email: ""));

      showAdultDetails = List.generate(
          flightResultsData.requestData.adults,
          (index) => false);

      showAdultDetails[0] =true;
    }

    if (flightResultsData.requestData.children !=
        0) {
      travelInfoModel = TravelInfoModel(
          name: "test",
          birthday: "1991-07-19T18:30:00.000Z",
          email: "info@tripshop.com",
          surname: "test",
          title: "ms",
          cardno: "",
          category: "children",
          expiration: "2020-07-24T18:30:00.000Z",
          holdBags: null,
          nationality: "",
          phone: "+44 44857282842");

      childSaveBookingDetails = List.generate(
          flightResultsData.requestData.children,
          (index) => travelInfoModel);

      childBookingDetails = List.generate(
          flightResultsData.requestData.children,
          (index) => TravellerDetails(
              nationality: "",
              countryCode: "",
              dob: "",
              firstname: "",
              gender: 0,
              isPrimary: flightResultsData
                              .requestData
                              .adults ==
                          0 &&
                      index == 0
                  ? true
                  : false,
              lastname: "",
              passportExpirationDate: "",
              passport: "",
              phoneNumberCode: "",
              relation: "",
              phoneNumber: "",
              address: "",
              country: "",
              email: ""));

      showChildDetails = List.generate(
          flightResultsData.requestData.children,
          (index) => false);
    }

    if (flightResultsData.requestData.infants !=
        0) {
      travelInfoModel = TravelInfoModel(
          name: "test",
          birthday: "1991-07-19T18:30:00.000Z",
          email: "info@tripshop.com",
          surname: "test",
          title: "ms",
          cardno: "",
          category: "infants",
          expiration: "2020-07-24T18:30:00.000Z",
          holdBags: null,
          nationality: "",
          phone: "+44 44857282842");

      infantSaveBookingDetails = List.generate(
          flightResultsData.requestData.infants,
          (index) => travelInfoModel);

      infantBookingDetails = List.generate(
          flightResultsData.requestData.infants,
          (index) => TravellerDetails(
              nationality: "",
              countryCode: "",
              dob: "",
              firstname: "",
              gender: 0,
              isPrimary: false,
              lastname: "",
              passportExpirationDate: "",
              passport: "",
              phoneNumberCode: "",
              relation: "",
              phoneNumber: "",
              address: "",
              country: "",
              email: ""));

      showInfantDetails = List.generate(
          flightResultsData.requestData.infants,
          (index) => false);
    }
  }

  getArguments() {
    FlightTravelInfoData flightTravelInfoData;

    var flightSaveBooking =
        FlightSaveBookingRequest(
            bags: flightResultsData
                .requestData.adults,
            currency: flightResultsData
                .requestData.curr,
            locale: flightResultsData
                .requestData.locale,
            lang: flightResultsData
                .requestData.locale,
            options: flightResultsData.options,
            tpa: flightResultsData.tpa,
            passengers: getEntries());

    flightTravelInfoData = FlightTravelInfoData(
        flightResultsData: flightResultsData,
        flightSaveBookingRequest:
            flightSaveBooking,
        traveldetails: getTravelDetails());

    return flightTravelInfoData;
  }

  getEntries() {
    List<TravelInfoModel> entries = [];

    adultSaveBookingDetails.forEach((element) {
      entries.add(element);
    });

    childSaveBookingDetails.forEach((element) {
      entries.add(element);
    });

    infantSaveBookingDetails.forEach((element) {
      entries.add(element);
    });

    return entries;
  }

  enabledEditMode(int passengerType, int index) {
    if (passengerType == 0) {
      if (showAdultDetails[index]) {
        showAdultDetails[index] = false;
      } else
        showAdultDetails[index] = true;
    } else if (passengerType == 1) {
      if (showChildDetails[index]) {
        showChildDetails[index] = false;
      } else
        showChildDetails[index] = true;
    } else {
      if (showInfantDetails[index]) {
        showInfantDetails[index] = false;
      } else
        showInfantDetails[index] = true;
    }

    notifyListeners();
  }
  enabledEditModeOnContinue(int index,int passengerType,) {
    if (passengerType == 0) {

      for(int i =0 ;i<showAdultDetails.length;i++)
        if(i!=index)
        showAdultDetails[i] = false;

      for(int i =0 ;i<showChildDetails.length;i++)

          showChildDetails[i] = false;

      for(int i =0 ;i<showInfantDetails.length;i++)

          showInfantDetails[i] = false;


        showAdultDetails[index] = true;


    } else if (passengerType == 1) {

      for(int i =0 ;i<showAdultDetails.length;i++)

          showAdultDetails[i] = false;

      for(int i =0 ;i<showChildDetails.length;i++)
        if(i!=index)
        showChildDetails[i] = false;

      for(int i =0 ;i<showInfantDetails.length;i++)

        showInfantDetails[i] = false;


        showChildDetails[index] = true;

    } else {
      for(int i =0 ;i<showAdultDetails.length;i++)

        showAdultDetails[i] = false;

      for(int i =0 ;i<showChildDetails.length;i++)

          showChildDetails[i] = false;

      for(int i =0 ;i<showInfantDetails.length;i++)
        if(i!=index)
        showInfantDetails[i] = false;

        showInfantDetails[index] = true;
    }

    notifyListeners();
  }

  getPassengerName(int index, int passengerType) {
    if (passengerType == 0) {
      print(adultBookingDetails[index].firstname);

      return adultBookingDetails[index].firstname;
    } else if (passengerType == 1) {
      return childBookingDetails[index].firstname;
    } else {
      return infantBookingDetails[index]
          .firstname;
    }
  }

  setPassengerName(
      int index, int passengerType, String name) {
    if (passengerType == 0) {
      adultBookingDetails[index].firstname = name;
    } else if (passengerType == 1) {
      childBookingDetails[index].firstname = name;
    } else {
      infantBookingDetails[index].firstname =
          name;
    }

    notifyListeners();
    print(name);
  }

  getPassengerLastName(
      int index, int passengerType) {
    if (passengerType == 0) {
      return adultBookingDetails[index].lastname;
    } else if (passengerType == 1) {
      return childBookingDetails[index].lastname;
    } else {
      return infantBookingDetails[index].lastname;
    }
  }

  setPassengerLastName(
      int index, int passengerType, String name) {
    if (passengerType == 0) {
      adultBookingDetails[index].lastname = name;
    } else if (passengerType == 1) {
      childBookingDetails[index].lastname = name;
    } else {
      infantBookingDetails[index].lastname = name;
    }

    notifyListeners();
  }

  getPassengerPassportNumber(
      int index, int passengerType) {
    if (passengerType == 0) {
      return adultBookingDetails[index].passport;
    } else if (passengerType == 1) {
      return childBookingDetails[index].passport;
    } else {
      return infantBookingDetails[index].passport;
    }
  }

  setPassengerPassportNumber(int index,
      int passengerType, String passportNumber) {
    if (passengerType == 0) {
      adultBookingDetails[index].passport =
          passportNumber;
    } else if (passengerType == 1) {
      childBookingDetails[index].passport =
          passportNumber;
    } else {
      infantBookingDetails[index].passport =
          passportNumber;
    }

    print(passportNumber);

    notifyListeners();
  }

  getPassengerPassportExpData(
      int index, int passengerType) {
    if (passengerType == 0) {
      return adultBookingDetails[index]
          .passportExpirationDate;
    } else if (passengerType == 1) {
      return childBookingDetails[index]
          .passportExpirationDate;
    } else {
      return infantBookingDetails[index]
          .passportExpirationDate;
    }
  }

  setPassengerPassportExpDate(int index,
      int passengerType, DateTime expiryDate) {
    var normalformat =
        new DateFormat('yyyy-MM-dd');

    var iso_format = new DateFormat(
        "yyyy-MM-dd'T'HH:mm:ss'Z'");

    if (passengerType == 0) {
      adultBookingDetails[index]
              .passportExpirationDate =
         normalformat.format(tempDate);

      adultSaveBookingDetails[index].expiration =
          normalformat.format(tempDate);
    } else if (passengerType == 1) {
      childBookingDetails[index]
              .passportExpirationDate =
          normalformat.format(tempDate);

      childSaveBookingDetails[index].expiration =
          normalformat.format(tempDate);
    } else {
      infantBookingDetails[index]
              .passportExpirationDate =
          normalformat.format(tempDate);

      infantSaveBookingDetails[index].expiration =
          normalformat.format(tempDate);
    }

    notifyListeners();


  }

  getPassengerDOB(int index, int passengerType) {
    if (passengerType == 0) {
      return adultBookingDetails[index].dob;
    } else if (passengerType == 1) {
      return childBookingDetails[index].dob;
    } else {
      return infantBookingDetails[index].dob;
    }
  }

  setPassengerDOB(
    int index,
    int passengerType,
    DateTime tempDate,
  ) {
    var normalformat =
        new DateFormat('yyyy-MM-dd');

    var iso_format = new DateFormat(
        "yyyy-MM-dd'T'HH:mm:ss'Z'");

    if (passengerType == 0) {
      adultBookingDetails[index].dob =
          normalformat.format(tempDate);

      adultSaveBookingDetails[index].birthday =
          normalformat.format(tempDate);
    } else if (passengerType == 1) {
      childBookingDetails[index].dob =
          normalformat.format(tempDate);

      childSaveBookingDetails[index].birthday =
          normalformat.format(tempDate);
    } else {
      infantBookingDetails[index].dob =
          normalformat.format(tempDate);

      infantSaveBookingDetails[index].birthday =
          normalformat.format(tempDate);
    }

    notifyListeners();


  }

  isPrimary(int index, int passengerType) {
    if (passengerType == 0) {
      print(
          "PRIMARY${adultBookingDetails[index].isPrimary}");

      return adultBookingDetails[index].isPrimary;
    } else if (passengerType == 1) {
      return childBookingDetails[index].isPrimary;
    } else {
      return infantBookingDetails[index]
          .isPrimary;
    }
  }

  areDetailsShown(int index, int passengerType) {

    if (passengerType == 0) {
      return showAdultDetails[index];
    } else if (passengerType == 1) {
      return showChildDetails[index];
    } else {
      return showInfantDetails[index];
    }

  }

  getGender(int index, int passengerType) {
    if (passengerType == 0) {
      return adultBookingDetails[index].gender ==
          0;
    } else if (passengerType == 1) {
      return childBookingDetails[index].gender ==
          0;
    } else {
      return infantBookingDetails[index].gender ==
          0;
    }
  }

  void enableNext(int passengerType, int index) {
    if (passengerType == 0) {
      showAdultDetails[index + 1] = true;
    } else if (passengerType == 1) {
      showChildDetails[index + 1] = true;
    } else {
      showInfantDetails[index + 1] = true;
    }

    notifyListeners();
  }

  void searchCountryList(String text) {
    var searchValue = text.trim();

    tempCountryCodes = [];

    searchValue.isNotEmpty
        ? tempCountryCodes =
            countryCodes.where((results) {
            return results.name
                .toLowerCase()
                .contains(text.toLowerCase());
          }).toList()
        : tempCountryCodes.addAll(countryCodes);

    notifyListeners();
  }

  setPassengersEmail(String value) {
    emailId = value;

    adultSaveBookingDetails.forEach((element) {
      element.email = value;
    });

    childSaveBookingDetails.forEach((element) {
      element.email = value;
    });

    infantSaveBookingDetails.forEach((element) {
      element.email = value;
    });

    adultBookingDetails.forEach((element) {
      element.email = value;
    });

    childBookingDetails.forEach((element) {
      element.email = value;
    });

    infantBookingDetails.forEach((element) {
      element.email = value;
    });

    notifyListeners();
  }

  setCountry() {
    int primaryMemberType;

    int primaryMemberIndex;

    adultBookingDetails
        .asMap()
        .forEach((index, element) {
      element.countryCode = countryCode;
      element.country = country;
      element.phoneNumberCode = telephoneCode;
      element.phoneNumber =
          phoneNumber.phoneNumber.toString();

      print(element.isPrimary);

      if (element.isPrimary) {
        element.nationality = countryCode;
        primaryMemberIndex = index;
        primaryMemberType = 0;
      }
    });

    childBookingDetails
        .asMap()
        .forEach((index, element) {
      element.countryCode = countryCode;
      element.country = country;
      element.phoneNumberCode = telephoneCode;
      element.phoneNumber =
          phoneNumber.phoneNumber.toString();

      if (element.isPrimary) {
        element.nationality = countryCode;
        primaryMemberIndex = index;
        primaryMemberType = 1;
      }
    });

    infantBookingDetails
        .asMap()
        .forEach((index, element) {
      element.countryCode = countryCode;
      element.country = country;
      element.phoneNumberCode = telephoneCode;
      element.phoneNumber =
          phoneNumber.phoneNumber.toString();

      if (element.isPrimary) {
        element.nationality = countryCode;
        primaryMemberIndex = index;
        primaryMemberType = 2;
      }
    });

    adultSaveBookingDetails
        .asMap()
        .forEach((index, element) {
      if (primaryMemberType == 0 &&
          index == primaryMemberIndex) {
        element.nationality = countryCode;
      }

      element.phone =
          phoneNumber.phoneNumber;
    });
    print(adultSaveBookingDetails);
    childSaveBookingDetails
        .asMap()
        .forEach((index, element) {
      if (primaryMemberType == 1 &&
          index == primaryMemberIndex) {
        element.nationality = countryCode;
      }
      element.phone =
          phoneNumber.phoneNumber;
    });

    infantSaveBookingDetails
        .asMap()
        .forEach((index, element) {
      if (primaryMemberType == 2 &&
          index == primaryMemberIndex) {
        element.nationality = countryCode;
      }
      element.phone =
            phoneNumber.phoneNumber;
    });

    // notifyListeners();
  }

  void setGender(
      int index, int passengerType, int i) {
    if (passengerType == 0) {
      adultBookingDetails[index].gender = i;
    } else if (passengerType == 1) {
      childBookingDetails[index].gender = i;
    } else {
      infantBookingDetails[index].gender = i;
    }

    notifyListeners();
  }

  void setNationality(int index,
      int passengerType, String alpha2code) {
    adultSaveBookingDetails.forEach((element) {
      element.nationality = alpha2code;
    });

    childSaveBookingDetails.forEach((element) {
      element.nationality = alpha2code;
    });

    infantSaveBookingDetails.forEach((element) {
      element.nationality = alpha2code;
    });

    adultBookingDetails.forEach((element) {
      element.nationality = alpha2code;
    });

    childBookingDetails.forEach((element) {
      element.nationality = alpha2code;
    });

    infantBookingDetails.forEach((element) {
      element.nationality = alpha2code;
    });
  }

  getNationality(int index, int passengerType) {
    if (passengerType == 0) {
      if (adultBookingDetails[index]
              .nationality !=
          null) {
        return adultBookingDetails[index]
            .nationality;
      } else {
        return "";
      }
    } else if (passengerType == 1) {
      if (childBookingDetails[index]
              .nationality !=
          null) {
        return childBookingDetails[index]
            .nationality;
      } else {
        return "";
      }
    } else {
      if (infantBookingDetails[index]
              .nationality !=
          null) {
        return infantBookingDetails[index]
            .nationality;
      } else {
        return "";
      }
    }
  }

  getTravelDetails() {
    List<TravellerDetails> entries2 = List();

    adultBookingDetails.forEach((element) {
      entries2.add(element);
    });

    childBookingDetails.forEach((element) {
      entries2.add(element);
    });

    infantBookingDetails.forEach((element) {
      entries2.add(element);
    });

    print(jsonEncode(entries2));

    return entries2;
  }

  void openAllCards(GlobalKey<FormState> formState, GlobalKey<FormState> child_formState, GlobalKey<FormState> infant_formState) {
    showAdultDetails
        .asMap()
        .forEach((index, element) {
      showAdultDetails[index] = true;
    });

    showChildDetails
        .asMap()
        .forEach((index, element) {
      showChildDetails[index] = true;
    });

    showInfantDetails
        .asMap()
        .forEach((index, element) {
      showInfantDetails[index] = true;
    });

    notifyListeners();

    verifyData( formState,child_formState,infant_formState);

  }

   verifyData(GlobalKey<FormState> formState, GlobalKey<FormState> child_formState, GlobalKey<FormState> infant_formState) {
    if (flightResultsData.requestData.adults !=
    0) {
      formState.currentState.save();
    }
    if (flightResultsData.requestData.children !=
    0) {
      child_formState.currentState.save();
    }
    if (flightResultsData.requestData.infants !=
    0) {
      infant_formState.currentState.save();
    } else {


    }


  }










}




class PassengerModel {
  int selectedGender = 0;
  int id;

  // 0 - Adult , 1- Child , 2- Infant
  int type;
  bool isPrimary;
  bool isFlipped = false;

  String groupId;
  String firstName, lastName, email;
  String phoneNumber;
  String doB, passportNumber, passportExpiry;
  PhoneNumber intlPhoneNumber = PhoneNumber(
    isoCode: 'UAE',
  );
  String age;

  int selectedCountry = 0;
  bool phoneNumberValidated = false;
  bool isValid() {
    bool generalValidation = ((firstName != null && firstName.isNotEmpty) && (lastName != null && lastName.isNotEmpty)
    //&&()&&()
    );
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