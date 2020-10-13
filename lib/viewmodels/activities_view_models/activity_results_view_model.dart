import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/activity/activity_search_response.dart';
//import 'package:ota/models/activity/activity_search_response1_entity.dart';
//import 'package:ota/models/activity/activity_search_response_entity.dart';
import 'package:ota/models/activity/request/activity_details_data.dart';
import 'package:ota/models/activity/request/activity_results_data.dart';
import 'package:ota/models/activity/request/fill_details_request.dart';
import 'package:ota/models/activity/request/search_activity_data.dart';
import 'package:ota/models/activity/request/search_activity_request.dart';
import 'package:ota/net/service/activity/activity_service.dart';
import 'package:ota/viewmodels/activities_view_models/data_models/activity_booking_data.dart';
import 'package:ota/views/activities/fulldetails_data.dart';

class ActivityResultsModel extends ChangeNotifier {
  ActivityService _activityService;

  SearchActivityData requestData;

  bool loading = true;

  int filterCount = 0;

  bool priceFilterHighLow = false;

  bool priceRangeVaried = false;

  bool priceFilter = false;

  bool segmentFilter = false;

  bool openCategories = false;

  bool openDuration = false;

  bool openRecommendedActivity = false;

  TextEditingController searchController = TextEditingController();

  List<ActivitySearchResponseActivities> activityList = [];

  ActivitySearchResponse activitySearchResponse;

  List<ActivitySearchResponseSegments> recommendedActivityFilter = List();

  List<ActivitySearchResponseSegments> categoriesFilter = List();

  List<ActivitySearchResponseSegments> durationFilter = List();

  double minPriceRange = 0.0;

  double maxPriceRange = 0.0;

  double minPrice = 0.0;

  double maxPrice = 0.0;

  RangeValues priceRange;

  List<ActivitySearchResponseSegments> appliedFilters = List();

//  List<ActivitySearchResponseSegments> appliedCategoriesFilter = List();
//
//  List<ActivitySearchResponseSegments> appliedDurationFilter = List();

  bool applyDurationFilter = false;

  bool applyRecommendedActivity = false;

  bool applyCategories = false;

  ActivitySearchResponseData activitySearchResponseData;

  ActivityResultsModel(this.requestData) {
    _activityService = GetIt.instance<ActivityService>();

    print(requestData.startPlaceName);

    getActivities();
  }

  Future<void> getActivities() async {
    SearchActivityRequest searchActivityRequest = SearchActivityRequest(
        language: requestData.language,
        filters: getFilters(),
        from: requestData.fromDate,
        to: requestData.returnDate,
        order: "DEFAULT",
        pagination: Pagination(itemsPerPage: 50, page: 1),
        paxes: getPaxes());
    print(searchActivityRequest.toJson());

    activitySearchResponseData = await _activityService.getActivities(searchActivityRequest);

    print("CorrelationId${activitySearchResponseData.correlationId}");

    activitySearchResponse = activitySearchResponseData.activitySearchResponse;




    if(!activitySearchResponse.isError) {
      setData();

    }



      _setloading(false);




  }

  getFilters() {
    List<Filters> filterList = List();

    List<SearchFilterItems> filterItems = List();

    SearchFilterItems searchFilterItems = SearchFilterItems(
      type: "gps",
      latitude: requestData.startPoint.lat.toString(),
      longitude: requestData.startPoint.lng.toString(),
    );

    filterItems.add(searchFilterItems);

    Filters filters = Filters(searchFilterItems: filterItems);

    filterList.add(filters);

    return filterList;
  }

  getPaxes() {
    List<Paxes> paxesList = List();

    for (int i = 0; i < requestData.Age.length; i++) {
      print(requestData.Age[i]);

      Paxes paxes = Paxes(age: requestData.Age[i].toString());
      paxesList.add(paxes);
    }

    return paxesList;
  }

  void _setloading(bool value) {
    loading = value;
    notifyListeners();
  }

