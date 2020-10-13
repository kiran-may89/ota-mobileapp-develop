// To parse this JSON data, do
//
//     final flightBookingResponse = flightBookingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:ota/models/flights/check_availability_response.dart';


class FlightBookingRes {
  FlightBookingRes({
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

  factory FlightBookingRes.fromRawJson(String str) => FlightBookingRes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlightBookingRes.fromJson(Map<String, dynamic> json) => FlightBookingRes(
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
    this.id,
    this.uid,
    this.bookingId,
    this.userId,
    this.userType,
    this.tenantId,
    this.correlationId,
    this.totalAmount,
    this.totalAmountMarkup,
    this.markup,
    this.otaTax,
    this.totalRefundAmount,
    this.totalCancellationCharge,
    this.paymentMode,
    this.paymentTransactionId,
    this.ibanNumber,
    this.status,
    this.visaRequestId,
    this.visaLink,
    this.preVisaReference,
    this.isDeleted,
    this.bookings,
    this.contact,
    this.errors,
    this.paymentDetails,
    this.visaStatus,
  });

  int id;
  String uid;
  String bookingId;
  String userId;
  String userType;
  String tenantId;
  String correlationId;
  double totalAmount;
  double totalAmountMarkup;
  double markup;
  double otaTax;
  dynamic totalRefundAmount;
  dynamic totalCancellationCharge;
  String paymentMode;
  String paymentTransactionId;
  dynamic ibanNumber;
  String status;
  dynamic visaRequestId;
  dynamic visaLink;
  dynamic preVisaReference;
  bool isDeleted;
  List<Booking> bookings;
  Contact contact;
  Errors errors;
  dynamic paymentDetails;
  dynamic visaStatus;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    uid: json["uid"],
    bookingId: json["bookingId"],
    userId: json["userId"],
    userType: json["userType"],
    tenantId: json["tenantId"],
    correlationId: json["correlationId"],
    totalAmount: json["totalAmount"].toDouble(),
    totalAmountMarkup: json["totalAmountMarkup"].toDouble(),
    markup: json["markup"].toDouble(),
    otaTax: json["otaTax"].toDouble(),
    totalRefundAmount: json["totalRefundAmount"],
    totalCancellationCharge: json["totalCancellationCharge"],
    paymentMode: json["paymentMode"],
    paymentTransactionId: json["paymentTransactionId"],
    ibanNumber: json["ibanNumber"],
    status: json["status"],
    visaRequestId: json["visaRequestId"],
    visaLink: json["visaLink"],
    preVisaReference: json["preVisaReference"],
    isDeleted: json["isDeleted"],
    bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromJson(x))),
    contact: Contact.fromJson(json["contact"]),
    errors: Errors.fromJson(json["errors"]),
    paymentDetails: json["paymentDetails"],
    visaStatus: json["visaStatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "bookingId": bookingId,
    "userId": userId,
    "userType": userType,
    "tenantId": tenantId,
    "correlationId": correlationId,
    "totalAmount": totalAmount,
    "totalAmountMarkup": totalAmountMarkup,
    "markup": markup,
    "otaTax": otaTax,
    "totalRefundAmount": totalRefundAmount,
    "totalCancellationCharge": totalCancellationCharge,
    "paymentMode": paymentMode,
    "paymentTransactionId": paymentTransactionId,
    "ibanNumber": ibanNumber,
    "status": status,
    "visaRequestId": visaRequestId,
    "visaLink": visaLink,
    "preVisaReference": preVisaReference,
    "isDeleted": isDeleted,
    "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
    "contact": contact.toJson(),
    "errors": errors.toJson(),
    "paymentDetails": paymentDetails,
    "visaStatus": visaStatus,
  };
}

class Booking {
  Booking({
    this.id,
    this.uid,
    this.bookingId,
    this.reservationNumber,
    this.alternateTpaBookingId,
    this.reservationDate,
    this.returnDate,
    this.bookingDate,
    this.trackToken,
    this.logToken,
    this.invoicePath,
    this.iterinaryPath,
    this.markupId,
    this.status,
    this.totalAmount,
    this.totalAmountMarkup,
    this.markup,
    this.otaTax,
    this.tpaAmount,
    this.tpaType,
    this.tpa,
    this.serviceTypeId,
    this.serviceType,
    this.serviceTypeCode,
    this.provider,
    this.couponId,
    this.isBookingModified,
    this.isBookingCancelled,
    this.isDeleted,
    this.isMakkah,
    this.summaryInfo,
    this.travellers,
    this.bookingCancellation,
    this.bookingInfoPath,
    this.isManualCancellation,
  });

