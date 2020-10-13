import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/profile/requests/add_famliy_member.dart';
import 'package:ota/models/profile/requests/update_family_member_request.dart';
import 'package:ota/models/profile/responses/common_response.dart';
import 'package:ota/models/profile/responses/family_list.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/net/service/profile/profile_service.dart';
import 'package:ota/prefs/session_manager.dart';

class AddMemberViewModel extends ChangeNotifier {
  ProfileService _profileService;

  CommonService commonService;

  SessionManager sessionManager;

  List<CountryCodesResponseResult> _countryCodes;

  List<CountryCodesResponseResult>
      tempCountryCodes;

  bool loading = true;

  var firstName = TextEditingController();

  var lastName = TextEditingController();

  var passportNumber = TextEditingController();

  var passportExpiryDate =
      TextEditingController();

  var dateOfBirth = TextEditingController();

  var emailId = TextEditingController();

  var nationality = TextEditingController();

  var locationName = TextEditingController();

  //var selectGender = TextEditingController();

//  var relation = TextEditingController();

  var phoneNumber = TextEditingController();

  DateTime passportExpiryDateSelected;

  DateTime dateOfBirthSelected;

  DateTime tempDate;

  PhoneNumber rawPhoneNumber;

  String formattedExpiryDate;

  String formattedDateOfBirth;

  String countryCode;

  String selectedGender;

  int genderCode;

  int selectedCountry;

  String telephoneCode;

  String selectedRelation;

  CommonResponse commonResponse =
      CommonResponse();

  List<String> gender = ["Male", "Female"];

  List<String> _relationsMale = [
    "Son",
    "Father",
    "Brother",
    "Husband",
    "Grand Father",
    "Newphew",
    "Brother In Law",
    "Grand Son",
    "Mother's brother",
    "Uncle",
    "Son In Law",
    "Step Father",
    "Father In Law"
  ];

  List<String> _relationFemale = [
    "Daughter",
    "Sister",
    "Mother",
    "Wife",
    "Grand Daughter",
    "Mother's Sister",
    "Aunty",
    "Daughter In Law",
    "Step Mother",
    "Mother In Law"
  ];

  List<String> genderBasedRelationList = List();

  var normalFormat = new DateFormat('MM/dd/yyyy');

  var isoFormat =
      new DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");

  var convertFormat =
  new DateFormat("yyyy-MM-dd'T'HH:mm:ss");

  RelationResult editableData;

  AddMemberViewModel(this.editableData) {

    _profileService =
    GetIt.instance<ProfileService>();

    sessionManager = SessionManager.getInstance();

    commonService =
    GetIt.instance<CommonService>();


    if (sessionManager.getCountryCodes == null) {
      getCountryCodes();
      _setloading(false);
    } else {
      _countryCodes =
          sessionManager.getCountryCodes;
      tempCountryCodes = _countryCodes;
      _setloading(false);
    }
    rawPhoneNumber = PhoneNumber(isoCode: 'UAE');

    if(editableData!=null){
      setEditableData(editableData);
    }
  }

  void setNationality(
    int index,
    int passengerType,
    CountryCodesResponseResult tempCountryCod,
  ) {
    nationality.text = tempCountryCod.name;

    countryCode = tempCountryCod.alpha2Code;

    print(tempCountryCod.name);

    print(tempCountryCod.alpha2Code);

    notifyListeners();
  }

  void setTempDate(DateTime date) {
    tempDate = date;
    notifyListeners();
  }

  void setSelectedDate(bool forward) {
    if (forward) {
      passportExpiryDate.text =
          normalFormat.format(tempDate);

      passportExpiryDateSelected = tempDate;

      formattedExpiryDate =
          isoFormat.format(tempDate);
    } else {
      dateOfBirth.text =
          normalFormat.format(tempDate);

      dateOfBirthSelected = tempDate;

      formattedDateOfBirth =
          isoFormat.format(tempDate);
    }

    tempDate = null;

    notifyListeners();
  }

  void setGender(newValue) {
    if (newValue == "Male") {
      genderCode = 0;
    } else {
      genderCode = 1;
    }

    print(genderCode);
    print(newValue);

    selectedRelation = null;

    genderBasedRelationList.clear();

    setGenderList();

    notifyListeners();
  }

  void setGenderList() {
    if (genderCode == 0) {
      genderBasedRelationList
          .addAll(_relationsMale);
    } else {
      genderBasedRelationList
          .addAll(_relationFemale);
    }

    notifyListeners();
  }

  void setGenderRelation(newValue) {
    selectedRelation = newValue;

    print(selectedRelation);
    notifyListeners();
  }

