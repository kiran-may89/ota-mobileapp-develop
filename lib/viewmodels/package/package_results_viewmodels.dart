

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/packages/categories_list.dart';
import 'package:ota/models/packages/destinations_list.dart';
import 'package:ota/models/packages/package_results.dart';
import 'package:ota/net/service/package/package_service.dart';

class PackageResultsViewModel  extends ChangeNotifier{


PackageService _packageService;

bool Price_Filter = false;

bool loading = true;

bool openCategories = false;

bool openDestinations = false;

DestinationsAndCategoryList categoryList = DestinationsAndCategoryList();

DestinationsAndCategoryList destinationList = DestinationsAndCategoryList();

PackageResultList packageResultList = PackageResultList();

List<DestinationsAndCategoryResult> filtersItems = List();


PackageResultsViewModel(){

_packageService = GetIt.instance<PackageService>();

getPackages();
}

  Future<PackageResultList> getPackages() async {

packageResultList = await _packageService.getPackagesList();

getCategories();

loading = false;

notifyListeners();

  }


Future<void> getCategories() async {


  categoryList = await _packageService.getAllCategories(8);

  getDestinations();

}

Future<void> getDestinations() async {

  destinationList = await _packageService.getAllDestinations(7);

  loading=false;

  notifyListeners();
}


void clearFilters() {}

  void applyFilters() {}

  void openCloseCategories() {

  if(openCategories){
    openCategories =false;
  }else{
    openCategories = true;
  }
  notifyListeners();

  }

  void filterItemsAddAndRemove(int index) {

  var item  = categoryList.result[index];

  if(filtersItems.contains(item)) {
    filtersItems.remove(item);
  }else{
    filtersItems.add(item);
  }

  notifyListeners();

  }

  checkAppliedCategories(int index) {

    if (filtersItems.contains(categoryList.result[index])) {
      return true;
    } else {
      return false;
    }


  }

  void openCloseDestinations() {

    if(openDestinations){
      openDestinations =false;
    }else{
      openDestinations = true;
    }
    notifyListeners();

  }

  void destinationsAddAndRemove(int index) {

    var item  = destinationList.result[index];

    if(filtersItems.contains(item)) {
      filtersItems.remove(item);
    }else{
      filtersItems.add(item);
    }

    notifyListeners();

  }


checkAppliedDestinations(int index) {

  if (filtersItems.contains(destinationList.result[index])) {
    return true;
  } else {
    return false;
  }


}






}