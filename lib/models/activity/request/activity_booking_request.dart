import 'package:ota/generated/json/base/json_convert_content.dart';
import 'package:ota/models/activity/prebooking_response_entity.dart';
import 'package:ota/models/activity/small_details_response.dart';

class ActivityBookingRequest {
  String location;
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
  List<ActivityTravellerDetails> travellerDetails;
  String ibanNumber;
  int paymentMode;
  int tpaType;
  int serviceId;
  String serviceTypeCode;
  String provider;
  double baseRate;
  double taxAndOtherCharges;
  double supplierBaseRate;
  double oTATax;
  double markup;
  double totalAmount;
  double totalAmountMarkup;
  ActivityBookingRequest(
      {this.location,
        this.userId,
        this.tenantId,
        this.userType,
        this.apiKey,
        this.correlationId,
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
        this.totalAmountMarkup,this.summaryInfo,this.returnDate,this.reservationDate});

  ActivityBookingRequest.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    userId = json['userId'];
    tenantId = json['tenantId'];
    userType = json['userType'];
    apiKey = json['apiKey'];
    correlationId = json['correlationId'];
    summaryInfo = json['summaryInfo'];
    reservationDate = json['reservationDate'];
    returnDate = json['returnDate'];
    reservationRequest = json['reservationRequest'];
    paymentRequest = json['paymentRequest'] != null
        ? new PaymentRequest.fromJson(json['paymentRequest'])
        : null;
    if (json['travellerDetails'] != null) {
      travellerDetails = new List<ActivityTravellerDetails>();
      json['travellerDetails'].forEach((v) {
        travellerDetails.add(new ActivityTravellerDetails.fromJson(v));
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = this.location;
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

  PaymentRequest(
      {this.bookingId,
        this.userId,
        this.userType,
        this.amount,
        this.currency,
        this.orderType,
        this.mode,
        this.card});

  PaymentRequest.fromJson(Map<String, dynamic> json) {
    bookingId = json['bookingId'];
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

class ActivityTravellerDetails {
  String firstname;
  String lastname;
  int gender;
  String dob;
  String phoneNumber;
  String phoneNumberCode;
  String email;
  String countryCode;
  String address;
  String passport;
  String passportExpirationDate;
  String relation;
  String country;
  String nationality;
  int visaFee;
  String visaFeeReference;
  bool isPrimary;

  ActivityTravellerDetails(
      {this.firstname,
        this.lastname,
        this.gender,
        this.dob,
        this.phoneNumber,
        this.phoneNumberCode,
        this.email,
        this.countryCode,
        this.address,
        this.passport,
        this.passportExpirationDate,
        this.relation,
        this.country,
        this.nationality,
        this.visaFee,
        this.visaFeeReference,
        this.isPrimary});

  ActivityTravellerDetails.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    gender = json['gender'];
    dob = json['dob'];
    phoneNumber = json['phoneNumber'];
    phoneNumberCode = json['phoneNumberCode'];
    email = json['email'];
    countryCode = json['countryCode'];
    address = json['address'];
    passport = json['passport'];
    passportExpirationDate = json['passportExpirationDate'];
    relation = json['relation'];
    country = json['country'];
    nationality = json['nationality'];
    visaFee = json['visaFee'];
    visaFeeReference = json['visaFeeReference'];
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
    data['countryCode'] = this.countryCode;
    data['address'] = this.address;
    data['passport'] = this.passport;
    data['passportExpirationDate'] = this.passportExpirationDate;
    data['relation'] = this.relation;
    data['country'] = this.country;
    data['nationality'] = this.nationality;
    data['visaFee'] = this.visaFee;
    data['visaFeeReference'] = this.visaFeeReference;
    data['isPrimary'] = this.isPrimary;
    return data;
  }
}



class OptionsModified {
  String language;
  String reference;
  int tpa;
  String tpaName;
  List<SmallDetailsResponseOptions> options;

  OptionsModified(
      {this.language, this.reference, this.tpa, this.tpaName, this.options});

  OptionsModified.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    reference = json['reference'];
    tpa = json['tpa'];
    tpaName = json['tpaName'];
    if (json['options'] != null) {
      options = new List<SmallDetailsResponseOptions>();
      json['options'].forEach((v) {
        options.add(new SmallDetailsResponseOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['reference'] = this.reference;
    data['tpa'] = this.tpa;
    data['tpaName'] = this.tpaName;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionsData with JsonConvert<OptionsData>{
  String key;
  String value;

  OptionsData({this.key, this.value});

  OptionsData.fromJson(Map<String, dynamic> json) {
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