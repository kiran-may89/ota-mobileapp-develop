import 'package:get_it/get_it.dart';
import 'package:ota/models/hotels/responses/hotel_details_response.dart';
import 'package:ota/net/service/hotel/hotels_service.dart';
import 'package:ota/viewmodels/base_view_model.dart';
import 'package:ota/models/hotels/hotel_details_request.dart';

import 'package:ota/models/hotels/search_hotel_request.dart';

class AboutHotelViewModel extends BaseViewModel {
  HotelDetailsRequest dto;
  HotelService _service;
  SearchHotelRequest searchDto;
  HotelDetailsResponse _hotelDetailsResponse;
  int _radionGroupValue = 0;
  HotelDetailsResponse get hotelDetailsResponse => _hotelDetailsResponse;

  bool _loading = true;

  bool get loading => _loading;

  int get radioGroupValue => _radionGroupValue;
  AboutHotelViewModel(this.dto, this.searchDto);
  void setState(bool value) {
    _loading = value;
    notifyListeners();
  }

  @override
  void initialise() {
    _service = GetIt.instance<HotelService>();
    loadHotelDetails();
  }

  void loadHotelDetails() async {
    _hotelDetailsResponse = await _service.getHotelDetails(dto);
    if (!_hotelDetailsResponse.isError) {
      _hotelDetailsResponse.result.searchId = dto.searchId;
    }

    setState(false);
  }

  void updateRoomOption(int value) {
    _radionGroupValue = value;
    notifyListeners();
  }

  selectNoGroup() {
    _radionGroupValue = -1;
    notifyListeners();
  }
}
