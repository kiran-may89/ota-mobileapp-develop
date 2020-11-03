import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/common/models/validation_errors.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/utils/utils.dart';
import 'package:ota/viewmodels/signup_view_model.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignUp> {
  bool _validate = false;
  bool _autoValidate = false;
  bool phoneNumberValidated = false;
  GlobalKey<FormState> _formkey = new GlobalKey();
  SignUpViewModel model;

  void startTransaction(
    BuildContext context,
  ) {
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
    model.signUp().then((value) {
      Navigator.pop(context);
      if (!value.isError) {
        Navigator.pushNamed(context, Routes.otpVerification, arguments: value);
      } else {
        ValidationErrors validationErrors = value.apiException.responseException.validationErrors[0];
        Dialogs.showErrorPopup(context, messaage: validationErrors.message);
      }
    }).catchError((value, trace) {
      Dialogs.showErrorPopup(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => model = SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
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
                ),
              ],
            ),
            body: model.isLoading
                ? SpinKitChasingDots(
                    size: SizeConstants.SIZE_50,
                    color: CustomColors.White,
                  )
                : SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.only(left: SizeConstants.SIZE_30, right: SizeConstants.SIZE_30),
                        child: Form(
                          key: _formkey,
                          autovalidate: _autoValidate,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: SizeConstants.SIZE_10,
                              ),
                              Text(
                                getLocalText('create_account', context),
                                style: CustomStyles.style1,
                              ),
                              SizedBox(
                                height: SizeConstants.SIZE_16,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                                      onSaved: (value) {
                                        model.signupRequest.firstName = value;
                                      },
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        return value == null || value.isEmpty ? getLocalText("enter_first_name", context) : null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: getLocalText("first_name", context),
                                          hintStyle: CustomStyles.HintStyle,
                                          contentPadding: EdgeInsets.only(left: 10, top: 5,right: 10),
                                          suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.cancel,
                                              size: 18,
                                            ),
                                          ),
                                          border: new OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(5.0),
                                            ),
                                          ),
                                          filled: true,
                                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                          fillColor: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: SizeConstants.SIZE_4,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                                      onSaved: (value) {
                                        model.signupRequest.lastName = value;
                                      },
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        return value == null || value.isEmpty ? getLocalText("enter_last_name", context) : null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: getLocalText("last_name", context),
                                          hintStyle: CustomStyles.HintStyle,
                                          contentPadding: EdgeInsets.only(left: 10, top: 5,right: 10),                                          suffixIcon: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.cancel,
                                              size: 18,
                                            ),
                                          ),
                                          border: new OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(5.0),
                                            ),
                                          ),
                                          filled: true,
                                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                          fillColor: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConstants.SIZE_10,
                              ),
                              TextFormField(
                                style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                                onSaved: (value) {
                                  model.signupRequest.email = value;
                                },
                                keyboardType: TextInputType.emailAddress,

                                validator: (input) =>input.isEmpty?getLocalText("enter_email", context): isValidEmail(input) ? null :getLocalText("enter_valid_email", context),

                                decoration: InputDecoration(
                                    hintText:  getLocalText("email_id", context),
                                    hintStyle: CustomStyles.HintStyle,
                                    contentPadding: EdgeInsets.only(left: 10, top: 5,right: 10),                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.cancel,
                                        size: 18,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(5.0),
                                      ),
                                    ),
                                    filled: true,
                                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                    fillColor: Colors.white),
                              ),
                              SizedBox(
                                height: SizeConstants.SIZE_10,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                child: InternationalPhoneNumberInput(
                                  onSaved: (value) {
                                    model.signupRequest.phoneNumber =
                                        "+${model.countryCodes[model.selectedCountry].telephoneCode} " + value.replaceAll(" ", "");
                                  },
                                  textStyle: CustomStyles.HintStyle.copyWith(color: Colors.black),
                                  selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
                                  onInputChanged: (PhoneNumber number) {
                                    model.onCountryCodeChanged(number.dialCode);
                                  },
                                  onInputValidated: (bool value) {
                                    phoneNumberValidated = value;
                                  },
                                  validator: (value) {
                                    if (!phoneNumberValidated) {
                                      return getLocalText("enter_phone_number", context);
                                    }
                                    return null;
                                  },
                                  inputDecoration: new InputDecoration(
                                      contentPadding: EdgeInsets.only(left: -25),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: getLocalText("phone_number", context),
                                    hintStyle: CustomStyles.HintStyle,),
                                  ignoreBlank: false,
                                  initialValue: model.phoneNumber,
                                ),
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(SizeConstants.SIZE_4))),
                              ),
                              SizedBox(
                                height: SizeConstants.SIZE_10,
                              ),
                              TextFormField(
                                style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                                onSaved: (value) {
                                  model.signupRequest.address = value;
                                },
                                keyboardType: TextInputType.streetAddress,
                                validator: (value) {
                                  return value == null || value.isEmpty ? "Enter address" : null;
                                },
                                decoration: InputDecoration(
                                    hintText: getLocalText("address", context),
                                    hintStyle: CustomStyles.HintStyle,
                                    contentPadding: EdgeInsets.only(left: 10, top: 5,right: 10),                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.cancel,
                                        size: 24,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(5.0),
                                      ),
                                    ),
                                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                    filled: true,
                                    fillColor: Colors.white),
                              ),
                              SizedBox(
                                height: SizeConstants.SIZE_10,
                              ),
                              TextFormField(
                                style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                                onSaved: (value) {
                                  model.signupRequest.passwordHash = value;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                obscuringCharacter: "*",
                                validator: (value) {
                                  bool valid = passwordExp.hasMatch(value);
                                  return !valid ? getLocalText("enter_valid_password", context) : null;

                                },
                                onChanged: (value) => model.signupRequest.passwordHash = value,
                                decoration: InputDecoration(
                                    hintText: getLocalText("password",context),
                                    hintStyle: CustomStyles.HintStyle,
                                    contentPadding: EdgeInsets.only(left: 10, top: 5,right: 10),                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.cancel,
                                        size: 18,
                                      ),
                                    ),
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(5.0),
                                      ),
                                    ),
                                    filled: true,
                                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                    fillColor: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                                onSaved: (value) {
                                  model.signupRequest.passwordHash = value;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                obscuringCharacter: "*",
                                validator: (value) {
                                  bool valid = passwordExp.hasMatch(value);

                                  if (!valid) {
                                    return getLocalText("enter_password", context);
                                  } else if (value != model.signupRequest.passwordHash) {
                                    return getLocalText("password_did_not_match", context);
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: getLocalText("confirm_password", context),
                                    suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.cancel,
                                        size: 18,
                                      ),
                                    ),
                                    hintStyle: CustomStyles.HintStyle,
                                    contentPadding: EdgeInsets.only(left: 10, top: 5,right: 10),                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(5.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white),
                              ),
                              SizedBox(
                                height: 23,
                              ),
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: RaisedButton(
                                    color: CustomColors.Orange,
                                    child: Text(
                                      getLocalText('done', context),
                                      style: CustomStyles.button_style,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    onPressed: () {
                                      if (_formkey.currentState.validate()) {
                                        _formkey.currentState.save();
                                        startTransaction(context);
                                      } else {
                                        _autoValidate = true;
                                      }
                                    }),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  child: Text(
                                    getLocalText('skip', context),
                                    style: CustomStyles.countDownStyle,
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushNamedAndRemoveUntil(Routes.dashboard, (route) => false);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                        ))),
          );
        },
      ),
    );
    
    
  }

  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
  bool isValidEmail(email) {
    return RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    .hasMatch(email);
  }
}
