import 'package:ota/models/hotels/city_look_up_response.dart';
import 'package:ota/models/hotels/hotel_details_request.dart';
import 'package:ota/models/hotels/hotel_search_response.dart';
import 'package:ota/models/hotels/requests/rate_checker_request.dart';
import 'package:ota/models/hotels/responses/hotel_auto_search_model.dart';
import 'package:ota/models/hotels/responses/hotel_details_response.dart';
import 'package:ota/models/hotels/search_hotel_request.dart';

import 'package:ota/models/hotels/payments/response/HotelBookingResponse.dart';
import 'package:ota/models/hotels/payments/request/hotel_payment_model.dart';
import 'package:ota/models/hotels/responses/rate_check_response.dart';

abstract class HotelService {
  Future<HotelSearchResponse> getHotels(SearchHotelRequest body);
  Future<CityLookUpResponse> getCities(String params);
  Future<HotelDetailsResponse> getHotelDetails(HotelDetailsRequest params);
  Future<HotelBookingResponse> bookHotel(HotelPaymentModel params);

  Future<RateCheckResponse> getRateCheck(RateCheckerRequest rateCheckerRequest);
  Future<HotelAutoSearchModel> getAutoCompleteCities(String params);
}
