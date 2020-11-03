import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/transfers/data_model/transfers_search_respose_data.dart';
import 'package:ota/models/transfers/requests/search_transfer_request.dart';
import 'package:ota/models/transfers/data_model/search_transfer_data.dart';
import 'package:ota/models/transfers/search_transfer_response_entity.dart';
import 'package:ota/models/transfers/search_transfers_response.dart';
import 'package:ota/net/service/delegate.dart';
import 'package:ota/net/service/transfers/transfer_results_data.dart';
import 'package:ota/net/service/transfers/transfer_service.dart';

class TransferResultsModel extends ChangeNotifier{


  TransferService  _transferService;

  List<Vechile> transferList = [];


  List<Vechile> selectedVehicleData = [];

  bool filterApplied = false;

  SearchTransferData  _requestData;

  SearchTransferData get requestData=>_requestData;

  TransferSearchResponseData transferSearchResponseData = TransferSearchResponseData();

  TransferSearchResponse transferSearchResponse =   TransferSearchResponse();

  int filterCount=0;

  bool oneWay  ;

  bool priceHighLowFilter = false;

  bool priceFilter = false;

  bool carTypeFilter = false;

  double minPrice = 0.0;

  double maxPrice = 0.0;


  double minPriceRange = 0.0;

  double maxPriceRange = 0.0;

  bool priceRangeVaried = false;

  int cabType;

  String cabTypeSelection;

  bool standardFilter = false;

  bool minivanFilter = false;

  bool minibusFilter = false;

  RangeValues priceRange ;

  bool loading = true;
  Delegate _delegate;

  TransferResultsModel(this._requestData,Delegate delegate){

    _delegate =delegate;
    oneWay = _requestData.oneWay;

    _transferService = GetIt.instance<TransferService>();


    getTransferResults();
    }

     getTransferResults() async {
       SearchTransferRequest searchTransferRequest;


       searchTransferRequest = SearchTransferRequest(

       startPoint: requestData.startPoint,
       finishPoint: requestData.finishPoint,
       clientNationality: requestData
       .clientNationality,
       currency: requestData.currency,
       tenantId: requestData.tenantId

       );

       print(jsonEncode(searchTransferRequest
       .toJson()));

       transferSearchResponseData = await _transferService
       .getTransfers(searchTransferRequest);
       var response = transferSearchResponseData.transferSearchResponse;
        if( response.isError) {
          _delegate.onError("Something Went wrong, Please Try Again..", false, "assets/images/transfer.png");
          return;
        }
       transferSearchResponse = transferSearchResponseData
       .transferSearchResponse;

       if (transferSearchResponse != null) {
         if (!transferSearchResponse.isError && transferSearchResponse.result.vechiles.length>0 ) {
           setData();
           sortPrices();
         }

         _setloading(false);
       }

     }


  void _setloading(bool value) {
    loading = value;
    notifyListeners();
  }



  setData() {

    transferList = [];

    transferList.addAll(transferSearchResponse.result.vechiles);

    if(filterApplied){

      if(priceFilter){

        transferList =   transferList.where((results) =>
        results.displayRateInfoWithMarkup.totalPriceWithMarkup >= priceRange.start &&

            results.displayRateInfoWithMarkup.totalPriceWithMarkup <= priceRange.end

        ).toList();

      }
      if(standardFilter){

        transferList =   transferList.where((results) =>
        results.carClass.title.toLowerCase() == "standard"
        ).toList();

      }
      if(minivanFilter){

        transferList =   transferList.where((results) =>
        results.carClass.title.toLowerCase() == "minivan"
        ).toList();

      }
      if(minibusFilter){

        transferList =   transferList.where((results) =>
        results.carClass.title.toLowerCase() == "minibus"
        ).toList();

      }

    }


    notifyListeners();


  }



  sortPrices(){

    if (priceHighLowFilter) {

      Comparator <Vechile> priceComparator = (
          a, b) => -a.displayRateInfoWithMarkup.totalPriceWithMarkup.compareTo(b.displayRateInfoWithMarkup.totalPriceWithMarkup);
      transferList.sort(priceComparator);




    } else {

      Comparator<Vechile> priceComparator = (
          a, b) => a.displayRateInfoWithMarkup.totalPriceWithMarkup.compareTo(b.displayRateInfoWithMarkup.totalPriceWithMarkup);
      transferList.sort(priceComparator);

      maxPrice =  transferList.last.displayRateInfoWithMarkup.totalPriceWithMarkup;

      minPrice = transferList.first.displayRateInfoWithMarkup.totalPriceWithMarkup;

    }
    minPriceRange = minPrice;

    maxPriceRange = maxPrice;




    priceRange = RangeValues(minPrice, maxPrice);

    notifyListeners();


  }


  changePriceFilterType()  {

    if(priceHighLowFilter){

      priceHighLowFilter=false;

      sortPrices();

    }else{

      priceHighLowFilter=true;


sortPrices();

    }

  }

  
  
  void changePriceRangeSelection(RangeValues value) {
    priceRangeVaried = true;

    priceRange = value;
    notifyListeners();
  }




  void cabSelection_Changes(bool value, cabType) {


    if(cabType =="standard"){

      standardFilter = value;

    }else if(cabType =="minivan"){

      minivanFilter = value;

    }else if(cabType =="minibus"){

      minibusFilter = value;

    }


    notifyListeners();
  }




  void applyFilters() {

    filterCount = 0;

    priceFilter =false;

    carTypeFilter = false;

    filterApplied = false;

    if(standardFilter||minibusFilter||minivanFilter){


      filterCount++;

    }
    if(priceRangeVaried){

      priceFilter =true;

      filterCount++;

    }

    filterApplied = true;

    notifyListeners();
    setData();

  }

  void clearFilters() {
    filterApplied = false;

    filterCount = 0;

    standardFilter = false;

    minibusFilter = false;

    minivanFilter = false;

    priceFilter =false;

    carTypeFilter = false;


    setData();

    sortPrices();

  }

  getArguments() {

TransferResultsData transferResultsData =
    TransferResultsData(
        requestData: requestData,
        selectedVehicleData: selectedVehicleData,
        correlationId: transferSearchResponseData.correlationId,
        distance:transferSearchResponse.result.googleMetrix.distance.text,
        time: transferSearchResponse.result.googleMetrix.duration.text,


    );

return transferResultsData;

  }






}