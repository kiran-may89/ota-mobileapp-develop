import 'package:get_it/get_it.dart';
import 'package:ota/models/onboard/requests/send_otp_request.dart';
import 'package:ota/models/onboard/requests/verify_otp_request.dart';
import 'package:ota/models/onboard/response/otp_verify_response.dart';
import 'package:ota/models/onboard/response/send_otp_response.dart';
import 'package:ota/models/onboard/response/signup_response.dart';
import 'package:ota/net/service/onboarding/onboarding.dart';
import 'package:ota/viewmodels/base_view_model.dart';

class OtpVerifyViewModel extends BaseViewModel {
  OnBoarding _service;
  SignupResponse signupResponse;
  SendOtpRequest otpRequest;
  SendOtpResponse sendOtpResponse;
  @override
  void initialise() {}
  OtpVerifyViewModel(this.signupResponse) {
    _service = GetIt.instance<OnBoarding>();
    otpRequest = SendOtpRequest(contextId: "5b80ce58-9cfd-4715-aada-4516d09365b5",
    //signupResponse.result.id
     mobileNumber: signupResponse.result.phoneNumber);

    sendOtp();
  }
  void sendOtp() async {
    sendOtpResponse = await _service.sendOtp(otpRequest);

  }

  Future<OtpVerifyResponse> verifyOtp(String otp) async {
    VerifyOtpRequest request = VerifyOtpRequest(otp: otp, referenceId: sendOtpResponse.result);
    return await _service.verifyOtp(request);
  }
}
