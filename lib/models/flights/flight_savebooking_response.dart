// To parse this JSON data, do
//
//     final flightSaveBookingResponse = flightSaveBookingResponseFromMap(jsonString);

import 'dart:convert';

class FlightSaveBookingResponse {
  FlightSaveBookingResponse({
    this.version,
    this.message,
    this.isError,
    this.responseException,
    this.result,
  });

  dynamic version;
  String message;
  bool isError;
  dynamic responseException;
  Result result;

  factory FlightSaveBookingResponse.fromJson(String str) => FlightSaveBookingResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FlightSaveBookingResponse.fromMap(Map<String, dynamic> json) => FlightSaveBookingResponse(
    version: json["version"],
    message: json["message"] == null ? null : json["message"],
    isError: json["isError"] == null ? null : json["isError"],
    responseException: json["responseException"],
    result: json["result"] == null ? null : Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "version": version,
    "message": message == null ? null : message,
    "isError": isError == null ? null : isError,
    "responseException": responseException,
    "result": result == null ? null : result.toMap(),
  };
}

class Result {
  Result({
    this.tpa,
    this.options,
    this.airlinesMeta,
    this.serverTime,
    this.pnum,
    this.flights,
    this.flightsChecked,
    this.flightsToCheck,
    this.flightsRealChecked,
    this.flightsInvalid,
    this.maxPassengers,
    this.infantsConditions,
    this.documentOptions,
    this.visasAgreementRequiered,
    this.transfers,
    this.route,
    this.bookFee,
    this.feeAirline,
    this.extraFee,
    this.flightsPrice,
    this.total,
    this.spFee,
    this.flightRealPrice,
    this.onePassenger,
    this.creditsPrice,
    this.origPriceUsage,
    this.priceChange,
    this.ticketsPrice,
    this.origPrice,
    this.insuranceData,
    this.insurancePrice,
    this.adultsPrice,
    this.childrenPrice,
    this.infantsPrice,
    this.bags,
    this.bagsFee,
    this.bagsFeeSplit,
    this.bagsPrice,
    this.bagsPriceSplit,
    this.handBagsPrice,
    this.bagsRestrictions,
    this.additionalOrderBaggageFee,
    this.luggage,
    this.sandbox,
    this.status,
    this.promocode,
    this.passengers,
    this.authToken,
    this.bookingId,
    this.transactionId,
    this.statusCode,
    this.zoozToken,
    this.eurPaymentPrice,
    this.bookFeeWithMarkup,
    this.feeAirlineWithMarkup,
    this.extraFeeWithMarkup,
    this.flightsPriceWithMarkup,
    this.totalWithMarkup,
    this.spFeeWithMarkup,
    this.flightRealPriceWithMarkup,
  });

