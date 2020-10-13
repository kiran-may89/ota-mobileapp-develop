import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/profile/requests/add_famliy_member.dart';
import 'package:ota/models/profile/responses/common_response.dart';
import 'package:ota/models/profile/responses/family_list.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/net/service/profile/profile_service.dart';
import 'package:ota/prefs/session_manager.dart';

class FamilyMembersViewModel
    extends ChangeNotifier {
  ProfileService _profileService;

  CommonService commonService;

  SessionManager sessionManager;

  List<CountryCodesResponseResult> _countryCodes;

  List<CountryCodesResponseResult>
      tempCountryCodes;
  CommonResponse commonResponse  = CommonResponse();

  RelationsList relationsList = RelationsList();

  bool loading = true;


  List<bool>visible = List();



  FamilyMembersViewModel() {
    _profileService =
    GetIt.instance<ProfileService>();

    sessionManager = SessionManager.getInstance();

    commonService =
        GetIt.instance<CommonService>();

    getFamilyMembersList();



  }





  Future<void> getFamilyMembersList() async {


    print(SessionManager.getInstance()
        .getUser
        .firstName);


    relationsList =
        await _profileService.getFamilyMemersList(SessionManager.getInstance().getUser.sub);

    visible.clear();

    visible = List.generate(relationsList.result.length, (index) => false);

    _setloading(false);
  }

  void _setloading(bool value) {
    loading = value;
    notifyListeners();
  }



  void showDetails(int index) {

    if(visible[index] == true){
      visible[index] = false;
    }else{
      visible[index] = true;
    }


    notifyListeners();

  }

  Future<CommonResponse>removeMember(int index) async {

    String uID = relationsList.result[index].uid;

    commonResponse = await _profileService.removeFamilyMember(uID);

    print(commonResponse.isError);
    notifyListeners();
        return commonResponse;

  }









}
