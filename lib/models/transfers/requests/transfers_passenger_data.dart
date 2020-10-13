import 'package:ota/models/transfers/requests/reservation_request.dart';
import 'package:ota/models/transfers/requests/transfer_summary_info.dart';
import 'package:ota/models/transfers/search_transfers_response.dart';

import '../data_model/search_transfer_data.dart';
import '../search_transfer_response_entity.dart';

class TransferPassengerData{

  List<Vechile> selectedVehicleData;

  SearchTransferData requestData;

  ReservationRequestData reservationRequest;

  List<TravellerDetails> travellerDetails;

  String correlationId;

  TransferSummaryInfo summaryInfo;


  TransferPassengerData({this.selectedVehicleData,this.requestData,this.travellerDetails,this.reservationRequest,this.correlationId,this.summaryInfo});


}