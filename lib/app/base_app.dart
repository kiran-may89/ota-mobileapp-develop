import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/net/api_service_config.dart';
import 'package:ota/net/service/activity/ActivityServie_Impl.dart';
import 'package:ota/net/service/activity/activity_service.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/net/service/common/common_service_impl.dart';
import 'package:ota/net/service/flight_service/flight_service.dart';
import 'package:ota/net/service/flight_service/flight_service_impl.dart';
import 'package:ota/net/service/googleplaces/google_place_repository.dart';
import 'package:ota/net/service/googleplaces/google_places.dart';
import 'package:ota/net/service/hotel/hotel_service_impl.dart';
import 'package:ota/net/service/hotel/hotels_service.dart';
import 'package:ota/net/service/my_bookings/booking_service.dart';
import 'package:ota/net/service/my_bookings/booking_service_impl.dart';
import 'package:ota/net/service/onboarding/onboard_repo.dart';
import 'package:ota/net/service/onboarding/onboarding.dart';
import 'package:ota/net/service/package/package_service.dart';
import 'package:ota/net/service/package/package_service_impl.dart';
import 'package:ota/net/service/profile/profile_service.dart';
import 'package:ota/net/service/profile/profile_service_impl.dart';
import 'package:ota/net/service/transfers/transfer_service.dart';
import 'package:ota/net/service/transfers/transfer_service_implementation.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/prefs/shared_prefernce.dart';

class BaseApp extends StatelessWidget {


  BaseApp() {
    GetIt it = GetIt.instance;
    var config = ApiServiceConfig.instance;
    it.registerLazySingleton<FlightService>(
        () => FlightServiceImpl(config.dio));
    it.registerLazySingleton<HotelService>(() => HotelServiceImpl(config.dio));
    it.registerLazySingleton<GooglePlaces>(() => GooglePlaceRepository());
    it.registerLazySingleton<TransferService>(
        () => TransferServiceImplementation(config.dio));
    it.registerLazySingleton<ActivityService>(
        () => ActivityService_Impl(config.dio));
    it.registerLazySingleton<OnBoarding>(() => OnBoardRepo(config.dio));
    it.registerLazySingleton<ProfileService>(() => ProfileServiceImpl(config.dio));

    it.registerLazySingleton<CommonService>(
        () => CommonServiceImpl(config.dio));
    it.registerLazySingleton<BookingService>(() => BookingServiceImpl(config.dio));

    it.registerLazySingleton<PackageService>(() => PackageServiceImpl(config.dio));
    SessionManager session = SessionManager.getInstance();
    CommonService commonService = GetIt.instance<CommonService>();
    if (session.isGuest) {
      commonService.getGuestToken();
    } else {
      commonService.refreshAccessToken(session.getRefreshToken);
    }



  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: "TripShop",
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color(0xFF033C5D),
        accentColor: Color(0xFFF18246),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        unselectedWidgetColor: Colors.white,
        disabledColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      supportedLocales: [
//        Locale('en', 'US'),
//        Locale('ar', 'AR'),
//      ],

      debugShowCheckedModeBanner: false,

      initialRoute: "/",

      onGenerateRoute: Routes.generatRouter,

//      home: MyHomePage(),
    );
  }



  }

//  Future _showNotificationWithoutSound(Map<String, dynamic> msg) async {
//    final title = msg['notification']['title'];
//    final body = msg['notification']['body'];
//    var r;
//    Random rnd;
//    int min = 5;
//    int max = 10;
//    rnd = new Random();
//    r = min + rnd.nextInt(max - min);
//    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//    '$r', 'myorders', 'patient first',
//    channelShowBadge: true,
//    playSound: true, importance: Importance.Max, priority: Priority.High);
//    var iOSPlatformChannelSpecifics =
//    new IOSNotificationDetails(presentSound: false);
//    var platformChannelSpecifics = new NotificationDetails(
//    androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.show(
//    r,
//    '$title',
//    '$body',
//    platformChannelSpecifics,
//    payload: 'No_Sound'
//    );
//  }



