
//
import '../search_transfers_response.dart';

class ReservationRequestData {
  int transaction;
  int tpa;

  String tpaName;
  List<Option> options;

  ReservationRequestData({this.transaction, this.tpa, this.tpaName, this.options});



  ReservationRequestData.fromJson(Map<String, dynamic> json) {
    transaction = json['bookingNumner'];
    tpa = json['tpa'];

    tpaName = json['tpaName'];
    options = json['options'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction'] = this.transaction;
    data['tpa'] = this.tpa;
    data['tpaName'] = this.tpaName;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toMap()).toList();
    }
    return data;
  }
}
//
//
//
//
//class TravellerDetails {
//  String firstname;
//  String lastname;
//  int gender;
//  String dob;
//  String phoneNumber;
//  String phoneNumberCode;
//  String email;
//  String country;
//  String countryCode;
//  String address;
//  String passport;
//  String passportExpirationDate;
//  String relation;
//  String nationality;
//  int visaFee;
//  String visaFeeReference;
//  bool isPrimary;
//
//  TravellerDetails(
//      {this.firstname,
//        this.lastname,
//        this.gender,
//        this.dob,
//        this.phoneNumber,
//        this.phoneNumberCode,
//        this.email,
//        this.country,
//        this.countryCode,
//        this.address,
//        this.passport,
//        this.passportExpirationDate,
//        this.relation,
//        this.nationality,
//        this.visaFee,
//        this.visaFeeReference,
//        this.isPrimary});
//
//  TravellerDetails.fromJson(Map<String, dynamic> json) {
//    firstname = json['firstname'];
//    lastname = json['lastname'];
//    gender = json['gender'];
//    dob = json['dob'];
//    phoneNumber = json['phoneNumber'];
//    phoneNumberCode = json['phoneNumberCode'];
//    email = json['email'];
//    country = json['country'];
//    countryCode = json['countryCode'];
//    address = json['address'];
//    passport = json['passport'];
//    passportExpirationDate = json['passportExpirationDate'];
//    relation = json['relation'];
//    nationality = json['nationality'];
//    visaFee = json['visaFee'];
//    visaFeeReference = json['visaFeeReference'];
//    isPrimary = json['isPrimary'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['firstname'] = this.firstname;
//    data['lastname'] = this.lastname;
//    data['gender'] = this.gender;
//    data['dob'] = this.dob;
//    data['phoneNumber'] = this.phoneNumber;
//    data['phoneNumberCode'] = this.phoneNumberCode;
//    data['email'] = this.email;
//    data['country'] = this.country;
//    data['countryCode'] = this.countryCode;
//    data['address'] = this.address;
//    data['passport'] = this.passport;
//    data['passportExpirationDate'] = this.passportExpirationDate;
//    data['relation'] = this.relation;
//    data['nationality'] = this.nationality;
//    data['visaFee'] = this.visaFee;
//    data['visaFeeReference'] = this.visaFeeReference;
//    data['isPrimary'] = this.isPrimary;
//    return data;
//  }
//}
//
//
//
//class PaymenRequest{
//
//  String bookinId;
//  String userId;
//  String userType;
//  double amount;
//  String currency;
//  String orderType;
//  String mode;
//  Card card;
//
//
//  PaymenRequest({this.bookinId ,this.userId,this.currency,
//    this.amount,this.card,this.mode,this.orderType,this.userType });
//}
//
//class Card {
//
//  String number;
//  String securityCode;
//  Expiry expiry;
//
//  Card({this.number,this.expiry,this.securityCode});
//
//
//}
//
//class Expiry {
//String year;
//String month;
//Expiry({this.month,this.year});
//
//}




class BookingRequest {
  String fromLocation;
  String toLocation;
  String flightorTrainNumber;
  String terminalNumber;
  int distance;
  int travelTime;
  String userId;
  String tenantId;
  String userType;
  String apiKey;
  String correlationId;
  String summaryInfo;
  String reservationDate;
  String returnDate;
  String reservationRequest;
  PaymentRequest paymentRequest;
  List<TravellerDetails> travellerDetails;
  String ibanNumber;
  int paymentMode;
  int tpaType;
  int serviceId;
  String serviceTypeCode;
  String provider;
  dynamic baseRate;
  dynamic taxAndOtherCharges;
  dynamic supplierBaseRate;
  dynamic oTATax;
  dynamic markup;
  dynamic totalAmount;
  dynamic totalAmountMarkup;
  bool supportCancellation;

