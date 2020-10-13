import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:ota/models/transfers/requests/search_transfer_request.dart';
import 'package:ota/models/transfers/data_model/search_transfer_data.dart';
import 'package:ota/net/service/googleplaces/google_place_repository.dart';
import 'package:ota/net/service/googleplaces/google_places.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/base_view_model.dart';
import 'package:ota/models/googleplaces/predictions.dart';
import 'package:ota/models/googleplaces/place.dart';
class BookTransferViewModel extends BaseViewModel{
  final TextEditingController _fromTypeHeadController = TextEditingController();
  final TextEditingController _destinationTypeHeadController = TextEditingController();
  TextEditingController get fromTypeHeadController => _fromTypeHeadController;
  TextEditingController get destinationTypeHeadController => _destinationTypeHeadController;
  GooglePlaceRepository _googleServices;
  List<Prediction> _predictionList = new List();
  List<Prediction> _tempList = new List();
  List<Prediction> get predictionList => _predictionList;
  Place  fromPlace;
  Place  toPlace;

  String FromPlace_details;

  String ToPlace_Details;
  bool _sourceType =true;
  String _from ;
  String get from => _from;
  String _destination ;
  String get destination => _destination;
  bool get sourceType =>_sourceType;
  // ignore: unnecessary_getters_setters
  set  sourceType(bool data)
  {
    _sourceType =data;
  }


  bool OneWay = true;

  String trainCarriageNumber;

  String trainNumber;

  @override
  void initialise() {
    _googleServices = GetIt.instance<GooglePlaces>();
  }

  Future<Predictions> getPredcitions(String pattern) async{
    var response = await _googleServices.getPredictions(pattern);
    _predictionList =response.predictions;
    notifyListeners();
    return response;

  }

  void searchLocation(String value) {
    if (value.isEmpty)
      _predictionList = _tempList;
    else {
      var sortedList = _tempList.where((item) =>
          item.description.toLowerCase().contains(value.toLowerCase()))
          .toList();

      _predictionList = sortedList;

      notifyListeners();
    }
  }
  void setFromSelected(Prediction suggestion) {
    _fromTypeHeadController.text = suggestion.description;
    _from = suggestion.description;
     getPlaceDetails(suggestion).then((value) => {
       fromPlace  = value
     });
         notifyListeners();
  }
  Future<Place> getPlaceDetails(Prediction suggestion)async{
    var response = await _googleServices.getPlace(suggestion.placeId);
    return response;


  }

  void setSelectedDestination(Prediction suggestion) {
    _destinationTypeHeadController.text = suggestion.description;
    _destination = suggestion.description;
    getPlaceDetails(suggestion).then((value) => {
      toPlace  = value
    });

  }


  SearchTransferData getRequestData(){


    SearchTransferData searchTransferData = SearchTransferData(
     tenantId: SessionManager.getInstance().getUser.tenantId,
      currency: "USD",
        clientNationality: "SA",
        startPoint: StartPoint(lat: fromPlace.result.geometry.location.lat,
        lng: fromPlace.result.geometry.location.lng
      ),

         finishPoint: StartPoint(lat:toPlace.result.geometry.location.lat,
         lng:toPlace.result.geometry.location.lng,),
          dropPlace: _destination,
          pichUpPlace: _from,
      //bookingDateMonth: new DateFormat("dd-MMM").format(DateTime.now()),
      oneWay: OneWay,
      //dateTime: new DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now().add(Duration(days: 1))),

    );


    print(jsonEncode(searchTransferData.toJson()));


    return searchTransferData;
  }

  void changeTripType() {

    if(OneWay){

      OneWay = false;
    }else{

      OneWay = true;
    }
    notifyListeners();


  }

  bool validateData(GlobalKey<ScaffoldState> scaffoldKey) {

    SnackBar snackBar;


    if(_from==null){


      snackBar = SnackBar(content:Text("Please Select Source",style: CustomStyles.medium16.copyWith(color: CustomColors.White),),
        backgroundColor: CustomColors.BackGround,
      );

      scaffoldKey.currentState.showSnackBar(snackBar);
      return false;

    }else if(_destination==null){

      snackBar = SnackBar(content: Text("Select Destination",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
        backgroundColor: CustomColors.BackGround,
      );

      scaffoldKey.currentState.showSnackBar(snackBar);

      return false;

    }else{
      return true;

    }




  }





}