  String tpa;
  List<Option> options;
  List<AirlinesMeta> airlinesMeta;
  dynamic serverTime;
  dynamic pnum;
  List<Flight> flights;
  bool flightsChecked;
  bool flightsToCheck;
  bool flightsRealChecked;
  bool flightsInvalid;
  dynamic maxPassengers;
  InfantsConditions infantsConditions;
  DocumentOptions documentOptions;
  bool visasAgreementRequiered;
  List<dynamic> transfers;
  List<String> route;
  dynamic bookFee;
  dynamic feeAirline;
  dynamic extraFee;
  dynamic flightsPrice;
  dynamic total;
  double spFee;
  dynamic flightRealPrice;
  dynamic onePassenger;
  dynamic creditsPrice;
  bool origPriceUsage;
  bool priceChange;
  dynamic ticketsPrice;
  dynamic origPrice;
  dynamic insuranceData;
  dynamic insurancePrice;
  dynamic adultsPrice;
  dynamic childrenPrice;
  dynamic infantsPrice;
  Bags bags;
  dynamic bagsFee;
  BagsFeeSplit bagsFeeSplit;
  BagsPrice bagsPrice;
  BagsPriceSplit bagsPriceSplit;
  BagsRestrictions handBagsPrice;
  BagsRestrictions bagsRestrictions;
  dynamic additionalOrderBaggageFee;
  List<String> luggage;
  bool sandbox;
  String status;
  Promocode promocode;
  List<Passenger> passengers;
  String authToken;
  dynamic bookingId;
  String transactionId;
  dynamic statusCode;
  dynamic zoozToken;
  dynamic eurPaymentPrice;
  dynamic bookFeeWithMarkup;
  dynamic feeAirlineWithMarkup;
  dynamic extraFeeWithMarkup;
  dynamic flightsPriceWithMarkup;
  dynamic totalWithMarkup;
  double spFeeWithMarkup;
  dynamic flightRealPriceWithMarkup;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    tpa: json["tpa"] == null ? null : json["tpa"],
    options: json["options"] == null ? null : List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
    airlinesMeta: json["airlinesMeta"] == null ? null : List<AirlinesMeta>.from(json["airlinesMeta"].map((x) => AirlinesMeta.fromMap(x))),
    serverTime: json["server_time"] == null ? null : json["server_time"],
    pnum: json["pnum"] == null ? null : json["pnum"],
    flights: json["flights"] == null ? null : List<Flight>.from(json["flights"].map((x) => Flight.fromMap(x))),
    flightsChecked: json["flights_checked"] == null ? null : json["flights_checked"],
    flightsToCheck: json["flights_to_check"] == null ? null : json["flights_to_check"],
    flightsRealChecked: json["flights_real_checked"] == null ? null : json["flights_real_checked"],
    flightsInvalid: json["flights_invalid"] == null ? null : json["flights_invalid"],
    maxPassengers: json["max_passengers"] == null ? null : json["max_passengers"],
    infantsConditions: json["infants_conditions"] == null ? null : InfantsConditions.fromMap(json["infants_conditions"]),
    documentOptions: json["document_options"] == null ? null : DocumentOptions.fromMap(json["document_options"]),
    visasAgreementRequiered: json["visas_agreement_requiered"] == null ? null : json["visas_agreement_requiered"],
    transfers: json["transfers"] == null ? null : List<dynamic>.from(json["transfers"].map((x) => x)),
    route: json["route"] == null ? null : List<String>.from(json["route"].map((x) => x)),
    bookFee: json["book_fee"] == null ? null : json["book_fee"],
    feeAirline: json["fee_airline"] == null ? null : json["fee_airline"],
    extraFee: json["extra_fee"] == null ? null : json["extra_fee"],
    flightsPrice: json["flights_price"] == null ? null : json["flights_price"],
    total: json["total"] == null ? null : json["total"],
    spFee: json["sp_fee"] == null ? null : json["sp_fee"].toDouble(),
    flightRealPrice: json["flight_real_price"] == null ? null : json["flight_real_price"],
    onePassenger: json["one_passenger"] == null ? null : json["one_passenger"],
    creditsPrice: json["credits_price"] == null ? null : json["credits_price"],
    origPriceUsage: json["orig_price_usage"] == null ? null : json["orig_price_usage"],
    priceChange: json["price_change"] == null ? null : json["price_change"],
    ticketsPrice: json["tickets_price"] == null ? null : json["tickets_price"],
    origPrice: json["orig_price"] == null ? null : json["orig_price"],
    insuranceData: json["insurance_data"],
    insurancePrice: json["insurance_price"],
    adultsPrice: json["adults_price"] == null ? null : json["adults_price"],
    childrenPrice: json["children_price"] == null ? null : json["children_price"],
    infantsPrice: json["infants_price"] == null ? null : json["infants_price"],
    bags: json["bags"] == null ? null : Bags.fromMap(json["bags"]),
    bagsFee: json["bags_fee"] == null ? null : json["bags_fee"],
    bagsFeeSplit: json["bags_fee_split"] == null ? null : BagsFeeSplit.fromMap(json["bags_fee_split"]),
    bagsPrice: json["bags_price"] == null ? null : BagsPrice.fromMap(json["bags_price"]),
    bagsPriceSplit: json["bags_price_split"] == null ? null : BagsPriceSplit.fromMap(json["bags_price_split"]),
    handBagsPrice: json["hand_bags_price"] == null ? null : BagsRestrictions.fromMap(json["hand_bags_price"]),
    bagsRestrictions: json["bags_restrictions"] == null ? null : BagsRestrictions.fromMap(json["bags_restrictions"]),
    additionalOrderBaggageFee: json["additional_order_baggage_fee"] == null ? null : json["additional_order_baggage_fee"],
    luggage: json["luggage"] == null ? null : List<String>.from(json["luggage"].map((x) => x == null ? null : x)),
    sandbox: json["sandbox"] == null ? null : json["sandbox"],
    status: json["status"] == null ? null : json["status"],
    promocode: json["promocode"] == null ? null : Promocode.fromMap(json["promocode"]),
    passengers: json["passengers"] == null ? null : List<Passenger>.from(json["passengers"].map((x) => Passenger.fromMap(x))),
    authToken: json["auth_token"] == null ? null : json["auth_token"],
    bookingId: json["booking_id"] == null ? null : json["booking_id"],
    transactionId: json["transaction_id"] == null ? null : json["transaction_id"],
    statusCode: json["status_code"] == null ? null : json["status_code"],
    zoozToken: json["zooz_token"],
    eurPaymentPrice: json["eur_payment_price"] == null ? null : json["eur_payment_price"],
    bookFeeWithMarkup: json["book_feeWithMarkup"] == null ? null : json["book_feeWithMarkup"],
    feeAirlineWithMarkup: json["fee_airlineWithMarkup"] == null ? null : json["fee_airlineWithMarkup"],
    extraFeeWithMarkup: json["extra_feeWithMarkup"] == null ? null : json["extra_feeWithMarkup"],
    flightsPriceWithMarkup: json["flights_priceWithMarkup"] == null ? null : json["flights_priceWithMarkup"],
    totalWithMarkup: json["totalWithMarkup"] == null ? null : json["totalWithMarkup"],
    spFeeWithMarkup: json["sp_feeWithMarkup"] == null ? null : json["sp_feeWithMarkup"].toDouble(),
    flightRealPriceWithMarkup: json["flight_real_priceWithMarkup"] == null ? null : json["flight_real_priceWithMarkup"],
  );

  Map<String, dynamic> toMap() => {
    "tpa": tpa == null ? null : tpa,
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toMap())),
    "airlinesMeta": airlinesMeta == null ? null : List<dynamic>.from(airlinesMeta.map((x) => x.toMap())),
    "server_time": serverTime == null ? null : serverTime,
    "pnum": pnum == null ? null : pnum,
    "flights": flights == null ? null : List<dynamic>.from(flights.map((x) => x.toMap())),
    "flights_checked": flightsChecked == null ? null : flightsChecked,
    "flights_to_check": flightsToCheck == null ? null : flightsToCheck,
    "flights_real_checked": flightsRealChecked == null ? null : flightsRealChecked,
    "flights_invalid": flightsInvalid == null ? null : flightsInvalid,
    "max_passengers": maxPassengers == null ? null : maxPassengers,
    "infants_conditions": infantsConditions == null ? null : infantsConditions.toMap(),
    "document_options": documentOptions == null ? null : documentOptions.toMap(),
    "visas_agreement_requiered": visasAgreementRequiered == null ? null : visasAgreementRequiered,
    "transfers": transfers == null ? null : List<dynamic>.from(transfers.map((x) => x)),
    "route": route == null ? null : List<dynamic>.from(route.map((x) => x)),
    "book_fee": bookFee == null ? null : bookFee,
    "fee_airline": feeAirline == null ? null : feeAirline,
    "extra_fee": extraFee == null ? null : extraFee,
    "flights_price": flightsPrice == null ? null : flightsPrice,
    "total": total == null ? null : total,
    "sp_fee": spFee == null ? null : spFee,
    "flight_real_price": flightRealPrice == null ? null : flightRealPrice,
    "one_passenger": onePassenger == null ? null : onePassenger,
    "credits_price": creditsPrice == null ? null : creditsPrice,
    "orig_price_usage": origPriceUsage == null ? null : origPriceUsage,
    "price_change": priceChange == null ? null : priceChange,
    "tickets_price": ticketsPrice == null ? null : ticketsPrice,
    "orig_price": origPrice == null ? null : origPrice,
    "insurance_data": insuranceData,
    "insurance_price": insurancePrice,
    "adults_price": adultsPrice == null ? null : adultsPrice,
    "children_price": childrenPrice == null ? null : childrenPrice,
    "infants_price": infantsPrice == null ? null : infantsPrice,
    "bags": bags == null ? null : bags.toMap(),
    "bags_fee": bagsFee == null ? null : bagsFee,
    "bags_fee_split": bagsFeeSplit == null ? null : bagsFeeSplit.toMap(),
    "bags_price": bagsPrice == null ? null : bagsPrice.toMap(),
    "bags_price_split": bagsPriceSplit == null ? null : bagsPriceSplit.toMap(),
    "hand_bags_price": handBagsPrice == null ? null : handBagsPrice.toMap(),
    "bags_restrictions": bagsRestrictions == null ? null : bagsRestrictions.toMap(),
    "additional_order_baggage_fee": additionalOrderBaggageFee == null ? null : additionalOrderBaggageFee,
    "luggage": luggage == null ? null : List<dynamic>.from(luggage.map((x) => x == null ? null : x)),
    "sandbox": sandbox == null ? null : sandbox,
    "status": status == null ? null : status,
    "promocode": promocode == null ? null : promocode.toMap(),
    "passengers": passengers == null ? null : List<dynamic>.from(passengers.map((x) => x.toMap())),
    "auth_token": authToken == null ? null : authToken,
    "booking_id": bookingId == null ? null : bookingId,
    "transaction_id": transactionId == null ? null : transactionId,
    "status_code": statusCode == null ? null : statusCode,
    "zooz_token": zoozToken,
    "eur_payment_price": eurPaymentPrice == null ? null : eurPaymentPrice,
    "book_feeWithMarkup": bookFeeWithMarkup == null ? null : bookFeeWithMarkup,
    "fee_airlineWithMarkup": feeAirlineWithMarkup == null ? null : feeAirlineWithMarkup,
    "extra_feeWithMarkup": extraFeeWithMarkup == null ? null : extraFeeWithMarkup,
    "flights_priceWithMarkup": flightsPriceWithMarkup == null ? null : flightsPriceWithMarkup,
    "totalWithMarkup": totalWithMarkup == null ? null : totalWithMarkup,
    "sp_feeWithMarkup": spFeeWithMarkup == null ? null : spFeeWithMarkup,
    "flight_real_priceWithMarkup": flightRealPriceWithMarkup == null ? null : flightRealPriceWithMarkup,
  };
}

