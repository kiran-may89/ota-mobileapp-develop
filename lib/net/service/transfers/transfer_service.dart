

import 'package:ota/models/transfers/data_model/transfers_search_respose_data.dart';
import 'package:ota/models/transfers/search_transfer_response_entity.dart';
import 'package:ota/models/transfers/search_transfers_response.dart';
import 'package:ota/models/transfers/transfer_booking_response.dart';
import 'package:ota/models/transfers/transfer_booking_response_entity.dart';
import 'package:ota/models/transfers/transfer_place_order_response_entity.dart';

abstract class TransferService{

  Future<TransferSearchResponseData> getTransfers(body);


  Future<TransferPlaceOrderResponseEntity> placeOrder(body);


  Future<TransferBookingResponse> bookTransfer(body);


}