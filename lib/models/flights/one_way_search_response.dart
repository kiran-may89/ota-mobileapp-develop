
import 'package:json_annotation/json_annotation.dart';
import 'package:ota/models/base_model.dart';
import 'package:ota/models/common/models/api_exception.dart';

part 'one_way_search_response.g.dart';

@JsonSerializable()
class OneWayResponse extends BaseModel{
  String version;
  String message;
  bool isError;
  dynamic responseException;
  OneWayResult result;

  OneWayResponse({this.version, this.message, this.isError, this.responseException, this.result});

  factory OneWayResponse.fromJson(Map<String, dynamic> json)=> _$OneWayResponseFromJson(json);

  Map<String, dynamic> toJson()=>_$OneWayResponseToJson(this);



}

@JsonSerializable()
class OneWayResult {
  List<OneWayFlights> flights;
  DatePrices datePrices;
  DatePrices datePricesWithMarkup;
  List<AirlinesFilters> airlinesFilters;

  OneWayResult({this.flights, this.datePrices, this.datePricesWithMarkup, this.airlinesFilters});

  factory OneWayResult.fromJson(Map<String, dynamic> json)=> _$OneWayResultFromJson(json);

  Map<String, dynamic> toJson()=>_$OneWayResultToJson(this);




}

@JsonSerializable()
class OneWayFlights {

dynamic nightsInDest;
String flyFrom;
String cityFrom;
String cityCodeFrom;
String flyTo;
String cityTo;
String cityCodeTo;
dynamic price;
bool facilitatedBookingAvailable;
int onewaystopsCount;
@JsonKey(name: "oneway_local_arrival")
String onewayLocalArrival;
String onewayUtcArrival;
String onewayLocalDeparture;
String onewayUtcDeparture;
String returnLocalArrival;
String returnUtcArrival;
String returnLocalDeparture;
String returnUtcDeparture;
double priceWithMarkup;
String tpa;
dynamic returnwaystopsCount;
List<OneWayRoute> route;
List<Options> options;
List<AirlinesMeta> airlinesMeta;
Durations duration;


  OneWayFlights({this.route, this.nightsInDest, this.duration, this.flyFrom, this.cityFrom,
    this.cityCodeFrom, this.flyTo, this.cityTo, this.cityCodeTo,
    this.airlinesMeta, this.price, this.facilitatedBookingAvailable,
    this.onewaystopsCount, this.returnwaystopsCount, this.onewayLocalArrival,
    this.onewayUtcArrival, this.onewayLocalDeparture, this.onewayUtcDeparture,
    this.returnLocalArrival, this.returnUtcArrival, this.returnLocalDeparture, this.returnUtcDeparture, this.priceWithMarkup, this.tpa, this.options});

  factory OneWayFlights.fromJson(Map<String, dynamic> json)=> _$OneWayFlightsFromJson(json);

  Map<String, dynamic> toJson()=>_$OneWayFlightsToJson(this);



}


@JsonSerializable()
class OneWayRoute {
  String fareCategory;
  int return_to;
  String cityTo;
  String cityFrom;
  String cityCodeFrom;
  String cityCodeTo;
  String flyTo;
  String flyFrom;
  String airline;
  String operatingCarrier;
  String localArrival;
  String utcArrival;
  String localDeparture;
  String utcDeparture;

  OneWayRoute({this.fareCategory, this.return_to, this.cityTo, this.cityFrom, this.cityCodeFrom, this.cityCodeTo, this.flyTo, this.flyFrom, this.airline, this.operatingCarrier, this.localArrival, this.utcArrival, this.localDeparture, this.utcDeparture});


  factory OneWayRoute.fromJson(Map<String, dynamic> json)=> _$OneWayRouteFromJson(json);

  Map<String, dynamic> toJson()=>_$OneWayRouteToJson(this);



}


@JsonSerializable()
class Durations {
  int departure;
  int return_duration;
  int total;