  BookingRequest(
      {
        this.fromLocation,
        this.toLocation,
        this.flightorTrainNumber,
        this.terminalNumber,
        this.distance,
        this.travelTime,
        this.userId,
        this.tenantId,
        this.userType,
        this.apiKey,
        this.correlationId,
        this.summaryInfo,
        this.reservationDate,
        this.returnDate,
        this.reservationRequest,
        this.paymentRequest,
        this.travellerDetails,
        this.ibanNumber,
        this.paymentMode,
        this.tpaType,
        this.serviceId,
        this.serviceTypeCode,
        this.provider,
        this.baseRate,
        this.taxAndOtherCharges,
        this.supplierBaseRate,
        this.oTATax,
        this.markup,
        this.totalAmount,
        this.totalAmountMarkup,
        this.supportCancellation});

  BookingRequest.fromJson(Map<String, dynamic> json) {
    fromLocation = json['fromLocation'];
    toLocation = json['toLocation'];
    flightorTrainNumber = json['flightorTrainNumber'];
    terminalNumber = json['terminalNumber'];
    distance = json['distance'];
    travelTime = json['travelTime'];
    userId = json['userId'];
    tenantId = json['tenantId'];
    userType = json['userType'];
    apiKey = json['apiKey'];
    correlationId = json['correlationId'];
    summaryInfo = json['summaryInfo'];
    reservationDate = json['reservationDate'];
    returnDate = json['returnDate'];
    reservationRequest = json['reservationRequest'];
//        != null ?
//    new ReservationRequest.fromJson(json['reservationRequest'])
//        : null;
    paymentRequest = json['paymentRequest'] != null
        ? new PaymentRequest.fromJson(json['paymentRequest'])
        : null;
    if (json['travellerDetails'] != null) {
      travellerDetails = new List<TravellerDetails>();
      json['travellerDetails'].forEach((v) {
        travellerDetails.add(new TravellerDetails.fromJson(v));
      });
    }
    ibanNumber = json['ibanNumber'];
    paymentMode = json['paymentMode'];
    tpaType = json['tpaType'];
    serviceId = json['serviceId'];
    serviceTypeCode = json['serviceTypeCode'];
    provider = json['provider'];
    baseRate = json['baseRate'];
    taxAndOtherCharges = json['taxAndOtherCharges'];
    supplierBaseRate = json['supplierBaseRate'];
    oTATax = json['OTATax'];
    markup = json['Markup'];
    totalAmount = json['totalAmount'];
    totalAmountMarkup = json['totalAmountMarkup'];
    supportCancellation = json['supportCancellation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromLocation'] = this.fromLocation;
    data['toLocation'] = this.toLocation;
    data['flightorTrainNumber'] = this.flightorTrainNumber;
    data['terminalNumber'] = this.terminalNumber;
    data['distance'] = this.distance;
    data['travelTime'] = this.travelTime;
    data['userId'] = this.userId;
    data['tenantId'] = this.tenantId;
    data['userType'] = this.userType;
    data['apiKey'] = this.apiKey;
    data['correlationId'] = this.correlationId;
    data['summaryInfo'] = this.summaryInfo;
    data['reservationDate'] = this.reservationDate;
    data['returnDate'] = this.returnDate;
    data['reservationRequest'] = this.reservationRequest;
    if (this.paymentRequest != null) {
      data['paymentRequest'] = this.paymentRequest.toJson();
    }
    if (this.travellerDetails != null) {
      data['travellerDetails'] =
          this.travellerDetails.map((v) => v.toJson()).toList();
    }
    data['ibanNumber'] = this.ibanNumber;
    data['paymentMode'] = this.paymentMode;
    data['tpaType'] = this.tpaType;
    data['serviceId'] = this.serviceId;
    data['serviceTypeCode'] = this.serviceTypeCode;
    data['provider'] = this.provider;
    data['baseRate'] = this.baseRate;
    data['taxAndOtherCharges'] = this.taxAndOtherCharges;
    data['supplierBaseRate'] = this.supplierBaseRate;
    data['OTATax'] = this.oTATax;
    data['Markup'] = this.markup;
    data['totalAmount'] = this.totalAmount;
    data['totalAmountMarkup'] = this.totalAmountMarkup;
    data['supportCancellation'] = this.supportCancellation;
    return data;
  }
}

