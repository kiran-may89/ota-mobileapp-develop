import 'package:ota/models/my_bookings/booking_resposne.dart';
import 'package:ota/models/my_bookings/cancel_booking_response.dart';
import 'package:ota/models/my_bookings/cancel_policy_response.dart';
import 'package:ota/models/my_bookings/requests/booking_cancel_request_model.dart';
import 'package:ota/models/my_bookings/requests/primary_booking_request.dart';

abstract class BookingService
{
  Future<GenericResponse> getBookingsByUser(PrimaryBookingRequest model);
  Future<BookingCancelResponse> cancelBooking(BookingCancelRequest model);
  Future<CancelPolicyResponse> getCancellationPolicy(String reservationID);

}