  dynamic id;
  String uid;
  dynamic bookingId;
  String reservationNumber;
  dynamic alternateTpaBookingId;
  String reservationDate;
  dynamic returnDate;
  String bookingDate;
  dynamic trackToken;
  dynamic logToken;
  dynamic invoicePath;
  dynamic iterinaryPath;
  String markupId;
  String status;
  double totalAmount;
  double totalAmountMarkup;
  double markup;
  double otaTax;
  dynamic tpaAmount;
  dynamic tpaType;
  String tpa;
  dynamic serviceTypeId;
  String serviceType;
  String serviceTypeCode;
  String provider;
  dynamic couponId;
  bool isBookingModified;
  bool isBookingCancelled;
  bool isDeleted;
  bool isMakkah;
  SummaryInfo summaryInfo;
  List<dynamic> travellers;
  dynamic bookingCancellation;
  dynamic bookingInfoPath;
  bool isManualCancellation;

  factory Booking.fromRawJson(String str) => Booking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["id"],
    uid: json["uid"],
    bookingId: json["bookingId"],
    reservationNumber: json["reservationNumber"],
    alternateTpaBookingId: json["alternateTpaBookingId"],
    reservationDate: json["reservationDate"],
    returnDate: json["returnDate"],
    bookingDate: json["bookingDate"],
    trackToken: json["trackToken"],
    logToken: json["logToken"],
    invoicePath: json["invoicePath"],
    iterinaryPath: json["iterinaryPath"],
    markupId: json["markupId"],
    status: json["status"],
    totalAmount: json["totalAmount"].toDouble(),
    totalAmountMarkup: json["totalAmountMarkup"].toDouble(),
    markup: json["markup"].toDouble(),
    otaTax: json["otaTax"].toDouble(),
    tpaAmount: json["tpaAmount"],
    tpaType: json["tpaType"],
    tpa: json["tpa"],
    serviceTypeId: json["serviceTypeId"],
    serviceType: json["serviceType"],
    serviceTypeCode: json["serviceTypeCode"],
    provider: json["provider"],
    couponId: json["couponId"],
    isBookingModified: json["isBookingModified"],
    isBookingCancelled: json["isBookingCancelled"],
    isDeleted: json["isDeleted"],
    isMakkah: json["isMakkah"],
    summaryInfo: SummaryInfo.fromJson(json["summaryInfo"]),
    travellers: List<dynamic>.from(json["travellers"].map((x) => x)),
    bookingCancellation: json["bookingCancellation"],
    bookingInfoPath: json["bookingInfoPath"],
    isManualCancellation: json["isManualCancellation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "bookingId": bookingId,
    "reservationNumber": reservationNumber,
    "alternateTpaBookingId": alternateTpaBookingId,
    "reservationDate": reservationDate,
    "returnDate": returnDate,
    "bookingDate": bookingDate,
    "trackToken": trackToken,
    "logToken": logToken,
    "invoicePath": invoicePath,
    "iterinaryPath": iterinaryPath,
    "markupId": markupId,
    "status": status,
    "totalAmount": totalAmount,
    "totalAmountMarkup": totalAmountMarkup,
    "markup": markup,
    "otaTax": otaTax,
    "tpaAmount": tpaAmount,
    "tpaType": tpaType,
    "tpa": tpa,
    "serviceTypeId": serviceTypeId,
    "serviceType": serviceType,
    "serviceTypeCode": serviceTypeCode,
    "provider": provider,
    "couponId": couponId,
    "isBookingModified": isBookingModified,
    "isBookingCancelled": isBookingCancelled,
    "isDeleted": isDeleted,
    "isMakkah": isMakkah,
    "summaryInfo": summaryInfo.toJson(),
    "travellers": List<dynamic>.from(travellers.map((x) => x)),
    "bookingCancellation": bookingCancellation,
    "bookingInfoPath": bookingInfoPath,
    "isManualCancellation": isManualCancellation,
  };
}

