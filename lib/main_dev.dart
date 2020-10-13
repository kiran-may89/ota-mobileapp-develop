import 'dart:convert';
import 'package:crypto/crypto.dart' as crypt;
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart' as Key;
import 'package:encrypt/encrypt.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/app/base_app.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/prefs/shared_prefernce.dart';
import 'package:ota/productflavors/flavor_package.dart';
import 'package:ota/utils/constants.dart';

import 'net/service/common/common_service.dart';

Future<void> main() async {
  Crashlytics.instance.enableInDevMode = true;

  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;
  var token = await Pref.getInstnace().getRefreshToken();
  SessionManager session = SessionManager.getInstance();


  if (token != null) {
    session.isGuest = false;
    session.setRefreshToekn = token;
  }

  FlavourConfig(
      flavor: Flavor.DEV,
      name: Flavor.DEV,
      values: FlavorValues(
        baseUrl: Constants.DEV_BASEURL,
      ));
  runApp(MyApp());
}

class MyApp extends BaseApp {}