class AirlinesMeta {
  AirlinesMeta({
    this.code,
    this.type,
    this.name,
    this.lcc,
    this.image32,
    this.image64,
    this.image128,
    this.isDeleted,
    this.id,
    this.uid,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.createdAtUtc,
    this.updatedAtUtc,
  });

  String code;
  String type;
  String name;
  dynamic lcc;
  String image32;
  String image64;
  String image128;
  bool isDeleted;
  dynamic id;
  String uid;
  String createdBy;
  DateTime createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  DateTime createdAtUtc;
  DateTime updatedAtUtc;

  factory AirlinesMeta.fromJson(String str) => AirlinesMeta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AirlinesMeta.fromMap(Map<String, dynamic> json) => AirlinesMeta(
    code: json["code"] == null ? null : json["code"],
    type: json["type"] == null ? null : json["type"],
    name: json["name"] == null ? null : json["name"],
    lcc: json["lcc"] == null ? null : json["lcc"],
    image32: json["image32"] == null ? null : json["image32"],
    image64: json["image64"] == null ? null : json["image64"],
    image128: json["image128"] == null ? null : json["image128"],
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
    id: json["id"] == null ? null : json["id"],
    uid: json["uid"] == null ? null : json["uid"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    updatedBy: json["updatedBy"],
    updatedDate: json["updatedDate"],
    createdAtUtc: json["createdAtUTC"] == null ? null : DateTime.parse(json["createdAtUTC"]),
    updatedAtUtc: json["updatedAtUTC"] == null ? null : DateTime.parse(json["updatedAtUTC"]),
  );

  Map<String, dynamic> toMap() => {
    "code": code == null ? null : code,
    "type": type == null ? null : type,
    "name": name == null ? null : name,
    "lcc": lcc == null ? null : lcc,
    "image32": image32 == null ? null : image32,
    "image64": image64 == null ? null : image64,
    "image128": image128 == null ? null : image128,
    "isDeleted": isDeleted == null ? null : isDeleted,
    "id": id == null ? null : id,
    "uid": uid == null ? null : uid,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate == null ? null : createdDate.toIso8601String(),
    "updatedBy": updatedBy,
    "updatedDate": updatedDate,
    "createdAtUTC": createdAtUtc == null ? null : createdAtUtc.toIso8601String(),
    "updatedAtUTC": updatedAtUtc == null ? null : updatedAtUtc.toIso8601String(),
  };
}

class Bags {
  Bags({
    this.definitions,
    this.combinations,
    this.notices,
  });

  Tions definitions;
  Tions combinations;
  BagsRestrictions notices;

  factory Bags.fromJson(String str) => Bags.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bags.fromMap(Map<String, dynamic> json) => Bags(
    definitions: json["definitions"] == null ? null : Tions.fromMap(json["definitions"]),
    combinations: json["combinations"] == null ? null : Tions.fromMap(json["combinations"]),
    notices: json["notices"] == null ? null : BagsRestrictions.fromMap(json["notices"]),
  );

  Map<String, dynamic> toMap() => {
    "definitions": definitions == null ? null : definitions.toMap(),
    "combinations": combinations == null ? null : combinations.toMap(),
    "notices": notices == null ? null : notices.toMap(),
  };
}

class Tions {
  Tions({
    this.holdBag,
    this.handBag,
  });

  List<DBag> holdBag;
  List<DBag> handBag;

