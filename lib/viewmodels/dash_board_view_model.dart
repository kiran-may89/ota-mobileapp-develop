import 'package:get_it/get_it.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/packages/group_by_category.dart';
import 'package:ota/models/packages/group_by_destinations.dart';
import 'package:ota/net/service/package/package_service.dart';
import 'package:ota/net/service/profile/profile_service.dart';
import 'package:ota/utils/strings.dart';

import 'base_view_model.dart';

class DashBoardViewModel extends BaseViewModel {
  List<DashBoardItem> dashBoardItems;
  PackageService _packageService;

  GroupByCategoryResults groupByCategoryResults = GroupByCategoryResults();

  GroupTopDestinationsResults groupTopDestinationsResults = GroupTopDestinationsResults();

  bool loading = true;

  int currentIndex = 0;
  DashBoardViewModel() {

    _packageService = GetIt.instance<PackageService>();

    initItems();
    getPackageByCategory();

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

  Future<void> getPackageByDestination() async {

    groupTopDestinationsResults = await _packageService.getPackageByDestination();

    print(groupTopDestinationsResults.result);
    loading=false;

    notifyListeners();

  }

  Future<void> getPackageByCategory() async {

groupByCategoryResults = await _packageService.getPackageByCategory();

print(groupByCategoryResults.result);

getPackageByDestination();

  }



}

class DashBoardItem {
  String assets;
  String name;
  bool isSelected;

  String navigation;

  DashBoardItem({this.assets, this.name, this.isSelected, this.navigation});
}
