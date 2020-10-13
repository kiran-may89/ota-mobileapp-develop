import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/app/transisations.dart';
import 'package:ota/models/activity/request/activity_details_data.dart';
import 'package:ota/models/activity/request/activity_results_data.dart';
import 'package:ota/models/activity/request/activity_traveller_data.dart';
import 'package:ota/models/activity/request/booking_data.dart';
import 'package:ota/models/activity/request/search_activity_data.dart';
import 'package:ota/models/flights/data_model/pass_arguments.dart';
import 'package:ota/models/flights/requests/flight_save_booking_request.dart';
import 'package:ota/models/flights/search_flight_request.dart';
import 'package:ota/models/profile/responses/family_list.dart';
import 'package:ota/models/transfers/requests/credit_card_transfers_data.dart';
import 'package:ota/models/transfers/requests/transfers_passenger_data.dart';
import 'package:ota/models/transfers/data_model/search_transfer_data.dart';
import 'package:ota/net/service/transfers/transfer_results_data.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_booking_data.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_results_data.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_travel_info_model.dart';
import 'package:ota/views/activities/activity_booking.dart';
import 'package:ota/views/activities/activity_booking_status.dart';
import 'package:ota/views/activities/activity_cc_details.dart';
import 'package:ota/views/activities/activity_details.dart';
import 'package:ota/views/activities/activity_payment_options.dart';
import 'package:ota/views/activities/activity_questions.dart';
import 'package:ota/models/activity/request/activity_questions_data.dart';
import 'package:ota/views/activities/activity_results.dart';
import 'package:ota/views/activities/activity_travel_information.dart';
import 'package:ota/views/dash_board.dart';
import 'package:ota/views/my_bookings/my_bookings_view.dart';
import 'package:ota/views/my_bookings/widgets/activity_booking_detail_view.dart';
import 'package:ota/views/my_bookings/widgets/hotel_detail_booking_view.dart';
import 'package:ota/views/my_bookings/widgets/transfer_booking_detail_view.dart';
import 'package:ota/views/onboard/details.dart';
import 'package:ota/views/flights/flightBooking_status.dart';
import 'package:ota/views/flights/flightResults.dart';
import 'package:ota/views/flights/flight_booking.dart';
import 'package:ota/views/flights/flight_cc_details.dart';
import 'package:ota/views/flights/flight_details.dart';
import 'package:ota/views/flights/flight_payment_options.dart';
import 'package:ota/views/hotels/about_hotel.dart';
import 'package:ota/views/hotels/hotel_booking_status.dart';
import 'package:ota/views/hotels/hotel_payment.dart';

import 'package:ota/views/hotels/hotel_search.dart';
import 'package:ota/views/hotels/hotel_results.dart';
import 'package:ota/views/hotels/stay_info_hotel.dart';
import 'package:ota/views/onboard/home_page.dart';
import 'package:ota/views/onboard/otp_verification.dart';
import 'package:ota/views/onboard/sign_in.dart';
import 'package:ota/views/onboard/sign_up.dart';
import 'package:ota/views/packages/package_results.dart';
import 'package:ota/views/profile/add_family_member.dart';
import 'package:ota/views/profile/family_list.dart';
import 'package:ota/views/profile/profile.dart';
import 'package:ota/views/profile/profile_management.dart';

import 'package:ota/views/transfer/passenger_information.dart';
import 'package:ota/views/transfer/transfer_booking.dart';
import 'package:ota/views/transfer/transfer_booking_status.dart';
import 'package:ota/views/transfer/transfer_cc_details.dart';
import 'package:ota/views/transfer/transfer_details.dart';
import 'package:ota/views/transfer/transfer_payment_options.dart';
import 'package:ota/views/transfer/transfer_results.dart';
import 'package:ota/views/flights/travel_information.dart';
import 'package:ota/models/hotels/search_hotel_request.dart';

import 'package:ota/models/hotels/hotel_details_request.dart';

class Routes {
  static const String searchHotels = "/searchHotel";
  static const String transferBookingDetailsView = "/transferBookingDetailsView";
  static const String activityBookingDetailsView = "/activityBookingDetailsView";

