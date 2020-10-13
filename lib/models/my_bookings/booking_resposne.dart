// To parse this JSON data, do
//
//     final genericResponse = genericResponseFromMap(jsonString);

import 'dart:convert';

class GenericResponse {
  GenericResponse({
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
  List<BookingResponseModel> result;

  factory GenericResponse.fromJson(String str) => GenericResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GenericResponse.fromMap(Map<String, dynamic> json) => GenericResponse(
    version: json["version"],
    message: json["message"] == null ? null : json["message"],
    isError: json["isError"] == null ? null : json["isError"],
    responseException: json["responseException"],
    result: json["result"] == null ? null : List<BookingResponseModel>.from(json["result"].map((x) => BookingResponseModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "version": version,
    "message": message == null ? null : message,
    "isError": isError == null ? null : isError,
    "responseException": responseException,
    "result": result == null ? null : List<dynamic>.from(result.map((x) => x.toMap())),
  };
}

class BookingResponseModel {
  BookingResponseModel({
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
  UserType userType;
  String tenantId;
  String correlationId;
  double totalAmount;
  double totalAmountMarkup;
  double markup;
  double otaTax;
  double totalRefundAmount;
  double totalCancellationCharge;
  PaymentMode paymentMode;
  String paymentTransactionId;
  dynamic ibanNumber;
  ResultStatus status;
  dynamic visaRequestId;
  dynamic visaLink;
  dynamic preVisaReference;
  bool isDeleted;
  List<Booking> bookings;
  Contact contact;
  Errors errors;
  dynamic paymentDetails;
  dynamic visaStatus;

  factory BookingResponseModel.fromJson(String str) => BookingResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookingResponseModel.fromMap(Map<String, dynamic> json) => BookingResponseModel(
    id: json["id"] == null ? null : json["id"],
    uid: json["uid"] == null ? null : json["uid"],
    bookingId: json["bookingId"] == null ? null : json["bookingId"],
    userId: json["userId"] == null ? null : json["userId"],
    userType: json["userType"] == null ? null : userTypeValues.map[json["userType"]],
    tenantId: json["tenantId"] == null ? null : json["tenantId"],
    correlationId: json["correlationId"] == null ? null : json["correlationId"],
    totalAmount: json["totalAmount"] == null ? null : json["totalAmount"].toDouble(),
    totalAmountMarkup: json["totalAmountMarkup"] == null ? null : json["totalAmountMarkup"].toDouble(),
    markup: json["markup"] == null ? null : json["markup"].toDouble(),
    otaTax: json["otaTax"] == null ? null : json["otaTax"].toDouble(),
    totalRefundAmount: json["totalRefundAmount"] == null ? null : json["totalRefundAmount"],
    totalCancellationCharge: json["totalCancellationCharge"] == null ? null : json["totalCancellationCharge"],
    paymentMode: json["paymentMode"] == null ? null : paymentModeValues.map[json["paymentMode"]],
    paymentTransactionId: json["paymentTransactionId"] == null ? null : json["paymentTransactionId"],
    ibanNumber: json["ibanNumber"],
    status: json["status"] == null ? null : resultStatusValues.map[json["status"]],
    visaRequestId: json["visaRequestId"],
    visaLink: json["visaLink"],
    preVisaReference: json["preVisaReference"],
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
    bookings: json["bookings"] == null ? null : List<Booking>.from(json["bookings"].map((x) => Booking.fromMap(x))),
    contact: json["contact"] == null ? null : Contact.fromMap(json["contact"]),
    errors: json["errors"] == null ? null : Errors.fromMap(json["errors"]),
    paymentDetails: json["paymentDetails"],
    visaStatus: json["visaStatus"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "uid": uid == null ? null : uid,
    "bookingId": bookingId == null ? null : bookingId,
    "userId": userId == null ? null : userId,
    "userType": userType == null ? null : userTypeValues.reverse[userType],
    "tenantId": tenantId == null ? null : tenantId,
    "correlationId": correlationId == null ? null : correlationId,
    "totalAmount": totalAmount == null ? null : totalAmount,
    "totalAmountMarkup": totalAmountMarkup == null ? null : totalAmountMarkup,
    "markup": markup == null ? null : markup,
    "otaTax": otaTax == null ? null : otaTax,
    "totalRefundAmount": totalRefundAmount == null ? null : totalRefundAmount,
    "totalCancellationCharge": totalCancellationCharge == null ? null : totalCancellationCharge,
    "paymentMode": paymentMode == null ? null : paymentModeValues.reverse[paymentMode],
    "paymentTransactionId": paymentTransactionId == null ? null : paymentTransactionId,
    "ibanNumber": ibanNumber,
    "status": status == null ? null : resultStatusValues.reverse[status],
    "visaRequestId": visaRequestId,
    "visaLink": visaLink,
    "preVisaReference": preVisaReference,
    "isDeleted": isDeleted == null ? null : isDeleted,
    "bookings": bookings == null ? null : List<dynamic>.from(bookings.map((x) => x.toMap())),
    "contact": contact == null ? null : contact.toMap(),
    "errors": errors == null ? null : errors.toMap(),
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

  int id;
  String uid;
  int bookingId;
  String reservationNumber;
  String alternateTpaBookingId;
  DateTime reservationDate;
  DateTime returnDate;
  DateTime bookingDate;
  dynamic trackToken;
  dynamic logToken;
  String invoicePath;
  dynamic iterinaryPath;
  String markupId;
  BookingStatus status;
  double totalAmount;
  double totalAmountMarkup;
  double markup;
  double otaTax;
  double tpaAmount;
  int tpaType;
  String tpa;
  int serviceTypeId;
  ServiceType serviceType;
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

  factory Booking.fromJson(String str) => Booking.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Booking.fromMap(Map<String, dynamic> json) => Booking(
    id: json["id"] == null ? null : json["id"],
    uid: json["uid"] == null ? null : json["uid"],
    bookingId: json["bookingId"] == null ? null : json["bookingId"],
    reservationNumber: json["reservationNumber"] == null ? null : json["reservationNumber"],
    alternateTpaBookingId: json["alternateTpaBookingId"] == null ? null : json["alternateTpaBookingId"],
    reservationDate: json["reservationDate"] == null ? null : DateTime.parse(json["reservationDate"]),
    returnDate: json["returnDate"] == null ? null : DateTime.parse(json["returnDate"]),
    bookingDate: json["bookingDate"] == null ? null : DateTime.parse(json["bookingDate"]),
    trackToken: json["trackToken"],
    logToken: json["logToken"],
    invoicePath: json["invoicePath"] == null ? null : json["invoicePath"],
    iterinaryPath: json["iterinaryPath"],
    markupId: json["markupId"] == null ? null : json["markupId"],
    status: json["status"] == null ? null : bookingStatusValues.map[json["status"]],
    totalAmount: json["totalAmount"] == null ? null : json["totalAmount"].toDouble(),
    totalAmountMarkup: json["totalAmountMarkup"] == null ? null : json["totalAmountMarkup"].toDouble(),
    markup: json["markup"] == null ? null : json["markup"].toDouble(),
    otaTax: json["otaTax"] == null ? null : json["otaTax"].toDouble(),
    tpaAmount: json["tpaAmount"] == null ? null : json["tpaAmount"].toDouble(),
    tpaType: json["tpaType"] == null ? null : json["tpaType"],
    tpa: json["tpa"] == null ? null : json["tpa"],
    serviceTypeId: json["serviceTypeId"] == null ? null : json["serviceTypeId"],
    serviceType: json["serviceType"] == null ? null : serviceTypeValues.map[json["serviceType"]],
    serviceTypeCode: json["serviceTypeCode"] == null ? null : json["serviceTypeCode"],
    provider: json["provider"] == null ? null : json["provider"],
    couponId: json["couponId"],
    isBookingModified: json["isBookingModified"] == null ? null : json["isBookingModified"],
    isBookingCancelled: json["isBookingCancelled"] == null ? null : json["isBookingCancelled"],
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
    isMakkah: json["isMakkah"] == null ? null : json["isMakkah"],
    summaryInfo: json["summaryInfo"] == null ? null : SummaryInfo.fromMap(json["summaryInfo"]),
    travellers: json["travellers"] == null ? null : List<dynamic>.from(json["travellers"].map((x) => x)),
    bookingCancellation: json["bookingCancellation"],
    bookingInfoPath: json["bookingInfoPath"],
    isManualCancellation: json["isManualCancellation"] == null ? null : json["isManualCancellation"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "uid": uid == null ? null : uid,
    "bookingId": bookingId == null ? null : bookingId,
    "reservationNumber": reservationNumber == null ? null : reservationNumber,
    "alternateTpaBookingId": alternateTpaBookingId == null ? null : alternateTpaBookingId,
    "reservationDate": reservationDate == null ? null : reservationDate.toIso8601String(),
    "returnDate": returnDate == null ? null : returnDate.toIso8601String(),
    "bookingDate": bookingDate == null ? null : bookingDate.toIso8601String(),
    "trackToken": trackToken,
    "logToken": logToken,
    "invoicePath": invoicePath == null ? null : invoicePath,
    "iterinaryPath": iterinaryPath,
    "markupId": markupId == null ? null : markupId,
    "status": status == null ? null : bookingStatusValues.reverse[status],
    "totalAmount": totalAmount == null ? null : totalAmount,
    "totalAmountMarkup": totalAmountMarkup == null ? null : totalAmountMarkup,
    "markup": markup == null ? null : markup,
    "otaTax": otaTax == null ? null : otaTax,
    "tpaAmount": tpaAmount == null ? null : tpaAmount,
    "tpaType": tpaType == null ? null : tpaType,
    "tpa": tpa == null ? null : tpa,
    "serviceTypeId": serviceTypeId == null ? null : serviceTypeId,
    "serviceType": serviceType == null ? null : serviceTypeValues.reverse[serviceType],
    "serviceTypeCode": serviceTypeCode == null ? null : serviceTypeCode,
    "provider": provider == null ? null : provider,
    "couponId": couponId,
    "isBookingModified": isBookingModified == null ? null : isBookingModified,
    "isBookingCancelled": isBookingCancelled == null ? null : isBookingCancelled,
    "isDeleted": isDeleted == null ? null : isDeleted,
    "isMakkah": isMakkah == null ? null : isMakkah,
    "summaryInfo": summaryInfo == null ? null : summaryInfo.toMap(),
    "travellers": travellers == null ? null : List<dynamic>.from(travellers.map((x) => x)),
    "bookingCancellation": bookingCancellation,
    "bookingInfoPath": bookingInfoPath,
    "isManualCancellation": isManualCancellation == null ? null : isManualCancellation,
  };
}

enum ServiceType { TRF, FLT, HTL, ACT }

final serviceTypeValues = EnumValues({
  "ACT": ServiceType.ACT,
  "FLT": ServiceType.FLT,
  "HTL": ServiceType.HTL,
  "TRF": ServiceType.TRF
});

enum BookingStatus { BOOKING_SUCCESS, BOOKING_PENDING }

final bookingStatusValues = EnumValues({
  "BOOKING_PENDING": BookingStatus.BOOKING_PENDING,
  "BOOKING_SUCCESS": BookingStatus.BOOKING_SUCCESS
});

class SummaryInfo {
  SummaryInfo({
    this.serviceType,
    this.trips,
    this.carClass,
    this.provider,
    this.pickUpDate,
    this.pickUpTime,
    this.code,
    this.flightType,
    this.selectedCabins,
    this.reservationDate,
    this.returnDate,
    this.flight,
    this.checkInDate,
    this.checkOutDate,
    this.name,
    this.address,
    this.selcectRooms,
    this.image,
    this.checkInTime,
    this.checkOutTime,
    this.fromLocationName,
    this.activityName,
    this.modalityDetails,
    this.selectedPersons,
  });

  ServiceType serviceType;
  List<Trip> trips;
  CarClass carClass;
  String provider;
  DateTime pickUpDate;
  String pickUpTime;
  dynamic code;
  String flightType;
  String selectedCabins;
  String reservationDate;
  dynamic returnDate;
  List<Flight> flight;
  String checkInDate;
  String checkOutDate;
  String name;
  String address;
  String selcectRooms;
  String image;
  dynamic checkInTime;
  dynamic checkOutTime;
  String fromLocationName;
  String activityName;
  ModalityDetails modalityDetails;
  int selectedPersons;

  factory SummaryInfo.fromJson(String str) => SummaryInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SummaryInfo.fromMap(Map<String, dynamic> json) => SummaryInfo(
    serviceType: json["serviceType"] == null ? null : serviceTypeValues.map[json["serviceType"]],
    trips: json["trips"] == null ? null : List<Trip>.from(json["trips"].map((x) => Trip.fromMap(x))),
    carClass: json["car_class"] == null ? null : CarClass.fromMap(json["car_class"]),
    provider: json["provider"] == null ? null : json["provider"],
    pickUpDate: json["PickUpDate"] == null ? null : DateTime.parse(json["PickUpDate"]),
    pickUpTime: json["PickUpTime"] == null ? null : json["PickUpTime"],
    code: json["code"],
    flightType: json["flight_type"] == null ? null : json["flight_type"],
    selectedCabins: json["selected_cabins"] == null ? null : json["selected_cabins"],
    reservationDate: json["reservationDate"] == null ? null : json["reservationDate"],
    returnDate: json["returnDate"],
    flight: json["flight"] == null ? null : List<Flight>.from(json["flight"].map((x) => Flight.fromMap(x))),
    checkInDate: json["checkInDate"] == null ? null : json["checkInDate"],
    checkOutDate: json["checkOutDate"] == null ? null : json["checkOutDate"],
    name: json["name"] == null ? null : json["name"],
    address: json["address"] == null ? null : json["address"],
    selcectRooms: json["selcectRooms"] == null ? null : json["selcectRooms"],
    image: json["image"] == null ? null : json["image"],
    checkInTime: json["checkInTime"],
    checkOutTime: json["checkOutTime"],
    fromLocationName: json["fromLocationName"] == null ? null : json["fromLocationName"],
    activityName: json["activityName"] == null ? null : json["activityName"],
    modalityDetails: json["modalityDetails"] == null ? null : ModalityDetails.fromMap(json["modalityDetails"]),
    selectedPersons: json["selectedPersons"] == null ? null : json["selectedPersons"],
  );

  Map<String, dynamic> toMap() => {
    "serviceType": serviceType == null ? null : serviceTypeValues.reverse[serviceType],
    "trips": trips == null ? null : List<dynamic>.from(trips.map((x) => x.toMap())),
    "car_class": carClass == null ? null : carClass.toMap(),
    "provider": provider == null ? null : provider,
    "PickUpDate": pickUpDate == null ? null : "${pickUpDate.year.toString().padLeft(4, '0')}-${pickUpDate.month.toString().padLeft(2, '0')}-${pickUpDate.day.toString().padLeft(2, '0')}",
    "PickUpTime": pickUpTime == null ? null : pickUpTime,
    "code": code,
    "flight_type": flightType == null ? null : flightType,
    "selected_cabins": selectedCabins == null ? null : selectedCabins,
    "reservationDate": reservationDate == null ? null : reservationDate,
    "returnDate": returnDate,
    "flight": flight == null ? null : List<dynamic>.from(flight.map((x) => x.toMap())),
    "checkInDate": checkInDate == null ? null : checkInDate,
    "checkOutDate": checkOutDate == null ? null : checkOutDate,
    "name": name == null ? null : name,
    "address": address == null ? null : address,
    "selcectRooms": selcectRooms == null ? null : selcectRooms,
    "image": image == null ? null : image,
    "checkInTime": checkInTime,
    "checkOutTime": checkOutTime,
    "fromLocationName": fromLocationName == null ? null : fromLocationName,
    "activityName": activityName == null ? null : activityName,
    "modalityDetails": modalityDetails == null ? null : modalityDetails.toMap(),
    "selectedPersons": selectedPersons == null ? null : selectedPersons,
  };
}

class CarClass {
  CarClass({
    this.carClassId,
    this.title,
    this.models,
    this.photo,
    this.capacity,
  });

  int carClassId;
  Title title;
  List<Model> models;
  String photo;
  int capacity;

  factory CarClass.fromJson(String str) => CarClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarClass.fromMap(Map<String, dynamic> json) => CarClass(
    carClassId: json["car_class_id"] == null ? null : json["car_class_id"],
    title: json["title"] == null ? null : titleValues.map[json["title"]],
    models: json["models"] == null ? null : List<Model>.from(json["models"].map((x) => modelValues.map[x])),
    photo: json["photo"] == null ? null : json["photo"],
    capacity: json["capacity"] == null ? null : json["capacity"],
  );

  Map<String, dynamic> toMap() => {
    "car_class_id": carClassId == null ? null : carClassId,
    "title": title == null ? null : titleValues.reverse[title],
    "models": models == null ? null : List<dynamic>.from(models.map((x) => modelValues.reverse[x])),
    "photo": photo == null ? null : photo,
    "capacity": capacity == null ? null : capacity,
  };
}

enum Model { TOYOTA_INNOVA, FORD_FOCUS, TOYOTA_COROLLA }

final modelValues = EnumValues({
  "Ford Focus": Model.FORD_FOCUS,
  "Toyota Corolla": Model.TOYOTA_COROLLA,
  "Toyota Innova": Model.TOYOTA_INNOVA
});

enum Title { MINIVAN, STANDARD }

final titleValues = EnumValues({
  "minivan": Title.MINIVAN,
  "standard": Title.STANDARD
});

class Flight {
  Flight({
    this.otaId,
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
    this.viewDetails,
    this.errorMessage,
  });

  String otaId;
  List<Route> route;
  dynamic nightsInDest;
  dynamic duration;
  String flyFrom;
  String cityFrom;
  String cityCodeFrom;
  Country countryFrom;
  String flyTo;
  String cityTo;
  String cityCodeTo;
  Country countryTo;
  double distance;
  List<List<String>> routes;
  List<String> airlines;
  List<AirlinesMeta> airlinesMeta;
  int pnrCount;
  bool virtualInterlining;
  bool hasAirportChange;
  int technicalStops;
  dynamic price;
  BagsPrice bagsPrice;
  Baglimit baglimit;
  Availability availability;
  bool facilitatedBookingAvailable;
  List<dynamic> transfers;
  List<String> typeFlights;
  Conversion conversion;
  DateTime localArrival;
  DateTime utcArrival;
  DateTime localDeparture;
  DateTime utcDeparture;
  String deepLink;
  int onewaystopsCount;
  int returnwaystopsCount;
  DateTime onewayLocalArrival;
  DateTime onewayUtcArrival;
  DateTime onewayLocalDeparture;
  DateTime onewayUtcDeparture;
  DateTime returnLocalArrival;
  DateTime returnUtcArrival;
  DateTime returnLocalDeparture;
  DateTime returnUtcDeparture;
  DisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  String tpa;
  List<Option> options;
  bool viewDetails;
  dynamic errorMessage;

  factory Flight.fromJson(String str) => Flight.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Flight.fromMap(Map<String, dynamic> json) => Flight(
    otaId: json["otaId"] == null ? null : json["otaId"],
    route: json["route"] == null ? null : List<Route>.from(json["route"].map((x) => Route.fromMap(x))),
    nightsInDest: json["nightsInDest"],
    duration: json["duration"] == null ? null : json["duration"],
    flyFrom: json["flyFrom"] == null ? null : json["flyFrom"],
    cityFrom: json["cityFrom"] == null ? null : json["cityFrom"],
    cityCodeFrom: json["cityCodeFrom"] == null ? null : json["cityCodeFrom"],
    countryFrom: json["countryFrom"] == null ? null : Country.fromMap(json["countryFrom"]),
    flyTo: json["flyTo"] == null ? null : json["flyTo"],
    cityTo: json["cityTo"] == null ? null : json["cityTo"],
    cityCodeTo: json["cityCodeTo"] == null ? null : json["cityCodeTo"],
    countryTo: json["countryTo"] == null ? null : Country.fromMap(json["countryTo"]),
    distance: json["distance"] == null ? null : json["distance"].toDouble(),
    routes: json["routes"] == null ? null : List<List<String>>.from(json["routes"].map((x) => List<String>.from(x.map((x) => x)))),
    airlines: json["airlines"] == null ? null : List<String>.from(json["airlines"].map((x) => x)),
    airlinesMeta: json["airlinesMeta"] == null ? null : List<AirlinesMeta>.from(json["airlinesMeta"].map((x) => AirlinesMeta.fromMap(x))),
    pnrCount: json["pnr_count"] == null ? null : json["pnr_count"],
    virtualInterlining: json["virtual_interlining"] == null ? null : json["virtual_interlining"],
    hasAirportChange: json["has_airport_change"] == null ? null : json["has_airport_change"],
    technicalStops: json["technical_stops"] == null ? null : json["technical_stops"],
    price: json["price"] == null ? null : json["price"],
    bagsPrice: json["bags_price"] == null ? null : BagsPrice.fromMap(json["bags_price"]),
    baglimit: json["baglimit"] == null ? null : Baglimit.fromMap(json["baglimit"]),
    availability: json["availability"] == null ? null : Availability.fromMap(json["availability"]),
    facilitatedBookingAvailable: json["facilitated_booking_available"] == null ? null : json["facilitated_booking_available"],
    transfers: json["transfers"] == null ? null : List<dynamic>.from(json["transfers"].map((x) => x)),
    typeFlights: json["type_flights"] == null ? null : List<String>.from(json["type_flights"].map((x) => x)),
    conversion: json["conversion"] == null ? null : Conversion.fromMap(json["conversion"]),
    localArrival: json["local_arrival"] == null ? null : DateTime.parse(json["local_arrival"]),
    utcArrival: json["utc_arrival"] == null ? null : DateTime.parse(json["utc_arrival"]),
    localDeparture: json["local_departure"] == null ? null : DateTime.parse(json["local_departure"]),
    utcDeparture: json["utc_departure"] == null ? null : DateTime.parse(json["utc_departure"]),
    deepLink: json["deep_link"] == null ? null : json["deep_link"],
    onewaystopsCount: json["onewaystops_count"] == null ? null : json["onewaystops_count"],
    returnwaystopsCount: json["returnwaystops_count"] == null ? null : json["returnwaystops_count"],
    onewayLocalArrival: json["oneway_local_arrival"] == null ? null : DateTime.parse(json["oneway_local_arrival"]),
    onewayUtcArrival: json["oneway_utc_arrival"] == null ? null : DateTime.parse(json["oneway_utc_arrival"]),
    onewayLocalDeparture: json["oneway_local_departure"] == null ? null : DateTime.parse(json["oneway_local_departure"]),
    onewayUtcDeparture: json["oneway_utc_departure"] == null ? null : DateTime.parse(json["oneway_utc_departure"]),
    returnLocalArrival: json["return_local_arrival"] == null ? null : DateTime.parse(json["return_local_arrival"]),
    returnUtcArrival: json["return_utc_arrival"] == null ? null : DateTime.parse(json["return_utc_arrival"]),
    returnLocalDeparture: json["return_local_departure"] == null ? null : DateTime.parse(json["return_local_departure"]),
    returnUtcDeparture: json["return_utc_departure"] == null ? null : DateTime.parse(json["return_utc_departure"]),
    displayRateInfoWithMarkup: json["displayRateInfoWithMarkup"] == null ? null : DisplayRateInfoWithMarkup.fromMap(json["displayRateInfoWithMarkup"]),
    tpa: json["tpa"] == null ? null : json["tpa"],
    options: json["options"] == null ? null : List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
    viewDetails: json["viewDetails"] == null ? null : json["viewDetails"],
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toMap() => {
    "otaId": otaId == null ? null : otaId,
    "route": route == null ? null : List<dynamic>.from(route.map((x) => x.toMap())),
    "nightsInDest": nightsInDest,
    "duration": duration == null ? null : duration.toMap(),
    "flyFrom": flyFrom == null ? null : flyFrom,
    "cityFrom": cityFrom == null ? null : cityFrom,
    "cityCodeFrom": cityCodeFrom == null ? null : cityCodeFrom,
    "countryFrom": countryFrom == null ? null : countryFrom.toMap(),
    "flyTo": flyTo == null ? null : flyTo,
    "cityTo": cityTo == null ? null : cityTo,
    "cityCodeTo": cityCodeTo == null ? null : cityCodeTo,
    "countryTo": countryTo == null ? null : countryTo.toMap(),
    "distance": distance == null ? null : distance,
    "routes": routes == null ? null : List<dynamic>.from(routes.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "airlines": airlines == null ? null : List<dynamic>.from(airlines.map((x) => x)),
    "airlinesMeta": airlinesMeta == null ? null : List<dynamic>.from(airlinesMeta.map((x) => x.toMap())),
    "pnr_count": pnrCount == null ? null : pnrCount,
    "virtual_interlining": virtualInterlining == null ? null : virtualInterlining,
    "has_airport_change": hasAirportChange == null ? null : hasAirportChange,
    "technical_stops": technicalStops == null ? null : technicalStops,
    "price": price == null ? null : price,
    "bags_price": bagsPrice == null ? null : bagsPrice.toMap(),
    "baglimit": baglimit == null ? null : baglimit.toMap(),
    "availability": availability == null ? null : availability.toMap(),
    "facilitated_booking_available": facilitatedBookingAvailable == null ? null : facilitatedBookingAvailable,
    "transfers": transfers == null ? null : List<dynamic>.from(transfers.map((x) => x)),
    "type_flights": typeFlights == null ? null : List<dynamic>.from(typeFlights.map((x) => x)),
    "conversion": conversion == null ? null : conversion.toMap(),
    "local_arrival": localArrival == null ? null : localArrival.toIso8601String(),
    "utc_arrival": utcArrival == null ? null : utcArrival.toIso8601String(),
    "local_departure": localDeparture == null ? null : localDeparture.toIso8601String(),
    "utc_departure": utcDeparture == null ? null : utcDeparture.toIso8601String(),
    "deep_link": deepLink == null ? null : deepLink,
    "onewaystops_count": onewaystopsCount == null ? null : onewaystopsCount,
    "returnwaystops_count": returnwaystopsCount == null ? null : returnwaystopsCount,
    "oneway_local_arrival": onewayLocalArrival == null ? null : onewayLocalArrival.toIso8601String(),
    "oneway_utc_arrival": onewayUtcArrival == null ? null : onewayUtcArrival.toIso8601String(),
    "oneway_local_departure": onewayLocalDeparture == null ? null : onewayLocalDeparture.toIso8601String(),
    "oneway_utc_departure": onewayUtcDeparture == null ? null : onewayUtcDeparture.toIso8601String(),
    "return_local_arrival": returnLocalArrival == null ? null : returnLocalArrival.toIso8601String(),
    "return_utc_arrival": returnUtcArrival == null ? null : returnUtcArrival.toIso8601String(),
    "return_local_departure": returnLocalDeparture == null ? null : returnLocalDeparture.toIso8601String(),
    "return_utc_departure": returnUtcDeparture == null ? null : returnUtcDeparture.toIso8601String(),
    "displayRateInfoWithMarkup": displayRateInfoWithMarkup == null ? null : displayRateInfoWithMarkup.toMap(),
    "tpa": tpa == null ? null : tpa,
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toMap())),
    "viewDetails": viewDetails == null ? null : viewDetails,
    "errorMessage": errorMessage,
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
  int lcc;
  String image32;
  String image64;
  String image128;
  bool isDeleted;
  int id;
  String uid;
  String createdBy;
  DateTime createdDate;
  dynamic updatedBy;
  String updatedDate;

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
    updatedDate: json["updatedDate"] == null ? null : json["updatedDate"],
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
    "updatedDate": updatedDate == null ? null : updatedDate,
  };
}

class Availability {
  Availability({
    this.seats,
  });

  dynamic seats;

  factory Availability.fromJson(String str) => Availability.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Availability.fromMap(Map<String, dynamic> json) => Availability(
    seats: json["seats"],
  );

  Map<String, dynamic> toMap() => {
    "seats": seats,
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

  int handWidth;
  int handHeight;
  int handLength;
  int handWeight;
  int holdWidth;
  int holdHeight;
  int holdLength;
  int holdDimensionsSum;
  int holdWeight;

  factory Baglimit.fromJson(String str) => Baglimit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Baglimit.fromMap(Map<String, dynamic> json) => Baglimit(
    handWidth: json["hand_width"] == null ? null : json["hand_width"],
    handHeight: json["hand_height"] == null ? null : json["hand_height"],
    handLength: json["hand_length"] == null ? null : json["hand_length"],
    handWeight: json["hand_weight"] == null ? null : json["hand_weight"],
    holdWidth: json["hold_width"] == null ? null : json["hold_width"],
    holdHeight: json["hold_height"] == null ? null : json["hold_height"],
    holdLength: json["hold_length"] == null ? null : json["hold_length"],
    holdDimensionsSum: json["hold_dimensions_sum"] == null ? null : json["hold_dimensions_sum"],
    holdWeight: json["hold_weight"] == null ? null : json["hold_weight"],
  );

  Map<String, dynamic> toMap() => {
    "hand_width": handWidth == null ? null : handWidth,
    "hand_height": handHeight == null ? null : handHeight,
    "hand_length": handLength == null ? null : handLength,
    "hand_weight": handWeight == null ? null : handWeight,
    "hold_width": holdWidth == null ? null : holdWidth,
    "hold_height": holdHeight == null ? null : holdHeight,
    "hold_length": holdLength == null ? null : holdLength,
    "hold_dimensions_sum": holdDimensionsSum == null ? null : holdDimensionsSum,
    "hold_weight": holdWeight == null ? null : holdWeight,
  };
}

class BagsPrice {
  BagsPrice({
    this.invalidName1,
    this.invalidName2,
  });

  dynamic invalidName1;
  dynamic invalidName2;

  factory BagsPrice.fromJson(String str) => BagsPrice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BagsPrice.fromMap(Map<String, dynamic> json) => BagsPrice(
    invalidName1: json["__invalid_name__1"] == null ? null : json["__invalid_name__1"],
    invalidName2: json["__invalid_name__2"],
  );

  Map<String, dynamic> toMap() => {
    "__invalid_name__1": invalidName1 == null ? null : invalidName1,
    "__invalid_name__2": invalidName2,
  };
}

class Conversion {
  Conversion({
    this.eur,
  });

  dynamic eur;

  factory Conversion.fromJson(String str) => Conversion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Conversion.fromMap(Map<String, dynamic> json) => Conversion(
    eur: json["eur"] == null ? null : json["eur"],
  );

  Map<String, dynamic> toMap() => {
    "eur": eur == null ? null : eur,
  };
}

class Country {
  Country({
    this.code,
    this.name,
  });

  String code;
  String name;

  factory Country.fromJson(String str) => Country.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Country.fromMap(Map<String, dynamic> json) => Country(
    code: json["code"] == null ? null : json["code"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "code": code == null ? null : code,
    "name": name == null ? null : name,
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
  Currency currency;

  factory DisplayRateInfoWithMarkup.fromJson(String str) => DisplayRateInfoWithMarkup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DisplayRateInfoWithMarkup.fromMap(Map<String, dynamic> json) => DisplayRateInfoWithMarkup(
    totalPriceWithMarkup: json["totalPriceWithMarkup"] == null ? null : json["totalPriceWithMarkup"].toDouble(),
    baseRate: json["baseRate"] == null ? null : json["baseRate"].toDouble(),
    taxAndOtherCharges: json["taxAndOtherCharges"] == null ? null : json["taxAndOtherCharges"].toDouble(),
    otaTax: json["otaTax"] == null ? null : json["otaTax"].toDouble(),
    markup: json["markup"] == null ? null : json["markup"].toDouble(),
    supplierBaseRate: json["supplierBaseRate"] == null ? null : json["supplierBaseRate"].toDouble(),
    supplierTotalCost: json["supplierTotalCost"] == null ? null : json["supplierTotalCost"].toDouble(),
    currency: json["currency"] == null ? null : currencyValues.map[json["currency"]],
  );

  Map<String, dynamic> toMap() => {
    "totalPriceWithMarkup": totalPriceWithMarkup == null ? null : totalPriceWithMarkup,
    "baseRate": baseRate == null ? null : baseRate,
    "taxAndOtherCharges": taxAndOtherCharges == null ? null : taxAndOtherCharges,
    "otaTax": otaTax == null ? null : otaTax,
    "markup": markup == null ? null : markup,
    "supplierBaseRate": supplierBaseRate == null ? null : supplierBaseRate,
    "supplierTotalCost": supplierTotalCost == null ? null : supplierTotalCost,
    "currency": currency == null ? null : currencyValues.reverse[currency],
  };
}

enum Currency { SAR }

final currencyValues = EnumValues({
  "SAR": Currency.SAR
});

class FlightDuration {
  FlightDuration({
    this.departure,
    this.durationReturn,
    this.total,
  });

  int departure;
  int durationReturn;
  int total;

  factory FlightDuration.fromJson(String str) => FlightDuration.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FlightDuration.fromMap(Map<String, dynamic> json) => FlightDuration(
    departure: json["departure"] == null ? null : json["departure"],
    durationReturn: json["return"] == null ? null : json["return"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toMap() => {
    "departure": departure == null ? null : departure,
    "return": durationReturn == null ? null : durationReturn,
    "total": total == null ? null : total,
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

  String fareBasis;
  String fareCategory;
  String fareClasses;
  String fareFamily;
  DateTime lastSeen;
  DateTime refreshTimestamp;
  int routeReturn;
  bool bagsRecheckRequired;
  bool guarantee;
  String cityTo;
  String cityFrom;
  String cityCodeFrom;
  String cityCodeTo;
  String flyTo;
  String flyFrom;
  String airline;
  String operatingCarrier;
  dynamic equipment;
  int flightNo;
  String vehicleType;
  String operatingFlightNo;
  DateTime localArrival;
  DateTime utcArrival;
  DateTime localDeparture;
  DateTime utcDeparture;

  factory Route.fromJson(String str) => Route.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Route.fromMap(Map<String, dynamic> json) => Route(
    fareBasis: json["fare_basis"] == null ? null : json["fare_basis"],
    fareCategory: json["fare_category"] == null ? null : json["fare_category"],
    fareClasses: json["fare_classes"] == null ? null : json["fare_classes"],
    fareFamily: json["fare_family"] == null ? null : json["fare_family"],
    lastSeen: json["last_seen"] == null ? null : DateTime.parse(json["last_seen"]),
    refreshTimestamp: json["refresh_timestamp"] == null ? null : DateTime.parse(json["refresh_timestamp"]),
    routeReturn: json["return"] == null ? null : json["return"],
    bagsRecheckRequired: json["bags_recheck_required"] == null ? null : json["bags_recheck_required"],
    guarantee: json["guarantee"] == null ? null : json["guarantee"],
    cityTo: json["cityTo"] == null ? null : json["cityTo"],
    cityFrom: json["cityFrom"] == null ? null : json["cityFrom"],
    cityCodeFrom: json["cityCodeFrom"] == null ? null : json["cityCodeFrom"],
    cityCodeTo: json["cityCodeTo"] == null ? null : json["cityCodeTo"],
    flyTo: json["flyTo"] == null ? null : json["flyTo"],
    flyFrom: json["flyFrom"] == null ? null : json["flyFrom"],
    airline: json["airline"] == null ? null : json["airline"],
    operatingCarrier: json["operating_carrier"] == null ? null : json["operating_carrier"],
    equipment: json["equipment"],
    flightNo: json["flight_no"] == null ? null : json["flight_no"],
    vehicleType: json["vehicle_type"] == null ? null : json["vehicle_type"],
    operatingFlightNo: json["operating_flight_no"] == null ? null : json["operating_flight_no"],
    localArrival: json["local_arrival"] == null ? null : DateTime.parse(json["local_arrival"]),
    utcArrival: json["utc_arrival"] == null ? null : DateTime.parse(json["utc_arrival"]),
    localDeparture: json["local_departure"] == null ? null : DateTime.parse(json["local_departure"]),
    utcDeparture: json["utc_departure"] == null ? null : DateTime.parse(json["utc_departure"]),
  );

  Map<String, dynamic> toMap() => {
    "fare_basis": fareBasis == null ? null : fareBasis,
    "fare_category": fareCategory == null ? null : fareCategory,
    "fare_classes": fareClasses == null ? null : fareClasses,
    "fare_family": fareFamily == null ? null : fareFamily,
    "last_seen": lastSeen == null ? null : lastSeen.toIso8601String(),
    "refresh_timestamp": refreshTimestamp == null ? null : refreshTimestamp.toIso8601String(),
    "return": routeReturn == null ? null : routeReturn,
    "bags_recheck_required": bagsRecheckRequired == null ? null : bagsRecheckRequired,
    "guarantee": guarantee == null ? null : guarantee,
    "cityTo": cityTo == null ? null : cityTo,
    "cityFrom": cityFrom == null ? null : cityFrom,
    "cityCodeFrom": cityCodeFrom == null ? null : cityCodeFrom,
    "cityCodeTo": cityCodeTo == null ? null : cityCodeTo,
    "flyTo": flyTo == null ? null : flyTo,
    "flyFrom": flyFrom == null ? null : flyFrom,
    "airline": airline == null ? null : airline,
    "operating_carrier": operatingCarrier == null ? null : operatingCarrier,
    "equipment": equipment,
    "flight_no": flightNo == null ? null : flightNo,
    "vehicle_type": vehicleType == null ? null : vehicleType,
    "operating_flight_no": operatingFlightNo == null ? null : operatingFlightNo,
    "local_arrival": localArrival == null ? null : localArrival.toIso8601String(),
    "utc_arrival": utcArrival == null ? null : utcArrival.toIso8601String(),
    "local_departure": localDeparture == null ? null : localDeparture.toIso8601String(),
    "utc_departure": utcDeparture == null ? null : utcDeparture.toIso8601String(),
  };
}

class ModalityDetails {
  ModalityDetails({
    this.code,
    this.name,
    this.duration,
    this.questions,
    this.amountsFromWithMarkup,
    this.rates,
    this.amountUnitType,
    this.uniqueIdentifier,
    this.comments,
    this.supplierInformation,
    this.providerInformation,
    this.destinationCode,
    this.contract,
    this.languages,
    this.amountsFrom,
  });

  String code;
  String name;
  ModalityDetailsDuration duration;
  List<Question> questions;
  List<AmountsFrom> amountsFromWithMarkup;
  List<Rate> rates;
  String amountUnitType;
  String uniqueIdentifier;
  List<Comment> comments;
  SupplierInformation supplierInformation;
  ProviderInformation providerInformation;
  String destinationCode;
  Contract contract;
  List<dynamic> languages;
  List<AmountsFrom> amountsFrom;

  factory ModalityDetails.fromJson(String str) => ModalityDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModalityDetails.fromMap(Map<String, dynamic> json) => ModalityDetails(
    code: json["code"] == null ? null : json["code"],
    name: json["name"] == null ? null : json["name"],
    duration: json["duration"] == null ? null : ModalityDetailsDuration.fromMap(json["duration"]),
    questions: json["questions"] == null ? null : List<Question>.from(json["questions"].map((x) => Question.fromMap(x))),
    amountsFromWithMarkup: json["amountsFromWithMarkup"] == null ? null : List<AmountsFrom>.from(json["amountsFromWithMarkup"].map((x) => AmountsFrom.fromMap(x))),
    rates: json["rates"] == null ? null : List<Rate>.from(json["rates"].map((x) => Rate.fromMap(x))),
    amountUnitType: json["amountUnitType"] == null ? null : json["amountUnitType"],
    uniqueIdentifier: json["uniqueIdentifier"] == null ? null : json["uniqueIdentifier"],
    comments: json["comments"] == null ? null : List<Comment>.from(json["comments"].map((x) => Comment.fromMap(x))),
    supplierInformation: json["supplierInformation"] == null ? null : SupplierInformation.fromMap(json["supplierInformation"]),
    providerInformation: json["providerInformation"] == null ? null : ProviderInformation.fromMap(json["providerInformation"]),
    destinationCode: json["destinationCode"] == null ? null : json["destinationCode"],
    contract: json["contract"] == null ? null : Contract.fromMap(json["contract"]),
    languages: json["languages"] == null ? null : List<dynamic>.from(json["languages"].map((x) => x)),
    amountsFrom: json["amountsFrom"] == null ? null : List<AmountsFrom>.from(json["amountsFrom"].map((x) => AmountsFrom.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "code": code == null ? null : code,
    "name": name == null ? null : name,
    "duration": duration == null ? null : duration.toMap(),
    "questions": questions == null ? null : List<dynamic>.from(questions.map((x) => x.toMap())),
    "amountsFromWithMarkup": amountsFromWithMarkup == null ? null : List<dynamic>.from(amountsFromWithMarkup.map((x) => x.toMap())),
    "rates": rates == null ? null : List<dynamic>.from(rates.map((x) => x.toMap())),
    "amountUnitType": amountUnitType == null ? null : amountUnitType,
    "uniqueIdentifier": uniqueIdentifier == null ? null : uniqueIdentifier,
    "comments": comments == null ? null : List<dynamic>.from(comments.map((x) => x.toMap())),
    "supplierInformation": supplierInformation == null ? null : supplierInformation.toMap(),
    "providerInformation": providerInformation == null ? null : providerInformation.toMap(),
    "destinationCode": destinationCode == null ? null : destinationCode,
    "contract": contract == null ? null : contract.toMap(),
    "languages": languages == null ? null : List<dynamic>.from(languages.map((x) => x)),
    "amountsFrom": amountsFrom == null ? null : List<dynamic>.from(amountsFrom.map((x) => x.toMap())),
  };
}

class AmountsFrom {
  AmountsFrom({
    this.paxType,
    this.ageFrom,
    this.ageTo,
    this.amount,
    this.boxOfficeAmount,
    this.mandatoryApplyAmount,
    this.displayRateInfoWithMarkup,
  });

  PaxType paxType;
  int ageFrom;
  int ageTo;
  double amount;
  double boxOfficeAmount;
  String mandatoryApplyAmount;
  DisplayRateInfoWithMarkup displayRateInfoWithMarkup;

  factory AmountsFrom.fromJson(String str) => AmountsFrom.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AmountsFrom.fromMap(Map<String, dynamic> json) => AmountsFrom(
    paxType: json["paxType"] == null ? null : paxTypeValues.map[json["paxType"]],
    ageFrom: json["ageFrom"] == null ? null : json["ageFrom"],
    ageTo: json["ageTo"] == null ? null : json["ageTo"],
    amount: json["amount"] == null ? null : json["amount"].toDouble(),
    boxOfficeAmount: json["boxOfficeAmount"] == null ? null : json["boxOfficeAmount"].toDouble(),
    mandatoryApplyAmount: json["mandatoryApplyAmount"] == null ? null : json["mandatoryApplyAmount"],
    displayRateInfoWithMarkup: json["displayRateInfoWithMarkup"] == null ? null : DisplayRateInfoWithMarkup.fromMap(json["displayRateInfoWithMarkup"]),
  );

  Map<String, dynamic> toMap() => {
    "paxType": paxType == null ? null : paxTypeValues.reverse[paxType],
    "ageFrom": ageFrom == null ? null : ageFrom,
    "ageTo": ageTo == null ? null : ageTo,
    "amount": amount == null ? null : amount,
    "boxOfficeAmount": boxOfficeAmount == null ? null : boxOfficeAmount,
    "mandatoryApplyAmount": mandatoryApplyAmount == null ? null : mandatoryApplyAmount,
    "displayRateInfoWithMarkup": displayRateInfoWithMarkup == null ? null : displayRateInfoWithMarkup.toMap(),
  };
}

enum PaxType { ADULT, CHILD }

final paxTypeValues = EnumValues({
  "ADULT": PaxType.ADULT,
  "CHILD": PaxType.CHILD
});

class Comment {
  Comment({
    this.type,
    this.text,
  });

  String type;
  String text;

  factory Comment.fromJson(String str) => Comment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
    type: json["type"] == null ? null : json["type"],
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toMap() => {
    "type": type == null ? null : type,
    "text": text == null ? null : text,
  };
}

class Contract {
  Contract({
    this.incomingOffice,
    this.code,
    this.name,
  });

  int incomingOffice;
  int code;
  String name;

  factory Contract.fromJson(String str) => Contract.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contract.fromMap(Map<String, dynamic> json) => Contract(
    incomingOffice: json["incomingOffice"] == null ? null : json["incomingOffice"],
    code: json["code"] == null ? null : json["code"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "incomingOffice": incomingOffice == null ? null : incomingOffice,
    "code": code == null ? null : code,
    "name": name == null ? null : name,
  };
}

class ModalityDetailsDuration {
  ModalityDetailsDuration({
    this.value,
    this.metric,
  });

  dynamic value;
  String metric;

  factory ModalityDetailsDuration.fromJson(String str) => ModalityDetailsDuration.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModalityDetailsDuration.fromMap(Map<String, dynamic> json) => ModalityDetailsDuration(
    value: json["value"] == null ? null : json["value"],
    metric: json["metric"] == null ? null : json["metric"],
  );

  Map<String, dynamic> toMap() => {
    "value": value == null ? null : value,
    "metric": metric == null ? null : metric,
  };
}

class ProviderInformation {
  ProviderInformation({
    this.name,
  });

  String name;

  factory ProviderInformation.fromJson(String str) => ProviderInformation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProviderInformation.fromMap(Map<String, dynamic> json) => ProviderInformation(
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
  };
}

class Question {
  Question({
    this.code,
    this.text,
    this.required,
  });

  String code;
  String text;
  String required;

  factory Question.fromJson(String str) => Question.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Question.fromMap(Map<String, dynamic> json) => Question(
    code: json["code"] == null ? null : json["code"],
    text: json["text"] == null ? null : json["text"],
    required: json["required"] == null ? null : json["required"],
  );

  Map<String, dynamic> toMap() => {
    "code": code == null ? null : code,
    "text": text == null ? null : text,
    "required": required == null ? null : required,
  };
}

class Rate {
  Rate({
    this.rateCode,
    this.rateClass,
    this.name,
    this.rateDetails,
  });

  String rateCode;
  String rateClass;
  String name;
  List<RateDetail> rateDetails;

  factory Rate.fromJson(String str) => Rate.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rate.fromMap(Map<String, dynamic> json) => Rate(
    rateCode: json["rateCode"] == null ? null : json["rateCode"],
    rateClass: json["rateClass"] == null ? null : json["rateClass"],
    name: json["name"] == null ? null : json["name"],
    rateDetails: json["rateDetails"] == null ? null : List<RateDetail>.from(json["rateDetails"].map((x) => RateDetail.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "rateCode": rateCode == null ? null : rateCode,
    "rateClass": rateClass == null ? null : rateClass,
    "name": name == null ? null : name,
    "rateDetails": rateDetails == null ? null : List<dynamic>.from(rateDetails.map((x) => x.toMap())),
  };
}

class RateDetail {
  RateDetail({
    this.rateKey,
    this.operationDatesWithMarkup,
    this.totalAmountWithMarkup,
    this.paxAmountsWithMarkup,
    this.tpa,
    this.tpaName,
    this.options,
  });

  String rateKey;
  List<OperationDatesWithMarkup> operationDatesWithMarkup;
  TotalAmountWithMarkup totalAmountWithMarkup;
  List<AmountsFrom> paxAmountsWithMarkup;
  int tpa;
  String tpaName;
  List<Option> options;

  factory RateDetail.fromJson(String str) => RateDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RateDetail.fromMap(Map<String, dynamic> json) => RateDetail(
    rateKey: json["rateKey"] == null ? null : json["rateKey"],
    operationDatesWithMarkup: json["operationDatesWithMarkup"] == null ? null : List<OperationDatesWithMarkup>.from(json["operationDatesWithMarkup"].map((x) => OperationDatesWithMarkup.fromMap(x))),
    totalAmountWithMarkup: json["totalAmountWithMarkup"] == null ? null : TotalAmountWithMarkup.fromMap(json["totalAmountWithMarkup"]),
    paxAmountsWithMarkup: json["paxAmountsWithMarkup"] == null ? null : List<AmountsFrom>.from(json["paxAmountsWithMarkup"].map((x) => AmountsFrom.fromMap(x))),
    tpa: json["tpa"] == null ? null : json["tpa"],
    tpaName: json["tpaName"] == null ? null : json["tpaName"],
    options: json["options"] == null ? null : List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "rateKey": rateKey == null ? null : rateKey,
    "operationDatesWithMarkup": operationDatesWithMarkup == null ? null : List<dynamic>.from(operationDatesWithMarkup.map((x) => x.toMap())),
    "totalAmountWithMarkup": totalAmountWithMarkup == null ? null : totalAmountWithMarkup.toMap(),
    "paxAmountsWithMarkup": paxAmountsWithMarkup == null ? null : List<dynamic>.from(paxAmountsWithMarkup.map((x) => x.toMap())),
    "tpa": tpa == null ? null : tpa,
    "tpaName": tpaName == null ? null : tpaName,
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toMap())),
  };
}

class OperationDatesWithMarkup {
  OperationDatesWithMarkup({
    this.from,
    this.to,
    this.cancellationPolicies,
  });

  DateTime from;
  DateTime to;
  List<CancellationPolicy> cancellationPolicies;

  factory OperationDatesWithMarkup.fromJson(String str) => OperationDatesWithMarkup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OperationDatesWithMarkup.fromMap(Map<String, dynamic> json) => OperationDatesWithMarkup(
    from: json["from"] == null ? null : DateTime.parse(json["from"]),
    to: json["to"] == null ? null : DateTime.parse(json["to"]),
    cancellationPolicies: json["cancellationPolicies"] == null ? null : List<CancellationPolicy>.from(json["cancellationPolicies"].map((x) => CancellationPolicy.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "from": from == null ? null : "${from.year.toString().padLeft(4, '0')}-${from.month.toString().padLeft(2, '0')}-${from.day.toString().padLeft(2, '0')}",
    "to": to == null ? null : "${to.year.toString().padLeft(4, '0')}-${to.month.toString().padLeft(2, '0')}-${to.day.toString().padLeft(2, '0')}",
    "cancellationPolicies": cancellationPolicies == null ? null : List<dynamic>.from(cancellationPolicies.map((x) => x.toMap())),
  };
}

class CancellationPolicy {
  CancellationPolicy({
    this.dateFrom,
    this.amount,
  });

  DateTime dateFrom;
  double amount;

  factory CancellationPolicy.fromJson(String str) => CancellationPolicy.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CancellationPolicy.fromMap(Map<String, dynamic> json) => CancellationPolicy(
    dateFrom: json["dateFrom"] == null ? null : DateTime.parse(json["dateFrom"]),
    amount: json["amount"] == null ? null : json["amount"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "dateFrom": dateFrom == null ? null : dateFrom.toIso8601String(),
    "amount": amount == null ? null : amount,
  };
}

class TotalAmountWithMarkup {
  TotalAmountWithMarkup({
    this.displayRateInfoWithMarkup,
    this.boxOfficeAmount,
    this.mandatoryApplyAmount,
  });

  DisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  double boxOfficeAmount;
  String mandatoryApplyAmount;

  factory TotalAmountWithMarkup.fromJson(String str) => TotalAmountWithMarkup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TotalAmountWithMarkup.fromMap(Map<String, dynamic> json) => TotalAmountWithMarkup(
    displayRateInfoWithMarkup: json["displayRateInfoWithMarkup"] == null ? null : DisplayRateInfoWithMarkup.fromMap(json["displayRateInfoWithMarkup"]),
    boxOfficeAmount: json["boxOfficeAmount"] == null ? null : json["boxOfficeAmount"].toDouble(),
    mandatoryApplyAmount: json["mandatoryApplyAmount"] == null ? null : json["mandatoryApplyAmount"],
  );

  Map<String, dynamic> toMap() => {
    "displayRateInfoWithMarkup": displayRateInfoWithMarkup == null ? null : displayRateInfoWithMarkup.toMap(),
    "boxOfficeAmount": boxOfficeAmount == null ? null : boxOfficeAmount,
    "mandatoryApplyAmount": mandatoryApplyAmount == null ? null : mandatoryApplyAmount,
  };
}

class SupplierInformation {
  SupplierInformation({
    this.name,
    this.vatNumber,
  });

  String name;
  String vatNumber;

  factory SupplierInformation.fromJson(String str) => SupplierInformation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SupplierInformation.fromMap(Map<String, dynamic> json) => SupplierInformation(
    name: json["name"] == null ? null : json["name"],
    vatNumber: json["vatNumber"] == null ? null : json["vatNumber"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "vatNumber": vatNumber == null ? null : vatNumber,
  };
}

class Trip {
  Trip({
    this.startLocation,
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
    this.options,
  });

  Location startLocation;
  Location finishLocation;
  List<dynamic> additionalLocation;
  List<Passenger> passengers;
  int passengersNumber;
  String textTablet;
  String comment;
  int additionalChangeItinerary;
  int additionalWait;
  int fareOnTollRoad;
  SendParams sendParams;
  bool isRoundTrip;
  int tpa;
  TpaName tpaName;
  List<Option> options;

  factory Trip.fromJson(String str) => Trip.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Trip.fromMap(Map<String, dynamic> json) => Trip(
    startLocation: json["start_location"] == null ? null : Location.fromMap(json["start_location"]),
    finishLocation: json["finish_location"] == null ? null : Location.fromMap(json["finish_location"]),
    additionalLocation: json["additional_location"] == null ? null : List<dynamic>.from(json["additional_location"].map((x) => x)),
    passengers: json["passengers"] == null ? null : List<Passenger>.from(json["passengers"].map((x) => Passenger.fromMap(x))),
    passengersNumber: json["passengers_number"] == null ? null : json["passengers_number"],
    textTablet: json["text_tablet"] == null ? null : json["text_tablet"],
    comment: json["comment"] == null ? null : json["comment"],
    additionalChangeItinerary: json["additional_change_itinerary"] == null ? null : json["additional_change_itinerary"],
    additionalWait: json["additional_wait"] == null ? null : json["additional_wait"],
    fareOnTollRoad: json["fare_on_toll_road"] == null ? null : json["fare_on_toll_road"],
    sendParams: json["send_params"] == null ? null : SendParams.fromMap(json["send_params"]),
    isRoundTrip: json["is_round_trip"] == null ? null : json["is_round_trip"],
    tpa: json["tpa"] == null ? null : json["tpa"],
    tpaName: json["tpaName"] == null ? null : tpaNameValues.map[json["tpaName"]],
    options: json["options"] == null ? null : List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "start_location": startLocation == null ? null : startLocation.toMap(),
    "finish_location": finishLocation == null ? null : finishLocation.toMap(),
    "additional_location": additionalLocation == null ? null : List<dynamic>.from(additionalLocation.map((x) => x)),
    "passengers": passengers == null ? null : List<dynamic>.from(passengers.map((x) => x.toMap())),
    "passengers_number": passengersNumber == null ? null : passengersNumber,
    "text_tablet": textTablet == null ? null : textTablet,
    "comment": comment == null ? null : comment,
    "additional_change_itinerary": additionalChangeItinerary == null ? null : additionalChangeItinerary,
    "additional_wait": additionalWait == null ? null : additionalWait,
    "fare_on_toll_road": fareOnTollRoad == null ? null : fareOnTollRoad,
    "send_params": sendParams == null ? null : sendParams.toMap(),
    "is_round_trip": isRoundTrip == null ? null : isRoundTrip,
    "tpa": tpa == null ? null : tpa,
    "tpaName": tpaName == null ? null : tpaNameValues.reverse[tpaName],
    "options": options == null ? null : List<dynamic>.from(options.map((x) => x.toMap())),
  };
}

class Location {
  Location({
    this.flightNumber,
    this.terminalNumber,
    this.trainNumber,
    this.trainCarriageNumber,
    this.address,
    this.location,
    this.time,
  });

  String flightNumber;
  String terminalNumber;
  String trainNumber;
  String trainCarriageNumber;
  String address;
  String location;
  String time;

  factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    flightNumber: json["flight_number"] == null ? null : json["flight_number"],
    terminalNumber: json["terminal_number"] == null ? null : json["terminal_number"],
    trainNumber: json["train_number"] == null ? null : json["train_number"],
    trainCarriageNumber: json["train_carriage_number"] == null ? null : json["train_carriage_number"],
    address: json["address"] == null ? null : json["address"],
    location: json["location"] == null ? null : json["location"],
    time: json["time"] == null ? null : json["time"],
  );

  Map<String, dynamic> toMap() => {
    "flight_number": flightNumber == null ? null : flightNumber,
    "terminal_number": terminalNumber == null ? null : terminalNumber,
    "train_number": trainNumber == null ? null : trainNumber,
    "train_carriage_number": trainCarriageNumber == null ? null : trainCarriageNumber,
    "address": address == null ? null : address,
    "location": location == null ? null : location,
    "time": time == null ? null : time,
  };
}

class Passenger {
  Passenger({
    this.name,
    this.email,
    this.phone,
  });

  String name;
  String email;
  String phone;

  factory Passenger.fromJson(String str) => Passenger.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Passenger.fromMap(Map<String, dynamic> json) => Passenger(
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
  };
}

class SendParams {
  SendParams({
    this.sendClientVoucher,
    this.sendAdminVoucher,
    this.sendClientDoc,
    this.sendAdminDoc,
  });

  dynamic sendClientVoucher;
  dynamic sendAdminVoucher;
  dynamic sendClientDoc;
  dynamic sendAdminDoc;

  factory SendParams.fromJson(String str) => SendParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SendParams.fromMap(Map<String, dynamic> json) => SendParams(
    sendClientVoucher: json["send_client_voucher"],
    sendAdminVoucher: json["send_admin_voucher"],
    sendClientDoc: json["send_client_doc"],
    sendAdminDoc: json["send_admin_doc"],
  );

  Map<String, dynamic> toMap() => {
    "send_client_voucher": sendClientVoucher,
    "send_admin_voucher": sendAdminVoucher,
    "send_client_doc": sendClientDoc,
    "send_admin_doc": sendAdminDoc,
  };
}

enum TpaName { IWAY }

final tpaNameValues = EnumValues({
  "Iway": TpaName.IWAY
});

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
  int bookingMasterId;
  String firstname;
  String lastname;
  int gender;
  DateTime dob;
  String phoneNumber;
  String phoneNumberCode;
  String email;
  CountryEnum country;
  CountryCode countryCode;
  Address address;
  String passport;
  DateTime passportExpirationDate;
  dynamic relation;
  CountryCode nationality;
  double visaFee;
  String visaFeeReference;

  factory Contact.fromJson(String str) => Contact.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Contact.fromMap(Map<String, dynamic> json) => Contact(
    id: json["id"] == null ? null : json["id"],
    uid: json["uid"] == null ? null : json["uid"],
    bookingMasterId: json["bookingMasterId"] == null ? null : json["bookingMasterId"],
    firstname: json["firstname"] == null ? null : json["firstname"],
    lastname: json["lastname"] == null ? null : json["lastname"],
    gender: json["gender"] == null ? null : json["gender"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    phoneNumberCode: json["phoneNumberCode"] == null ? null : json["phoneNumberCode"],
    email: json["email"] == null ? null : json["email"],
    country: json["country"] == null ? null : countryEnumValues.map[json["country"]],
    countryCode: json["countryCode"] == null ? null : countryCodeValues.map[json["countryCode"]],
    address: json["address"] == null ? null : addressValues.map[json["address"]],
    passport: json["passport"] == null ? null : json["passport"],
    passportExpirationDate: json["passportExpirationDate"] == null ? null : DateTime.parse(json["passportExpirationDate"]),
    relation: json["relation"],
    nationality: json["nationality"] == null ? null : countryCodeValues.map[json["nationality"]],
    visaFee: json["visaFee"] == null ? null : json["visaFee"],
    visaFeeReference: json["visaFeeReference"] == null ? null : json["visaFeeReference"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "uid": uid == null ? null : uid,
    "bookingMasterId": bookingMasterId == null ? null : bookingMasterId,
    "firstname": firstname == null ? null : firstname,
    "lastname": lastname == null ? null : lastname,
    "gender": gender == null ? null : gender,
    "dob": dob == null ? null : dob.toIso8601String(),
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "phoneNumberCode": phoneNumberCode == null ? null : phoneNumberCode,
    "email": email == null ? null : email,
    "country": country == null ? null : countryEnumValues.reverse[country],
    "countryCode": countryCode == null ? null : countryCodeValues.reverse[countryCode],
    "address": address == null ? null : addressValues.reverse[address],
    "passport": passport == null ? null : passport,
    "passportExpirationDate": passportExpirationDate == null ? null : passportExpirationDate.toIso8601String(),
    "relation": relation,
    "nationality": nationality == null ? null : countryCodeValues.reverse[nationality],
    "visaFee": visaFee == null ? null : visaFee,
    "visaFeeReference": visaFeeReference == null ? null : visaFeeReference,
  };
}

enum Address { EMPTY, TEST_ADDRESS }

final addressValues = EnumValues({
  "": Address.EMPTY,
  "test address": Address.TEST_ADDRESS
});

enum CountryEnum { INDIA, COUNTRY_INDIA, AFGHANISTAN }

final countryEnumValues = EnumValues({
  "Afghanistan": CountryEnum.AFGHANISTAN,
  "India (????)": CountryEnum.COUNTRY_INDIA,
  "India": CountryEnum.INDIA
});

enum CountryCode { IN, COUNTRY_CODE_IN, AF }

final countryCodeValues = EnumValues({
  "AF": CountryCode.AF,
  "in": CountryCode.COUNTRY_CODE_IN,
  "IN": CountryCode.IN
});

class Errors {
  Errors();

  factory Errors.fromJson(String str) => Errors.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Errors.fromMap(Map<String, dynamic> json) => Errors(
  );

  Map<String, dynamic> toMap() => {
  };
}

enum PaymentMode { CARD }

final paymentModeValues = EnumValues({
  "CARD": PaymentMode.CARD
});

enum ResultStatus { MASTER_BOOKING_SUCCESS, MASTER_BOOKING_PENDING }

final resultStatusValues = EnumValues({
  "MASTER_BOOKING_PENDING": ResultStatus.MASTER_BOOKING_PENDING,
  "MASTER_BOOKING_SUCCESS": ResultStatus.MASTER_BOOKING_SUCCESS
});

enum UserType { BC }

final userTypeValues = EnumValues({
  "bc": UserType.BC
});

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