  Durations({this.departure, this.return_duration, this.total});

  factory Durations.fromJson(Map<String, dynamic> json)=> _$DurationsFromJson(json);

  Map<String, dynamic> toJson()=>_$DurationsToJson(this);


}


@JsonSerializable()
class AirlinesMeta {
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
String createdDate;
dynamic updatedBy;
String updatedDate;

  AirlinesMeta({this.code, this.type, this.name, this.lcc, this.image32, this.image64, this.image128, this.isDeleted, this.id, this.uid, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate});

  factory AirlinesMeta.fromJson(Map<String, dynamic> json)=> _$AirlinesMetaFromJson(json);

  Map<String, dynamic> toJson()=>_$AirlinesMetaToJson(this);



}


@JsonSerializable()
class Options {
  String key;
  String value;

  Options({this.key, this.value});

  factory Options.fromJson(Map<String, dynamic> json)=> _$OptionsFromJson(json);

  Map<String, dynamic> toJson()=>_$OptionsToJson(this);




}

@JsonSerializable()
class DatePrices {
  List<Data> data;

  DatePrices({this.data});

  factory DatePrices.fromJson(Map<String, dynamic> json)=> _$DatePricesFromJson(json);

  Map<String, dynamic> toJson()=>_$DatePricesToJson(this);


}


@JsonSerializable()
class Data {
  String date;
  dynamic price;

  Data({this.date, this.price});


  factory Data.fromJson(Map<String, dynamic> json)=> _$DataFromJson(json);

  Map<String, dynamic> toJson()=>_$DataToJson(this);


}


@JsonSerializable()
class AirlinesFilters {
String code;
int count;
dynamic minprice;
dynamic minpriceWithMarkup;
AirlinesMeta meta;

  AirlinesFilters({this.code, this.count, this.minprice, this.minpriceWithMarkup, this.meta});

  factory AirlinesFilters.fromJson(Map<String, dynamic> json)=> _$AirlinesFiltersFromJson(json);

  Map<String, dynamic> toJson()=>_$AirlinesFiltersToJson(this);



}










