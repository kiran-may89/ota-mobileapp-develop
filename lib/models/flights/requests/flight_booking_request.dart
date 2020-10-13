


import '../check_availability_response.dart';

class FlightBookingRequest {
  String reservationNumber;
  String userId;
  String tenantId;
  String userType;
  String correlationId;
  String reservationDate;
  String returnDate;
  String summaryInfo;
  String reservationRequest;
  PaymentRequest paymentRequest;
  List<TravellerDetails> travellerDetails;
  Null ibanNumber;
  int paymentMode;
  int tpaType;
  int serviceId;
  String serviceTypeCode;
  String provider;
  bool supportCancellation;
  String baseRate;
  String taxAndOtherCharges;
  String supplierBaseRate;
  String oTATax;
  String markup;
  String totalAmount;
  String totalAmountMarkup;

  FlightBookingRequest(
      {this.reservationNumber,
        this.userId,
        this.tenantId,
        this.userType,
        this.correlationId,
        this.reservationDate,
        this.returnDate,
        this.summaryInfo,
        this.reservationRequest,
        this.paymentRequest,
        this.travellerDetails,
        this.ibanNumber,
        this.paymentMode,
        this.tpaType,
        this.serviceId,
        this.serviceTypeCode,
        this.provider,
        this.supportCancellation,
        this.baseRate,
        this.taxAndOtherCharges,
        this.supplierBaseRate,
        this.oTATax,
        this.markup,
        this.totalAmount,
        this.totalAmountMarkup});

  FlightBookingRequest.fromJson(Map<String, dynamic> json) {
    reservationNumber = json['reservationNumber'];
    userId = json['userId'];
    tenantId = json['tenantId'];
    userType = json['userType'];
    correlationId = json['correlationId'];
    reservationDate = json['reservationDate'];
    returnDate = json['returnDate'];
    summaryInfo = json['summaryInfo'];
    reservationRequest = json['reservationRequest'];
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
    supportCancellation = json['supportCancellation'];
    baseRate = json['baseRate'];
    taxAndOtherCharges = json['taxAndOtherCharges'];
    supplierBaseRate = json['supplierBaseRate'];
    oTATax = json['OTATax'];
    markup = json['Markup'];
    totalAmount = json['totalAmount'];
    totalAmountMarkup = json['totalAmountMarkup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reservationNumber'] = this.reservationNumber;
    data['userId'] = this.userId;
    data['tenantId'] = this.tenantId;
    data['userType'] = this.userType;
    data['correlationId'] = this.correlationId;
    data['reservationDate'] = this.reservationDate;
    data['returnDate'] = this.returnDate;
    data['summaryInfo'] = this.summaryInfo;
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
    data['supportCancellation'] = this.supportCancellation;
    data['baseRate'] = this.baseRate;
    data['taxAndOtherCharges'] = this.taxAndOtherCharges;
    data['supplierBaseRate'] = this.supplierBaseRate;
    data['OTATax'] = this.oTATax;
    data['Markup'] = this.markup;
    data['totalAmount'] = this.totalAmount;
    data['totalAmountMarkup'] = this.totalAmountMarkup;
    return data;
  }
}

class PaymentRequest {
  String userId;
  String userType;
  String amount;
  String currency;
  String orderType;
  String mode;
  Card card;

  PaymentRequest(
      {this.userId,
        this.userType,
        this.amount,
        this.currency,
        this.orderType,
        this.mode,
        this.card});

  PaymentRequest.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userType = json['userType'];
    amount = json['amount'];
    currency = json['currency'];
    orderType = json['orderType'];
    mode = json['mode'];
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['orderType'] = this.orderType;
    data['mode'] = this.mode;
    if (this.card != null) {
      data['card'] = this.card.toJson();
    }
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
  String nationality;
  String passport;
  String relation;
  String email;
  String address;
  bool isPrimary;
  String passportExpirationDate;
  String country;
  String countryCode;

  TravellerDetails(
      {this.firstname,
        this.lastname,
        this.gender,
        this.dob,
        this.phoneNumber,
        this.phoneNumberCode,
        this.nationality,
        this.passport,
        this.relation,
        this.email,
        this.address,
        this.isPrimary,
        this.passportExpirationDate,
        this.country,
        this.countryCode});

  TravellerDetails.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    gender = json['gender'];
    dob = json['dob'];
    phoneNumber = json['phoneNumber'];
    phoneNumberCode = json['phoneNumberCode'];
    nationality = json['nationality'];
    passport = json['passport'];
    relation = json['relation'];
    email = json['email'];
    address = json['address'];
    isPrimary = json['isPrimary'];
    passportExpirationDate = json['passportExpirationDate'];
    country = json['country'];
    countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['phoneNumber'] = this.phoneNumber;
    data['phoneNumberCode'] = this.phoneNumberCode;
    data['nationality'] = this.nationality;
    data['passport'] = this.passport;
    data['relation'] = this.relation;
    data['email'] = this.email;
    data['address'] = this.address;
    data['isPrimary'] = this.isPrimary;
    data['passportExpirationDate'] = this.passportExpirationDate;
    data['country'] = this.country;
    data['countryCode'] = this.countryCode;
    return data;
  }
}



class ReservationRequest{


  String tpa;

  List<Option> options;

  ReservationRequest({this.tpa,this.options});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tpa'] = this.tpa;

    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }

    return data;
  }


}