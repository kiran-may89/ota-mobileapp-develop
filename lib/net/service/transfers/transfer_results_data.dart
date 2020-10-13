import 'package:flutter/material.dart';
import 'package:ota/models/transfers/data_model/search_transfer_data.dart';
import 'package:ota/models/transfers/search_transfer_response_entity.dart';
import 'package:ota/models/transfers/search_transfers_response.dart';


class TransferResultsData{


  List<Vechile> selectedVehicleData;

  SearchTransferData requestData;

  String correlationId;

  String distance;

  String time;


  TransferResultsData({this.selectedVehicleData,this.requestData,this.correlationId,this.time,this.distance});


}