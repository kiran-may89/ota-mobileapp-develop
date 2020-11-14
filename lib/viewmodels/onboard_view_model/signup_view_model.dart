import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/onboard/response/signup_response.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/net/service/onboarding/onboarding.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/viewmodels/base_view_model.dart';
import 'package:ota/models/onboard/requests/signup_request.dart';

class SignUpViewModel extends BaseViewModel {
  OnBoarding _service;
  CommonService commonService;
  SessionManager sessionManager;
  List<CountryCodesResponseResult> _countryCodes;
  bool _isloading = true;
  bool get isLoading => _isloading;

  int selectedCountry = 0;
  SignupRequest signupRequest;
  String formattedPhoneNumber = "";
  String phoneCode;
  PhoneNumber phoneNumber;

  @override
  void initialise() {}
  SignUpViewModel() {
    signupRequest = new SignupRequest();
    _service = GetIt.instance<OnBoarding>();
    commonService = GetIt.instance<CommonService>();
    sessionManager = SessionManager.getInstance();
    phoneNumber = PhoneNumber(isoCode: 'UAE');
    if (sessionManager.getCountryCodes == null) {
      getCountryCodes();
    } else {
      _countryCodes = sessionManager.getCountryCodes;
      _isloading = false;
    }
  }
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');
    formattedPhoneNumber = phoneNumber;
  }

  void getCountryCodes() async {
    var result = await commonService.getCountryCodes();
    _countryCodes = result.result;
    state = false;
  }

  set state(bool value) {
    _isloading = value;
    notifyListeners();
  }

  void onCountryCodeChanged(String value) {
    for (int i = 0; i < _countryCodes.length; i++) {
      if ("+" + _countryCodes[i].telephoneCode == value) {
        selectedCountry = i;
        break;
      }
    }
    signupRequest.country = _countryCodes[selectedCountry].name;
  }

  List<CountryCodesResponseResult> get countryCodes => sessionManager.getCountryCodes;

  Future<SignupResponse> signUp() {

    print(jsonEncode(signupRequest.toJson()));
    return _service.userSignUp(signupRequest);
  }
}
