import 'package:ota/models/onboard/requests/login_request.dart';
import 'package:ota/models/onboard/requests/send_otp_request.dart';
import 'package:ota/models/onboard/requests/verify_otp_request.dart';
import 'package:ota/models/onboard/response/login_response.dart';
import 'package:ota/models/onboard/response/otp_verify_response.dart';
import 'package:ota/models/onboard/response/send_otp_response.dart';
import 'package:ota/models/onboard/response/signup_response.dart';
import 'package:ota/models/onboard/requests/signup_request.dart';
import 'package:ota/models/onboard/requests/external_auth_request_model.dart';

abstract class OnBoarding {
  Future<SignupResponse> userSignUp(SignupRequest models);
  Future<SendOtpResponse> sendOtp(SendOtpRequest body);
  Future<OtpVerifyResponse> verifyOtp(VerifyOtpRequest body);
  Future<LoginResponse> userLogin(LoginRequest body);
  Future<LoginResponse> authenicateExternal(ExternalAuthRequestModel body);
}