class PaymentRequest {
  String bookingId;
  String userId;
  String userType;
  double amount;
  String currency;
  String orderType;
  String mode;
  Card card;
  String serviceExtension;
  String invoiceType;

  PaymentRequest(
      {
        this.bookingId,
        this.userId,
        this.userType,
        this.amount,
        this.currency,
        this.orderType,
        this.mode,
        this.card,
        this.serviceExtension,
        this.invoiceType});

  PaymentRequest.fromJson(Map<String, dynamic> json) {
    bookingId = json['bookingId'];
    userId = json['userId'];
    userType = json['userType'];
    amount = json['amount'];
    currency = json['currency'];
    orderType = json['orderType'];
    mode = json['mode'];
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
    serviceExtension = json['serviceExtension'];
    invoiceType = json['invoiceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingId'] = this.bookingId;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['orderType'] = this.orderType;
    data['mode'] = this.mode;
    if (this.card != null) {
      data['card'] = this.card.toJson();
    }
    data['serviceExtension'] = this.serviceExtension;
    data['invoiceType'] = this.invoiceType;
    return data;
  }
}

class Card {
  Expiry expiry;
  String number;
  String securityCode;

  Card({this.expiry, this.number, this.securityCode});

  Card.fromJson(Map<String, dynamic> json) {
    expiry =
    json['expiry'] != null ? new Expiry.fromJson(json['expiry']) : null;
    number = json['number'];
    securityCode = json['securityCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.expiry != null) {
      data['expiry'] = this.expiry.toJson();
    }
    data['number'] = this.number;
    data['securityCode'] = this.securityCode;
    return data;
  }
}

class Expiry {
  String month;
  String year;

  Expiry({this.month, this.year});

  Expiry.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['year'] = this.year;
    return data;
  }
}

class TravellerDetails {
  String firstname;
  String lastname;
  int gender;
  String dob;
  String phoneNumber;
  String phoneNumberCode;
  String email;
  String country;
  String countryCode;
  String address;
  String passport;
  String passportExpirationDate;
  String relation;
  String nationality;
  bool isPrimary;

  TravellerDetails(
      {this.firstname,
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
        this.isPrimary});

  TravellerDetails.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    gender = json['gender'];
    dob = json['dob'];
    phoneNumber = json['phoneNumber'];
    phoneNumberCode = json['phoneNumberCode'];
    email = json['email'];
    country = json['country'];
    countryCode = json['countryCode'];
    address = json['address'];
    passport = json['passport'];
    passportExpirationDate = json['passportExpirationDate'];
    relation = json['relation'];
    nationality = json['nationality'];
    isPrimary = json['isPrimary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneNumberCode'] = this.phoneNumberCode;
    data['email'] = this.email;
    data['country'] = this.country;
    data['countryCode'] = this.countryCode;
    data['address'] = this.address;
    data['passport'] = this.passport;
    data['passportExpirationDate'] = this.passportExpirationDate;
    data['relation'] = this.relation;
    data['nationality'] = this.nationality;
    data['isPrimary'] = this.isPrimary;
    return data;
  }
}
class ReservationRequest {
  int transaction;
  int tpa;
//  String bookingNumner;
  String tpaName;
  List<Option> options;

  ReservationRequest({
 //   this.bookingNumner,
    this.transaction, this.tpa, this.tpaName, this.options});



  ReservationRequest.fromJson(Map<String, dynamic> json) {
    transaction = json['bookingNumner'];
    tpa = json['tpa'];
   // bookingNumner = json['bookingNumner'];
    tpaName = json['tpaName'];
    options = json['options'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

   // data['bookingNumner'] = this.bookingNumner;
    data['transaction'] = this.transaction;
    data['tpa'] = this.tpa;
    data['tpaName'] = this.tpaName;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toMap()).toList();
    }
    return data;
  }
}