  void setData() {
    activityList = [];

    activityList.addAll(activitySearchResponse.result.activities);


    activitySearchResponse.result.activities.forEach((activity) {
      activity.content.segmentationGroups.forEach((element) {
        if (element.code == 3) {
          element.segments.forEach((activity) {
            if (!recommendedActivityFilter.contains(activity)) {
              recommendedActivityFilter.add(activity);
            }
          });
        } else if (element.code == 1) {
          element.segments.forEach((category) {

            if (!categoriesFilter.contains(category)) categoriesFilter.add(category);

          });
        } else if (element.code == 2) {
          element.segments.forEach((duration) {

            if (!durationFilter.contains(duration)) durationFilter.add(duration);

          });
        }
      });
    });


    if ( appliedFilters.length != 0 ) {

      activityList =   activitySearchResponse.result.activities.where((element) {
        bool avilable = false;
        element.content.segmentationGroups.forEach((innerElement) {
          appliedFilters.forEach((filterElement) {
            if (innerElement.segments.contains(filterElement)) {
              avilable = true;
            }
          });
        });
        return avilable;
      }).toList();
    } else if (priceRangeVaried) {

      activityList =   activityList.where((results) =>

      getPrice(results.amountsFromWithMarkup) >= priceRange.start &&

      getPrice(results.amountsFromWithMarkup)<= priceRange.end

      ).toList();


    }



    sortPrices();


  }

  sortPrices() {
    activityList.sort((a, b) {
      double firstPrice = 0;
      double secondPrice = 0;
      a.amountsFromWithMarkup.forEach((element) {
        if (element.paxType == "ADULT") {
          firstPrice = element.displayRateInfoWithMarkup.totalPriceWithMarkup;
        }
      });
      b.amountsFromWithMarkup.forEach((element) {
        if (element.paxType == "ADULT") {
          secondPrice = element.displayRateInfoWithMarkup.totalPriceWithMarkup;
        }
      });
      if(priceFilterHighLow){
        return  secondPrice.compareTo(firstPrice);
      }else{
         firstPrice.compareTo(secondPrice);

        maxPrice =  getPrice(activityList.last.amountsFromWithMarkup);

        minPrice =  getPrice(activityList.first.amountsFromWithMarkup);

        return firstPrice.compareTo(secondPrice);

      }


    });

    minPriceRange = minPrice;

    maxPriceRange = maxPrice;


    priceRange = RangeValues(minPrice, maxPrice);

    notifyListeners();
  }

   getPrice(List<ActivitySearchResponseAmountsFromWithMarkup> amountsFromWithMarkup) {


    dynamic value;

    amountsFromWithMarkup.forEach((element) {
      if(element.paxType == "ADULT")

        value = (element.displayRateInfoWithMarkup.totalPriceWithMarkup);
    });

    return value;
  }

  changePriceFilterType() {
    if (priceFilterHighLow) {
      priceFilterHighLow = false;
    } else {
      priceFilterHighLow = true;
    }

    sortPrices();
  }

//  void searchActivities() {
//    activityList = [];
//
//    activityList = activitySearchResponse.result.activities.where((element) => element.name.toLowerCase().contains(searchController.text)).toList();
//
//    notifyListeners();
//  }

  getArgumentData(int index) {
    FullDetailsData fullDetailsData;

    FullDetailsRequest fullDetailsRequest = FullDetailsRequest(
        to: requestData.returnDate,
        from: requestData.fromDate,
        language: requestData.language,
        paxes: getPaxes(),
        code: activityList[index].code,
        tpaName: activityList[index].tpaName,
        tpa: activityList[index].tpa,
        options: activityList[index].options);

    print(fullDetailsRequest.toJson());

    fullDetailsData = FullDetailsData(age: requestData.Age, fullDetailsRequest: fullDetailsRequest);

    TravelDetails travelDetails = TravelDetails(
        count: requestData.adultCnt,
        FromDateMonth: requestData.fromDateMonth,
        FromPlace: requestData.startPlaceName,
        ToMonth: requestData.returnDateMonth);

    ActivityResultsData activityResultsData =
        ActivityResultsData(fullDetailsData: fullDetailsData, travelDetails: travelDetails, correlationId: activitySearchResponseData.correlationId);

    return activityResultsData;
  }

