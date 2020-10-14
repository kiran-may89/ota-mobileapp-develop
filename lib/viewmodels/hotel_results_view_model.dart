import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'package:ota/models/hotels/hotel_search_response.dart';
import 'package:ota/models/hotels/responses/hotel.dart';
import 'package:ota/viewmodels/base_view_model.dart';
import 'package:ota/models/hotels/search_hotel_request.dart';
import 'package:ota/net/service/hotel/hotels_service.dart';

import '../views/hotels/about_hotel.dart';

class HotelResultsViewModel extends BaseViewModel {
  SearchHotelRequest _dto;
  ScrollController scrollController = new ScrollController();
  bool _isListLoading = false;
  int present = 0;
  int perPage = 10;
  List<Hotel> hotels = new List();

  bool get isListLoading => _isListLoading;

  SearchHotelRequest get dto => _dto;
  Map<String, dynamic> filterMap = Map();
  HotelService _hotelService;

  HotelResultsViewModel(this._dto);

  HotelSearchResponse _response;

  HotelSearchResponse get response => _response;

  List<Hotel> unFilteredList;
  bool _loading = true;

  bool get loading => _loading;

  bool freeSelected = true;
  double minPrice = 0;
  double maxPrice = 0;

  RangeValues rangeValues;

  double rating = 0;
  List<Amentie> amenties = [
    Amentie("WiFi", "assets/images/ameneties/wifi.png", false),
    Amentie("Pool", "assets/images/ameneties/pool.png", false),
    Amentie("Gym", "assets/images/ameneties/gym.png", false),
    Amentie("A/C", "assets/images/ameneties/ac.png", false),
    Amentie("Bar", "assets/images/ameneties/bar.png", false),
    Amentie("Restaurant", "assets/images/ameneties/restuarant.png", false),
    Amentie("Pets", "assets/images/ameneties/pets.png", false),
    Amentie("Garden", "assets/images/ameneties/garden.png", false),
    Amentie("Parking", "assets/images/ameneties/parking.png", false),
  ];
  int filterLength = 0;

  void updateRangeValues(RangeValues values) {
    rangeValues = values;
    filterMap['range'] = rangeValues;
    notifyListeners();
  }

  void updateFreeSelected(bool value) {
    freeSelected = value;
    filterMap['cancelation'] = value;
    notifyListeners();
  }

  void updateRating(double value) {
    rating = value;
    filterMap['rating'] = value;
    notifyListeners();
  }

  void updateAmentieSelected(int index) {
    amenties[index].isAvailable = !amenties[index].isAvailable;
    notifyListeners();
  }

  void _setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  @override
  void initialise() {
    _hotelService = GetIt.instance<HotelService>();
    loadData();
  }

  void loadData() async {
    _response = await _hotelService.getHotels(_dto);
    if (!_response.isError) {
      asscendingOrder();
      rangeValues = new RangeValues(minPrice, maxPrice);
      loadMore();
    }

    _setloading(false);
  }

  void loadMore() async {
    if (hotels.length == response.result.hotels.length) return;
    if (hotels.length > 0) {
      _isListLoading = true;
      notifyListeners();
      await Future.delayed(Duration(seconds: 5));
    }

    int difference = response.result.hotels.length - (present + perPage);
    int offset = difference > 0 ? present + perPage : response.result.hotels.length-1;

    hotels.addAll(response.result.hotels.getRange(present, offset));
    present = offset;
    _isListLoading = false;

    notifyListeners();
  }

  void asscendingOrder() {
    if(hotels.isEmpty)return;
     hotels.sort((a, b) =>
        a.roomOption[0].displayRateInfoWithMarkup.totalPriceWithMarkup.compareTo(b.roomOption[0].displayRateInfoWithMarkup.totalPriceWithMarkup));
    unFilteredList = _response.result.hotels;
    minPrice = unFilteredList[0].roomOption[0].displayRateInfoWithMarkup.totalPriceWithMarkup;
    maxPrice = unFilteredList[unFilteredList.length - 1].roomOption[0].displayRateInfoWithMarkup.totalPriceWithMarkup;
  }

  void descendingOrder() {
    hotels.sort((a, b) =>
        b.roomOption[0].displayRateInfoWithMarkup.totalPriceWithMarkup.compareTo(a.roomOption[0].displayRateInfoWithMarkup.totalPriceWithMarkup));
    unFilteredList = _response.result.hotels;
  }

  void applyFilter() {
    var filters = unFilteredList;
    RangeValues priceRange = filterMap['range'];
    if (priceRange != null) {
      filters = filters
          .where((element) =>
              element.roomOption[0].displayRateInfoWithMarkup.totalPriceWithMarkup > priceRange.start &&
              element.roomOption[0].displayRateInfoWithMarkup.totalPriceWithMarkup < priceRange.end)
          .toList();
    }
    double rating = filterMap['rating'];
    if (rating != null && rating > 0) {
      filters = filters.where((element) => element.starRating == rating).toList();
    }
    present = 0;
    _response.result.hotels = filters;
    hotels.clear();

    scrollController.animateTo(0, duration: Duration(seconds: 2), curve: Curves.easeIn);
    loadMore();
  }

  void clearFilters() {
    present = 0;
    rating = 0;

    rangeValues = RangeValues(minPrice, maxPrice);
    _response.result.hotels = unFilteredList;
    filterMap['range'] = rangeValues;
    filterMap['rating'] = rating;
    hotels.clear();

    loadMore();
    scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }
}
