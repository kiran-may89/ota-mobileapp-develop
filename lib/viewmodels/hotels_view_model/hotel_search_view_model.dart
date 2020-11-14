import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/hotels/city_look_up_response.dart';
import 'package:ota/models/hotels/responses/hotel_auto_search_model.dart';

import 'package:ota/models/hotels/search_hotel_request.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/net/service/hotel/hotels_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/base_view_model.dart';

class HotelSearchViewModel extends BaseViewModel {
  GlobalKey<FormFieldState> key = GlobalKey();
  List<CountryCodesResponseResult>
  tempCountryCodes;
  DateTime _firstDate;
  DateTime _lastDate;
  DatePeriod _selectedPeriod;
  CityLookUpResponse response;
  HotelService _hotelService;
  final TextEditingController _typeAheadController = TextEditingController();
  bool isCalenderExpanded = true;
  SearchHotelRequest requestDto = SearchHotelRequest(cityIds: List(), rooms: List(), roomPaxes: List());
  var searchCountry = TextEditingController();
  bool startSearch = false;
  String _country = "Select Country";
  String get country => _country;
  var childAgeController =  TextEditingController(text: "1");

  set country (String text)
  {
    _country =text;

  }
  TextEditingController get typeAheadController => _typeAheadController;

  DateTime get firstDate => _firstDate;
  AnimationController expandController;
  Animation<double> animation;
  CommonService _commonService;
  List<CountryCodesResponseResult> countryCodes;
  int selectedCountryCodeIndex  = 0;

  HotelSearchViewModel() {
    _hotelService = GetIt.instance<HotelService>();
  }


  @override
  void initialise() {
    _firstDate = DateTime.now().subtract(Duration(days: 120));
    _lastDate = DateTime.now().add(Duration(days: 120));

    DateTime selectedPeriodStart = DateTime.now().subtract(Duration(days: 0));
    DateTime selectedPeriodEnd = DateTime.now().add(Duration(days: 1));
    _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);
    requestDto.checkInDate = _selectedPeriod.start.toIso8601String();
    requestDto.checkOutDate = _selectedPeriod.end.toIso8601String();

    var rooms = new Rooms(adultCnt: 0, children: List());
    requestDto.rooms.add(rooms);

    addAdultCount(true, 0);

    SessionManager sessionManager = SessionManager.getInstance();
    if (sessionManager.getCountryCodes == null) {
      _commonService = GetIt.instance<CommonService>();
      getCountryCodes();
    } else {
      countryCodes = sessionManager.getCountryCodes;
      tempCountryCodes =countryCodes;
    }
  }

  void getCountryCodes() async {
    var result = await _commonService.getCountryCodes();
    countryCodes = result.result;
    tempCountryCodes =countryCodes;
    notifyListeners();
  }


  void searchCountryList(String text) {
    var searchValue = text.trim();

    tempCountryCodes = [];

    searchValue.isNotEmpty
        ? tempCountryCodes =
        countryCodes.where((results) {
          return results.name
              .toLowerCase()
              .contains(text.toLowerCase());
        }).toList()
        : tempCountryCodes.addAll(countryCodes);

    notifyListeners();
  }

  DateTime get lastDate => _lastDate;

  DatePeriod get selectedPeriod => _selectedPeriod;

  Future<CityLookUpResponse> getCities(String query) async {
    var response = await _hotelService.getCities(query);
    return response;
  }

  Future<HotelAutoSearchModel> getAutoComplete(String query) async {
    var response = await _hotelService.getAutoCompleteCities(query);
    return response;
  }

  void setSelectedPlace(City suggestion) {
    _typeAheadController.text = suggestion.name;
    requestDto.cityIds = [suggestion.id.toString()];
    requestDto.city = suggestion.name;
    requestDto.isCity = suggestion.isCity;
    startSearch = false;
  }

  void setSelectedTimerPeriod(DatePeriod period) {
    _selectedPeriod = period;
    requestDto.checkInDate = period.start.toIso8601String();
    requestDto.checkOutDate = period.end.toIso8601String();
    if (period.start
        .difference(period.end)
        .inDays < 0) {
      isCalenderExpanded = false;
    }

    notifyListeners();
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
  void addAdultCount(bool increment, int index) {
    var room = requestDto.rooms[index];
    if (increment) {
      room.adultCnt++;
    } else if (room.adultCnt > 1) {
      room.adultCnt--;
    }
    notifyListeners();
  }

  void addChildCount(bool increment, int index) {
    var room = requestDto.rooms[index];
    if (increment && room.children.length < 5) {
      room.children.add(Children(childAge: 1));
    } else if (room.children.length > 0) {
      room.children.removeLast();
    }
    notifyListeners();
  }

   updateChildAge(int roomIndex,int childIndex,String value)
  {
    childAgeController =  TextEditingController(text: value);
    if(value.isNotEmpty) {
      var room = requestDto.rooms[roomIndex];

      var children =   room.children[childIndex];

      children.childAge = int.parse(value);


    }

  }


  void addRoomCount(bool increment) {
    if (increment) {
      var rooms = new Rooms(adultCnt: 0, children: List());
      requestDto.rooms.add(rooms);
    } else {
      if (requestDto.rooms.length > 1) {
        requestDto.rooms.removeLast();
      }
    }
    notifyListeners();
  }

  void toggleCalender() {
    isCalenderExpanded = !isCalenderExpanded;
    notifyListeners();
  }

  void removeRoom(int index) {
    if (requestDto.rooms.length > 1) {
      requestDto.rooms.removeAt(index);
      notifyListeners();
    }
  }

  void roomPaxes() {
    if (requestDto.roomPaxes.isNotEmpty || requestDto.roomPaxes.length > 0) {
      return;
    }
    requestDto.rooms.forEach((element) {
      RoomPaxes roomPaxes = RoomPaxes(adultCnt: element.adultCnt, children: element.children, rooms: 1);
      requestDto.roomPaxes.add(roomPaxes);
    });
  }

  bool validateData(GlobalKey<ScaffoldState> scaffoldKey) {

    bool isGuestError =false;



    SnackBar snackBar;



    if(_typeAheadController.text.isEmpty ){

      snackBar = SnackBar(content:Text("Please Select Destination",style: CustomStyles.medium16.copyWith(color: CustomColors.White),),
        backgroundColor: CustomColors.BackGround,
      );

      scaffoldKey.currentState.showSnackBar(snackBar);
      return false;

    }else if(_country == "Select Country"){


      snackBar = SnackBar(content: Text("Please Select Country",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
        backgroundColor: CustomColors.BackGround,);

      scaffoldKey.currentState.showSnackBar(snackBar);


      return false;


    }
   else if(!childAgeController.value.text.isEmpty)
     {
      if( int.parse(childAgeController.value.text)>8) {
        snackBar = SnackBar(content: Text("Please enter age lesser than 9",
            style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
          backgroundColor: CustomColors.BackGround,);

        scaffoldKey.currentState.showSnackBar(snackBar);


        return false;
      }

      return true;
     }

    else if(childAgeController.value.text.isEmpty)
    {

      snackBar = SnackBar(content: Text("Please enter age lesser than 9",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
        backgroundColor: CustomColors.BackGround,);

      scaffoldKey.currentState.showSnackBar(snackBar);


      return false;

    }
    else{
      return true;
    }

 return true;
  }


  void setCountryCode(CountryCodesResponseResult  newValue) {

    requestDto.clientNationality = newValue.alpha2Code;
    _country = newValue.name;
    notifyListeners();
  }
}
