import 'dart:convert';
import 'package:curl/curl.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:ota/models/my_bookings/booking_resposne.dart';
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
}
