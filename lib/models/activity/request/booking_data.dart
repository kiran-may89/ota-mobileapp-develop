import '../activity_booking_response_entity.dart';
import '../small_details_response.dart';
import 'activity_booking_request.dart';

class  BookingData{

 // String bookingnumber;

  List<ActivityTravellerDetails> travellerDetails;

  SmallDetailsResponseTotalAmountWithMarkup totalAmountWithMarkup;

  String currency;

  ActivityBookingResponseEntity activityBookingResponseEntity;


  String activityName;

  String duration;
  BookingData({ this.travellerDetails,this.currency,
      this.totalAmountWithMarkup, this.activityName, this.duration,this.activityBookingResponseEntity});




}