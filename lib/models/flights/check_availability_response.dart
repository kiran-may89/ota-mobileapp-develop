
import 'dart:convert';
class CheckAvailabilityResponse {
  CheckAvailabilityResponse({
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

  factory CheckAvailabilityResponse.fromRawJson(String str) => CheckAvailabilityResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckAvailabilityResponse.fromJson(Map<String, dynamic> json) => CheckAvailabilityResponse(
    version: json["version"],
    message: json["message"],
    isError: json["isError"],
    responseException: json["responseException"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "message": message,
    "isError": isError,
    "responseException": responseException,
    "result": result.toJson(),
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
    this.segments,
    this.currency,
    this.conversion,
    this.bookingToken,
    this.adultThreshold,
    this.ageCategoryThresholds,
    this.additionalServices,
    this.baggage,
    this.hasUsSegment,
    this.eurPaymentPrice,
    this.bookFeeWithMarkup,
    this.feeAirlineWithMarkup,
    this.extraFeeWithMarkup,
    this.flightsPriceWithMarkup,
    this.displayRateInfoWithMarkup,
    this.spFeeWithMarkup,
    this.flightRealPriceWithMarkup,
    this.eurPaymentPriceWithMarkup,
  });

  String tpa;
  List<Option> options;
  List<AirlinesMeta> airlinesMeta;
  dynamic serverTime;
  dynamic pnum;
  List<Flights> flights;
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
  double flightsPrice;
  dynamic total;
  double spFee;
  double flightRealPrice;
  dynamic onePassenger;
  dynamic creditsPrice;
  bool origPriceUsage;
  bool priceChange;
  dynamic ticketsPrice;
  dynamic origPrice;
  dynamic insuranceData;
  InsurancePrice insurancePrice;
  dynamic adultsPrice;
  dynamic childrenPrice;
  dynamic infantsPrice;
  Bags bags;
  dynamic bagsFee;
  BagsFeeSplit bagsFeeSplit;
  BagsPrice bagsPrice;
  BagsPriceSplit bagsPriceSplit;
  AdditionalServices handBagsPrice;
  AdditionalServices bagsRestrictions;
  dynamic additionalOrderBaggageFee;
  List<String> luggage;
  List<dynamic> segments;
  Currency currency;
  Conversion conversion;
  String bookingToken;
  dynamic adultThreshold;
  AgeCategoryThresholds ageCategoryThresholds;
  AdditionalServices additionalServices;
  Baggage baggage;
  bool hasUsSegment;
  dynamic eurPaymentPrice;
  dynamic bookFeeWithMarkup;
  dynamic feeAirlineWithMarkup;
  dynamic extraFeeWithMarkup;
  double flightsPriceWithMarkup;
  DisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  double spFeeWithMarkup;
  double flightRealPriceWithMarkup;
  dynamic eurPaymentPriceWithMarkup;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    tpa: json["tpa"],
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    airlinesMeta: List<AirlinesMeta>.from(json["airlinesMeta"].map((x) => AirlinesMeta.fromJson(x))),
    serverTime: json["server_time"],
    pnum: json["pnum"],
    flights: List<Flights>.from(json["flights"].map((x) => Flights.fromJson(x))),
    flightsChecked: json["flights_checked"],
    flightsToCheck: json["flights_to_check"],
    flightsRealChecked: json["flights_real_checked"],
    flightsInvalid: json["flights_invalid"],
    maxPassengers: json["max_passengers"],
    infantsConditions: InfantsConditions.fromJson(json["infants_conditions"]),
    documentOptions: DocumentOptions.fromJson(json["document_options"]),
    visasAgreementRequiered: json["visas_agreement_requiered"],
    transfers: List<dynamic>.from(json["transfers"].map((x) => x)),
    route: List<String>.from(json["route"].map((x) => x)),
    bookFee: json["book_fee"],
    feeAirline: json["fee_airline"],
    extraFee: json["extra_fee"],
    flightsPrice: json["flights_price"].toDouble(),
    total: json["total"],
    spFee: json["sp_fee"].toDouble(),
    flightRealPrice: json["flight_real_price"].toDouble(),
    onePassenger: json["one_passenger"],
    creditsPrice: json["credits_price"],
    origPriceUsage: json["orig_price_usage"],
    priceChange: json["price_change"],
    ticketsPrice: json["tickets_price"],
    origPrice: json["orig_price"],
    insuranceData: json["insurance_data"],
    insurancePrice: InsurancePrice.fromJson(json["insurance_price"]),
    adultsPrice: json["adults_price"],
    childrenPrice: json["children_price"],
    infantsPrice: json["infants_price"],
    bags: Bags.fromJson(json["bags"]),
    bagsFee: json["bags_fee"],
    bagsFeeSplit: BagsFeeSplit.fromJson(json["bags_fee_split"]),
    bagsPrice: BagsPrice.fromJson(json["bags_price"]),
    bagsPriceSplit: BagsPriceSplit.fromJson(json["bags_price_split"]),
    handBagsPrice: AdditionalServices.fromJson(json["hand_bags_price"]),
    bagsRestrictions: AdditionalServices.fromJson(json["bags_restrictions"]),
    additionalOrderBaggageFee: json["additional_order_baggage_fee"],
    luggage: List<String>.from(json["luggage"].map((x) => x == null ? null : x)),
    segments: List<dynamic>.from(json["segments"].map((x) => x)),
    currency: currencyValues.map[json["currency"]],
    conversion: Conversion.fromJson(json["conversion"]),
    bookingToken: json["booking_token"],
    adultThreshold: json["adult_threshold"],
    ageCategoryThresholds: AgeCategoryThresholds.fromJson(json["age_category_thresholds"]),
    additionalServices: AdditionalServices.fromJson(json["additional_services"]),
    baggage: Baggage.fromJson(json["baggage"]),
    hasUsSegment: json["has_us_segment"],
    eurPaymentPrice: json["eur_payment_price"],
    bookFeeWithMarkup: json["book_feeWithMarkup"],
    feeAirlineWithMarkup: json["fee_airlineWithMarkup"],
    extraFeeWithMarkup: json["extra_feeWithMarkup"],
    flightsPriceWithMarkup: json["flights_priceWithMarkup"].toDouble(),
    displayRateInfoWithMarkup: DisplayRateInfoWithMarkup.fromJson(json["displayRateInfoWithMarkup"]),
    spFeeWithMarkup: json["sp_feeWithMarkup"].toDouble(),
    flightRealPriceWithMarkup: json["flight_real_priceWithMarkup"].toDouble(),
    eurPaymentPriceWithMarkup: json["eur_payment_priceWithMarkup"],
  );

  Map<String, dynamic> toJson() => {
    "tpa": tpa,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "airlinesMeta": List<dynamic>.from(airlinesMeta.map((x) => x.toJson())),
    "server_time": serverTime,
    "pnum": pnum,
    "flights": List<dynamic>.from(flights.map((x) => x.toJson())),
    "flights_checked": flightsChecked,
    "flights_to_check": flightsToCheck,
    "flights_real_checked": flightsRealChecked,
    "flights_invalid": flightsInvalid,
    "max_passengers": maxPassengers,
    "infants_conditions": infantsConditions.toJson(),
    "document_options": documentOptions.toJson(),
    "visas_agreement_requiered": visasAgreementRequiered,
    "transfers": List<dynamic>.from(transfers.map((x) => x)),
    "route": List<dynamic>.from(route.map((x) => x)),
    "book_fee": bookFee,
    "fee_airline": feeAirline,
    "extra_fee": extraFee,
    "flights_price": flightsPrice,
    "total": total,
    "sp_fee": spFee,
    "flight_real_price": flightRealPrice,
    "one_passenger": onePassenger,
    "credits_price": creditsPrice,
    "orig_price_usage": origPriceUsage,
    "price_change": priceChange,
    "tickets_price": ticketsPrice,
    "orig_price": origPrice,
    "insurance_data": insuranceData,
    "insurance_price": insurancePrice.toJson(),
    "adults_price": adultsPrice,
    "children_price": childrenPrice,
    "infants_price": infantsPrice,
    "bags": bags.toJson(),
    "bags_fee": bagsFee,
    "bags_fee_split": bagsFeeSplit.toJson(),
    "bags_price": bagsPrice.toJson(),
    "bags_price_split": bagsPriceSplit.toJson(),
    "hand_bags_price": handBagsPrice.toJson(),
    "bags_restrictions": bagsRestrictions.toJson(),
    "additional_order_baggage_fee": additionalOrderBaggageFee,
    "luggage": List<dynamic>.from(luggage.map((x) => x == null ? null : x)),
    "segments": List<dynamic>.from(segments.map((x) => x)),
    "currency": currencyValues.reverse[currency],
    "conversion": conversion.toJson(),
    "booking_token": bookingToken,
    "adult_threshold": adultThreshold,
    "age_category_thresholds": ageCategoryThresholds.toJson(),
    "additional_services": additionalServices.toJson(),
    "baggage": baggage.toJson(),
    "has_us_segment": hasUsSegment,
    "eur_payment_price": eurPaymentPrice,
    "book_feeWithMarkup": bookFeeWithMarkup,
    "fee_airlineWithMarkup": feeAirlineWithMarkup,
    "extra_feeWithMarkup": extraFeeWithMarkup,
    "flights_priceWithMarkup": flightsPriceWithMarkup,
    "displayRateInfoWithMarkup": displayRateInfoWithMarkup.toJson(),
    "sp_feeWithMarkup": spFeeWithMarkup,
    "flight_real_priceWithMarkup": flightRealPriceWithMarkup,
    "eur_payment_priceWithMarkup": eurPaymentPriceWithMarkup,
  };
}

class AdditionalServices {
  AdditionalServices();

