
import 'dart:convert';

class TransferSearchResponse {
  TransferSearchResponse({
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

  factory TransferSearchResponse.fromMap(Map<String, dynamic> json) => TransferSearchResponse(
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
    this.googleMetrix,
    this.vechiles,
  });

  GoogleMetrix googleMetrix;
  List<Vechile> vechiles;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    googleMetrix: GoogleMetrix.fromMap(json["googleMetrix"]),
    vechiles: List<Vechile>.from(json["vechiles"].map((x) => Vechile.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "googleMetrix": googleMetrix.toMap(),
    "vechiles": List<dynamic>.from(vechiles.map((x) => x.toMap())),
  };
}

class GoogleMetrix {
  GoogleMetrix({
    this.distance,
    this.duration,
    this.status,
  });

  Distance distance;
  Distance duration;
  String status;

  factory GoogleMetrix.fromMap(Map<String, dynamic> json) => GoogleMetrix(
    distance: Distance.fromMap(json["distance"]),
    duration: Distance.fromMap(json["duration"]),
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "distance": distance.toMap(),
    "duration": duration.toMap(),
    "status": status,
  };
}

class Distance {
  Distance({
    this.text,
    this.value,
  });

  String text;
  int value;

  factory Distance.fromMap(Map<String, dynamic> json) => Distance(
    text: json["text"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "text": text,
    "value": value,
  };
}

class Vechile {
  Vechile({
    this.tpaPriceId,
    this.tpaReversePriceId,
    this.price,
    this.reversePrice,
    this.displayRateInfoWithMarkup,
    this.reverseDisplayRateInfoWithMarkup,
    this.currency,
    this.serviceId,
    this.carClass,
    this.allowableSubaddress,
    this.priceSubaddress,
    this.displayRateInfoWithMarkupSubaddress,
    this.cancellationTime,
    this.type,
    this.minimumDuration,
    this.startPlace,
    this.finishPlace,
    this.tpa,
    this.tpaName,
    this.options,
  });

  String tpaPriceId;
  String tpaReversePriceId;
  double price;
  double reversePrice;
  DisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  DisplayRateInfoWithMarkup reverseDisplayRateInfoWithMarkup;
  String currency;
  int serviceId;
  CarClass carClass;
  int allowableSubaddress;
  double priceSubaddress;
  DisplayRateInfoWithMarkup displayRateInfoWithMarkupSubaddress;
  int cancellationTime;
  int type;
  int minimumDuration;
  Place startPlace;
  Place finishPlace;
  int tpa;
  String tpaName;
  List<Option> options;

  factory Vechile.fromMap(Map<String, dynamic> json) => Vechile(
    tpaPriceId: json["tpa_price_id"],
    tpaReversePriceId: json["tpa_reverse_price_id"],
    price: json["price"].toDouble(),
    reversePrice: json["reverse_price"].toDouble(),
    displayRateInfoWithMarkup: DisplayRateInfoWithMarkup.fromMap(json["displayRateInfoWithMarkup"]),
    reverseDisplayRateInfoWithMarkup: DisplayRateInfoWithMarkup.fromMap(json["reverse_displayRateInfoWithMarkup"]),
    currency: json["currency"],
    serviceId: json["service_id"],
    carClass: CarClass.fromMap(json["car_class"]),
    allowableSubaddress: json["allowable_subaddress"],
    priceSubaddress: json["price_subaddress"].toDouble(),
    displayRateInfoWithMarkupSubaddress: DisplayRateInfoWithMarkup.fromMap(json["displayRateInfoWithMarkup_subaddress"]),
    cancellationTime: json["cancellation_time"],
    type: json["type"],
    minimumDuration: json["minimum_duration"],
    startPlace: Place.fromMap(json["start_place"]),
    finishPlace: Place.fromMap(json["finish_place"]),
    tpa: json["tpa"],
    tpaName: json["tpaName"],
    options: List<Option>.from(json["options"].map((x) => Option.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "tpa_price_id": tpaPriceId,
    "tpa_reverse_price_id": tpaReversePriceId,
    "price": price,
    "reverse_price": reversePrice,
    "displayRateInfoWithMarkup": displayRateInfoWithMarkup.toMap(),
    "reverse_displayRateInfoWithMarkup": reverseDisplayRateInfoWithMarkup.toMap(),
    "currency": currency,
    "service_id": serviceId,
    "car_class": carClass.toMap(),
    "allowable_subaddress": allowableSubaddress,
    "price_subaddress": priceSubaddress,
    "displayRateInfoWithMarkup_subaddress": displayRateInfoWithMarkupSubaddress.toMap(),
    "cancellation_time": cancellationTime,
    "type": type,
    "minimum_duration": minimumDuration,
    "start_place": startPlace.toMap(),
    "finish_place": finishPlace.toMap(),
    "tpa": tpa,
    "tpaName": tpaName,
    "options": List<dynamic>.from(options.map((x) => x.toMap())),
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
  String title;
  List<String> models;
  String photo;
  int capacity;

  factory CarClass.fromMap(Map<String, dynamic> json) => CarClass(
    carClassId: json["car_class_id"],
    title: json["title"],
    models: List<String>.from(json["models"].map((x) => x)),
    photo: json["photo"],
    capacity: json["capacity"],
  );

  Map<String, dynamic> toMap() => {
    "car_class_id": carClassId,
    "title": title,
    "models": List<dynamic>.from(models.map((x) => x)),
    "photo": photo,
    "capacity": capacity,
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

  factory DisplayRateInfoWithMarkup.fromMap(Map<String, dynamic> json) => DisplayRateInfoWithMarkup(
    totalPriceWithMarkup: json["totalPriceWithMarkup"].toDouble(),
    baseRate: json["baseRate"].toDouble(),
    taxAndOtherCharges: json["taxAndOtherCharges"].toDouble(),
    otaTax: json["otaTax"].toDouble(),
    markup: json["markup"].toDouble(),
    supplierBaseRate: json["supplierBaseRate"].toDouble(),
    supplierTotalCost: json["supplierTotalCost"].toDouble(),
    currency: json["currency"] == null ? null : json["currency"],
  );

  Map<String, dynamic> toMap() => {
    "totalPriceWithMarkup": totalPriceWithMarkup,
    "baseRate": baseRate,
    "taxAndOtherCharges": taxAndOtherCharges,
    "otaTax": otaTax,
    "markup": markup,
    "supplierBaseRate": supplierBaseRate,
    "supplierTotalCost": supplierTotalCost,
    "currency": currency == null ? null : currency,
  };
}

class Place {
  Place({
    this.placeId,
    this.title,
    this.type,
    this.typeTitle,
    this.terminal,
  });

  int placeId;
  String title;
  int type;
  String typeTitle;
  List<String> terminal;

  factory Place.fromMap(Map<String, dynamic> json) => Place(
    placeId: json["place_id"],
    title: json["title"],
    type: json["type"],
    typeTitle: json["type_title"],
    terminal: List<String>.from(json["terminal"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "place_id": placeId,
    "title": title,
    "type": type,
    "type_title": typeTitle,
    "terminal": List<String>.from(terminal.map((x) => x)),
  };
}

class Option {
  Option({
    this.key,
    this.value,
  });

  String key;
  String value;

  factory Option.fromMap(Map<String, dynamic> json) => Option(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "key": key,
    "value": value,
  };
}
