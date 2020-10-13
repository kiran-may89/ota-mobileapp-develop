import 'package:ota/models/transfers/requests/reservation_request.dart';
import 'package:ota/models/transfers/requests/transfer_summary_info.dart';

class TransferBookingResponse {
  TransferBookingResponse({
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

  factory TransferBookingResponse.fromMap(Map<String, dynamic> json) => TransferBookingResponse(
    version: json["version"],
    message: json["message"],
    isError: json["isError"],
    responseException: json["responseException"],
    result: Result.fromMap(json["result"]),
  );

  Map<String, dynamic> toMap() => {
    "version": version,
    "message": message,
    "isError": isError,
    "responseException": responseException,
    "result": result.toMap(),
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

  dynamic id;
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
  TravellerDetails contact;
  Errors errors;
  dynamic paymentDetails;
  dynamic visaStatus;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
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
    bookings: List<Booking>.from(json["bookings"].map((x) => Booking.fromMap(x))),
    contact: TravellerDetails.fromJson(json["contact"]),
    errors: Errors.fromMap(json["errors"]),
    paymentDetails: json["paymentDetails"],
    visaStatus: json["visaStatus"],
  );

  Map<String, dynamic> toMap() => {
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
    "bookings": List<dynamic>.from(bookings.map((x) => x.toMap())),
    "contact": contact.toJson(),
    "errors": errors.toMap(),
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
  String reservationDate;
  dynamic returnDate;
  String bookingDate;
  dynamic trackToken;
  dynamic logToken;
  String invoicePath;
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
  TransferSummaryInfo summaryInfo;
  List<dynamic> travellers;
  dynamic bookingCancellation;
  dynamic bookingInfoPath;
  bool isManualCancellation;

  factory Booking.fromMap(Map<String, dynamic> json) => Booking(
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
    summaryInfo: TransferSummaryInfo.fromJson(json["summaryInfo"]),
    travellers: List<dynamic>.from(json["travellers"].map((x) => x)),
    bookingCancellation: json["bookingCancellation"],
    bookingInfoPath: json["bookingInfoPath"],
    isManualCancellation: json["isManualCancellation"],
  );

  Map<String, dynamic> toMap() => {
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



class Errors {
  Errors();

  factory Errors.fromMap(Map<String, dynamic> json) => Errors(
  );

  Map<String, dynamic> toMap() => {
  };
}
