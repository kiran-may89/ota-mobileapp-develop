import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/packages/categories_list.dart';
import 'package:ota/models/packages/destinations_list.dart';
import 'package:ota/models/packages/group_by_category.dart';
import 'package:ota/models/packages/group_by_destinations.dart';
import 'package:ota/net/service/package/package_service.dart';
import 'package:ota/net/service/profile/profile_service.dart';
import 'package:ota/prefs/shared_prefernce.dart';
import 'package:ota/utils/strings.dart';

import 'base_view_model.dart';

class DashBoardViewModel extends BaseViewModel {



  List<DashBoardItem> dashBoardItems;

  PackageService _packageService;

  GroupByCategoryResults groupByCategoryResults = GroupByCategoryResults();

  GroupTopDestinationsResults groupTopDestinationsResults = GroupTopDestinationsResults();


  DestinationsAndCategoryList categoriesList = DestinationsAndCategoryList();
  
  DestinationsAndCategoryList destinationsList = DestinationsAndCategoryList();
  

  bool loading = true;

  int currentIndex = 0;
  DashBoardViewModel() {

    _packageService = GetIt.instance<PackageService>();

    initItems();
  getCategories();



  }
  void initItems() {
    dashBoardItems = [
      DashBoardItem(assets: "assets/images/dashboard/icon_hotel.png", name: strings.hotels, isSelected: true, navigation: Routes.hotelBooking),
      DashBoardItem(assets: "assets/images/dashboard/icon_flight.png", name: strings.flights, isSelected: false, navigation: Routes.flightBooking),
      DashBoardItem(
          assets: "assets/images/dashboard/icon_activities.png", name: strings.activites, isSelected: false, navigation: Routes.activityBooking),
      DashBoardItem(
          assets: "assets/images/dashboard/icon_transfer.png", name: strings.transfer, isSelected: false, navigation: Routes.transferBooking),
      DashBoardItem(assets: "assets/images/dashboard/icon_package.png", name: strings.package, isSelected: false,navigation: Routes.packages),
      DashBoardItem(assets: "assets/images/dashboard/icon_cruise.png", name: strings.cruise, isSelected: false),
    ];

  }

  @override
  void initialise() {
    // TODO: implement initialise
  }

  Future<GroupTopDestinationsResults> getPackageByDestination(int id) async {

    groupTopDestinationsResults = await _packageService.getPackageByDestination(id);

    notifyListeners();
   return groupTopDestinationsResults;



  }

  Future<GroupByCategoryResults> getPackageByCategory(int id) async {

groupByCategoryResults = await _packageService.getPackageByCategory(id);

print(groupByCategoryResults.result.length);

notifyListeners();

return groupByCategoryResults;
  }

  Future<void> getCategories() async {


    categoriesList = await _packageService.getAllCategories(8);

    if(groupByCategoryResults.result==null){

      getPackageByCategory(categoriesList.result.first.id);

    }

    getDestinations();
    
  }

  Future<void> getDestinations() async {

    destinationsList = await _packageService.getAllDestinations(7);

    if(groupTopDestinationsResults.result==null){

      getPackageByDestination(destinationsList.result.first.id);
    }

    loading=false;

    notifyListeners();
  }





}

class DashBoardItem {
  String assets;
  String name;
  bool isSelected;

  String navigation;

  DashBoardItem({this.assets, this.name, this.isSelected, this.navigation});
}