  void openCloseCategories() {
    if (openCategories) {
      openCategories = false;
    } else {
      openCategories = true;
    }
    notifyListeners();
  }

  void categoriesAddAndRemove(int index) {
    if (appliedFilters.contains(categoriesFilter[index])) {
      appliedFilters.remove(categoriesFilter[index]);
    } else {
      appliedFilters.add(categoriesFilter[index]);
    }
    notifyListeners();
  }

  checkAppliedCategories(int index) {
    if (appliedFilters.contains(categoriesFilter[index])) {
      return true;
    } else {
      return false;
    }
  }

  void openCloseRecommendedActivity() {
    if (openRecommendedActivity) {
      openRecommendedActivity = false;
    } else {
      openRecommendedActivity = true;
    }
    notifyListeners();
  }

  void recommendedActivityAddAndRemove(int index) {
    if (appliedFilters.contains(recommendedActivityFilter[index])) {
      appliedFilters.remove(recommendedActivityFilter[index]);
    } else {
      appliedFilters.add(recommendedActivityFilter[index]);
    }
    notifyListeners();
  }

  checkAppliedRecommendedActivity(int index) {
    if (appliedFilters.contains(recommendedActivityFilter[index])) {
      return true;
    } else {
      return false;
    }
  }

  void openCloseDuration() {
    if (openDuration) {
      openDuration = false;
    } else {
      openDuration = true;
    }
    notifyListeners();
  }

  void durationAddAndRemove(int index) {
    if (appliedFilters.contains(durationFilter[index])) {
      appliedFilters.remove(durationFilter[index]);
    } else {
      appliedFilters.add(durationFilter[index]);
    }
    notifyListeners();
  }

  checkAppliedDuration(int index) {
    if (appliedFilters.contains(durationFilter[index])) {
      return true;
    } else {
      return false;
    }
  }

  void changePriceRangeSelection(RangeValues value) {
    priceRangeVaried = true;

    priceRange = value;
    notifyListeners();
  }

  void clearFilters() {

   appliedFilters.clear();

   priceRangeVaried = false;

   filterCount =0;

   setData();

  }



  void applyFilters() {

    if(priceRangeVaried&&appliedFilters.isNotEmpty){
      filterCount = 2;
    }else if(priceRangeVaried&&appliedFilters.isEmpty){
      filterCount = 1;
    }else if(!priceRangeVaried&&appliedFilters.isNotEmpty){
      filterCount = 1;
    }

    setData();
  }
//  void applyFilters() {
//    if (appliedDurationFilter.length != 0 || appliedRecommendedFilters.length != 0 || appliedCategoriesFilter.length != 0) {
//
//
////      if(appliedDurationFilter!=0){
////
////        activityList =   activityList.where((activities) =>
////
////        activities.content.segmentationGroups.where((element) {
////
////
////
////
////        }
////        );
////
////        ).toList();
////
////      }
//
//    } else if (priceRangeVaried) {
//      priceFilter = true;
//    }
//
//    notifyListeners();
//  }

//  String getPrice(ActivityResultsModel model, int index) {
//    String value = "";
//
//    model.activityList[index].amountsFromWithMarkup.forEach((element) {
//      if (element.paxType == "ADULT") value = (element.displayRateInfoWithMarkup.totalPriceWithMarkup.roundToDouble().toString());
//    });
//
//    return value;
//  }

  compareArg1(ActivitySearchResponseActivities a) {
    // a.amountsFromWithMarkup.w
  }
}