class SummaryInfo {
  SummaryInfo({
    this.serviceType,
    this.flightType,
    this.selectedCabins,
    this.reservationDate,
    this.returnDate,
    this.flight,
    this.provider,
  });

  String serviceType;
  String flightType;
  String selectedCabins;
  String reservationDate;
  dynamic returnDate;
  List<Flight> flight;
  String provider;

  factory SummaryInfo.fromRawJson(String str) => SummaryInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SummaryInfo.fromJson(Map<String, dynamic> json) => SummaryInfo(
    serviceType: json["serviceType"],
    flightType: json["flight_type"],
    selectedCabins: json["selected_cabins"],
    reservationDate: json["reservationDate"],
    returnDate: json["returnDate"],
    flight: List<Flight>.from(json["flight"].map((x) => Flight.fromJson(x))),
    provider: json["provider"],
  );

  Map<String, dynamic> toJson() => {
    "serviceType": serviceType,
    "flight_type": flightType,
    "selected_cabins": selectedCabins,
    "reservationDate": reservationDate,
    "returnDate": returnDate,
    "flight": List<dynamic>.from(flight.map((x) => x.toJson())),
    "provider": provider,
  };
}

class Flight {
  Flight({
    this.route,
    this.nightsInDest,
    this.duration,
    this.flyFrom,
    this.cityFrom,
    this.cityCodeFrom,
    this.countryFrom,
    this.flyTo,
    this.cityTo,
    this.cityCodeTo,
    this.countryTo,
    this.distance,
    this.routes,
    this.airlines,
    this.airlinesMeta,
    this.pnrCount,
    this.virtualInterlining,
    this.hasAirportChange,
    this.technicalStops,
    this.price,
    this.bagsPrice,
    this.baglimit,
    this.availability,
    this.facilitatedBookingAvailable,
    this.transfers,
    this.typeFlights,
    this.conversion,
    this.localArrival,
    this.utcArrival,
    this.localDeparture,
    this.utcDeparture,
    this.deepLink,
    this.onewaystopsCount,
    this.returnwaystopsCount,
    this.onewayLocalArrival,
    this.onewayUtcArrival,
    this.onewayLocalDeparture,
    this.onewayUtcDeparture,
    this.returnLocalArrival,
    this.returnUtcArrival,
    this.returnLocalDeparture,
    this.returnUtcDeparture,
    this.displayRateInfoWithMarkup,
    this.tpa,
    this.options,
  });

  List<Route> route;
  dynamic nightsInDest;
  Durations duration;
  String flyFrom;
  String cityFrom;
  String cityCodeFrom;
  Country countryFrom;
  String flyTo;
  String cityTo;
  String cityCodeTo;
  Country countryTo;
  double distance;
  dynamic routes;
  dynamic airlines;
  List<AirlinesMeta> airlinesMeta;
  dynamic pnrCount;
  dynamic virtualInterlining;
  bool hasAirportChange;
  dynamic technicalStops;
  dynamic price;
  BagsPrice bagsPrice;
  Baglimit baglimit;
  dynamic availability;
  bool facilitatedBookingAvailable;
  dynamic transfers;
  dynamic typeFlights;
  Conversion conversion;
  dynamic localArrival;
  dynamic utcArrival;
  dynamic localDeparture;
  dynamic utcDeparture;
  dynamic deepLink;
  dynamic onewaystopsCount;
  dynamic returnwaystopsCount;
  String onewayLocalArrival;
  String onewayUtcArrival;
  String onewayLocalDeparture;
  String onewayUtcDeparture;
  String returnLocalArrival;
  String returnUtcArrival;
  String returnLocalDeparture;
  String returnUtcDeparture;
  DisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  String tpa;
  List<Option> options;

