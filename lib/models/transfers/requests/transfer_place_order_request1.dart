import 'package:ota/models/transfers/search_transfers_response.dart';

class TransferPlaceOrderRequest {
  String tenantId;
  String lang;
  String currency;
  List<Trips> trips;

  TransferPlaceOrderRequest(
      {this.tenantId, this.lang, this.currency, this.trips});

  TransferPlaceOrderRequest.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenantId'];
    lang = json['lang'];
    currency = json['currency'];
    if (json['trips'] != null) {
      trips = new List<Trips>();
      json['trips'].forEach((v) {
        trips.add(new Trips.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    data['lang'] = this.lang;
    data['currency'] = this.currency;
    if (this.trips != null) {
      data['trips'] = this.trips.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trips {
  StartLocation startLocation;
  StartLocation finishLocation;
  List additionalLocation;
  List<Passengers> passengers;
  int passengersNumber;
  String textTablet;
  String comment;
  int additionalChangeItinerary;
  int additionalWait;
  int fareOnTollRoad;
  SendParams sendParams;
  bool isRoundTrip;
  int tpa;
  String tpaName;
  List<Option> options;

  Trips(
      {this.startLocation,
        this.finishLocation,
        this.additionalLocation,
        this.passengers,
        this.passengersNumber,
        this.textTablet,
        this.comment,
        this.additionalChangeItinerary,
        this.additionalWait,
        this.fareOnTollRoad,
        this.sendParams,
        this.isRoundTrip,
        this.tpa,
        this.tpaName,
        this.options});

  Trips.fromJson(Map<String, dynamic> json) {
    startLocation = json['start_location'] != null
        ? new StartLocation.fromJson(json['start_location'])
        : null;
    finishLocation = json['finish_location'] != null
        ? new StartLocation.fromJson(json['finish_location'])
        : null;
//    if (json['additional_location'] != null) {
//      additionalLocation = new List();
//      json['additional_location'].forEach((v) {
//        additionalLocation.add(new AdditionalLocation.fromJson(v));
//      });
//    }
    if (json['passengers'] != null) {
      passengers = new List<Passengers>();
      json['passengers'].forEach((v) {
        passengers.add(new Passengers.fromJson(v));
      });
    }
    passengersNumber = json['passengers_number'];
    textTablet = json['text_tablet'];
    comment = json['comment'];
    additionalChangeItinerary = json['additional_change_itinerary'];
    additionalWait = json['additional_wait'];
    fareOnTollRoad = json['fare_on_toll_road'];
    sendParams = json['send_params'] != null
        ? new SendParams.fromJson(json['send_params'])
        : null;
    isRoundTrip = json['is_round_trip'];
    tpa = json['tpa'];
    tpaName = json['tpaName'];
    if (json['options'] != null) {
      options = new List<Option>();
      json['options'].forEach((v) {
        options.add(new Option.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.startLocation != null) {
      data['start_location'] = this.startLocation.toJson();
    }
    if (this.finishLocation != null) {
      data['finish_location'] = this.finishLocation.toJson();
    }
    if (this.additionalLocation != null) {
      data['additional_location'] =
          this.additionalLocation.map((v) => v.toJson()).toList();
    }
    if (this.passengers != null) {
      data['passengers'] = this.passengers.map((v) => v.toJson()).toList();
    }
    data['passengers_number'] = this.passengersNumber;
    data['text_tablet'] = this.textTablet;
    data['comment'] = this.comment;
    data['additional_change_itinerary'] = this.additionalChangeItinerary;
    data['additional_wait'] = this.additionalWait;
    data['fare_on_toll_road'] = this.fareOnTollRoad;
    if (this.sendParams != null) {
      data['send_params'] = this.sendParams.toJson();
    }
    data['is_round_trip'] = this.isRoundTrip;
    data['tpa'] = this.tpa;
    data['tpaName'] = this.tpaName;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class StartLocation {
  String flightNumber;
  String terminalNumber;
  String trainNumber;
  String trainCarriageNumber;
  String address;
  String location;
  String time;

  StartLocation(
      {this.flightNumber,
        this.terminalNumber,
        this.trainNumber,
        this.trainCarriageNumber,
        this.address,
        this.location,
        this.time});

  StartLocation.fromJson(Map<String, dynamic> json) {
    flightNumber = json['flight_number'];
    terminalNumber = json['terminal_number'];
    trainNumber = json['train_number'];
    trainCarriageNumber = json['train_carriage_number'];
    address = json['address'];
    location = json['location'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_number'] = this.flightNumber;
    data['terminal_number'] = this.terminalNumber;
    data['train_number'] = this.trainNumber;
    data['train_carriage_number'] = this.trainCarriageNumber;
    data['address'] = this.address;
    data['location'] = this.location;
    data['time'] = this.time;
    return data;
  }
}

class Passengers {
  String name;
  String email;
  String phone;

  Passengers({this.name, this.email, this.phone});

  Passengers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class SendParams {
  String sendClientVoucher;
  String sendAdminVoucher;
  String sendClientDoc;
  String sendAdminDoc;

  SendParams(
      {this.sendClientVoucher,
        this.sendAdminVoucher,
        this.sendClientDoc,
        this.sendAdminDoc});

  SendParams.fromJson(Map<String, dynamic> json) {
    sendClientVoucher = json['send_client_voucher'];
    sendAdminVoucher = json['send_admin_voucher'];
    sendClientDoc = json['send_client_doc'];
    sendAdminDoc = json['send_admin_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['send_client_voucher'] = this.sendClientVoucher;
    data['send_admin_voucher'] = this.sendAdminVoucher;
    data['send_client_doc'] = this.sendClientDoc;
    data['send_admin_doc'] = this.sendAdminDoc;
    return data;
  }
}

class Options {
  String key;
  String value;

  Options({this.key, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}