  static const String hotelBooking = "/hotelBooking";
  static const String aboutHotel = "/aboutHotel";
  static const String searchFlights = '/searchFlights';
  static const String flightBooking = '/flightBooking';
  static const String signIn = '/signIn';
  static const String otpVerification = '/otpVerification';
  static const String details = '/details';
  static const String dashboard = '/dashboard';
  static const String flightPaymentOptions = '/flightPaymentOptions';
  static const String flightDetails = '/flightDetails';
  static const String travelInformation = '/travelInformation';
  static const String flightBookingStatus = '/flightBookingStatus';
  static const String activityBooking = '/activityBooking';
  static const String transferBookingStatus = '/transferBookingStatus';
  static const String travelPaymentOptions = '/travelPaymentOptions';
  static const String travelInfo = '/travelInfo';
  static const String activityResults = '/activityResults';
  static const String activityDetails = '/activityDetails';
  static const String activityQuestions = '/activityQuestions';
  static const String activityTravellerInfo = '/activityTravellerInfo';
  static const String activityPaymentOptions = '/activityPaymentOptions';
  static const String activityCCDetails = '/activityCCDetails';
  static const String activityBookingStatus = '/activityBookingStatus';
  static const String transferBooking = '/transferBooking';
  static const String transfeResults = '/transfeResults';
  static const String transferDetails = '/transferDetails';
  static const String transferCCDetails = '/transferCCDetails';
  static const String stayInfoHotel = '/stayInfoHotel';
  static const String paymentHotel = '/paymentHotel';
  static const String hotelBookingStatus = '/hotelBookingStatus';
  static const String signUp = '/signUp';
  static const String flight_cc_details = '/flight_cc_details';
  static const String family_members = '/family_members';
  static const String add_family_members = '/add_family_members';
  static const String myBookings = '/myBookings';
  static const String hotelsBookingDetailView=  '/hotelsBookingDetailView';
  static const String profile_management = '/profile_management';
  static const String profile = '/profile';
  static const String packages = '/packages';


  static Route<dynamic> generatRouter(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomePage());
        break;
      case hotelsBookingDetailView:

      return MaterialPageRoute(builder: (_) =>  HotelBookingDetailView(args));
      break;

      case activityBookingDetailsView:

        return MaterialPageRoute(builder: (_) => ActivtiyBoookingDetailView(args));
        break;

      case transferBookingDetailsView:

        return MaterialPageRoute(builder: (_) =>  TransferBookingDetailView(args));
        break;

      case signIn:
        return MaterialPageRoute(builder: (_) => SignIn());
        break;
      case otpVerification:
        return MaterialPageRoute(builder: (_) => OtpVerification(args));
        break;
      case details:
        return MaterialPageRoute(builder: (_) => Details());
        break;
      case dashboard:
        return MaterialPageRoute(builder: (_) => DashBoard());
        break;
      case flightBooking:
        return MaterialPageRoute(builder: (_) => FlightBooking());
        break;
      case searchFlights:
        SearchFlightsRequest requestData = args as SearchFlightsRequest;
        return MaterialPageRoute(builder: (_) => FlightResults(requestData));
        break;

      case hotelBooking:
        return MaterialPageRoute(builder: (_) => HotelSearch());
        break;

