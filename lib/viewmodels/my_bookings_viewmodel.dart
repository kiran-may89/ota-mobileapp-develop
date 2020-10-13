import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/my_bookings/booking_resposne.dart';
import 'package:ota/models/my_bookings/requests/primary_booking_request.dart';
import 'package:ota/net/service/my_bookings/booking_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/viewmodels/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class MyBookingsViewModel extends ChangeNotifier {
  BookingService service;
  final key = new GlobalKey<ScaffoldState>();
  var _bookingResponseList = new List<BookingResponseModel>();
  List<BookingResponseModel> get bookingResponseList => _bookingResponseList;

  var _upcomingBookingList = new List<BookingResponseModel>();
  List<BookingResponseModel> get upcomingBookingList => _upcomingBookingList;


  var _completedBookingList = new List<BookingResponseModel>();
  List<BookingResponseModel> get completedBookingList => _completedBookingList;
  var _bookingListTemp = new List<BookingResponseModel>();
  MyBookingsViewModel() {
    service = GetIt.instance<BookingService>();
    getUserBookings();
  }

  void getFilteredList(String type)
  {
    if(type == "All")
      {
        _bookingListTemp = _bookingResponseList;
      }
    else
      {
       _bookingListTemp = _bookingResponseList.where((element) => element.bookings[0].summaryInfo.serviceType.toString().substring(element.bookings[0].serviceType.toString().indexOf('.')+1)== type).toList();
       // _bookingListTemp = _bookingResponseList.where((element) => element.bookingId == "BXC0000072").toList();

      }

    _completedBookingList = _bookingListTemp
        .where((p) => p.bookings[0].reservationDate.isBefore(DateTime.now()))
        .toList();
    _upcomingBookingList = _bookingListTemp
        .where((p) => p.bookings[0].reservationDate.isAfter(DateTime.now()))
        .toList();

    notifyListeners();
  }
  Future getUserBookings() async {
    var request = new PrimaryBookingRequest(
//        userId: SessionManager.getInstance().getUser.sub,
//        tenantId: SessionManager.getInstance().getUser.tenantId,
        type: 2);

    var response = await service.getBookingsByUser(request);

    if(!response.isError) {
      _completedBookingList = response.result
          .where((p) => p.bookings[0].reservationDate.isBefore(DateTime.now()))
          .toList();
      _upcomingBookingList = response.result
          .where((p) => p.bookings[0].reservationDate.isAfter(DateTime.now()))
          .toList();


      _bookingResponseList = response.result;
      _bookingListTemp = _bookingResponseList;
    }
    else
      {

      }


    notifyListeners();
  }
}