  void changeCountryCodeSelection(String value) {
    for (int i = 0;
        i < _countryCodes.length;
        i++) {
      if ("+" + _countryCodes[i].telephoneCode ==
          value) {
        selectedCountry = i;
        print(telephoneCode);
        telephoneCode =
            _countryCodes[i].telephoneCode;
        countryCode = _countryCodes[i].alpha2Code;

        break;
      }
    }
  }

  Future<CommonResponse> addFamilyMember() async {
    AddFamilyMembersRequest
        addFamilyMembersRequest =
        AddFamilyMembersRequest(
      firstName: firstName.text,
      lastName: lastName.text,
      email: emailId.text,
      gender: genderCode,
      country: nationality.text,
      phoneNumber:
          phoneNumber.text.trim().toString(),
      relation: selectedRelation,
      dob: formattedDateOfBirth,
      countryCode: countryCode,
      nationality: int.parse(telephoneCode),
      phoneCountryCode: "+" + telephoneCode,
      location: locationName.text,
      passportExpiry: formattedExpiryDate,
      passportNumber: passportNumber.text,
      userid: SessionManager.getInstance()
          .getUser
          .sub,
    );

    print(jsonEncode(
        addFamilyMembersRequest.toMap()));

    commonResponse = await _profileService
        .addFamilyMember(addFamilyMembersRequest);

    print(commonResponse.isError);

    return commonResponse;
  }

  void searchCountryList(String text) {
    var searchValue = text.trim();

    tempCountryCodes = [];

    searchValue.isNotEmpty
        ? tempCountryCodes =
            _countryCodes.where((results) {
            return results.name
                .toLowerCase()
                .contains(text.toLowerCase());
          }).toList()
        : tempCountryCodes.addAll(_countryCodes);

    notifyListeners();
  }

  void getCountryCodes() async {
    var result =
        await commonService.getCountryCodes();
    _countryCodes = result.result;
    tempCountryCodes = _countryCodes;
  }
  void _setloading(bool value) {
  loading = value;
  notifyListeners();
  }

  void setEditableData(RelationResult editableData) {
    firstName.text = editableData.firstName;
    lastName.text = editableData.lastName;
    emailId.text = editableData.email;
    locationName.text = editableData.location;
    dateOfBirthSelected  = convertFormat.parse(editableData.dob);
    dateOfBirth.text = normalFormat.format(dateOfBirthSelected);
    passportNumber.text = editableData.passportNumber;
    passportExpiryDateSelected = convertFormat.parse(editableData.passportExpiry);
    passportExpiryDate.text   = normalFormat.format(passportExpiryDateSelected);
    genderCode = editableData.gender;
    if(genderCode==0){
      selectedGender ="Male";
      genderBasedRelationList.addAll(_relationsMale);
    }else{
      selectedGender ="Female";
      genderBasedRelationList.addAll(_relationFemale);
    }
    selectedRelation = editableData.relation;
      nationality.text = editableData.country.replaceAll(RegExp(r'[()?]'), "");
      countryCode = editableData.countryCode;

    for (int i = 0; i < _countryCodes.length; i++) {
      if (_countryCodes[i].telephoneCode == editableData.nationality) {
        selectedCountry = i;

        rawPhoneNumber = PhoneNumber(phoneNumber:editableData.phoneNumber,dialCode:  "+"+_countryCodes[i].telephoneCode,isoCode: _countryCodes[i].alpha2Code );

        telephoneCode = rawPhoneNumber.dialCode;

        break;
      }
    }



    notifyListeners();




  }

      Future<CommonResponse> updateFamilyMember() async {


    UpdateFamilyMemberRequest updateFamilyMemberRequest  =
    UpdateFamilyMemberRequest(
      phoneNumber: phoneNumber.text,
      userid: editableData.userid,
      passportNumber: passportNumber.text,
      passportExpiry: convertFormat.format(passportExpiryDateSelected).toString(),
      location: locationName.text,
      phoneCountryCode: telephoneCode,
      nationality: int.parse(telephoneCode),
      countryCode: countryCode,
      dob: convertFormat.format(dateOfBirthSelected).toString(),
      relation: selectedRelation,
      country: nationality.text,
      gender: genderCode,
      email: emailId.text,
      lastName: lastName.text,
      firstName: firstName.text,
      id: editableData.id,
      uid: editableData.uid
    );

    print(jsonEncode(updateFamilyMemberRequest.toMap()));

    commonResponse = await _profileService.editFamilyMember(updateFamilyMemberRequest.toMap());

    print(commonResponse);

print(commonResponse.result);

return commonResponse;



  }

}
