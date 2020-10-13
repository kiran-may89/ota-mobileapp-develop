
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/profile/requests/get_profile_request.dart';
import 'package:ota/models/profile/requests/updateProfileRequest.dart';
import 'package:ota/models/profile/requests/update_family_member_request.dart';
import 'package:ota/models/profile/responses/update_profile_response.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/net/service/profile/profile_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:package_info/package_info.dart';

class ProfileViewModel extends ChangeNotifier{

ProfileService _profileService;

bool loading = true;

SessionManager sessionManager;

CommonService commonService;

List<CountryCodesResponseResult> _countryCodes;

List<CountryCodesResponseResult>

tempCountryCodes;

bool editStatus = false;

GetProfileResponse profileResponse = GetProfileResponse();

var firstName = TextEditingController();

var lastName = TextEditingController();

var passportNumber = TextEditingController();

var passportExpiryDate = TextEditingController();

var dateOfBirth = TextEditingController();

var emailId = TextEditingController();

var nationality = TextEditingController();

var locationName = TextEditingController();

var selectGender = TextEditingController();

var relation = TextEditingController();

var phoneNumber = TextEditingController();

DateTime dob ;

DateTime passportExpiryDateSelected;

DateTime dateOfBirthSelected;

DateTime tempDate;

PhoneNumber rawPhoneNumber ;

int selectedCountry;

String telephoneCode;

String countryCode;

var convertFormat =
new DateFormat("yyyy-MM-dd'T'HH:mm:ss");

var normalFormat = new DateFormat('MM/dd/yyyy');

var sendingFormat =
new DateFormat("yyyy-MM-dd'T'HH:mm:ss'+00:00'");


String version_;

String buildNumber_;



UpdateProfileResponse updateProfileResponse  = UpdateProfileResponse();

ProfileViewModel(){



  commonService =
  GetIt.instance<CommonService>();
  sessionManager = SessionManager.getInstance();

_profileService = GetIt.instance<ProfileService>();

  getVersion();

  if (sessionManager.getCountryCodes == null&&_countryCodes==null) {
    getCountryCodes();


  } else {
    _countryCodes =
    sessionManager.getCountryCodes;
    tempCountryCodes = _countryCodes;
    getProfile();

  }


}

  Future<void> getProfile() async {


profileResponse = await _profileService.getProfile();

print(profileResponse.result);

setData();


_setloading(false);

  }


void getCountryCodes() async {
  var result =
  await commonService.getCountryCodes();
  _countryCodes = result.result;
  tempCountryCodes = _countryCodes;
  getProfile();

}


void _setloading(bool value) {
loading = value;
notifyListeners();
}



void changeCountryCodeSelection(String value) {
  for (int i = 0; i < _countryCodes.length; i++) {
    if ("+" + _countryCodes[i].telephoneCode == value) {
      selectedCountry = i;
      print(telephoneCode);
      telephoneCode = _countryCodes[i].telephoneCode;
      countryCode = _countryCodes[i].alpha2Code;

      break;
    }
  }
}

  void setData() {

    for (int i = 0; i < _countryCodes.length; i++) {

   if(profileResponse.result.phoneNumber!=null)
      if (_countryCodes[i].name == profileResponse.result.country) {
        selectedCountry = i;

        rawPhoneNumber = PhoneNumber(phoneNumber: profileResponse.result.phoneNumber,dialCode:  "+"+_countryCodes[i].telephoneCode,isoCode: _countryCodes[i].alpha2Code );

        print(rawPhoneNumber.phoneNumber);
        print(rawPhoneNumber.isoCode);
        print(rawPhoneNumber.dialCode);

        break;
      }
    }


    emailId.text = profileResponse.result.email;
    firstName.text = profileResponse.result.firstName;
    lastName.text = profileResponse.result.lastName;
    if(profileResponse.result.dateOfBirth!=null) {
      print("DOB${profileResponse.result
      .dateOfBirth}");
      dob = convertFormat.parse(profileResponse
      .result.dateOfBirth);
      dateOfBirth.text = normalFormat.format(dob);
    }else{
      dateOfBirth.text = "";
    }
    locationName.text = profileResponse.result.address;
    nationality.text = profileResponse.result.country;


//notifyListeners();


  }

  void enableEdit() {

  if(editStatus){
    editStatus = false;
  }else {
    editStatus = true;
  }

  notifyListeners();

  }

  Future<UpdateProfileResponse> updateProfile() async {

  UpdateProfileRequest updateProfileRequest =

  UpdateProfileRequest(
    firstName: firstName.text,
    lastName: lastName.text,
    country: nationality.text,
    phoneNumber: profileResponse.result.phoneNumber,
   address: locationName.text,
   dateOfBirth:dob==null?null:sendingFormat.format(dob),
  );


  print(jsonEncode(updateProfileRequest.toMap()));

  updateProfileResponse = await _profileService.updateUserProfile(updateProfileRequest.toMap());


  return updateProfileResponse;


  }

  void setBuildNumber(String version, String buildNumber) {

  version_ = version;

  buildNumber_ = buildNumber;

  notifyListeners();

  }


Future<void> getVersion() async {

  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {

    version_ = packageInfo.version.replaceAll('-dev', "+");
    buildNumber_ = packageInfo.buildNumber;

  //  notifyListeners();


  });



}







}