  factory Flight.fromRawJson(String str) => Flight.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    route: List<Route>.from(json["route"].map((x) => Route.fromJson(x))),
    nightsInDest: json["nightsInDest"],
    duration: Durations.fromJson(json["duration"]),
    flyFrom: json["flyFrom"],
    cityFrom: json["cityFrom"],
    cityCodeFrom: json["cityCodeFrom"],
    countryFrom: Country.fromJson(json["countryFrom"]),
    flyTo: json["flyTo"],
    cityTo: json["cityTo"],
    cityCodeTo: json["cityCodeTo"],
    countryTo: Country.fromJson(json["countryTo"]),
    distance: json["distance"].toDouble(),
    routes: json["routes"],
    airlines: json["airlines"],
    airlinesMeta: List<AirlinesMeta>.from(json["airlinesMeta"].map((x) => AirlinesMeta.fromJson(x))),
    pnrCount: json["pnr_count"],
    virtualInterlining: json["virtual_interlining"],
    hasAirportChange: json["has_airport_change"],
    technicalStops: json["technical_stops"],
    price: json["price"],
    bagsPrice: BagsPrice.fromJson(json["bags_price"]),
    baglimit: Baglimit.fromJson(json["baglimit"]),
    availability: json["availability"],
    facilitatedBookingAvailable: json["facilitated_booking_available"],
    transfers: json["transfers"],
    typeFlights: json["type_flights"],
    conversion: Conversion.fromJson(json["conversion"]),
    localArrival: json["local_arrival"],
    utcArrival: json["utc_arrival"],
    localDeparture: json["local_departure"],
    utcDeparture: json["utc_departure"],
    deepLink: json["deep_link"],
    onewaystopsCount: json["onewaystops_count"],
    returnwaystopsCount: json["returnwaystops_count"],
    onewayLocalArrival: json["oneway_local_arrival"],
    onewayUtcArrival: json["oneway_utc_arrival"],
    onewayLocalDeparture: json["oneway_local_departure"],
    onewayUtcDeparture: json["oneway_utc_departure"],
    returnLocalArrival: json["return_local_arrival"],
    returnUtcArrival: json["return_utc_arrival"],
    returnLocalDeparture: json["return_local_departure"],
    returnUtcDeparture: json["return_utc_departure"],
    displayRateInfoWithMarkup: DisplayRateInfoWithMarkup.fromJson(json["displayRateInfoWithMarkup"]),
    tpa: json["tpa"],
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "route": List<dynamic>.from(route.map((x) => x.toJson())),
    "nightsInDest": nightsInDest,
    "duration": duration.toJson(),
    "flyFrom": flyFrom,
    "cityFrom": cityFrom,
    "cityCodeFrom": cityCodeFrom,
    "countryFrom": countryFrom.toJson(),
    "flyTo": flyTo,
    "cityTo": cityTo,
    "cityCodeTo": cityCodeTo,
    "countryTo": countryTo.toJson(),
    "distance": distance,
    "routes": routes,
    "airlines": airlines,
    "airlinesMeta": List<dynamic>.from(airlinesMeta.map((x) => x.toJson())),
    "pnr_count": pnrCount,
    "virtual_interlining": virtualInterlining,
    "has_airport_change": hasAirportChange,
    "technical_stops": technicalStops,
    "price": price,
    "bags_price": bagsPrice.toJson(),
    "baglimit": baglimit.toJson(),
    "availability": availability,
    "facilitated_booking_available": facilitatedBookingAvailable,
    "transfers": transfers,
    "type_flights": typeFlights,
    "conversion": conversion.toJson(),
    "local_arrival": localArrival,
    "utc_arrival": utcArrival,
    "local_departure": localDeparture,
    "utc_departure": utcDeparture,
    "deep_link": deepLink,
    "onewaystops_count": onewaystopsCount,
    "returnwaystops_count": returnwaystopsCount,
    "oneway_local_arrival": onewayLocalArrival,
    "oneway_utc_arrival": onewayUtcArrival,
    "oneway_local_departure": onewayLocalDeparture,
    "oneway_utc_departure": onewayUtcDeparture,
    "return_local_arrival": returnLocalArrival,
    "return_utc_arrival": returnUtcArrival,
    "return_local_departure": returnLocalDeparture,
    "return_utc_departure": returnUtcDeparture,
    "displayRateInfoWithMarkup": displayRateInfoWithMarkup.toJson(),
    "tpa": tpa,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
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
  String createdDate;
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
    createdDate: json["createdDate"],
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
    "createdDate": createdDate,
    "updatedBy": updatedBy,
    "updatedDate": updatedDate,
  };
}

class Baglimit {
  Baglimit({
    this.handWidth,
    this.handHeight,
    this.handLength,
    this.handWeight,
    this.holdWidth,
    this.holdHeight,
    this.holdLength,
    this.holdDimensionsSum,
    this.holdWeight,
  });

