import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:ota/models/activity/request/search_activity_data.dart';
import 'package:ota/models/googleplaces/place.dart';
import 'package:ota/models/googleplaces/predictions.dart';
import 'package:ota/models/transfers/requests/search_transfer_request.dart';
import 'package:ota/net/service/googleplaces/google_place_repository.dart';
import 'package:ota/net/service/googleplaces/google_places.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';

class Activity_Model extends ChangeNotifier {

  final TextEditingController _fromTypeHeadController = TextEditingController();

  TextEditingController get fromTypeHeadController => _fromTypeHeadController;

  GooglePlaceRepository _googleServices;

  Place fromPlace;

  String FromPlace_details;

  bool startSearch = false;

  int adultCount = 0;

  int childCount = 0;

  String startPlaceData;

  bool _toggleDateVisible = true;

  double calenderHeight = 280;

  bool get toggleDateVisible => _toggleDateVisible;


  String startDateMOnth = "-";
  //= new DateFormat("dd-MMM").format(DateTime.now());

  String returnDateMonth = "-";

  String startDate ;
  //= DateFormat("dd/MM/yyyy").format(DateTime.now());

  String returnDate ;
  //= DateFormat("dd/MM/yyyy").format(DateTime.now());

  List<int> Age = List();

  Activity_Model() {
    _googleServices = GetIt.instance<GooglePlaces>();
  }

  Future<Predictions> getPredcitions(String pattern) async {
    var response = await _googleServices.getPredictions(pattern);
    return response;
  }

  void setFromSelected(Prediction suggestion) {
    startPlaceData = suggestion.description;
    _fromTypeHeadController.text = null;
    getPlaceDetails(suggestion).then((value) => {fromPlace = value, print(fromPlace.result.geometry)});

  }

  Future<Place> getPlaceDetails(Prediction suggestion) async {
    var response = await _googleServices.getPlace(suggestion.placeId);
    return response;
  }

  void addChild() {
    childCount++;
    notifyListeners();
  }

  void removeChild() {
    if (childCount != 0) childCount--;
    notifyListeners();
  }

  void addAdult() {
    adultCount++;
    Age.add(0);
    notifyListeners();
  }

  void removeAdult() {
    if (adultCount != 0) adultCount--;
    Age.removeLast();
    notifyListeners();
  }

  void upDestinationDate(DateTime date) {
    startDate = DateFormat("yyyy-MM-dd").format(date);

    startDateMOnth = new DateFormat("dd-MMM").format(date);

    notifyListeners();
  }

  void upReturnDate(DateTime _return) {
    returnDate = DateFormat("yyyy-MM-dd").format(_return);

    returnDateMonth = new DateFormat("dd-MMM").format(_return);

    toggleCalender();

    notifyListeners();
  }

  getRequestData() {
    SearchActivityData searchActivityData = SearchActivityData(
        adultCnt: adultCount,
        startPoint: StartPoint(
            lat: fromPlace.result.geometry.location.lat,
            lng: fromPlace.result.geometry.location.lng),
        Age: Age,
        fromDate: startDate,
        fromDateMonth: startDateMOnth,
        returnDate: returnDate,
        returnDateMonth: returnDateMonth,
        startPlaceName: startPlaceData,
        language: "en");

    print(searchActivityData);

    return searchActivityData;
  }



  void dataChanged(String text){

    if(text.length!=0){
      startSearch = true;
    }else{
      startSearch =false;
    }


    notifyListeners();
  }

  void cancelSearch() {
    startSearch =false;
    notifyListeners();
  }

  void toggleCalender() {
    _toggleDateVisible = !_toggleDateVisible;
    calenderHeight  = _toggleDateVisible?280:0;
    notifyListeners();
  }

  bool validateData(GlobalKey<ScaffoldState> scaffoldKey) {

    bool isGuestError =false;

    if(adultCount!=0) {
      Age.forEach((element) {
        if (element == 0)
          isGuestError = true;
      });
    }

    SnackBar snackBar;



    if(startPlaceData==null){

      snackBar = SnackBar(content:Text("Please Select Source",style: CustomStyles.medium16.copyWith(color: CustomColors.White),),
        backgroundColor: CustomColors.BackGround,
      );

      scaffoldKey.currentState.showSnackBar(snackBar);
      return false;

    }else if(startDate==null||startDate==""){


      snackBar = SnackBar(content: Text("Select Start Date",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
        backgroundColor: CustomColors.BackGround,);

      scaffoldKey.currentState.showSnackBar(snackBar);


      return false;


    }else if(returnDate==null||returnDate==""){

      snackBar = SnackBar(content: Text("Select return Date",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
        backgroundColor: CustomColors.BackGround,);

      scaffoldKey.currentState.showSnackBar(snackBar);

      return false;


    }else if(adultCount==0){

      snackBar = SnackBar(content: Text("Add Guests",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
        backgroundColor: CustomColors.BackGround,);

      scaffoldKey.currentState.showSnackBar(snackBar);

      return false;


    }
    else if(isGuestError)
      {
        snackBar = SnackBar(content: Text("Add Guests Age",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
          backgroundColor: CustomColors.BackGround,);

        scaffoldKey.currentState.showSnackBar(snackBar);

        return false;

      }


    else{
      return true;
    }
//    else{
//
//      var status;
//
//
//      for (var number in Age) {
//        var index = Age.indexOf(number);
//
//        print('Origin forEach loop');
//
//        for (int i = 0; i < 1; i++) {
//          print("for loop");
//        }
//
//        break;
//      }
//
//
//
//      for(int i = 0; i < Age.length; i++){
//
//
//        if(Age[i]==0){
//
//          snackBar = SnackBar(content:Text("Please enter age of ${(i+1).toString()}",style: CustomStyles.medium16.copyWith(color: CustomColors.White),),
//            backgroundColor: CustomColors.BackGround,
//          );
//
//          scaffoldKey.currentState.showSnackBar(snackBar);
//
//
//        }else{
//
//
//        }
//
//
//      }
//
//
//
//      Age.asMap().forEach((index,element) {
//
//        if(element==0) {
//
//
//
//          status = true;
//
//
//
//
//        }else{
//          status =false;
//        }
//
//
//      });
//
//
//      return status;
//    }








  }

  void addAge(String age, int index) {
     Age[index] = int.parse(age);

     notifyListeners();
  }








}
