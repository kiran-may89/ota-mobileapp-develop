
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ota/models/transfers/data_model/search_transfer_data.dart';
import 'package:ota/models/transfers/search_transfer_response_entity.dart';
import 'package:ota/models/transfers/search_transfers_response.dart';
import 'package:ota/net/service/transfers/transfer_results_data.dart';
import 'package:ota/views/tabs/priceHigh_Low.dart';

class TransferDetailsModel extends ChangeNotifier{


  SearchTransferData  requestData;

  Set<Marker> markers = {};




  List<Vechile> selectedVehicleData = [];

  TransferResultsData transferResultsData;


  TransferDetailsModel(this.transferResultsData){

    requestData = transferResultsData.requestData;


     selectedVehicleData = transferResultsData.selectedVehicleData;

  }

  void addMarkers() {

    markers.add(
        Marker(
            markerId: MarkerId("Start"),

            position: LatLng(requestData.startPoint.lat, requestData.startPoint.lng),
            )
        );

    markers.add(
        Marker(
          markerId: MarkerId("end"),

          position: LatLng(requestData.finishPoint.lat, requestData.finishPoint.lng),
        )
    );

    notifyListeners();


  }















}