  dynamic handWidth;
  dynamic handHeight;
  dynamic handLength;
  dynamic handWeight;
  dynamic holdWidth;
  dynamic holdHeight;
  dynamic holdLength;
  dynamic holdDimensionsSum;
  dynamic holdWeight;

  factory Baglimit.fromRawJson(String str) => Baglimit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Baglimit.fromJson(Map<String, dynamic> json) => Baglimit(
    handWidth: json["hand_width"],
    handHeight: json["hand_height"],
    handLength: json["hand_length"],
    handWeight: json["hand_weight"],
    holdWidth: json["hold_width"],
    holdHeight: json["hold_height"],
    holdLength: json["hold_length"],
    holdDimensionsSum: json["hold_dimensions_sum"],
    holdWeight: json["hold_weight"],
  );

  Map<String, dynamic> toJson() => {
    "hand_width": handWidth,
    "hand_height": handHeight,
    "hand_length": handLength,
    "hand_weight": handWeight,
    "hold_width": holdWidth,
    "hold_height": holdHeight,
    "hold_length": holdLength,
    "hold_dimensions_sum": holdDimensionsSum,
    "hold_weight": holdWeight,
  };
}

class BagsPrice {
  BagsPrice({
    this.invalidName1,
    this.invalidName2,
  });

  dynamic invalidName1;
  dynamic invalidName2;

  factory BagsPrice.fromRawJson(String str) => BagsPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BagsPrice.fromJson(Map<String, dynamic> json) => BagsPrice(
    invalidName1: json["__invalid_name__1"],
    invalidName2: json["__invalid_name__2"],
  );

  Map<String, dynamic> toJson() => {
    "__invalid_name__1": invalidName1,
    "__invalid_name__2": invalidName2,
  };
}

class Conversion {
  Conversion({
    this.eur,
  });

  dynamic eur;

  factory Conversion.fromRawJson(String str) => Conversion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Conversion.fromJson(Map<String, dynamic> json) => Conversion(
    eur: json["eur"],
  );

  Map<String, dynamic> toJson() => {
    "eur": eur,
  };
}

class Country {
  Country({
    this.code,
    this.name,
  });

  String code;
  String name;

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
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

class Durations {
  Durations({
    this.departure,
    this.durationReturn,
    this.total,
  });

  dynamic departure;
  dynamic durationReturn;
  dynamic total;

  factory Durations.fromRawJson(String str) => Durations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Durations.fromJson(Map<String, dynamic> json) => Durations(
    departure: json["departure"],
    durationReturn: json["return"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "departure": departure,
    "return": durationReturn,
    "total": total,
  };
}



class Route {
  Route({
    this.fareBasis,
    this.fareCategory,
    this.fareClasses,
    this.fareFamily,
    this.lastSeen,
    this.refreshTimestamp,
    this.routeReturn,
    this.bagsRecheckRequired,
    this.guarantee,
    this.cityTo,
    this.cityFrom,
    this.cityCodeFrom,
    this.cityCodeTo,
    this.flyTo,
    this.flyFrom,
    this.airline,
    this.operatingCarrier,
    this.equipment,
    this.flightNo,
    this.vehicleType,
    this.operatingFlightNo,
    this.localArrival,
    this.utcArrival,
    this.localDeparture,
    this.utcDeparture,
  });

  dynamic fareBasis;
  String fareCategory;
  String fareClasses;
  String fareFamily;
  dynamic lastSeen;
  dynamic refreshTimestamp;
  dynamic routeReturn;
  bool bagsRecheckRequired;
  dynamic guarantee;
  String cityTo;
  String cityFrom;
  String cityCodeFrom;
  String cityCodeTo;
  String flyTo;
  String flyFrom;
  String airline;
  String operatingCarrier;
  dynamic equipment;
  dynamic flightNo;
  dynamic vehicleType;
  String operatingFlightNo;
  String localArrival;
  String utcArrival;
  String localDeparture;
  String utcDeparture;

