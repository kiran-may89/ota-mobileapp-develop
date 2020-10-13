import 'dart:convert';
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

  void initialise() {}
  List<Sliders> sliders = [
    Sliders('assets/images/flights.png', "Book a flight"),
    Sliders('assets/images/hotels.png', "Book a hotel"),
    Sliders('assets/images/cruise.png', "Book a cruise"),
    Sliders('assets/images/package.png', "Book a package"),
    Sliders('assets/images/transfer.png', "Book a transfer"),
    Sliders('assets/images/event.png', "Book an Activity"),
  ];

  HomePageViewModel() {
    pageController.addListener(() {
      currentPage = pageController.page;
      notifyListeners();
    });
    CommonService commonService = GetIt.instance<CommonService>();


  }
}

void refreshAccessToken(value) async {}

class Sliders {
  String image;
  String title;

  Sliders(this.image, this.title);
}
