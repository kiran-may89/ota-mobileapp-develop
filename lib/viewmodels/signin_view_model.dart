import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/onboard/requests/login_request.dart';
import 'package:ota/models/onboard/response/login_response.dart';
import 'package:ota/net/service/onboarding/onboarding.dart';
import 'package:ota/viewmodels/validationItem.dart';
import 'package:ota/models/onboard/requests/external_auth_request_model.dart';
import 'base_view_model.dart';

class SignInViewModel extends BaseViewModel {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginRequest request = LoginRequest();

  OnBoarding _service;

  SignInViewModel() {
    _service = GetIt.instance<OnBoarding>();
  }

  @override
  void initialise() {}

  Future<LoginResponse> login() async {
    return _service.userLogin(request);
  }

  Future<LoginResponse> authenicateExternal(ExternalAuthRequestModel model) async {
    return _service.authenicateExternal(model);
  }
}
