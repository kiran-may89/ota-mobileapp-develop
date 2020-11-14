

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/profile/requests/change_password_request.dart';
import 'package:ota/models/profile/responses/change_password_response.dart';
import 'package:ota/net/service/profile/profile_service.dart';

class ChangePasswordViewModel extends ChangeNotifier{


  ProfileService _profileService;

var presentPassword = TextEditingController();

var newPassword = TextEditingController();

var confirmPassword  = TextEditingController();

  ChangePasswordResponse changePasswordResponse = ChangePasswordResponse();

ChangePasswordViewModel(){
  _profileService = GetIt.instance<ProfileService>();
}

  Future<ChangePasswordResponse>changePassword() async {

    ChangePasswordRequest changePasswordRequest =  ChangePasswordRequest(password: newPassword.text,confirmPassword:confirmPassword.text,oldPassword: presentPassword.text);

 changePasswordResponse = await  _profileService.changePassword(changePasswordRequest);

    return changePasswordResponse;

  }




}