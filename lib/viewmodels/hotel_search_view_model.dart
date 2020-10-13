import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/hotels/city_look_up_response.dart';
import 'package:ota/models/hotels/responses/hotel_auto_search_model.dart';

import 'package:ota/models/hotels/search_hotel_request.dart';
import 'package:ota/net/service/hotel/hotels_service.dart';
import 'package:ota/viewmodels/base_view_model.dart';

class HotelSearchViewModel extends BaseViewModel {
  GlobalKey<FormFieldState> key = GlobalKey();
  DateTime _firstDate;
  DateTime _lastDate;
  DatePeriod _selectedPeriod;
  CityLookUpResponse response;
  HotelService _hotelService;
  final TextEditingController _typeAheadController = TextEditingController();
  bool isCalenderExpanded = true;
  SearchHotelRequest requestDto = SearchHotelRequest(cityIds: List(), rooms: List(), roomPaxes: List());

  TextEditingController get typeAheadController => _typeAheadController;

  DateTime get firstDate => _firstDate;
  AnimationController expandController;
  Animation<double> animation;

  HotelSearchViewModel() {
    _hotelService = GetIt.instance<HotelService>();
  }

  @override
  void initialise() {
    _firstDate = DateTime.now().subtract(Duration(days: 45));
    _lastDate = DateTime.now().add(Duration(days: 45));

    DateTime selectedPeriodStart = DateTime.now().subtract(Duration(days: 0));
    DateTime selectedPeriodEnd = DateTime.now().add(Duration(days: 1));
    _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);
    requestDto.checkInDate = _selectedPeriod.start.toIso8601String();
    requestDto.checkOutDate = _selectedPeriod.end.toIso8601String();

    var rooms = new Rooms(adultCnt: 0, children: List());
    requestDto.rooms.add(rooms);

    addAdultCount(true, 0);
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
  }

  void setSelectedTimerPeriod(DatePeriod period) {
    _selectedPeriod = period;
    requestDto.checkInDate = period.start.toIso8601String();
    requestDto.checkOutDate = period.end.toIso8601String();
    if (period.start.difference(period.end).inDays < 0) {
      isCalenderExpanded = false;
    }

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
    if(requestDto.rooms.length>1){
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
}
