import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/my_bookings/booking_resposne.dart';
import 'package:ota/models/my_bookings/cancel_booking_response.dart';
import 'package:ota/models/my_bookings/cancel_policy_response.dart';
import 'package:ota/models/my_bookings/requests/booking_cancel_request_model.dart';
import 'package:ota/models/my_bookings/requests/primary_booking_request.dart';
import 'package:ota/net/service/my_bookings/booking_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/viewmodels/base_view_model.dart';
import 'package:flutter/cupertino.dart';

class MyBookingsViewModel extends ChangeNotifier {
  BookingService service;
  bool _isLoading =false;
  bool _isError =false;
  bool get isLoading => _isLoading;
  bool get isError => _isError;

  String _searchHint = "Search By Reservation No";
  String get searchHint => _searchHint;
  set searchHint(String s)
  {
    _searchHint =s;
    notifyListeners();
  }

  String _phone = "";
  String get phone => _phone;
  set phone(String s)
  {
    _phone =s;
  }

  var searchText = TextEditingController();

  final key = new GlobalKey<ScaffoldState>();
  var _bookingResponseList ;
  List<BookingResponseModel> get bookingResponseList => _bookingResponseList;

  var _upcomingBookingList = new List<BookingResponseModel>();
  List<BookingResponseModel> get upcomingBookingList => _upcomingBookingList;


  var _completedBookingList = new List<BookingResponseModel>();
  List<BookingResponseModel> get completedBookingList => _completedBookingList;

  var _cancelledBookingList = new List<BookingResponseModel>();
  List<BookingResponseModel> get cancelledBookingList => _cancelledBookingList;

  var _bookingListTemp = new List<BookingResponseModel>();
  MyBookingsViewModel() {
    service = GetIt.instance<BookingService>();
    getUserBookings();
  }
  MyBookingsViewModel.searcbooking()
  {
    service = GetIt.instance<BookingService>();

  }
  Future searchBookings() async
  {


    switch(_searchHint) {
      case "Search By Reservation No" :
        {
          var response = await service.getBookingsByUser(new PrimaryBookingRequest(
              reservationNumber: searchText.value.text,
              type: 2
          ));

          _bookingResponseList = response.result;


         break;
        }
      case "Search By First Name" :
        {
          var response = await service.getBookingsByUser(new PrimaryBookingRequest(
              firstname: searchText.value.text,
              type: 2
          ));

          _bookingResponseList = response.result;


          break;
        }

      case "Search By Last Name" :
        {
          var response = await service.getBookingsByUser(new PrimaryBookingRequest(
              lastname: searchText.value.text,
              type: 2
          ));

          _bookingResponseList = response.result;


          break;
        }

      case "Search By Phone Number" :
        {

          var response = await service.getBookingsByUser(new PrimaryBookingRequest(
              phonenumber: _phone,
              type: 2
          ));

          _bookingResponseList = response.result;


          break;
        }

    }
    notifyListeners();
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
        .where((p) => p.bookings[0].reservationDate.isBefore(DateTime.now()) &&  p.bookings[0].status!=null )
        .toList();
    _upcomingBookingList = _bookingListTemp
        .where((p) => p.bookings[0].reservationDate.isAfter(DateTime.now()) && p.bookings[0].status!=null)
        .toList();

    _cancelledBookingList =_bookingListTemp.where((element) => element.bookings[0].status==null).toList();


    notifyListeners();
  }

  Future<BookingCancelResponse> cancelBookingByRezervationId(String reservationNumber)async
  {
    var request = new BookingCancelRequest(
      reservationNumber: reservationNumber
    );

    var response = await service.cancelBooking(request);

    return response;
  }

  Future getUserBookings() async {
    var request = new PrimaryBookingRequest(
        userId: SessionManager.getInstance().getUser.sub,
        tenantId: SessionManager.getInstance().getUser.tenantId,
        type: 2);

    var response = await service.getBookingsByUser(request);

    if(!response.isError) {
      _completedBookingList = response.result
          .where((p) => p.bookings[0].reservationDate.isBefore(DateTime.now()) && p.bookings[0].status!=null)
          .toList();
      _upcomingBookingList = response.result
          .where((p) => p.bookings[0].reservationDate.isAfter(DateTime.now()) && p.bookings[0].status!=null)
          .toList();
      _cancelledBookingList = response.result.where((element) => element.bookings[0].status==null).toList();


      _bookingResponseList = response.result;
      _bookingListTemp = _bookingResponseList;
    }
    else
      {

      }


    notifyListeners();
  }

  Future<CancelPolicyResponse> getCancellationPolicy(String reservationId)async
  {
    _isLoading =true;
    var response= await service.getCancellationPolicy(reservationId);
    if(response.isError) {
      _isError = true;
      _isLoading =false;
     // notifyListeners();
    }


return response;



  }

  void reloadView()
  {
    _upcomingBookingList.clear();
    _cancelledBookingList.clear();
    _bookingResponseList =null;
   _completedBookingList.clear();

    notifyListeners();
    getUserBookings();
  }

  void reloadSearchBookings()
  {
    _isLoading =true;
    _bookingResponseList = null;
    notifyListeners();
  }
}
