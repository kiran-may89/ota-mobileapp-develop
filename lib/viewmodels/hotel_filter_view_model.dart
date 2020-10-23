import 'package:flutter/material.dart';
import 'package:ota/viewmodels/base_view_model.dart';
import 'package:ota/views/hotels/about_hotel.dart';

class HotelFiltersViewModel extends BaseViewModel {
  bool freeSelected = true;
  double minPrice = 0;
  double maxPrice = 50000;

  RangeValues rangeValues = new RangeValues(0, 5000);

  double rating = 0;
  List<Amentie> amenties = [];
  void updateRangeValues(RangeValues values) {
    rangeValues = values;
    notifyListeners();
  }

  void updateFreeSelected(bool value) {
    freeSelected = value;
    notifyListeners();
  }

  void updateRating(double value) {
    rating = value;
    notifyListeners();
  }

  void updateAmentieSelected(int index) {
    amenties[index].isAvailable = !amenties[index].isAvailable;
    notifyListeners();
  }

  @override
  void initialise() {}
}