  factory Route.fromRawJson(String str) => Route.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Route.fromJson(Map<String, dynamic> json) => Route(
    fareBasis: json["fare_basis"],
    fareCategory: json["fare_category"],
    fareClasses: json["fare_classes"],
    fareFamily: json["fare_family"],
    lastSeen: json["last_seen"],
    refreshTimestamp: json["refresh_timestamp"],
    routeReturn: json["return"],
    bagsRecheckRequired: json["bags_recheck_required"],
    guarantee: json["guarantee"],
    cityTo: json["cityTo"],
    cityFrom: json["cityFrom"],
    cityCodeFrom: json["cityCodeFrom"],
    cityCodeTo: json["cityCodeTo"],
    flyTo: json["flyTo"],
    flyFrom: json["flyFrom"],
    airline: json["airline"],
    operatingCarrier: json["operating_carrier"],
    equipment: json["equipment"],
    flightNo: json["flight_no"],
    vehicleType: json["vehicle_type"],
    operatingFlightNo: json["operating_flight_no"],
    localArrival: json["local_arrival"],
    utcArrival: json["utc_arrival"],
    localDeparture: json["local_departure"],
    utcDeparture: json["utc_departure"],
  );

  Map<String, dynamic> toJson() => {
    "fare_basis": fareBasis,
    "fare_category": fareCategory,
    "fare_classes": fareClasses,
    "fare_family": fareFamily,
    "last_seen": lastSeen,
    "refresh_timestamp": refreshTimestamp,
    "return": routeReturn,
    "bags_recheck_required": bagsRecheckRequired,
    "guarantee": guarantee,
    "cityTo": cityTo,
    "cityFrom": cityFrom,
    "cityCodeFrom": cityCodeFrom,
    "cityCodeTo": cityCodeTo,
    "flyTo": flyTo,
    "flyFrom": flyFrom,
    "airline": airline,
    "operating_carrier": operatingCarrier,
    "equipment": equipment,
    "flight_no": flightNo,
    "vehicle_type": vehicleType,
    "operating_flight_no": operatingFlightNo,
    "local_arrival": localArrival,
    "utc_arrival": utcArrival,
    "local_departure": localDeparture,
    "utc_departure": utcDeparture,
  };
}

class Contact {
  Contact({
    this.id,
    this.uid,
    this.bookingMasterId,
    this.firstname,
    this.lastname,
    this.gender,
    this.dob,
    this.phoneNumber,
    this.phoneNumberCode,
    this.email,
    this.country,
    this.countryCode,
    this.address,
    this.passport,
    this.passportExpirationDate,
    this.relation,
    this.nationality,
    this.visaFee,
    this.visaFeeReference,
  });

  String id;
  String uid;
  dynamic bookingMasterId;
  String firstname;
  String lastname;
  dynamic gender;
  String dob;
  String phoneNumber;
  String phoneNumberCode;
  String email;
  String country;
  String countryCode;
  String address;
  String passport;
  String passportExpirationDate;
  dynamic relation;
  String nationality;
  dynamic visaFee;
  dynamic visaFeeReference;

  factory Contact.fromRawJson(String str) => Contact.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"],
    uid: json["uid"],
    bookingMasterId: json["bookingMasterId"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    gender: json["gender"],
    dob: json["dob"],
    phoneNumber: json["phoneNumber"],
    phoneNumberCode: json["phoneNumberCode"],
    email: json["email"],
    country: json["country"],
    countryCode: json["countryCode"],
    address: json["address"],
    passport: json["passport"],
    passportExpirationDate: json["passportExpirationDate"],
    relation: json["relation"],
    nationality: json["nationality"],
    visaFee: json["visaFee"],
    visaFeeReference: json["visaFeeReference"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "bookingMasterId": bookingMasterId,
    "firstname": firstname,
    "lastname": lastname,
    "gender": gender,
    "dob": dob,
    "phoneNumber": phoneNumber,
    "phoneNumberCode": phoneNumberCode,
    "email": email,
    "country": country,
    "countryCode": countryCode,
    "address": address,
    "passport": passport,
    "passportExpirationDate": passportExpirationDate,
    "relation": relation,
    "nationality": nationality,
    "visaFee": visaFee,
    "visaFeeReference": visaFeeReference,
  };
}

class Errors {
  Errors({
    this.invoice,
  });

  String invoice;

  factory Errors.fromRawJson(String str) => Errors.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
    invoice: json["Invoice"],
  );

  Map<String, dynamic> toJson() => {
    "Invoice": invoice,
  };
}
