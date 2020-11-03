

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/my_bookings/cancel_policy_response.dart';
import 'package:ota/net/service/my_bookings/booking_service.dart';

class CancellationPolicyModel extends ChangeNotifier{

BookingService service;

bool loading = true;

String reservationId;

bool _isLoading =false;

bool _isError =false;

CancellationPolicyModel(this.reservationId){

service = GetIt.instance<BookingService>();


}





Future<CancelPolicyResponse> getCancelationPolicy() async {


  var response= await service.getCancellationPolicy(reservationId);
  if(response.isError) {
  _isError = true;
  _isLoading =false;
  loading =false;
  // notifyListeners();
  }


  return response;




}






}