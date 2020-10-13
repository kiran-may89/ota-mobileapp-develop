import '../traveller_info_model.dart';

class FlightSaveBookingRequest {
  int bags;
  String currency;
  String lang;
  String locale;
  List<TravelInfoModel> passengers;
  String tpa;
  List options;

  FlightSaveBookingRequest(
      {this.bags,
        this.currency,
        this.lang,
        this.locale,
        this.passengers,
        this.tpa,
        this.options});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bags'] = this.bags;
    data['currency'] = this.currency;
    data['lang'] = this.lang;
    data['locale'] = this.locale;
    if (this.passengers != null) {
      data['passengers'] = this.passengers.map((v) => v.toJson()).toList();
    }
    data['tpa'] = this.tpa;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Passengers {
  String title;
  String email;
  String surname;
  String name;
  String phone;
  String birthday;
  String nationality;
  String category;
  String cardno;
  String expiration;
  Null holdBags;

  Passengers(
      {this.title,
        this.email,
        this.surname,
        this.name,
        this.phone,
        this.birthday,
        this.nationality,
        this.category,
        this.cardno,
        this.expiration,
        this.holdBags});

  Passengers.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    email = json['email'];
    surname = json['surname'];
    name = json['name'];
    phone = json['phone'];
    birthday = json['birthday'];
    nationality = json['nationality'];
    category = json['category'];
    cardno = json['cardno'];
    expiration = json['expiration'];
    holdBags = json['hold_bags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['email'] = this.email;
    data['surname'] = this.surname;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['nationality'] = this.nationality;
    data['category'] = this.category;
    data['cardno'] = this.cardno;
    data['expiration'] = this.expiration;
    data['hold_bags'] = this.holdBags;
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