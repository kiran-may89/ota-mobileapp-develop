import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/onboard/response/signup_response.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/otp_verify_viewmodel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OtpVerification extends StatefulWidget {
  SignupResponse signupResponse;
  OtpVerification(this.signupResponse);
  @override
  _OtpVerificationState createState() => _OtpVerificationState(signupResponse);
}

class _OtpVerificationState extends State<OtpVerification> {
  OtpVerifyViewModel viewModel;
  TextEditingController textEditingController = TextEditingController();
  String otp = "";
  SignupResponse signupResponse;
  _OtpVerificationState(this.signupResponse);
  void startTransaction(BuildContext context) {
    if (otp.length != 6) return;
    showDialog(
        context: context,
        barrierColor: Colors.black12,
        barrierDismissible: true,
        child: Container(
          width: SizeConstants.SIZE_50,
          height: SizeConstants.SIZE_50,
          color: Colors.transparent,
          child: SpinKitChasingDots(
            size: SizeConstants.SIZE_50,
            color: CustomColors.BackGround,
          ),
        ));
    viewModel.verifyOtp(otp).then((value) {
      Navigator.pop(context);
      if (!value.isError) {
        SessionManager.getInstance().isGuest = false;
        Navigator.pushNamed(context, Routes.dashboard);
      } else {
        Dialogs.showErrorPopup(context, messaage: value.apiException.responseException.exceptionMessage);
      }
    }).catchError((value, trace) {
      Dialogs.showErrorPopup(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OtpVerifyViewModel>(
        create: (context) => viewModel = OtpVerifyViewModel(signupResponse),
        child: Consumer<OtpVerifyViewModel>(
          builder: (context, model, child) {
            return Scaffold(
              backgroundColor: CustomColors.BackGround,
              appBar: AppBar(
                backgroundColor: CustomColors.BackGround,
                elevation: 0.0,
                leading: new IconButton(
                  icon: new Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 13,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: new Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 20,
                    ),
                    // onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - kBottomNavigationBarHeight,
                  margin: EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                getLocalText("hi", context),
                                style: CustomStyles.style1,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                getLocalText('verify_your_email', context),
                                style: CustomStyles.style2,
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Text(
                                  getLocalText('otp_has_been_sent', context),
                                  style: CustomStyles.style3.copyWith(color: CustomColors.White.withOpacity(.5)),
                                ),
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              PinCodeTextField(
                                  length: 6,
                                 // obsecureText: false,
                                  autoValidate: true,
                                  animationType: AnimationType.fade,
                                  backgroundColor: CustomColors.BackGround,
                                  textStyle: CustomStyles.medium16.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                  pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.underline,
                                      borderWidth: 2.0,
                                      activeColor: Colors.white,
                                      inactiveColor: Colors.white,
                                      activeFillColor: Colors.white),
                                  animationDuration: Duration(milliseconds: 300),
                                  controller: textEditingController,
                                  onChanged: (value) {
                                    otp = value;
                                  }),
                              Center(
                                  child: Text(
                                "30 sec",
                                style: CustomStyles.countDownStyle,
                              )),
                              SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  // width: ,
                                  height: 23,

                                  child: FlatButton(
                                    child: Text(
                                      getLocalText("resend_otp", context),
                                      style: CustomStyles.button_style.copyWith(fontSize: 12),
                                    ),
                                    shape:
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0), side: BorderSide(color: CustomColors.White)),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: RaisedButton(
                                    color: CustomColors.Orange,
                                    child: Text(
                                      getLocalText("continue", context),
                                      style: CustomStyles.button_style,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () {
                                      startTransaction(context);
                                    }),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  strings.Terms1,
                                  style: CustomStyles.style5.copyWith(color: CustomColors.White.withOpacity(.5), height: 1.5),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 38,
                              ),
                              /*  Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  child: Text(
                                    strings.skip,
                                    style: CustomStyles.countDownStyle,
                                  ),
                                  onTap: () {},
                                ),
                              )
                            */
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