  factory AdditionalServices.fromRawJson(String str) => AdditionalServices.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdditionalServices.fromJson(Map<String, dynamic> json) => AdditionalServices(
  );

  Map<String, dynamic> toJson() => {
  };
}

class AgeCategoryThresholds {
  AgeCategoryThresholds({
    this.adult,
    this.child,
  });

  String adult;
  String child;

  factory AgeCategoryThresholds.fromRawJson(String str) => AgeCategoryThresholds.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AgeCategoryThresholds.fromJson(Map<String, dynamic> json) => AgeCategoryThresholds(
    adult: json["adult"],
    child: json["child"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "child": child,
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
  String updatedDate;

  factory AirlinesMeta.fromRawJson(String str) => AirlinesMeta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AirlinesMeta.fromJson(Map<String, dynamic> json) => AirlinesMeta(
    code: json["code"],
    type: json["type"],
    name: json["name"],
    lcc: json["lcc"],
    image32: json["image32"],
    image64: json["image64"],
    image128: json["image128"],
    isDeleted: json["isDeleted"],
    id: json["id"],
    uid: json["uid"],
    createdBy: json["createdBy"],
    createdDate: DateTime.parse(json["createdDate"]),
    updatedBy: json["updatedBy"],
    updatedDate: json["updatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "type": type,
    "name": name,
    "lcc": lcc,
    "image32": image32,
    "image64": image64,
    "image128": image128,
    "isDeleted": isDeleted,
    "id": id,
    "uid": uid,
    "createdBy": createdBy,
    "createdDate": createdDate.toIso8601String(),
    "updatedBy": updatedBy,
    "updatedDate": updatedDate,
  };
}

class Baggage {
  Baggage({
    this.definitions,
    this.combinations,
    this.notices,
  });

  Tions definitions;
  Tions combinations;
  AdditionalServices notices;

  factory Baggage.fromRawJson(String str) => Baggage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Baggage.fromJson(Map<String, dynamic> json) => Baggage(
    definitions: Tions.fromJson(json["definitions"]),
    combinations: Tions.fromJson(json["combinations"]),
    notices: AdditionalServices.fromJson(json["notices"]),
  );

  Map<String, dynamic> toJson() => {
    "definitions": definitions.toJson(),
    "combinations": combinations.toJson(),
    "notices": notices.toJson(),
  };
}

class Tions {
  Tions({
    this.holdBag,
    this.handBag,
  });

  List<DBag> holdBag;
  List<DBag> handBag;

  factory Tions.fromRawJson(String str) => Tions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tions.fromJson(Map<String, dynamic> json) => Tions(
    holdBag: List<DBag>.from(json["hold_bag"].map((x) => DBag.fromJson(x))),
    handBag: List<DBag>.from(json["hand_bag"].map((x) => DBag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hold_bag": List<dynamic>.from(holdBag.map((x) => x.toJson())),
    "hand_bag": List<dynamic>.from(handBag.map((x) => x.toJson())),
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

  factory DBag.fromRawJson(String str) => DBag.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DBag.fromJson(Map<String, dynamic> json) => DBag(
    price: AdultClass.fromJson(json["price"]),
    conditions: Conditions.fromJson(json["conditions"]),
    category: json["category"],
    restrictions: json["restrictions"] == null ? null : Restrictions.fromJson(json["restrictions"]),
  );

  Map<String, dynamic> toJson() => {
    "price": price.toJson(),
    "conditions": conditions.toJson(),
    "category": category,
    "restrictions": restrictions == null ? null : restrictions.toJson(),
  };
}

class Conditions {
  Conditions({
    this.passengerGroups,
  });

  List<PassengerGroup> passengerGroups;

  factory Conditions.fromRawJson(String str) => Conditions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Conditions.fromJson(Map<String, dynamic> json) => Conditions(
    passengerGroups: List<PassengerGroup>.from(json["passenger_groups"].map((x) => passengerGroupValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "passenger_groups": List<dynamic>.from(passengerGroups.map((x) => passengerGroupValues.reverse[x])),
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

  factory AdultClass.fromRawJson(String str) => AdultClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdultClass.fromJson(Map<String, dynamic> json) => AdultClass(
    currency: currencyValues.map[json["currency"]],
    amount: json["amount"],
    base: json["base"],
    service: json["service"],
    serviceFlat: json["service_flat"],
    merchant: json["merchant"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currencyValues.reverse[currency],
    "amount": amount,
    "base": base,
    "service": service,
    "service_flat": serviceFlat,
    "merchant": merchant,
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

  factory Restrictions.fromRawJson(String str) => Restrictions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Restrictions.fromJson(Map<String, dynamic> json) => Restrictions(
    dimensionsSum: json["dimensions_sum"],
    weight: json["weight"],
    length: json["length"],
    height: json["height"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "dimensions_sum": dimensionsSum,
    "weight": weight,
    "length": length,
    "height": height,
    "width": width,
  };
}

class Bags {
  Bags({
    this.isDeprecated,
    this.definitions,
  });

  bool isDeprecated;
  Definitions definitions;

  factory Bags.fromRawJson(String str) => Bags.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bags.fromJson(Map<String, dynamic> json) => Bags(
    isDeprecated: json["_is_deprecated"],
    definitions: Definitions.fromJson(json["definitions"]),
  );

  Map<String, dynamic> toJson() => {
    "_is_deprecated": isDeprecated,
    "definitions": definitions.toJson(),
  };
}

class Definitions {
  Definitions({
    this.cabinBag,
  });

  List<dynamic> cabinBag;

  factory Definitions.fromRawJson(String str) => Definitions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Definitions.fromJson(Map<String, dynamic> json) => Definitions(
    cabinBag: List<dynamic>.from(json["cabin_bag"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "cabin_bag": List<dynamic>.from(cabinBag.map((x) => x)),
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

  factory BagsFeeSplit.fromRawJson(String str) => BagsFeeSplit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BagsFeeSplit.fromJson(Map<String, dynamic> json) => BagsFeeSplit(
    base: json["base"],
    service: json["service"],
    amount: json["amount"],
    currency: currencyValues.map[json["currency"]],
  );

  Map<String, dynamic> toJson() => {
    "base": base,
    "service": service,
    "amount": amount,
    "currency": currencyValues.reverse[currency],
  };
}

class BagsPrice {
  BagsPrice({
    this.the1,
  });

  dynamic the1;

  factory BagsPrice.fromRawJson(String str) => BagsPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BagsPrice.fromJson(Map<String, dynamic> json) => BagsPrice(
    the1: json["1"],
  );

  Map<String, dynamic> toJson() => {
    "1": the1,
  };
}

class BagsPriceSplit {
  BagsPriceSplit({
    this.the1,
    this.abp,
  });

  AdultClass the1;
  double abp;

  factory BagsPriceSplit.fromRawJson(String str) => BagsPriceSplit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BagsPriceSplit.fromJson(Map<String, dynamic> json) => BagsPriceSplit(
    the1: AdultClass.fromJson(json["1"]),
    abp: json["_abp"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "1": the1.toJson(),
    "_abp": abp,
  };
}

class Conversion {
  Conversion({
    this.currency,
    this.amount,
    this.bagsPrice,
    this.additionalOrderBaggageFee,
    this.adultsPrice,
    this.childrenPrice,
    this.infantsPrice,
  });

  Currency currency;
  dynamic amount;
  BagsPrice bagsPrice;
  dynamic additionalOrderBaggageFee;
  dynamic adultsPrice;
  dynamic childrenPrice;
  dynamic infantsPrice;

  factory Conversion.fromRawJson(String str) => Conversion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Conversion.fromJson(Map<String, dynamic> json) => Conversion(
    currency: currencyValues.map[json["currency"]],
    amount: json["amount"],
    bagsPrice: BagsPrice.fromJson(json["bags_price"]),
    additionalOrderBaggageFee: json["additional_order_baggage_fee"],
    adultsPrice: json["adults_price"],
    childrenPrice: json["children_price"],
    infantsPrice: json["infants_price"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currencyValues.reverse[currency],
    "amount": amount,
    "bags_price": bagsPrice.toJson(),
    "additional_order_baggage_fee": additionalOrderBaggageFee,
    "adults_price": adultsPrice,
    "children_price": childrenPrice,
    "infants_price": infantsPrice,
  };
}

class DisplayRateInfoWithMarkup {
  DisplayRateInfoWithMarkup({
    this.totalPriceWithMarkup,
    this.baseRate,
    this.taxAndOtherCharges,
    this.otaTax,
    this.markup,
    this.supplierBaseRate,
    this.supplierTotalCost,
    this.currency,
  });

  double totalPriceWithMarkup;
  double baseRate;
  double taxAndOtherCharges;
  double otaTax;
  double markup;
  double supplierBaseRate;
  double supplierTotalCost;
  String currency;

  factory DisplayRateInfoWithMarkup.fromRawJson(String str) => DisplayRateInfoWithMarkup.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DisplayRateInfoWithMarkup.fromJson(Map<String, dynamic> json) => DisplayRateInfoWithMarkup(
    totalPriceWithMarkup: json["totalPriceWithMarkup"].toDouble(),
    baseRate: json["baseRate"].toDouble(),
    taxAndOtherCharges: json["taxAndOtherCharges"].toDouble(),
    otaTax: json["otaTax"].toDouble(),
    markup: json["markup"].toDouble(),
    supplierBaseRate: json["supplierBaseRate"].toDouble(),
    supplierTotalCost: json["supplierTotalCost"].toDouble(),
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "totalPriceWithMarkup": totalPriceWithMarkup,
    "baseRate": baseRate,
    "taxAndOtherCharges": taxAndOtherCharges,
    "otaTax": otaTax,
    "markup": markup,
    "supplierBaseRate": supplierBaseRate,
    "supplierTotalCost": supplierTotalCost,
    "currency": currency,
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

  factory DocumentOptions.fromRawJson(String str) => DocumentOptions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DocumentOptions.fromJson(Map<String, dynamic> json) => DocumentOptions(
    documentNeed: json["document_need"],
    checkinDate: json["checkin_date"],
    airportCheckinPrice: json["airport_checkin_price"],
  );

  Map<String, dynamic> toJson() => {
    "document_need": documentNeed,
    "checkin_date": checkinDate,
    "airport_checkin_price": airportCheckinPrice,
  };
}

class Flights {
  Flights({
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

  factory Flights.fromRawJson(String str) => Flights.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Flights.fromJson(Map<String, dynamic> json) => Flights(
    id: json["id"],
    combinationTripId: json["combination_trip_id"],
    originalTripId: json["original_trip_id"],
    dst: json["dst"],
    src: json["src"],
    flightNo: json["flight_no"],
    airline: Airline.fromJson(json["airline"]),
    operatingAirline: OperatingAirline.fromJson(json["operating_airline"]),
    source: json["source"],
    scrapingStart: json["scraping_start"],
    extras: json["extras"],
    passengersFlightCheck: PassengersFlightCheck.fromJson(json["passengers_flight_check"]),
    price: json["price"].toDouble(),
    eur: json["eur"].toDouble(),
    foundOn: json["found_on"],
    invalid: json["invalid"],
    timestamp: DateTime.parse(json["timestamp"]),
    refreshed: DateTime.parse(json["refreshed"]),
    refreshTtl: json["refresh_ttl"],
    refreshPeriod: json["refresh_period"],
    fareBasis: json["fare_basis"],
    fareCategory: json["fare_category"],
    fareRestriction: json["fare_restriction"],
    fareClass: json["fare_class"],
    baggageFare: json["baggage_fare"],
    isCabinBagsWithPriorityBoarding: json["is_cabin_bags_with_priority_boarding"],
    sourceName: json["source_name"],
    sourceUrl: json["source_url"],
    checkin: DateTime.parse(json["checkin"]),
    srcCountry: json["src_country"],
    dstCountry: json["dst_country"],
    srcStation: json["src_station"],
    dstStation: json["dst_station"],
    infantsConditions: InfantsConditions.fromJson(json["infants_conditions"]),
    eurInfants: json["eur_infants"].toDouble(),
    eurChildren: json["eur_children"].toDouble(),
    maxPassengersForPrice: json["max_passengers_for_price"],
    srcName: json["src_name"],
    dstName: json["dst_name"],
    vehicle: Vehicle.fromJson(json["vehicle"]),
    flightReturn: json["return"],
    guarantee: json["guarantee"],
    guaranteeDisclaimer: json["guarantee_disclaimer"],
    bagsRecheckRequired: json["bags_recheck_required"],
    bagsRecheckDisclaimer: json["bags_recheck_disclaimer"],
    segmentPricing: SegmentPricing.fromJson(json["segment_pricing"]),
    localArrival: DateTime.parse(json["local_arrival"]),
    utcArrival: DateTime.parse(json["utc_arrival"]),
    localDeparture: DateTime.parse(json["local_departure"]),
    utcDeparture: DateTime.parse(json["utc_departure"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "combination_trip_id": combinationTripId,
    "original_trip_id": originalTripId,
    "dst": dst,
    "src": src,
    "flight_no": flightNo,
    "airline": airline.toJson(),
    "operating_airline": operatingAirline.toJson(),
    "source": source,
    "scraping_start": scrapingStart,
    "extras": extras,
    "passengers_flight_check": passengersFlightCheck.toJson(),
    "price": price,
    "eur": eur,
    "found_on": foundOn,
    "invalid": invalid,
    "timestamp": timestamp.toIso8601String(),
    "refreshed": refreshed.toIso8601String(),
    "refresh_ttl": refreshTtl,
    "refresh_period": refreshPeriod,
    "fare_basis": fareBasis,
    "fare_category": fareCategory,
    "fare_restriction": fareRestriction,
    "fare_class": fareClass,
    "baggage_fare": baggageFare,
    "is_cabin_bags_with_priority_boarding": isCabinBagsWithPriorityBoarding,
    "source_name": sourceName,
    "source_url": sourceUrl,
    "checkin": checkin.toIso8601String(),
    "src_country": srcCountry,
    "dst_country": dstCountry,
    "src_station": srcStation,
    "dst_station": dstStation,
    "infants_conditions": infantsConditions.toJson(),
    "eur_infants": eurInfants,
    "eur_children": eurChildren,
    "max_passengers_for_price": maxPassengersForPrice,
    "src_name": srcName,
    "dst_name": dstName,
    "vehicle": vehicle.toJson(),
    "return": flightReturn,
    "guarantee": guarantee,
    "guarantee_disclaimer": guaranteeDisclaimer,
    "bags_recheck_required": bagsRecheckRequired,
    "bags_recheck_disclaimer": bagsRecheckDisclaimer,
    "segment_pricing": segmentPricing.toJson(),
    "local_arrival": localArrival.toIso8601String(),
    "utc_arrival": utcArrival.toIso8601String(),
    "local_departure": localDeparture.toIso8601String(),
    "utc_departure": utcDeparture.toIso8601String(),
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
  AdditionalServices feesPerSource;
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
  dynamic mmbLink;
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
  String hand2Length;
  String hand2Width;
  String hand2Height;
  String hand2Weight;
  String hand2Note;
  String handNote;
  String holdNote;

  factory Airline.fromRawJson(String str) => Airline.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
    id: json["id"],
    code: json["code"],
    iataCode: json["iata_code"],
    icaoCode: json["icao_code"],
    codePublic: json["code_public"],
    airlineName: json["name"],
    alliance: json["alliance"],
    url: json["url"],
    checkin: json["checkin"],
    closeBookingHours: json["close_booking_hours"],
    bookingDocNeeded: json["booking_doc_needed"],
    airportCheckin: json["airport_checkin"],
    passengersInSearch: json["passengers_in_search"],
    doingOnlineCheckin: json["doing_online_checkin"],
    maximumPassengers: json["maximum_passengers"],
    grade: json["grade"],
    virtualCardReq: json["virtual_card_req"],
    country: json["country"],
    carrierType: json["carrier_type"],
    parentCarrier: json["parent_carrier"],
    checkinClosure: json["checkin_closure"],
    shorterStopoversAllowed: json["shorter_stopovers_allowed"],
    deprecated: json["deprecated"],
    bookFee: json["book_fee"],
    feeAirline: json["fee_airline"],
    searchPriority: json["search_priority"],
    feeInstead: json["fee_instead"],
    feePercent: json["fee_percent"],
    flightChangeFee: json["flight_change_fee"],
    thresholdChild: json["threshold_child"],
    thresholdTeen: json["threshold_teen"],
    thresholdAdult: json["threshold_adult"],
    feesPerSource: AdditionalServices.fromJson(json["fees_per_source"]),
    affilUrl: json["affil_url"],
    temporaryDisabled: json["temporary_disabled"],
    nonActiveReason: json["non_active_reason"],
    lcc: json["lcc"],
    active: json["active"],
    iatacode: json["iatacode"],
    isPassengerCardholder: json["is_passenger_cardholder"],
    isPrivateFaresAllowed: json["is_private_fares_allowed"],
    luggageOnlyDuringCheckinAirlines: json["luggage_only_during_checkin_airlines"],
    luggageOnlyOnWeb: json["luggage_only_on_web"],
    mmbLink: json["mmb_link"],
    paymentCardCopyEticketRequirement: json["payment_card_copy_eticket_requirement"],
    skipSubairlineMerge: json["skip_subairline_merge"],
    name: json["Name"],
    iata: json["iata"],
    handLength: json["hand_length"],
    handWidth: json["hand_width"],
    handHeight: json["hand_height"],
    handWeight: json["hand_weight"],
    holdWeight: json["hold_weight"],
    holdLength: json["hold_length"],
    holdWidth: json["hold_width"],
    holdHeight: json["hold_height"],
    hand2Length: json["hand2_length"],
    hand2Width: json["hand2_width"],
    hand2Height: json["hand2_height"],
    hand2Weight: json["hand2_weight"],
    hand2Note: json["hand2_note"],
    handNote: json["hand_note"],
    holdNote: json["hold_note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "iata_code": iataCode,
    "icao_code": icaoCode,
    "code_public": codePublic,
    "name": airlineName,
    "alliance": alliance,
    "url": url,
    "checkin": checkin,
    "close_booking_hours": closeBookingHours,
    "booking_doc_needed": bookingDocNeeded,
    "airport_checkin": airportCheckin,
    "passengers_in_search": passengersInSearch,
    "doing_online_checkin": doingOnlineCheckin,
    "maximum_passengers": maximumPassengers,
    "grade": grade,
    "virtual_card_req": virtualCardReq,
    "country": country,
    "carrier_type": carrierType,
    "parent_carrier": parentCarrier,
    "checkin_closure": checkinClosure,
    "shorter_stopovers_allowed": shorterStopoversAllowed,
    "deprecated": deprecated,
    "book_fee": bookFee,
    "fee_airline": feeAirline,
    "search_priority": searchPriority,
    "fee_instead": feeInstead,
    "fee_percent": feePercent,
    "flight_change_fee": flightChangeFee,
    "threshold_child": thresholdChild,
    "threshold_teen": thresholdTeen,
    "threshold_adult": thresholdAdult,
    "fees_per_source": feesPerSource.toJson(),
    "affil_url": affilUrl,
    "temporary_disabled": temporaryDisabled,
    "non_active_reason": nonActiveReason,
    "lcc": lcc,
    "active": active,
    "iatacode": iatacode,
    "is_passenger_cardholder": isPassengerCardholder,
    "is_private_fares_allowed": isPrivateFaresAllowed,
    "luggage_only_during_checkin_airlines": luggageOnlyDuringCheckinAirlines,
    "luggage_only_on_web": luggageOnlyOnWeb,
    "mmb_link": mmbLink,
    "payment_card_copy_eticket_requirement": paymentCardCopyEticketRequirement,
    "skip_subairline_merge": skipSubairlineMerge,
    "Name": name,
    "iata": iata,
    "hand_length": handLength,
    "hand_width": handWidth,
    "hand_height": handHeight,
    "hand_weight": handWeight,
    "hold_weight": holdWeight,
    "hold_length": holdLength,
    "hold_width": holdWidth,
    "hold_height": holdHeight,
    "hand2_length": hand2Length,
    "hand2_width": hand2Width,
    "hand2_height": hand2Height,
    "hand2_weight": hand2Weight,
    "hand2_note": hand2Note,
    "hand_note": handNote,
    "hold_note": holdNote,
  };
}

class InfantsConditions {
  InfantsConditions({
    this.trolley,
    this.handWeight,
  });

  bool trolley;
  dynamic handWeight;

  factory InfantsConditions.fromRawJson(String str) => InfantsConditions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InfantsConditions.fromJson(Map<String, dynamic> json) => InfantsConditions(
    trolley: json["trolley"],
    handWeight: json["hand_weight"],
  );

  Map<String, dynamic> toJson() => {
    "trolley": trolley,
    "hand_weight": handWeight,
  };
}

class OperatingAirline {
  OperatingAirline({
    this.iata,
    this.name,
  });

  String iata;
  String name;

  factory OperatingAirline.fromRawJson(String str) => OperatingAirline.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OperatingAirline.fromJson(Map<String, dynamic> json) => OperatingAirline(
    iata: json["iata"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "iata": iata,
    "name": name,
  };
}

class PassengersFlightCheck {
  PassengersFlightCheck({
    this.the1,
  });

  PassengersFlightCheck1 the1;

  factory PassengersFlightCheck.fromRawJson(String str) => PassengersFlightCheck.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PassengersFlightCheck.fromJson(Map<String, dynamic> json) => PassengersFlightCheck(
    the1: PassengersFlightCheck1.fromJson(json["1"]),
  );

  Map<String, dynamic> toJson() => {
    "1": the1.toJson(),
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

  factory PassengersFlightCheck1.fromRawJson(String str) => PassengersFlightCheck1.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PassengersFlightCheck1.fromJson(Map<String, dynamic> json) => PassengersFlightCheck1(
    eur: json["eur"].toDouble(),
    invalid: json["invalid"],
    lastChecked: json["last_checked"],
  );

  Map<String, dynamic> toJson() => {
    "eur": eur,
    "invalid": invalid,
    "last_checked": lastChecked,
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

  factory SegmentPricing.fromRawJson(String str) => SegmentPricing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SegmentPricing.fromJson(Map<String, dynamic> json) => SegmentPricing(
    adult: AdultClass.fromJson(json["adult"]),
    child: AdultClass.fromJson(json["child"]),
    infant: AdultClass.fromJson(json["infant"]),
  );

  Map<String, dynamic> toJson() => {
    "adult": adult.toJson(),
    "child": child.toJson(),
    "infant": infant.toJson(),
  };
}

class Vehicle {
  Vehicle({
    this.type,
  });

  String type;

  factory Vehicle.fromRawJson(String str) => Vehicle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
  };
}

class InsurancePrice {
  InsurancePrice({
    this.travelBasic,
    this.travelPlus,
    this.skysilver,
    this.skygold,
  });

  double travelBasic;
  double travelPlus;
  dynamic skysilver;
  dynamic skygold;

  factory InsurancePrice.fromRawJson(String str) => InsurancePrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InsurancePrice.fromJson(Map<String, dynamic> json) => InsurancePrice(
    travelBasic: json["travel_basic"].toDouble(),
    travelPlus: json["travel_plus"].toDouble(),
    skysilver: json["skysilver"],
    skygold: json["skygold"],
  );

  Map<String, dynamic> toJson() => {
    "travel_basic": travelBasic,
    "travel_plus": travelPlus,
    "skysilver": skysilver,
    "skygold": skygold,
  };
}

class Option {
  Option({
    this.key,
    this.value,
  });

  String key;
  String value;

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
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