      case searchHotels:
        SearchHotelRequest dto = args as SearchHotelRequest;
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => HotelResults(dto),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;

              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 600));
        break;

      case travelInformation:
        FlightResultsData argument = args as FlightResultsData;
        return MaterialPageRoute(builder: (_) => TravelInformation(argument));
        break;

      case flightBookingStatus:
        FlightBookingData argument = args as FlightBookingData;
        return MaterialPageRoute(builder: (_) => FlightBookingStatus(argument));
        break;

      case aboutHotel:
        Map<String, dynamic> maps = args as Map;
        HotelDetailsRequest hotelRequest = maps['response'];
        SearchHotelRequest request = maps['dto'];
        return ScaleRoute(page: AboutHotel(hotelRequest, request));
        break;

      case flightPaymentOptions:
        FlightTravelInfoData argument = args as FlightTravelInfoData;
        return MaterialPageRoute(builder: (_) => FlightPaymentOptions(argument));
        break;

      case flightDetails:
        FlightResultsData argument = args as FlightResultsData;
        return MaterialPageRoute(builder: (_) => FlightDetails(argument));
        break;

      case flight_cc_details:

        FlightTravelInfoData argument = args as FlightTravelInfoData;

        return MaterialPageRoute(builder: (_) => FlightCCDetails(argument));
        break;
      case activityBooking:
        return MaterialPageRoute(builder: (_) => ActivityBooking());
        break;

      case activityResults:
        SearchActivityData searchActivityData = args as SearchActivityData;
        return MaterialPageRoute(builder: (_) => ActivityResults(searchActivityData));
        break;

      case activityDetails:
        ActivityResultsData activityResultsData = args as ActivityResultsData;

        return MaterialPageRoute(builder: (_) => ActivityDetails(activityResultsData));

      case activityQuestions:
        ActivityDetailsData activityDetailsData = args as ActivityDetailsData;
        return MaterialPageRoute(builder: (_) => ActivityQuestions(activityDetailsData));

      case activityTravellerInfo:
        ActivityDetailsData activityDetailsData = args as ActivityDetailsData;

        return MaterialPageRoute(builder: (_) => Activity_TravellerInformation(activityDetailsData));
        break;

      case activityCCDetails:
        ActivityTravellerData activityTravellerData = args as ActivityTravellerData;
        return MaterialPageRoute(builder: (_) => ActivityCCDetails(activityTravellerData));
        break;

      case activityPaymentOptions:
        ActivityTravellerData activityTravellerData = args as ActivityTravellerData;
        return MaterialPageRoute(builder: (_) => ActivityPaymentOptions(activityTravellerData));
        break;

      case activityBookingStatus:
        BookingData bookingData = args as BookingData;
        return MaterialPageRoute(builder: (_) => ActivityBookingStatus(bookingData));
        break;

      case transferBooking:
        return MaterialPageRoute(builder: (_) => BookTransfer());
        break;

      case transfeResults:
        SearchTransferData searchTransferData = args as SearchTransferData;
        return MaterialPageRoute(builder: (_) => TransferResults(searchTransferData));
        break;

      case transferDetails:
        TransferResultsData transferResultsData = args as TransferResultsData;

        return MaterialPageRoute(builder: (_) => TransferDetails(transferResultsData));

      case travelInfo:
        TransferResultsData transferResultsData = args as TransferResultsData;
        return MaterialPageRoute(builder: (_) => Passenger_info(transferResultsData));

      case travelPaymentOptions:
        TransferPassengerData transferPassengerData = args as TransferPassengerData;

        return MaterialPageRoute(builder: (_) => TransferPaymentOptions(transferPassengerData));

      case transferCCDetails:
        TransferPassengerData transferPassengerData = args as TransferPassengerData;
        return MaterialPageRoute(builder: (_) => TranferCcDetails(transferPassengerData));

      case transferBookingStatus:
        TransfersCCData transfersCCData = args as TransfersCCData;

        return MaterialPageRoute(builder: (_) => TransferBookingStatus(transfersCCData));

      case stayInfoHotel:
        Map<String, dynamic> maps = args as Map;
        var result = maps['response'];

        var selectGroup = maps['selectGroup'];
        return ScaleRoute(page: StayInfoHotel(result, selectGroup));
      case paymentHotel:
        Map<String, dynamic> maps = args as Map;
        var result = maps['response'];
        var model = maps['paymentmodel'];

        var selectGroup = maps['selectGroup'];
        return ScaleRoute(page: HotelPayment(result, selectGroup, model));
      case hotelBookingStatus:
        Map<String, dynamic> maps = args as Map;
        var result = maps['response'];
        var hotel = maps['hotel'];
        var group = maps['group'];
        return ScaleRoute(page: HotelBookingStatus(result, hotel, group));

      case  family_members:
      return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FamilyList(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 600));
      break;
      case add_family_members:

        RelationResult argument = args as RelationResult;
        return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => AddFamilyMember(argument),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 600));


      case signUp:
        return ScaleRoute(page: SignUp());

      case myBookings:
        return MaterialPageRoute(builder: (_) => MyBookingsView());

      case profile_management:

        return MaterialPageRoute(builder: (_) => ProfileManagement());

        break;

      case profile:
        return MaterialPageRoute(builder: (_) => Profile());

        break;
      case packages:
        return MaterialPageRoute(builder: (_) => PackageResults());

        break;

      default:
        return _errorRoute();


    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
