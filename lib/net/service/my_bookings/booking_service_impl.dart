import 'dart:convert';
import 'package:curl/curl.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:ota/models/my_bookings/booking_resposne.dart';
import 'package:ota/models/my_bookings/cancel_booking_response.dart';
import 'package:ota/models/my_bookings/cancel_policy_response.dart';
import 'package:ota/models/my_bookings/requests/booking_cancel_request_model.dart';
import 'package:ota/models/my_bookings/requests/primary_booking_request.dart';
import 'package:ota/prefs/session_manager.dart';
import 'booking_service.dart';

class BookingServiceImpl extends BookingService {
  Dio apiConnector;
  final String _bookingEndPoint = "bookings/api/v1/booking/filter";
  SessionManager sessionManager = SessionManager.getInstance();

  BookingServiceImpl(this.apiConnector);

  @override
  Future<GenericResponse> getBookingsByUser(PrimaryBookingRequest model) async {
    // TODO: implement getBookingsByUser

    try {
      // var jsonData = jsonEncode(mode)
      var response =  await apiConnector.post(_bookingEndPoint,data: model.toJson());
//      var url =
//          "https://api.otadevtest.com/test/bookings/api/v1/booking/filter";
//      Map<String, String> headers = {
//        "Authorization": "Bearer ${sessionManager.guestAuthToken}",
//        "Content-type": "application/json"
//      };
//      var response =
//          await post(url, headers: headers, body: model.toJson());
//

      if(response.statusCode == 401)
        {
          GenericResponse results = GenericResponse();
          results.isError =true;
          results.responseException = response.statusCode.toString();
          return results;
        }


      //var curl = toCurl(response.request);

      return GenericResponse.fromMap(response.data);
    } on Exception catch (exception) {
      print(exception.toString());
    } catch (error) {
      GenericResponse results = GenericResponse();
     results.isError = true;
     results.responseException = error;
      print(error);

      return results;
    }
  }

  @override
  Future<BookingCancelResponse> cancelBooking(BookingCancelRequest model)async {
    // TODO: implement cancelBooking
    var _url = "/bookings/api/v1/cancellation/TPA/manual/initiate";
    BookingCancelResponse results = BookingCancelResponse();
    try{

      var response = await apiConnector.post(_url,data:model.toJson());

      if(response.statusCode==200)
        {
         return  BookingCancelResponse.fromMap(response.data);
        }


    }
    catch(error)
    {

      results.isError = true;
      results.responseException = error;
      print(error);


    }
return results;
  }

  @override
  Future<CancelPolicyResponse> getCancellationPolicy(String reservationID) async{
    // TODO: implement getCancellationPolicy
    var _url = "bookings/api/v1/cancellation/fetchPolicy/$reservationID";

    try{

      var response = await apiConnector.get(_url);

      if(response.statusCode==200)
      {
        return CancelPolicyResponse.fromMap(response.data);
      }

      CancelPolicyResponse results =CancelPolicyResponse();
      results.isError = true;


      return results;
    }
    catch(error)
    {
      CancelPolicyResponse results = CancelPolicyResponse();
      results.isError = true;

      print(error);

      return results;
    }
  }
}
