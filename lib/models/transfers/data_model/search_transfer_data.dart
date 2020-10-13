import 'package:ota/models/hotels/hotel_details_request.dart';
import 'package:ota/models/transfers/requests/search_transfer_request.dart';

class SearchTransferData {
  String tenantId;
  StartPoint startPoint;
  StartPoint finishPoint;
  String clientNationality;
  String currency;
  bool oneWay;
  String pichUpPlace;
  String dropPlace;



  SearchTransferData(
      {this.tenantId,
        this.startPoint,
        this.finishPoint,
        this.clientNationality,
        this.currency,
        this.pichUpPlace,
        this.dropPlace,
        this.oneWay,

      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    if (this.startPoint != null) {
      data['startPoint'] = this.startPoint.toJson();
    }
    if (this.finishPoint != null) {
      data['finishPoint'] = this.finishPoint.toJson();
    }
    data['clientNationality'] = this.clientNationality;
    data['currency'] = this.currency;

    data['pichUpPlace'] = this.pichUpPlace;
    data['dropPlace'] = this.dropPlace;
    data['oneWay'] = this.oneWay;


    return data;
  }
}