//
//
//class OneWayResponse extends BaseModel{
//  String version;
//  String message;
//  bool isError;
//  dynamic responseException;
//  OneWayResult result;
//
//  OneWayResponse({this.version, this.message, this.isError, this.responseException, this.result});
//
//  OneWayResponse.fromJson(Map<String, dynamic> json) {
//    version = json['version'];
//    message = json['message'];
//    isError = json['isError'];
//    responseException = json['responseException'];
//    result = json['result'] != null ? new OneWayResult.fromJson(json['result']) : null;
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['version'] = this.version;
//    data['message'] = this.message;
//    data['isError'] = this.isError;
//    data['responseException'] = this.responseException;
//    if (this.result != null) {
//      data['result'] = this.result.toJson();
//    }
//    return data;
//  }
//}
//
//class OneWayResult {
//  List<Flights> flights;
//  DatePrices datePrices;
//  DatePrices datePricesWithMarkup;
//  List<AirlinesFilters> airlinesFilters;
//
//  OneWayResult({this.flights, this.datePrices, this.datePricesWithMarkup, this.airlinesFilters});
//
//  OneWayResult.fromJson(Map<String, dynamic> json) {
//    if (json['flights'] != null) {
//      flights = new List<Flights>();
//      json['flights'].forEach((v) { flights.add(new Flights.fromJson(v)); });
//    }
//    datePrices = json['datePrices'] != null ? new DatePrices.fromJson(json['datePrices']) : null;
//    datePricesWithMarkup = json['datePricesWithMarkup'] != null ? new DatePrices.fromJson(json['datePricesWithMarkup']) : null;
//    if (json['airlinesFilters'] != null) {
//      airlinesFilters = new List<AirlinesFilters>();
//      json['airlinesFilters'].forEach((v) { airlinesFilters.add(new AirlinesFilters.fromJson(v)); });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.flights != null) {
//      data['flights'] = this.flights.map((v) => v.toJson()).toList();
//    }
//    if (this.datePrices != null) {
//      data['datePrices'] = this.datePrices.toJson();
//    }
//    if (this.datePricesWithMarkup != null) {
//      data['datePricesWithMarkup'] = this.datePricesWithMarkup.toJson();
//    }
//    if (this.airlinesFilters != null) {
//      data['airlinesFilters'] = this.airlinesFilters.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}
//
//class Flights {
//  List<Route> route;
//  dynamic nightsInDest;
//  Duration duration;
//  String flyFrom;
//  String cityFrom;
//  String cityCodeFrom;
//  String flyTo;
//  String cityTo;
//  String cityCodeTo;
//  List<AirlinesMeta> airlinesMeta;
//  dynamic price;
//  bool facilitatedBookingAvailable;
//  int onewaystopsCount;
//  dynamic returnwaystopsCount;
//  String onewayLocalArrival;
//  String onewayUtcArrival;
//  String onewayLocalDeparture;
//  String onewayUtcDeparture;
//  String returnLocalArrival;
//  String returnUtcArrival;
//  String returnLocalDeparture;
//  String returnUtcDeparture;
//  double priceWithMarkup;
//  String tpa;
//  List<Options> options;
//
//  Flights({this.route, this.nightsInDest, this.duration, this.flyFrom, this.cityFrom, this.cityCodeFrom, this.flyTo, this.cityTo, this.cityCodeTo, this.airlinesMeta, this.price, this.facilitatedBookingAvailable, this.onewaystopsCount, this.returnwaystopsCount, this.onewayLocalArrival, this.onewayUtcArrival, this.onewayLocalDeparture, this.onewayUtcDeparture, this.returnLocalArrival, this.returnUtcArrival, this.returnLocalDeparture, this.returnUtcDeparture, this.priceWithMarkup, this.tpa, this.options});
//
//  Flights.fromJson(Map<String, dynamic> json) {
//    if (json['route'] != null) {
//      route = new List<Route>();
//      json['route'].forEach((v) { route.add(new Route.fromJson(v)); });
//    }
//    nightsInDest = json['nightsInDest'];
//    duration = json['duration'] != null ? new Duration.fromJson(json['duration']) : null;
//    flyFrom = json['flyFrom'];
//    cityFrom = json['cityFrom'];
//    cityCodeFrom = json['cityCodeFrom'];
//    flyTo = json['flyTo'];
//    cityTo = json['cityTo'];
//    cityCodeTo = json['cityCodeTo'];
//    if (json['airlinesMeta'] != null) {
//      airlinesMeta = new List<AirlinesMeta>();
//      json['airlinesMeta'].forEach((v) { airlinesMeta.add(new AirlinesMeta.fromJson(v)); });
//    }
//    price = json['price'];
//    facilitatedBookingAvailable = json['facilitated_booking_available'];
//    onewaystopsCount = json['onewaystops_count'];
//    returnwaystopsCount = json['returnwaystops_count'];
//    onewayLocalArrival = json['oneway_local_arrival'];
//    onewayUtcArrival = json['oneway_utc_arrival'];
//    onewayLocalDeparture = json['oneway_local_departure'];
//    onewayUtcDeparture = json['oneway_utc_departure'];
//    returnLocalArrival = json['return_local_arrival'];
//    returnUtcArrival = json['return_utc_arrival'];
//    returnLocalDeparture = json['return_local_departure'];
//    returnUtcDeparture = json['return_utc_departure'];
//    priceWithMarkup = json['priceWithMarkup'];
//    tpa = json['tpa'];
//    if (json['options'] != null) {
//      options = new List<Options>();
//      json['options'].forEach((v) { options.add(new Options.fromJson(v)); });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.route != null) {
//      data['route'] = this.route.map((v) => v.toJson()).toList();
//    }
//    data['nightsInDest'] = this.nightsInDest;
//    if (this.duration != null) {
//      data['duration'] = this.duration.toJson();
//    }
//    data['flyFrom'] = this.flyFrom;
//    data['cityFrom'] = this.cityFrom;
//    data['cityCodeFrom'] = this.cityCodeFrom;
//    data['flyTo'] = this.flyTo;
//    data['cityTo'] = this.cityTo;
//    data['cityCodeTo'] = this.cityCodeTo;
//    if (this.airlinesMeta != null) {
//      data['airlinesMeta'] = this.airlinesMeta.map((v) => v.toJson()).toList();
//    }
//    data['price'] = this.price;
//    data['facilitated_booking_available'] = this.facilitatedBookingAvailable;
//    data['onewaystops_count'] = this.onewaystopsCount;
//    data['returnwaystops_count'] = this.returnwaystopsCount;
//    data['oneway_local_arrival'] = this.onewayLocalArrival;
//    data['oneway_utc_arrival'] = this.onewayUtcArrival;
//    data['oneway_local_departure'] = this.onewayLocalDeparture;
//    data['oneway_utc_departure'] = this.onewayUtcDeparture;
//    data['return_local_arrival'] = this.returnLocalArrival;
//    data['return_utc_arrival'] = this.returnUtcArrival;
//    data['return_local_departure'] = this.returnLocalDeparture;
//    data['return_utc_departure'] = this.returnUtcDeparture;
//    data['priceWithMarkup'] = this.priceWithMarkup;
//    data['tpa'] = this.tpa;
//    if (this.options != null) {
//      data['options'] = this.options.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}
//
//class Route {
//  String fareCategory;
//  dynamic return_to;
//  String cityTo;
//  String cityFrom;
//  String cityCodeFrom;
//  String cityCodeTo;
//  String flyTo;
//  String flyFrom;
//  String airline;
//  String operatingCarrier;
//  String localArrival;
//  String utcArrival;
//  String localDeparture;
//  String utcDeparture;
//
//  Route({this.fareCategory, this.return_to, this.cityTo, this.cityFrom, this.cityCodeFrom, this.cityCodeTo, this.flyTo, this.flyFrom, this.airline, this.operatingCarrier, this.localArrival, this.utcArrival, this.localDeparture, this.utcDeparture});
//
//Route.fromJson(Map<String, dynamic> json) {
//fareCategory = json['fare_category'];
//return_to = json['return'];
//cityTo = json['cityTo'];
//cityFrom = json['cityFrom'];
//cityCodeFrom = json['cityCodeFrom'];
//cityCodeTo = json['cityCodeTo'];
//flyTo = json['flyTo'];
//flyFrom = json['flyFrom'];
//airline = json['airline'];
//operatingCarrier = json['operating_carrier'];
//localArrival = json['local_arrival'];
//utcArrival = json['utc_arrival'];
//localDeparture = json['local_departure'];
//utcDeparture = json['utc_departure'];
//}
//
//Map<String, dynamic> toJson() {
//  final Map<String, dynamic> data = new Map<String, dynamic>();
//  data['fare_category'] = this.fareCategory;
//  data['return'] = this.return_to;
//  data['cityTo'] = this.cityTo;
//  data['cityFrom'] = this.cityFrom;
//  data['cityCodeFrom'] = this.cityCodeFrom;
//  data['cityCodeTo'] = this.cityCodeTo;
//  data['flyTo'] = this.flyTo;
//  data['flyFrom'] = this.flyFrom;
//  data['airline'] = this.airline;
//  data['operating_carrier'] = this.operatingCarrier;
//  data['local_arrival'] = this.localArrival;
//  data['utc_arrival'] = this.utcArrival;
//  data['local_departure'] = this.localDeparture;
//  data['utc_departure'] = this.utcDeparture;
//  return data;
//}
//}
//
//class Duration {
//  int departure;
//  int return_duration;
//  int total;
//
//  Duration({this.departure, this.return_duration, this.total});
//
//Duration.fromJson(Map<String, dynamic> json) {
//departure = json['departure'];
//return_duration = json['return'];
//total = json['total'];
//}
//
//Map<String, dynamic> toJson() {
//  final Map<String, dynamic> data = new Map<String, dynamic>();
//  data['departure'] = this.departure;
//  data['return'] = this.return_duration;
//  data['total'] = this.total;
//  return data;
//}
//}
//
//class AirlinesMeta {
//  String code;
//  String type;
//  String name;
//  int lcc;
//  String image32;
//  String image64;
//  String image128;
//  bool isDeleted;
//  int id;
//  String uid;
//  String createdBy;
//  String createdDate;
//  dynamic updatedBy;
//  String updatedDate;
//
//  AirlinesMeta({this.code, this.type, this.name, this.lcc, this.image32, this.image64, this.image128, this.isDeleted, this.id, this.uid, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate});
//
//  AirlinesMeta.fromJson(Map<String, dynamic> json) {
//    code = json['code'];
//    type = json['type'];
//    name = json['name'];
//    lcc = json['lcc'];
//    image32 = json['image32'];
//    image64 = json['image64'];
//    image128 = json['image128'];
//    isDeleted = json['isDeleted'];
//    id = json['id'];
//    uid = json['uid'];
//    createdBy = json['createdBy'];
//    createdDate = json['createdDate'];
//    updatedBy = json['updatedBy'];
//    updatedDate = json['updatedDate'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['code'] = this.code;
//    data['type'] = this.type;
//    data['name'] = this.name;
//    data['lcc'] = this.lcc;
//    data['image32'] = this.image32;
//    data['image64'] = this.image64;
//    data['image128'] = this.image128;
//    data['isDeleted'] = this.isDeleted;
//    data['id'] = this.id;
//    data['uid'] = this.uid;
//    data['createdBy'] = this.createdBy;
//    data['createdDate'] = this.createdDate;
//    data['updatedBy'] = this.updatedBy;
//    data['updatedDate'] = this.updatedDate;
//    return data;
//  }
//}
//
//class Options {
//  String key;
//  String value;
//
//  Options({this.key, this.value});
//
//  Options.fromJson(Map<String, dynamic> json) {
//    key = json['key'];
//    value = json['value'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['key'] = this.key;
//    data['value'] = this.value;
//    return data;
//  }
//}
//
//class DatePrices {
//  List<Data> data;
//
//  DatePrices({this.data});
//
//  DatePrices.fromJson(Map<String, dynamic> json) {
//    if (json['data'] != null) {
//      data = new List<Data>();
//      json['data'].forEach((v) { data.add(new Data.fromJson(v)); });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this.data != null) {
//      data['data'] = this.data.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}
//
//class Data {
//  String date;
//  dynamic price;
//
//  Data({this.date, this.price});
//
//  Data.fromJson(Map<String, dynamic> json) {
//    date = json['date'];
//    price = json['price'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['date'] = this.date;
//    data['price'] = this.price;
//    return data;
//  }
//}
//
//class AirlinesFilters {
//  String code;
//  int count;
//  dynamic minprice;
//  dynamic minpriceWithMarkup;
//  AirlinesMeta meta;
//
//  AirlinesFilters({this.code, this.count, this.minprice, this.minpriceWithMarkup, this.meta});
//
//  AirlinesFilters.fromJson(Map<String, dynamic> json) {
//    code = json['code'];
//    count = json['count'];
//    minprice = json['minprice'];
//    minpriceWithMarkup = json['minpriceWithMarkup'];
//    meta = json['meta'] != null ? new AirlinesMeta.fromJson(json['meta']) : null;
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['code'] = this.code;
//    data['count'] = this.count;
//    data['minprice'] = this.minprice;
//    data['minpriceWithMarkup'] = this.minpriceWithMarkup;
//    if (this.meta != null) {
//      data['meta'] = this.meta.toJson();
//    }
//    return data;
//  }
//}









