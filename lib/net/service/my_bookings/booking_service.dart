import 'package:ota/models/my_bookings/booking_resposne.dart';
import 'package:ota/models/my_bookings/requests/primary_booking_request.dart';

abstract class BookingService
{
  Future<GenericResponse> getBookingsByUser(PrimaryBookingRequest model);
}