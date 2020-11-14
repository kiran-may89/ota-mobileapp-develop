import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:ota/net/service/common/common_service.dart';

import 'package:ota/net/service/hotel/hotels_service.dart';
import 'package:ota/utils/constants.dart';
import 'package:ota/viewmodels/base_view_model.dart';
import 'package:ota/prefs/shared_prefernce.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/prefs/session_manager.dart';

class HomePageViewModel extends BaseViewModel {
  PageController pageController = new PageController();
  double currentPage = 0;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void initialise() {}
  List<Sliders> sliders = [
    Sliders('assets/images/hotels.png', "book_a_hotel"),
    Sliders('assets/images/flights.png', "book_a_flight"),
    Sliders('assets/images/event.png', "book_a_activity"),
    Sliders('assets/images/transfer.png', "book_a_transfer"),
    Sliders('assets/images/package.png', "book_a_package"),
    Sliders('assets/images/cruise.png', "book_a_cruise"),
  ];

  HomePageViewModel() {
    pageController.addListener(() {
      currentPage = pageController.page;
      notifyListeners();
    });
    CommonService commonService = GetIt.instance<CommonService>();

    if(checkFCMToken()!=null) {
      _getFCMToken();
    }else{
      setNotificationChannel(
      );
    }
  }


  void _getFCMToken() {

    _firebaseMessaging.requestNotificationPermissions(
    const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token){
      Pref.getInstnace().saveData(Pref().FCM_TOKEN, token);

    });

  }

  checkFCMToken() async{
    String token = await Pref.getInstnace().getData(Pref().FCM_TOKEN);
    return token;
  }

  void setNotificationChannel() {

    if (Platform.isIOS) {
      _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings());
    }

//    _firebaseMessaging.configure(
//      onMessage: (Map<String, dynamic> message) async {
//        print("onMessage: $message");
//      },
//      onLaunch: (Map<String, dynamic> message) async {
//        print("onLaunch: $message");
//      },
//      onResume: (Map<String, dynamic> message) async {
//        print("onResume: $message");
//      },
//    );
  }


}

void refreshAccessToken(value) async {}

class Sliders {
  String image;
  String title;

  Sliders(this.image, this.title);
}