  factory Tions.fromJson(String str) => Tions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tions.fromMap(Map<String, dynamic> json) => Tions(
    holdBag: json["hold_bag"] == null ? null : List<DBag>.from(json["hold_bag"].map((x) => DBag.fromMap(x))),
    handBag: json["hand_bag"] == null ? null : List<DBag>.from(json["hand_bag"].map((x) => DBag.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "hold_bag": holdBag == null ? null : List<dynamic>.from(holdBag.map((x) => x.toMap())),
    "hand_bag": handBag == null ? null : List<dynamic>.from(handBag.map((x) => x.toMap())),
  };
}

class DBag {
  DBag({
    this.price,
    this.conditions,
    this.category,
    this.restrictions,
  });

  AdultClass price;
  Conditions conditions;
  String category;
  Restrictions restrictions;

  factory DBag.fromJson(String str) => DBag.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DBag.fromMap(Map<String, dynamic> json) => DBag(
    price: json["price"] == null ? null : AdultClass.fromMap(json["price"]),
    conditions: json["conditions"] == null ? null : Conditions.fromMap(json["conditions"]),
    category: json["category"] == null ? null : json["category"],
    restrictions: json["restrictions"] == null ? null : Restrictions.fromMap(json["restrictions"]),
  );

  Map<String, dynamic> toMap() => {
    "price": price == null ? null : price.toMap(),
    "conditions": conditions == null ? null : conditions.toMap(),
    "category": category == null ? null : category,
    "restrictions": restrictions == null ? null : restrictions.toMap(),
  };
}

class Conditions {
  Conditions({
    this.passengerGroups,
  });

  List<PassengerGroup> passengerGroups;

  factory Conditions.fromJson(String str) => Conditions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Conditions.fromMap(Map<String, dynamic> json) => Conditions(
    passengerGroups: json["passenger_groups"] == null ? null : List<PassengerGroup>.from(json["passenger_groups"].map((x) => passengerGroupValues.map[x])),
  );

  Map<String, dynamic> toMap() => {
    "passenger_groups": passengerGroups == null ? null : List<dynamic>.from(passengerGroups.map((x) => passengerGroupValues.reverse[x])),
  };
}

enum PassengerGroup { ADULT, CHILD, INFANT }

final passengerGroupValues = EnumValues({
  "adult": PassengerGroup.ADULT,
  "child": PassengerGroup.CHILD,
  "infant": PassengerGroup.INFANT
});

class AdultClass {
  AdultClass({
    this.currency,
    this.amount,
    this.base,
    this.service,
    this.serviceFlat,
    this.merchant,
  });

  Currency currency;
  String amount;
  String base;
  String service;
  String serviceFlat;
  String merchant;

  factory AdultClass.fromJson(String str) => AdultClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdultClass.fromMap(Map<String, dynamic> json) => AdultClass(
    currency: json["currency"] == null ? null : currencyValues.map[json["currency"]],
    amount: json["amount"] == null ? null : json["amount"],
    base: json["base"] == null ? null : json["base"],
    service: json["service"] == null ? null : json["service"],
    serviceFlat: json["service_flat"] == null ? null : json["service_flat"],
    merchant: json["merchant"] == null ? null : json["merchant"],
  );

  Map<String, dynamic> toMap() => {
    "currency": currency == null ? null : currencyValues.reverse[currency],
    "amount": amount == null ? null : amount,
    "base": base == null ? null : base,
    "service": service == null ? null : service,
    "service_flat": serviceFlat == null ? null : serviceFlat,
    "merchant": merchant == null ? null : merchant,
  };
}

enum Currency { EUR }

final currencyValues = EnumValues({
  "EUR": Currency.EUR
});

class Restrictions {
  Restrictions({
    this.dimensionsSum,
    this.weight,
    this.length,
    this.height,
    this.width,
  });

  dynamic dimensionsSum;
  dynamic weight;
  dynamic length;
  dynamic height;
  dynamic width;

  factory Restrictions.fromJson(String str) => Restrictions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Restrictions.fromMap(Map<String, dynamic> json) => Restrictions(
    dimensionsSum: json["dimensions_sum"] == null ? null : json["dimensions_sum"],
    weight: json["weight"] == null ? null : json["weight"],
    length: json["length"] == null ? null : json["length"],
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
  );

  Map<String, dynamic> toMap() => {
    "dimensions_sum": dimensionsSum == null ? null : dimensionsSum,
    "weight": weight == null ? null : weight,
    "length": length == null ? null : length,
    "height": height == null ? null : height,
    "width": width == null ? null : width,
  };
}

class BagsRestrictions {
  BagsRestrictions();

  factory BagsRestrictions.fromJson(String str) => BagsRestrictions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BagsRestrictions.fromMap(Map<String, dynamic> json) => BagsRestrictions(
  );

  Map<String, dynamic> toMap() => {
  };
}

class BagsFeeSplit {
  BagsFeeSplit({
    this.base,
    this.service,
    this.amount,
    this.currency,
  });

  dynamic base;
  dynamic service;
  dynamic amount;
  Currency currency;

  factory BagsFeeSplit.fromJson(String str) => BagsFeeSplit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BagsFeeSplit.fromMap(Map<String, dynamic> json) => BagsFeeSplit(
    base: json["base"] == null ? null : json["base"],
    service: json["service"] == null ? null : json["service"],
    amount: json["amount"] == null ? null : json["amount"],
    currency: json["currency"] == null ? null : currencyValues.map[json["currency"]],
  );

  Map<String, dynamic> toMap() => {
    "base": base == null ? null : base,
    "service": service == null ? null : service,
    "amount": amount == null ? null : amount,
    "currency": currency == null ? null : currencyValues.reverse[currency],
  };
}

class BagsPrice {
  BagsPrice({
    this.the1,
  });

  dynamic the1;

  factory BagsPrice.fromJson(String str) => BagsPrice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BagsPrice.fromMap(Map<String, dynamic> json) => BagsPrice(
    the1: json["1"] == null ? null : json["1"],
  );

  Map<String, dynamic> toMap() => {
    "1": the1 == null ? null : the1,
  };
}

class BagsPriceSplit {
  BagsPriceSplit({
    this.the1,
    this.abp,
  });

  AdultClass the1;
  double abp;

  factory BagsPriceSplit.fromJson(String str) => BagsPriceSplit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BagsPriceSplit.fromMap(Map<String, dynamic> json) => BagsPriceSplit(
    the1: json["1"] == null ? null : AdultClass.fromMap(json["1"]),
    abp: json["_abp"] == null ? null : json["_abp"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "1": the1 == null ? null : the1.toMap(),
    "_abp": abp == null ? null : abp,
  };
}

class DocumentOptions {
  DocumentOptions({
    this.documentNeed,
    this.checkinDate,
    this.airportCheckinPrice,
  });

  dynamic documentNeed;
  dynamic checkinDate;
  dynamic airportCheckinPrice;

  factory DocumentOptions.fromJson(String str) => DocumentOptions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DocumentOptions.fromMap(Map<String, dynamic> json) => DocumentOptions(
    documentNeed: json["document_need"] == null ? null : json["document_need"],
    checkinDate: json["checkin_date"] == null ? null : json["checkin_date"],
    airportCheckinPrice: json["airport_checkin_price"] == null ? null : json["airport_checkin_price"],
  );

  Map<String, dynamic> toMap() => {
    "document_need": documentNeed == null ? null : documentNeed,
    "checkin_date": checkinDate == null ? null : checkinDate,
    "airport_checkin_price": airportCheckinPrice == null ? null : airportCheckinPrice,
  };
}

class Flight {
  Flight({
    this.id,
    this.combinationTripId,
    this.originalTripId,
    this.dst,
    this.src,
    this.flightNo,
    this.airline,
    this.operatingAirline,
    this.source,
    this.scrapingStart,
    this.extras,
    this.passengersFlightCheck,
    this.price,
    this.eur,
    this.foundOn,
    this.invalid,
    this.timestamp,
    this.refreshed,
    this.refreshTtl,
    this.refreshPeriod,
    this.fareBasis,
    this.fareCategory,
    this.fareRestriction,
    this.fareClass,
    this.baggageFare,
    this.isCabinBagsWithPriorityBoarding,
    this.sourceName,
    this.sourceUrl,
    this.checkin,
    this.srcCountry,
    this.dstCountry,
    this.srcStation,
    this.dstStation,
    this.infantsConditions,
    this.eurInfants,
    this.eurChildren,
    this.maxPassengersForPrice,
    this.srcName,
    this.dstName,
    this.vehicle,
    this.flightReturn,
    this.guarantee,
    this.guaranteeDisclaimer,
    this.bagsRecheckRequired,
    this.bagsRecheckDisclaimer,
    this.segmentPricing,
    this.localArrival,
    this.utcArrival,
    this.localDeparture,
    this.utcDeparture,
  });

  String id;
  String combinationTripId;
  String originalTripId;
  String dst;
  String src;
  String flightNo;
  Airline airline;
  OperatingAirline operatingAirline;
  String source;
  dynamic scrapingStart;
  String extras;
  PassengersFlightCheck passengersFlightCheck;
  double price;
  double eur;
  String foundOn;
  dynamic invalid;
  DateTime timestamp;
  DateTime refreshed;
  dynamic refreshTtl;
  dynamic refreshPeriod;
  String fareBasis;
  String fareCategory;
  dynamic fareRestriction;
  String fareClass;
  String baggageFare;
  dynamic isCabinBagsWithPriorityBoarding;
  String sourceName;
  String sourceUrl;
  DateTime checkin;
  String srcCountry;
  String dstCountry;
  String srcStation;
  String dstStation;
  InfantsConditions infantsConditions;
  double eurInfants;
  double eurChildren;
  dynamic maxPassengersForPrice;
  String srcName;
  String dstName;
  Vehicle vehicle;
  dynamic flightReturn;
  bool guarantee;
  String guaranteeDisclaimer;
  bool bagsRecheckRequired;
  String bagsRecheckDisclaimer;
  SegmentPricing segmentPricing;
  DateTime localArrival;
  DateTime utcArrival;
  DateTime localDeparture;
  DateTime utcDeparture;

  factory Flight.fromJson(String str) => Flight.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Flight.fromMap(Map<String, dynamic> json) => Flight(
    id: json["id"] == null ? null : json["id"],
    combinationTripId: json["combination_trip_id"] == null ? null : json["combination_trip_id"],
    originalTripId: json["original_trip_id"] == null ? null : json["original_trip_id"],
    dst: json["dst"] == null ? null : json["dst"],
    src: json["src"] == null ? null : json["src"],
    flightNo: json["flight_no"] == null ? null : json["flight_no"],
    airline: json["airline"] == null ? null : Airline.fromMap(json["airline"]),
    operatingAirline: json["operating_airline"] == null ? null : OperatingAirline.fromMap(json["operating_airline"]),
    source: json["source"] == null ? null : json["source"],
    scrapingStart: json["scraping_start"] == null ? null : json["scraping_start"],
    extras: json["extras"] == null ? null : json["extras"],
    passengersFlightCheck: json["passengers_flight_check"] == null ? null : PassengersFlightCheck.fromMap(json["passengers_flight_check"]),
    price: json["price"] == null ? null : json["price"].toDouble(),
    eur: json["eur"] == null ? null : json["eur"].toDouble(),
    foundOn: json["found_on"] == null ? null : json["found_on"],
    invalid: json["invalid"] == null ? null : json["invalid"],
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    refreshed: json["refreshed"] == null ? null : DateTime.parse(json["refreshed"]),
    refreshTtl: json["refresh_ttl"] == null ? null : json["refresh_ttl"],
    refreshPeriod: json["refresh_period"] == null ? null : json["refresh_period"],
    fareBasis: json["fare_basis"] == null ? null : json["fare_basis"],
    fareCategory: json["fare_category"] == null ? null : json["fare_category"],
    fareRestriction: json["fare_restriction"],
    fareClass: json["fare_class"] == null ? null : json["fare_class"],
    baggageFare: json["baggage_fare"] == null ? null : json["baggage_fare"],
    isCabinBagsWithPriorityBoarding: json["is_cabin_bags_with_priority_boarding"],
    sourceName: json["source_name"] == null ? null : json["source_name"],
    sourceUrl: json["source_url"] == null ? null : json["source_url"],
    checkin: json["checkin"] == null ? null : DateTime.parse(json["checkin"]),
    srcCountry: json["src_country"] == null ? null : json["src_country"],
    dstCountry: json["dst_country"] == null ? null : json["dst_country"],
    srcStation: json["src_station"] == null ? null : json["src_station"],
    dstStation: json["dst_station"] == null ? null : json["dst_station"],
    infantsConditions: json["infants_conditions"] == null ? null : InfantsConditions.fromMap(json["infants_conditions"]),
    eurInfants: json["eur_infants"] == null ? null : json["eur_infants"].toDouble(),
    eurChildren: json["eur_children"] == null ? null : json["eur_children"].toDouble(),
    maxPassengersForPrice: json["max_passengers_for_price"] == null ? null : json["max_passengers_for_price"],
    srcName: json["src_name"] == null ? null : json["src_name"],
    dstName: json["dst_name"] == null ? null : json["dst_name"],
    vehicle: json["vehicle"] == null ? null : Vehicle.fromMap(json["vehicle"]),
    flightReturn: json["return"] == null ? null : json["return"],
    guarantee: json["guarantee"] == null ? null : json["guarantee"],
    guaranteeDisclaimer: json["guarantee_disclaimer"] == null ? null : json["guarantee_disclaimer"],
    bagsRecheckRequired: json["bags_recheck_required"] == null ? null : json["bags_recheck_required"],
    bagsRecheckDisclaimer: json["bags_recheck_disclaimer"] == null ? null : json["bags_recheck_disclaimer"],
    segmentPricing: json["segment_pricing"] == null ? null : SegmentPricing.fromMap(json["segment_pricing"]),
    localArrival: json["local_arrival"] == null ? null : DateTime.parse(json["local_arrival"]),
    utcArrival: json["utc_arrival"] == null ? null : DateTime.parse(json["utc_arrival"]),
    localDeparture: json["local_departure"] == null ? null : DateTime.parse(json["local_departure"]),
    utcDeparture: json["utc_departure"] == null ? null : DateTime.parse(json["utc_departure"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "combination_trip_id": combinationTripId == null ? null : combinationTripId,
    "original_trip_id": originalTripId == null ? null : originalTripId,
    "dst": dst == null ? null : dst,
    "src": src == null ? null : src,
    "flight_no": flightNo == null ? null : flightNo,
    "airline": airline == null ? null : airline.toMap(),
    "operating_airline": operatingAirline == null ? null : operatingAirline.toMap(),
    "source": source == null ? null : source,
    "scraping_start": scrapingStart == null ? null : scrapingStart,
    "extras": extras == null ? null : extras,
    "passengers_flight_check": passengersFlightCheck == null ? null : passengersFlightCheck.toMap(),
    "price": price == null ? null : price,
    "eur": eur == null ? null : eur,
    "found_on": foundOn == null ? null : foundOn,
    "invalid": invalid == null ? null : invalid,
    "timestamp": timestamp == null ? null : timestamp.toIso8601String(),
    "refreshed": refreshed == null ? null : refreshed.toIso8601String(),
    "refresh_ttl": refreshTtl == null ? null : refreshTtl,
    "refresh_period": refreshPeriod == null ? null : refreshPeriod,
    "fare_basis": fareBasis == null ? null : fareBasis,
    "fare_category": fareCategory == null ? null : fareCategory,
    "fare_restriction": fareRestriction,
    "fare_class": fareClass == null ? null : fareClass,
    "baggage_fare": baggageFare == null ? null : baggageFare,
    "is_cabin_bags_with_priority_boarding": isCabinBagsWithPriorityBoarding,
    "source_name": sourceName == null ? null : sourceName,
    "source_url": sourceUrl == null ? null : sourceUrl,
    "checkin": checkin == null ? null : checkin.toIso8601String(),
    "src_country": srcCountry == null ? null : srcCountry,
    "dst_country": dstCountry == null ? null : dstCountry,
    "src_station": srcStation == null ? null : srcStation,
    "dst_station": dstStation == null ? null : dstStation,
    "infants_conditions": infantsConditions == null ? null : infantsConditions.toMap(),
    "eur_infants": eurInfants == null ? null : eurInfants,
    "eur_children": eurChildren == null ? null : eurChildren,
    "max_passengers_for_price": maxPassengersForPrice == null ? null : maxPassengersForPrice,
    "src_name": srcName == null ? null : srcName,
    "dst_name": dstName == null ? null : dstName,
    "vehicle": vehicle == null ? null : vehicle.toMap(),
    "return": flightReturn == null ? null : flightReturn,
    "guarantee": guarantee == null ? null : guarantee,
    "guarantee_disclaimer": guaranteeDisclaimer == null ? null : guaranteeDisclaimer,
    "bags_recheck_required": bagsRecheckRequired == null ? null : bagsRecheckRequired,
    "bags_recheck_disclaimer": bagsRecheckDisclaimer == null ? null : bagsRecheckDisclaimer,
    "segment_pricing": segmentPricing == null ? null : segmentPricing.toMap(),
    "local_arrival": localArrival == null ? null : localArrival.toIso8601String(),
    "utc_arrival": utcArrival == null ? null : utcArrival.toIso8601String(),
    "local_departure": localDeparture == null ? null : localDeparture.toIso8601String(),
    "utc_departure": utcDeparture == null ? null : utcDeparture.toIso8601String(),
  };
}

class Airline {
  Airline({
    this.id,
    this.code,
    this.iataCode,
    this.icaoCode,
    this.codePublic,
    this.airlineName,
    this.alliance,
    this.url,
    this.checkin,
    this.closeBookingHours,
    this.bookingDocNeeded,
    this.airportCheckin,
    this.passengersInSearch,
    this.doingOnlineCheckin,
    this.maximumPassengers,
    this.grade,
    this.virtualCardReq,
    this.country,
    this.carrierType,
    this.parentCarrier,
    this.checkinClosure,
    this.shorterStopoversAllowed,
    this.deprecated,
    this.bookFee,
    this.feeAirline,
    this.searchPriority,
    this.feeInstead,
    this.feePercent,
    this.flightChangeFee,
    this.thresholdChild,
    this.thresholdTeen,
    this.thresholdAdult,
    this.feesPerSource,
    this.affilUrl,
    this.temporaryDisabled,
    this.nonActiveReason,
    this.lcc,
    this.active,
    this.iatacode,
    this.isPassengerCardholder,
    this.isPrivateFaresAllowed,
    this.luggageOnlyDuringCheckinAirlines,
    this.luggageOnlyOnWeb,
    this.mmbLink,
    this.paymentCardCopyEticketRequirement,
    this.skipSubairlineMerge,
    this.name,
    this.iata,
    this.handLength,
    this.handWidth,
    this.handHeight,
    this.handWeight,
    this.holdWeight,
    this.holdLength,
    this.holdWidth,
    this.holdHeight,
    this.hand2Length,
    this.hand2Width,
    this.hand2Height,
    this.hand2Weight,
    this.hand2Note,
    this.handNote,
    this.holdNote,
  });

  dynamic id;
  String code;
  String iataCode;
  String icaoCode;
  String codePublic;
  String airlineName;
  dynamic alliance;
  String url;
  dynamic checkin;
  dynamic closeBookingHours;
  dynamic bookingDocNeeded;
  dynamic airportCheckin;
  dynamic passengersInSearch;
  dynamic doingOnlineCheckin;
  dynamic maximumPassengers;
  String grade;
  bool virtualCardReq;
  String country;
  String carrierType;
  dynamic parentCarrier;
  dynamic checkinClosure;
  dynamic shorterStopoversAllowed;
  bool deprecated;
  dynamic bookFee;
  dynamic feeAirline;
  dynamic searchPriority;
  dynamic feeInstead;
  dynamic feePercent;
  dynamic flightChangeFee;
  String thresholdChild;
  dynamic thresholdTeen;
  String thresholdAdult;
  BagsRestrictions feesPerSource;
  dynamic affilUrl;
  dynamic temporaryDisabled;
  dynamic nonActiveReason;
  dynamic lcc;
  dynamic active;
  String iatacode;
  dynamic isPassengerCardholder;
  dynamic isPrivateFaresAllowed;
  dynamic luggageOnlyDuringCheckinAirlines;
  dynamic luggageOnlyOnWeb;
  String mmbLink;
  bool paymentCardCopyEticketRequirement;
  dynamic skipSubairlineMerge;
  String name;
  String iata;
  dynamic handLength;
  dynamic handWidth;
  dynamic handHeight;
  dynamic handWeight;
  dynamic holdWeight;
  dynamic holdLength;
  dynamic holdWidth;
  dynamic holdHeight;
  dynamic hand2Length;
  dynamic hand2Width;
  dynamic hand2Height;
  dynamic hand2Weight;
  String hand2Note;
  String handNote;
  String holdNote;

  factory Airline.fromJson(String str) => Airline.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Airline.fromMap(Map<String, dynamic> json) => Airline(
    id: json["id"] == null ? null : json["id"],
    code: json["code"] == null ? null : json["code"],
    iataCode: json["iata_code"] == null ? null : json["iata_code"],
    icaoCode: json["icao_code"] == null ? null : json["icao_code"],
    codePublic: json["code_public"] == null ? null : json["code_public"],
    airlineName: json["name"] == null ? null : json["name"],
    alliance: json["alliance"],
    url: json["url"] == null ? null : json["url"],
    checkin: json["checkin"] == null ? null : json["checkin"],
    closeBookingHours: json["close_booking_hours"] == null ? null : json["close_booking_hours"],
    bookingDocNeeded: json["booking_doc_needed"] == null ? null : json["booking_doc_needed"],
    airportCheckin: json["airport_checkin"] == null ? null : json["airport_checkin"],
    passengersInSearch: json["passengers_in_search"] == null ? null : json["passengers_in_search"],
    doingOnlineCheckin: json["doing_online_checkin"] == null ? null : json["doing_online_checkin"],
    maximumPassengers: json["maximum_passengers"] == null ? null : json["maximum_passengers"],
    grade: json["grade"] == null ? null : json["grade"],
    virtualCardReq: json["virtual_card_req"] == null ? null : json["virtual_card_req"],
    country: json["country"] == null ? null : json["country"],
    carrierType: json["carrier_type"] == null ? null : json["carrier_type"],
    parentCarrier: json["parent_carrier"],
    checkinClosure: json["checkin_closure"] == null ? null : json["checkin_closure"],
    shorterStopoversAllowed: json["shorter_stopovers_allowed"] == null ? null : json["shorter_stopovers_allowed"],
    deprecated: json["deprecated"] == null ? null : json["deprecated"],
    bookFee: json["book_fee"] == null ? null : json["book_fee"],
    feeAirline: json["fee_airline"] == null ? null : json["fee_airline"],
    searchPriority: json["search_priority"],
    feeInstead: json["fee_instead"] == null ? null : json["fee_instead"],
    feePercent: json["fee_percent"] == null ? null : json["fee_percent"],
    flightChangeFee: json["flight_change_fee"] == null ? null : json["flight_change_fee"],
    thresholdChild: json["threshold_child"] == null ? null : json["threshold_child"],
    thresholdTeen: json["threshold_teen"],
    thresholdAdult: json["threshold_adult"] == null ? null : json["threshold_adult"],
    feesPerSource: json["fees_per_source"] == null ? null : BagsRestrictions.fromMap(json["fees_per_source"]),
    affilUrl: json["affil_url"],
    temporaryDisabled: json["temporary_disabled"],
    nonActiveReason: json["non_active_reason"],
    lcc: json["lcc"],
    active: json["active"] == null ? null : json["active"],
    iatacode: json["iatacode"] == null ? null : json["iatacode"],
    isPassengerCardholder: json["is_passenger_cardholder"],
    isPrivateFaresAllowed: json["is_private_fares_allowed"],
    luggageOnlyDuringCheckinAirlines: json["luggage_only_during_checkin_airlines"],
    luggageOnlyOnWeb: json["luggage_only_on_web"],
    mmbLink: json["mmb_link"] == null ? null : json["mmb_link"],
    paymentCardCopyEticketRequirement: json["payment_card_copy_eticket_requirement"] == null ? null : json["payment_card_copy_eticket_requirement"],
    skipSubairlineMerge: json["skip_subairline_merge"],
    name: json["Name"] == null ? null : json["Name"],
    iata: json["iata"] == null ? null : json["iata"],
    handLength: json["hand_length"] == null ? null : json["hand_length"],
    handWidth: json["hand_width"] == null ? null : json["hand_width"],
    handHeight: json["hand_height"] == null ? null : json["hand_height"],
    handWeight: json["hand_weight"] == null ? null : json["hand_weight"],
    holdWeight: json["hold_weight"] == null ? null : json["hold_weight"],
    holdLength: json["hold_length"] == null ? null : json["hold_length"],
    holdWidth: json["hold_width"] == null ? null : json["hold_width"],
    holdHeight: json["hold_height"] == null ? null : json["hold_height"],
    hand2Length: json["hand2_length"],
    hand2Width: json["hand2_width"],
    hand2Height: json["hand2_height"],
    hand2Weight: json["hand2_weight"],
    hand2Note: json["hand2_note"] == null ? null : json["hand2_note"],
    handNote: json["hand_note"] == null ? null : json["hand_note"],
    holdNote: json["hold_note"] == null ? null : json["hold_note"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "code": code == null ? null : code,
    "iata_code": iataCode == null ? null : iataCode,
    "icao_code": icaoCode == null ? null : icaoCode,
    "code_public": codePublic == null ? null : codePublic,
    "name": airlineName == null ? null : airlineName,
    "alliance": alliance,
    "url": url == null ? null : url,
    "checkin": checkin == null ? null : checkin,
    "close_booking_hours": closeBookingHours == null ? null : closeBookingHours,
    "booking_doc_needed": bookingDocNeeded == null ? null : bookingDocNeeded,
    "airport_checkin": airportCheckin == null ? null : airportCheckin,
    "passengers_in_search": passengersInSearch == null ? null : passengersInSearch,
    "doing_online_checkin": doingOnlineCheckin == null ? null : doingOnlineCheckin,
    "maximum_passengers": maximumPassengers == null ? null : maximumPassengers,
    "grade": grade == null ? null : grade,
    "virtual_card_req": virtualCardReq == null ? null : virtualCardReq,
    "country": country == null ? null : country,
    "carrier_type": carrierType == null ? null : carrierType,
    "parent_carrier": parentCarrier,
    "checkin_closure": checkinClosure == null ? null : checkinClosure,
    "shorter_stopovers_allowed": shorterStopoversAllowed == null ? null : shorterStopoversAllowed,
    "deprecated": deprecated == null ? null : deprecated,
    "book_fee": bookFee == null ? null : bookFee,
    "fee_airline": feeAirline == null ? null : feeAirline,
    "search_priority": searchPriority,
    "fee_instead": feeInstead == null ? null : feeInstead,
    "fee_percent": feePercent == null ? null : feePercent,
    "flight_change_fee": flightChangeFee == null ? null : flightChangeFee,
    "threshold_child": thresholdChild == null ? null : thresholdChild,
    "threshold_teen": thresholdTeen,
    "threshold_adult": thresholdAdult == null ? null : thresholdAdult,
    "fees_per_source": feesPerSource == null ? null : feesPerSource.toMap(),
    "affil_url": affilUrl,
    "temporary_disabled": temporaryDisabled,
    "non_active_reason": nonActiveReason,
    "lcc": lcc,
    "active": active == null ? null : active,
    "iatacode": iatacode == null ? null : iatacode,
    "is_passenger_cardholder": isPassengerCardholder,
    "is_private_fares_allowed": isPrivateFaresAllowed,
    "luggage_only_during_checkin_airlines": luggageOnlyDuringCheckinAirlines,
    "luggage_only_on_web": luggageOnlyOnWeb,
    "mmb_link": mmbLink == null ? null : mmbLink,
    "payment_card_copy_eticket_requirement": paymentCardCopyEticketRequirement == null ? null : paymentCardCopyEticketRequirement,
    "skip_subairline_merge": skipSubairlineMerge,
    "Name": name == null ? null : name,
    "iata": iata == null ? null : iata,
    "hand_length": handLength == null ? null : handLength,
    "hand_width": handWidth == null ? null : handWidth,
    "hand_height": handHeight == null ? null : handHeight,
    "hand_weight": handWeight == null ? null : handWeight,
    "hold_weight": holdWeight == null ? null : holdWeight,
    "hold_length": holdLength == null ? null : holdLength,
    "hold_width": holdWidth == null ? null : holdWidth,
    "hold_height": holdHeight == null ? null : holdHeight,
    "hand2_length": hand2Length,
    "hand2_width": hand2Width,
    "hand2_height": hand2Height,
    "hand2_weight": hand2Weight,
    "hand2_note": hand2Note == null ? null : hand2Note,
    "hand_note": handNote == null ? null : handNote,
    "hold_note": holdNote == null ? null : holdNote,
  };
}

class InfantsConditions {
  InfantsConditions({
    this.trolley,
    this.handWeight,
  });

  bool trolley;
  dynamic handWeight;

  factory InfantsConditions.fromJson(String str) => InfantsConditions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfantsConditions.fromMap(Map<String, dynamic> json) => InfantsConditions(
    trolley: json["trolley"] == null ? null : json["trolley"],
    handWeight: json["hand_weight"] == null ? null : json["hand_weight"],
  );

  Map<String, dynamic> toMap() => {
    "trolley": trolley == null ? null : trolley,
    "hand_weight": handWeight == null ? null : handWeight,
  };
}

class OperatingAirline {
  OperatingAirline({
    this.iata,
    this.name,
  });

  String iata;
  String name;

  factory OperatingAirline.fromJson(String str) => OperatingAirline.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OperatingAirline.fromMap(Map<String, dynamic> json) => OperatingAirline(
    iata: json["iata"] == null ? null : json["iata"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "iata": iata == null ? null : iata,
    "name": name == null ? null : name,
  };
}

class PassengersFlightCheck {
  PassengersFlightCheck({
    this.the1,
  });

  PassengersFlightCheck1 the1;

  factory PassengersFlightCheck.fromJson(String str) => PassengersFlightCheck.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PassengersFlightCheck.fromMap(Map<String, dynamic> json) => PassengersFlightCheck(
    the1: json["1"] == null ? null : PassengersFlightCheck1.fromMap(json["1"]),
  );

  Map<String, dynamic> toMap() => {
    "1": the1 == null ? null : the1.toMap(),
  };
}

class PassengersFlightCheck1 {
  PassengersFlightCheck1({
    this.eur,
    this.invalid,
    this.lastChecked,
  });

  double eur;
  bool invalid;
  dynamic lastChecked;

  factory PassengersFlightCheck1.fromJson(String str) => PassengersFlightCheck1.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PassengersFlightCheck1.fromMap(Map<String, dynamic> json) => PassengersFlightCheck1(
    eur: json["eur"] == null ? null : json["eur"].toDouble(),
    invalid: json["invalid"] == null ? null : json["invalid"],
    lastChecked: json["last_checked"] == null ? null : json["last_checked"],
  );

  Map<String, dynamic> toMap() => {
    "eur": eur == null ? null : eur,
    "invalid": invalid == null ? null : invalid,
    "last_checked": lastChecked == null ? null : lastChecked,
  };
}

class SegmentPricing {
  SegmentPricing({
    this.adult,
    this.child,
    this.infant,
  });

  AdultClass adult;
  AdultClass child;
  AdultClass infant;

  factory SegmentPricing.fromJson(String str) => SegmentPricing.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SegmentPricing.fromMap(Map<String, dynamic> json) => SegmentPricing(
    adult: json["adult"] == null ? null : AdultClass.fromMap(json["adult"]),
    child: json["child"] == null ? null : AdultClass.fromMap(json["child"]),
    infant: json["infant"] == null ? null : AdultClass.fromMap(json["infant"]),
  );

  Map<String, dynamic> toMap() => {
    "adult": adult == null ? null : adult.toMap(),
    "child": child == null ? null : child.toMap(),
    "infant": infant == null ? null : infant.toMap(),
  };
}

class Vehicle {
  Vehicle({
    this.type,
  });

  String type;

  factory Vehicle.fromJson(String str) => Vehicle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vehicle.fromMap(Map<String, dynamic> json) => Vehicle(
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toMap() => {
    "type": type == null ? null : type,
  };
}

class Option {
  Option({
    this.key,
    this.value,
  });

  String key;
  String value;

  factory Option.fromJson(String str) => Option.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Option.fromMap(Map<String, dynamic> json) => Option(
    key: json["key"] == null ? null : json["key"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toMap() => {
    "key": key == null ? null : key,
    "value": value == null ? null : value,
  };
}

class Passenger {
  Passenger({
    this.title,
    this.name,
    this.surname,
    this.cardno,
    this.expiration,
    this.nationality,
    this.birthday,
    this.category,
    this.bid,
    this.createdAt,
    this.updatedAt,
    this.pk,
    this.insuranceSent,
    this.checkin,
    this.visa,
    this.issuer,
    this.insuranceType,
    this.insurancePrice,
    this.holdBags,
    this.handBags,
  });

  String title;
  String name;
  String surname;
  String cardno;
  dynamic expiration;
  String nationality;
  DateTime birthday;
  String category;
  dynamic bid;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic pk;
  dynamic insuranceSent;
  dynamic checkin;
  dynamic visa;
  String issuer;
  dynamic insuranceType;
  dynamic insurancePrice;
  dynamic holdBags;
  dynamic handBags;

  factory Passenger.fromJson(String str) => Passenger.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Passenger.fromMap(Map<String, dynamic> json) => Passenger(
    title: json["title"] == null ? null : json["title"],
    name: json["name"] == null ? null : json["name"],
    surname: json["surname"] == null ? null : json["surname"],
    cardno: json["cardno"] == null ? null : json["cardno"],
    expiration: json["expiration"] == null ? null : json["expiration"],
    nationality: json["nationality"] == null ? null : json["nationality"],
    birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
    category: json["category"] == null ? null : json["category"],
    bid: json["bid"] == null ? null : json["bid"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pk: json["pk"] == null ? null : json["pk"],
    insuranceSent: json["insurance_sent"],
    checkin: json["checkin"],
    visa: json["visa"],
    issuer: json["issuer"] == null ? null : json["issuer"],
    insuranceType: json["insurance_type"],
    insurancePrice: json["insurance_price"],
    holdBags: json["hold_bags"] == null ? null : json["hold_bags"],
    handBags: json["hand_bags"] == null ? null : json["hand_bags"],
  );

  Map<String, dynamic> toMap() => {
    "title": title == null ? null : title,
    "name": name == null ? null : name,
    "surname": surname == null ? null : surname,
    "cardno": cardno == null ? null : cardno,
    "expiration": expiration == null ? null : expiration,
    "nationality": nationality == null ? null : nationality,
    "birthday": birthday == null ? null : "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "category": category == null ? null : category,
    "bid": bid == null ? null : bid,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "pk": pk == null ? null : pk,
    "insurance_sent": insuranceSent,
    "checkin": checkin,
    "visa": visa,
    "issuer": issuer == null ? null : issuer,
    "insurance_type": insuranceType,
    "insurance_price": insurancePrice,
    "hold_bags": holdBags == null ? null : holdBags,
    "hand_bags": handBags == null ? null : handBags,
  };
}

class Promocode {
  Promocode({
    this.discount,
    this.used,
  });

  dynamic discount;
  bool used;

  factory Promocode.fromJson(String str) => Promocode.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Promocode.fromMap(Map<String, dynamic> json) => Promocode(
    discount: json["discount"] == null ? null : json["discount"],
    used: json["used"] == null ? null : json["used"],
  );

  Map<String, dynamic> toMap() => {
    "discount": discount == null ? null : discount,
    "used": used == null ? null : used,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
