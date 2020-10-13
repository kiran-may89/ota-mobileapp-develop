import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ota/models/common/models/api_exception.dart';
import 'package:ota/models/onboard/requests/login_request.dart';
import 'package:ota/models/onboard/response/login_response.dart';
import 'package:ota/models/onboard/response/send_otp_response.dart';
import 'package:ota/models/onboard/response/otp_verify_response.dart';
import 'package:ota/models/onboard/requests/verify_otp_request.dart';
import 'package:ota/models/onboard/requests/send_otp_request.dart';
import 'package:ota/models/onboard/response/signup_response.dart';
import 'package:ota/models/onboard/requests/signup_request.dart';
import 'package:ota/net/service/onboarding/onboarding.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/models/onboard/requests/external_auth_request_model.dart';
class OnBoardRepo extends OnBoarding {
  final String _SIGN_UP = "auth/api/v1/User";
  final String _SEND_OTP = "notifications/api/v1/Sms/single/template";
  final String _VERIFY_OTP = "notifications/api/v1/Sms/verifyotp";
  final String _LOGIN = "auth/api/v1/Authenticate/MobileLogin";
  final String _AUTHENTICATE_EXTERNAL_LOGIN = "auth/api/v1/Authenticate/MobileExternalLogin";
  Dio apiConnector;

  OnBoardRepo(this.apiConnector);
  @override
  Future<SignupResponse> userSignUp(SignupRequest models) async {
    try {
      Response response = await apiConnector.post(_SIGN_UP, data: jsonEncode(models));
      var data = response.data;
      SignupResponse results = SignupResponse.fromJson(data);
      return results;
    } catch (error, stacktrace) {
      SignupResponse results = SignupResponse();
      if (error is DioError) {
        results.setException(error: error);
        DioError dioError = error as DioError;
        if (error.type == DioErrorType.RESPONSE) {
          results = SignupResponse.fromJson(error.response.data);
          results.apiException = ApiException.fromJson(error.response.data);
        }
      }

      return results;
    }
  }

  @override
  Future<SendOtpResponse> sendOtp(SendOtpRequest body) async {
    try {
      Response response = await apiConnector.post(_SEND_OTP, data: jsonEncode(body));
      var data = response.data;
      SendOtpResponse results = SendOtpResponse.fromJson(data);
      return results;
    } catch (error, stacktrace) {
      SendOtpResponse results = SendOtpResponse();
      if (error is DioError) {
        results.setException(error: error);
        results = SendOtpResponse.fromJson(error.response.data);
        results.apiException = ApiException.fromJson(error.response.data);
      }

      return results;
    }
  }

  @override
  Future<OtpVerifyResponse> verifyOtp(VerifyOtpRequest body) async {
    try {
      Response response = await apiConnector.post(_VERIFY_OTP, data: jsonEncode(body));
      var data = response.data;
      OtpVerifyResponse results = OtpVerifyResponse.fromJson(data);
      return results;
    } catch (error, stacktrace) {
      OtpVerifyResponse results = OtpVerifyResponse();
      if (error is DioError) {
        results.setException(error: error);
        results = OtpVerifyResponse.fromJson(error.response.data);
        results.apiException = ApiException.fromJson(error.response.data);
      }

      return results;
    }
  }

  @override
  Future<LoginResponse> userLogin(LoginRequest body)async {
    try {
      Response response = await apiConnector.post(_LOGIN, data: jsonEncode(body.toJson()));
      var data = response.data;
      LoginResponse results = LoginResponse.fromJson(data);

      return results;
    } catch (error, stacktrace) {
      LoginResponse results = LoginResponse();

      print(results.apiException.responseException.exceptionMessage);
      if (error is DioError) {

        results = LoginResponse.fromJson(error.response.data);
        results.apiException = ApiException.fromJson(error.response.data);
      }

      return results;
    }
  }

  @override
  Future<LoginResponse> authenicateExternal(ExternalAuthRequestModel body) async{
    try {
      Response response = await apiConnector.post(_AUTHENTICATE_EXTERNAL_LOGIN, data: jsonEncode(body.toJson()));
      var data = response.data;
      LoginResponse results = LoginResponse.fromJson(data);

      return results;
    } catch (error, stacktrace) {
      LoginResponse results = LoginResponse();

      print(results.apiException.responseException.exceptionMessage);
      if (error is DioError) {

        results = LoginResponse.fromJson(error.response.data);
        results.apiException = ApiException.fromJson(error.response.data);
      }

      return results;
    }
  }
}
