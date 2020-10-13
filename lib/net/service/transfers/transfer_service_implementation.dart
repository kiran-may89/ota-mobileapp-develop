

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ota/models/transfers/search_transfer_response_entity.dart';
import 'package:ota/models/transfers/search_transfers_response.dart';
import 'package:ota/models/transfers/transfer_booking_response.dart';
import 'package:ota/models/transfers/transfer_booking_response_entity.dart';
import 'package:ota/models/transfers/transfer_place_order_response_entity.dart';
import 'package:ota/models/transfers/data_model/transfers_search_respose_data.dart';
import 'package:ota/net/service/transfers/transfer_service.dart';

 class TransferServiceImplementation extends TransferService{




   Dio apiConnector;

   final String _SEARCH_TRANSFERS = "transfers/api/v1/aggregatedTransfer/aggregatedtransfersearch";

   final String _ORDER_TRANSFERS = "transfers/api/v1/aggregatedTransfer/aggregatedtransferplaceOrder";

   final String _BOOK_TRANSFERS = "bookings/api/v1/booking/transfers";


   TransferServiceImplementation(this.apiConnector);


  @override
  Future<TransferSearchResponseData> getTransfers(body) async {


    try {
      Response response = await apiConnector
          .post(_SEARCH_TRANSFERS, data: jsonEncode(body.toJson()));


      var data = response.data;

      var correlationId = response.headers.value('X-Correlation-ID');


      TransferSearchResponse results = TransferSearchResponse.fromMap(data);

      TransferSearchResponseData transferSearchResponseData = TransferSearchResponseData(correlationId:correlationId ,transferSearchResponse: results);


      return transferSearchResponseData;

    } catch (error, stacktrace) {

      TransferSearchResponse results = TransferSearchResponse();

      print(error.toString());


      TransferSearchResponseData transferSearchResponseData = TransferSearchResponseData(correlationId:"" , transferSearchResponse: results);

      //results.setException(error: error);

      return transferSearchResponseData;
    }



  }

  @override
  Future<TransferPlaceOrderResponseEntity> placeOrder(body) async {


    try {
      Response response = await apiConnector
          .post(_ORDER_TRANSFERS, data: jsonEncode(body.toJson()));


      var data = response.data;


      TransferPlaceOrderResponseEntity results = TransferPlaceOrderResponseEntity();


      return results.fromJson(data);

    } catch (error, stacktrace) {

      TransferPlaceOrderResponseEntity results = TransferPlaceOrderResponseEntity();

      print(results.responseException.toString());


      return results;
    }


  }

   @override
   Future<TransferBookingResponse> bookTransfer(body) async {


     try {
       Response response = await apiConnector
           .post(_BOOK_TRANSFERS, data: jsonEncode(body.toJson()));


       var data = response.data;


       TransferBookingResponse results = TransferBookingResponse.fromMap(data);


       return results;

     } catch (error, stacktrace) {

       TransferBookingResponse results = TransferBookingResponse();

       print(results.responseException.toString());


       return results;
     }


   }







}