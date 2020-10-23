import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:ota/app/Router.dart';
import 'package:ota/models/onboard/requests/external_auth_request_model.dart';
import 'package:ota/models/onboard/response/fb_graph_model.dart';
import 'package:ota/models/onboard/response/login_response.dart';
import 'package:ota/models/onboard/response/user.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/prefs/shared_prefernce.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/utils/utils.dart';
import 'package:ota/viewmodels/signin_view_model.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> key = GlobalKey();
  SignInViewModel viewModel;
  GoogleSignIn _googleSignIn;

  _SignInState() {
    _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult = await facebookLogin.logIn(['email']);
    final graphResponse = await http
        .get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult.accessToken.token}');

    var fbdata = FbGraphModel.fromJson(jsonDecode(graphResponse.body));
    var result = await viewModel.authenicateExternal(ExternalAuthRequestModel(
        externalUserId: facebookLoginResult.accessToken.userId,
        externalProvider: "FaceBook",
        email: fbdata.email ?? "",
        name: fbdata.firstName,
        surName: fbdata.lastName ?? fbdata.firstName,
        givenName: fbdata.firstName));

    saveCredintials(result);
    Navigator.pushNamedAndRemoveUntil(context, Routes.dashboard, (route) => false);
  }

  void loginAction() async {
    viewModel.login().then((value) {
      Navigator.pop(context);
      if (value.isError) {
        Dialogs.showErrorPopup(context, messaage: value.apiException.responseException.exceptionMessage);
        return;
      }

      saveCredintials(value);
      Navigator.pushNamedAndRemoveUntil(context, Routes.dashboard, (route) => false);
    }, onError: (error) {
      Navigator.pop(context);
      Dialogs.showErrorPopup(context);
    });
  }

  void saveCredintials(LoginResponse response) {
    Pref prefs = Pref.getInstnace();
    prefs.saveAccessToken(response.result.accesToken);
    prefs.saveRefreshToken(response.result.refreshToken);
    SessionManager.getInstance().isGuest = false;
    setUser(response.result.accesToken);
  }

  void setUser(String idToken) {
    final List<String> parts = idToken.split('.');
    assert(parts.length == 3);

    var json = jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
    User user = User.fromJson(json);
    SessionManager.getInstance().setUser = user;
  }
  var screenHeight;

  @override
  Widget build(BuildContext context) {

    screenHeight =MediaQuery.of(context).size.height/10;

    return ChangeNotifierProvider<SignInViewModel>(create: (context) {
      viewModel = SignInViewModel();
      return viewModel;
    }, child: Consumer<SignInViewModel>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Color(0xFF033C5D),
//        appBar: AppBar(elevation: 0.0, leading: SizedBox.shrink()),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height ,
              margin: EdgeInsets.only(left: 32, right: 32),
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: screenHeight*.3),
              Text(strings.hi, style: CustomStyles.style1),
              SizedBox(height: 10),
              Text(strings.welcome_to, style: CustomStyles.style2),


              SizedBox(height: screenHeight*.4),
              Center(child: Text(strings.easy_login, style: CustomStyles.style3.copyWith(color: CustomColors.White.withOpacity(.5)))),
              SizedBox(height: screenHeight*.5),
              Column(
                children: [
                  Form(
                  key: key,
                  child: Column(
                    children: [
                      TextFormField(
                        style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                        onSaved: (value) {
                          model.request.email = value;
                        },
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          return value == null || value.isEmpty ? "Enter Email" : null;
                        },
                        decoration: InputDecoration(
                        hintText: "Email Id",
                        hintStyle: CustomStyles.HintStyle,
                        contentPadding: EdgeInsets.only(left: 20, top: 5),
                        suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          size: 18,
                        )),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                      ),
                      SizedBox(height: SizeConstants.SIZE_16),
                      TextFormField(
                        style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                        onSaved: (value) {
                          model.request.password = value;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        obscuringCharacter: "*",
                        validator: (value) {
                          bool valid = passwordExp.hasMatch(value);
                          if (value.isEmpty) {
                            return "Enter Password";
                          } else if (!valid) {
                            return "Enter Valid Password";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: CustomStyles.HintStyle,
                        contentPadding: EdgeInsets.only(left: 20, top: 5),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.cancel,
                            size: 18,
                          ),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white),
                      ),
                    ],
                  )),
                  SizedBox(height: SizeConstants.SIZE_24),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                    color: CustomColors.Orange,
                    child: Text("Login", style: CustomStyles.button_style),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      if (key.currentState.validate()) {
                        key.currentState.save();
                        Dialogs.showSpinkitLoading(context);
                        loginAction();
                      } else {}
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("OR", style: CustomStyles.style1.copyWith(color: Colors.white, fontSize: 12)),
                  ),
                  SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                    color: CustomColors.Orange,
                    child: Text(
                      "Continue As Guest",
                      style: CustomStyles.button_style.copyWith(),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {
                      Dialogs.showSpinkitLoading(context);
                      generateGuestToken();
                    }),
                  ),
                  SizedBox(
                    height: SizeConstants.SIZE_16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 48,
                        width: 100,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.white,
                          onPressed: () {
                            Dialogs.showSpinkitLoading(context);
                            initiateFacebookLogin();
                          },
                          child: Container(
                          height: 48,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                            Image.asset(
                              "assets/images/facebook_icon.png",
                              fit: BoxFit.contain,
                            )
                          ])),
                        ),
                      ),
                      SizedBox(
                        width: SizeConstants.SIZE_16,
                      ),
                      SizedBox(
                        height: 48,
                        width: 100,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.white,
                          child: Container(
                          height: 60,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                            Image.asset(
                              "assets/images/google_icon.png",
                              fit: BoxFit.contain,
                            )
                          ])),
                          onPressed: () async {
                            try {
                              GoogleSignInAccount account = await _googleSignIn.signIn();
                              print(account.email);
                            } catch (error) {
                              print(error);
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
//              Flexible(
//              fit: FlexFit.loose,
//
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      SizedBox(height: 25),
//                      Center(child: Text(strings.easy_login, style: CustomStyles.style3.copyWith(color: CustomColors.White.withOpacity(.5)))),
//                      SizedBox(height: 25),
//                      SizedBox(height: 25),
//                      Column(
//                        children: [
//                          Form(
//                              key: key,
//                              child: Column(
//                                children: [
//                                  TextFormField(
//                                    style: CustomStyles.HintStyle.copyWith(color: Colors.black),
//                                    onSaved: (value) {
//                                      model.request.email = value;
//                                    },
//                                    keyboardType: TextInputType.name,
//                                    validator: (value) {
//                                      return value == null || value.isEmpty ? "Enter Email" : null;
//                                    },
//                                    decoration: InputDecoration(
//                                        hintText: "Email Id",
//                                        hintStyle: CustomStyles.HintStyle,
//                                        contentPadding: EdgeInsets.only(left: 20, top: 5),
//                                        suffixIcon: IconButton(
//                                            onPressed: () {},
//                                            icon: Icon(
//                                              Icons.cancel,
//                                              size: 18,
//                                            )),
//                                        border: new OutlineInputBorder(
//                                          borderRadius: const BorderRadius.all(
//                                            const Radius.circular(5.0),
//                                          ),
//                                        ),
//                                        filled: true,
//                                        fillColor: Colors.white),
//                                  ),
//                                  SizedBox(height: SizeConstants.SIZE_16),
//                                  TextFormField(
//                                    style: CustomStyles.HintStyle.copyWith(color: Colors.black),
//                                    onSaved: (value) {
//                                      model.request.password = value;
//                                    },
//                                    keyboardType: TextInputType.visiblePassword,
//                                    obscureText: true,
//                                    obscuringCharacter: "*",
//                                    validator: (value) {
//                                      bool valid = passwordExp.hasMatch(value);
//                                      if (value.isEmpty) {
//                                        return "Enter Password";
//                                      } else if (!valid) {
//                                        return "Enter Valid Password";
//                                      } else {
//                                        return null;
//                                      }
//                                    },
//                                    decoration: InputDecoration(
//                                        hintText: "Password",
//                                        hintStyle: CustomStyles.HintStyle,
//                                        contentPadding: EdgeInsets.only(left: 20, top: 5),
//                                        suffixIcon: IconButton(
//                                          onPressed: () {},
//                                          icon: Icon(
//                                            Icons.cancel,
//                                            size: 18,
//                                          ),
//                                        ),
//                                        border: new OutlineInputBorder(
//                                          borderRadius: const BorderRadius.all(
//                                            const Radius.circular(5.0),
//                                          ),
//                                        ),
//                                        filled: true,
//                                        fillColor: Colors.white),
//                                  ),
//                                ],
//                              )),
//                          SizedBox(height: SizeConstants.SIZE_24),
//                          SizedBox(
//                            height: 48,
//                            width: MediaQuery.of(context).size.width,
//                            child: RaisedButton(
//                                color: CustomColors.Orange,
//                                child: Text("Login", style: CustomStyles.button_style),
//                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//                                onPressed: () {
//                                  if (key.currentState.validate()) {
//                                    key.currentState.save();
//                                    Dialogs.showSpinkitLoading(context);
//                                    loginAction();
//                                  } else {}
//                                }),
//                          ),
//                          Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Text("OR", style: CustomStyles.style1.copyWith(color: Colors.white, fontSize: 12)),
//                          ),
//                          SizedBox(
//                            height: 48,
//                            width: MediaQuery.of(context).size.width,
//                            child: RaisedButton(
//                                color: CustomColors.Orange,
//                                child: Text(
//                                  "Continue As Guest",
//                                  style: CustomStyles.button_style.copyWith(),
//                                ),
//                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//                                onPressed: () {
//                                  Dialogs.showSpinkitLoading(context);
//                                  generateGuestToken();
//                                }),
//                          ),
//                          SizedBox(
//                            height: SizeConstants.SIZE_16,
//                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: [
//                              SizedBox(
//                                height: 48,
//                                width: 100,
//                                child: RaisedButton(
//                                  color: Colors.white,
//                                  onPressed: () {
//                                    Dialogs.showSpinkitLoading(context);
//                                    initiateFacebookLogin();
//                                  },
//                                  child: Container(
//                                      height: 48,
//                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
//                                        Image.asset(
//                                          "assets/images/facebook_icon.png",
//                                          fit: BoxFit.contain,
//                                        )
//                                      ])),
//                                ),
//                              ),
//                              SizedBox(
//                                width: SizeConstants.SIZE_16,
//                              ),
//                              SizedBox(
//                                height: 48,
//                                width: 100,
//                                child: RaisedButton(
//                                  color: Colors.white,
//                                  child: Container(
//                                      height: 60,
//                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
//                                        Image.asset(
//                                          "assets/images/google_icon.png",
//                                          fit: BoxFit.contain,
//                                        )
//                                      ])),
//                                  onPressed: () async {
//                                    try {
//                                      GoogleSignInAccount account = await _googleSignIn.signIn();
//                                      print(account.email);
//                                    } catch (error) {
//                                      print(error);
//                                    }
//                                  },
//                                ),
//                              ),
//                            ],
//                          )
//                        ],
//                      ),
//                    ],
//                  )),

              SizedBox(height: screenHeight*.3),
              Center(
                child: Text(strings.Terms1,
                    style: CustomStyles.style5.copyWith(color: CustomColors.White.withOpacity(.5), height: 1.5), textAlign: TextAlign.center),
              ),
              SizedBox(height: screenHeight*.3),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(bottom: screenHeight*.2, right: 16),
                    child: Text("Sign Up", style: CustomStyles.button_style),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.signUp);
                  },
                ),
              )
            ],
              ),
            ),
          ),
        ),
      );
    }));
  }

  Future<void> generateGuestToken() async {
    CommonService commonService = GetIt.instance<CommonService>();

    var result = await commonService.getGuestToken();

    if (result != null) {
      SessionManager.getInstance().isGuest = true;
      Navigator.pushNamedAndRemoveUntil(context, Routes.dashboard, (route) => false);
    }
  }
}
