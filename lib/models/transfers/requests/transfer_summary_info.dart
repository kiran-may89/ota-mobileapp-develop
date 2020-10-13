import '../search_transfers_response.dart';
import 'transfer_place_order_request1.dart';

class TransferSummaryInfo {
  String serviceType;
  List<Trips> trips;
  CarClass carClass;
  String provider;
  String pickUpDate;
  String pickUpTime;
  Null code;

  TransferSummaryInfo(
      {this.serviceType,
        this.trips,
        this.carClass,
        this.provider,
        this.pickUpDate,
        this.pickUpTime,
        this.code});

  TransferSummaryInfo.fromJson(Map<String, dynamic> json) {
    serviceType = json['serviceType'];
    if (json['trips'] != null) {
      trips = new List<Trips>();
      json['trips'].forEach((v) {
        trips.add(new Trips.fromJson(v));
      });
    }
    carClass = json['car_class'] != null
        ? new CarClass.fromMap(json['car_class'])
        : null;
    provider = json['provider'];
    pickUpDate = json['PickUpDate'];
    pickUpTime = json['PickUpTime'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceType'] = this.serviceType;
    if (this.trips != null) {
      data['trips'] = this.trips.map((v) => v.toJson()).toList();
    }
    if (this.carClass != null) {
      data['car_class'] = this.carClass.toMap();
    }
    data['provider'] = this.provider;
    data['PickUpDate'] = this.pickUpDate;
    data['PickUpTime'] = this.pickUpTime;
    data['code'] = this.code;
    return data;
  }
}