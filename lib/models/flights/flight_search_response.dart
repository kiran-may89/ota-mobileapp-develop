import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_search_response.g.dart';



@JsonSerializable()
class FlightSearchResponse {
  dynamic version;
  String message;
  bool isError;
  dynamic responseException;
  FlightSearchResponseResult result;

  FlightSearchResponse({this.version, this.message, this.isError, this.responseException, this.result});

  factory  FlightSearchResponse.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseToJson(this);





}

@JsonSerializable()
class FlightSearchResponseResult {
  List<FlightSearchResponseFlights> flights;
  List<FlightSearchResponseAirlinesFilters> airlinesFilters;

  FlightSearchResponseResult({this.flights, this.airlinesFilters});

  factory  FlightSearchResponseResult.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseResultFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseResultToJson(this);


}

@JsonSerializable()
class FlightSearchResponseFlights {
  List<FlightSearchResponseRoute> route;
  dynamic nightsInDest;
  FlightSearchResponseDuration duration;
  String flyFrom;
  String cityFrom;
  String cityCodeFrom;
  FlightSearchResponseCountryFrom countryFrom;
  String flyTo;
  String cityTo;
  String cityCodeTo;
  FlightSearchResponseCountryFrom countryTo;
  dynamic distance;
  List<List> routes;
  List<String> airlines;
  List<FlightSearchResponseAirlinesMeta> airlinesMeta;
  @JsonKey(name: 'pnr_count')
  dynamic pnrCount;
  @JsonKey(name: 'virtual_interlining')
  bool virtualInterlining;
  @JsonKey(name: 'has_airport_change')
  bool hasAirportChange;
  @JsonKey(name: 'technical_stops')
  int technicalStops;
  dynamic price;
  @JsonKey(name: 'bags_price')
  FlightSearchResponseBagsPrice bagsPrice;
  FlightSearchResponseBaglimit baglimit;
  FlightSearchResponseAvailability availability;
  @JsonKey(name: 'facilitated_booking_available')
  bool facilitatedBookingAvailable;
  List<dynamic> transfers;
  @JsonKey(name: 'type_flights')
  List<String> typeFlights;
  FlightSearchResponseConversion conversion;
  @JsonKey(name: 'local_arrival')
  String localArrival;
  @JsonKey(name: 'utc_arrival')
  String utcArrival;
  @JsonKey(name: 'local_departure')
  String localDeparture;
  @JsonKey(name: 'utc_departure')
  String utcDeparture;
  @JsonKey(name: 'deep_link')
  String deepLink;
  @JsonKey(name: 'onewaystops_count')
  int onewaystopsCount;
  @JsonKey(name: 'returnwaystops_count')
  int returnwaystopsCount;
  @JsonKey(name: 'oneway_local_arrival')
  String onewayLocalArrival;
  @JsonKey(name: 'oneway_utc_arrival')
  String onewayUtcArrival;
  @JsonKey(name: 'oneway_local_departure')
  String onewayLocalDeparture;
  @JsonKey(name: 'oneway_utc_departure')
  String onewayUtcDeparture;
  @JsonKey(name: 'return_local_arrival')
  String returnLocalArrival;
  @JsonKey(name: 'return_utc_arrival')
  String returnUtcArrival;
  @JsonKey(name: 'return_local_departure')
  String returnLocalDeparture;
  @JsonKey(name: 'return_utc_departure')
  String returnUtcDeparture;
  FlightSearchResponseDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  String tpa;
  List<FlightSearchResponseOptions> options;

  FlightSearchResponseFlights({this.route, this.nightsInDest, this.duration, this.flyFrom, this.cityFrom, this.cityCodeFrom, this.countryFrom, this.flyTo, this.cityTo, this.cityCodeTo, this.countryTo, this.distance, this.routes, this.airlines, this.airlinesMeta, this.pnrCount, this.virtualInterlining, this.hasAirportChange, this.technicalStops, this.price, this.bagsPrice, this.baglimit, this.availability, this.facilitatedBookingAvailable, this.transfers, this.typeFlights, this.conversion, this.localArrival, this.utcArrival, this.localDeparture, this.utcDeparture, this.deepLink, this.onewaystopsCount, this.returnwaystopsCount, this.onewayLocalArrival, this.onewayUtcArrival, this.onewayLocalDeparture, this.onewayUtcDeparture, this.returnLocalArrival, this.returnUtcArrival, this.returnLocalDeparture, this.returnUtcDeparture, this.displayRateInfoWithMarkup, this.tpa, this.options});

  factory  FlightSearchResponseFlights.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseFlightsFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseFlightsToJson(this);




}

@JsonSerializable()
class FlightSearchResponseRoute {
  @JsonKey(name: 'fare_basis')
  String fareBasis;
  @JsonKey(name: 'fare_category')
  String fareCategory;
  @JsonKey(name: 'fare_classes')
  String fareClasses;
  @JsonKey(name: 'fare_family')
  String fareFamily;
  @JsonKey(name: 'last_seen')
  String lastSeen;
  @JsonKey(name: 'refresh_timestamp')
  String refreshTimestamp;
  @JsonKey(name: 'return')
  int return__;
  @JsonKey(name: 'bags_recheck_required')
  bool bagsRecheckRequired;
  bool guarantee;
  String cityTo;
  String cityFrom;
  String cityCodeFrom;
  String cityCodeTo;
  String flyTo;
  String flyFrom;
  String airline;
  @JsonKey(name: 'operating_carrier')
  String operatingCarrier;
  dynamic equipment;
  @JsonKey(name: 'flight_no')
  int flightNo;
  @JsonKey(name: 'vehicle_type')
  String vehicleType;
  @JsonKey(name: 'operating_flight_no')
  String operatingFlightNo;
  @JsonKey(name: 'local_arrival')
  String localArrival;
  @JsonKey(name: 'utc_arrival')
  String utcArrival;
  @JsonKey(name: 'local_departure')
  String localDeparture;
  @JsonKey(name: 'utc_departure')
  String utcDeparture;

  FlightSearchResponseRoute({this.fareBasis, this.fareCategory, this.fareClasses, this.fareFamily, this.lastSeen, this.refreshTimestamp, this.return__, this.bagsRecheckRequired, this.guarantee, this.cityTo, this.cityFrom, this.cityCodeFrom, this.cityCodeTo, this.flyTo, this.flyFrom, this.airline, this.operatingCarrier, this.equipment, this.flightNo, this.vehicleType, this.operatingFlightNo, this.localArrival, this.utcArrival, this.localDeparture, this.utcDeparture});

  factory  FlightSearchResponseRoute.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseRouteFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseRouteToJson(this);



}

@JsonSerializable()
class FlightSearchResponseDuration {
  dynamic departure;
  @JsonKey(name: 'return')
  int return_;
  dynamic total;

  FlightSearchResponseDuration({this.departure, this.return_, this.total});

  factory  FlightSearchResponseDuration.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseDurationFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseDurationToJson(this);




}

@JsonSerializable()
class FlightSearchResponseCountryFrom {
  String code;
  String name;

  FlightSearchResponseCountryFrom({this.code, this.name});

  factory  FlightSearchResponseCountryFrom.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseCountryFromFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseCountryFromToJson(this);


}


@JsonSerializable()
class FlightSearchResponseAirlinesMeta extends Equatable{
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

  FlightSearchResponseAirlinesMeta({this.code, this.type, this.name, this.lcc, this.image32, this.image64, this.image128, this.isDeleted, this.id, this.uid, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate});

  factory  FlightSearchResponseAirlinesMeta.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseAirlinesMetaFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseAirlinesMetaToJson(this);


  List<Object> get props => [this.name];
  bool contains(Object element) {
    return false;
  }


}

@JsonSerializable()
class FlightSearchResponseBagsPrice {
  @JsonKey(name: '__invalid_name__1')
  dynamic iInvalidName1;
  @JsonKey(name: '__invalid_name__2')
  dynamic nInvalidName2;

  FlightSearchResponseBagsPrice({this.iInvalidName1, this.nInvalidName2});

  factory  FlightSearchResponseBagsPrice.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseBagsPriceFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseBagsPriceToJson(this);


}

@JsonSerializable()
class FlightSearchResponseBaglimit {
  @JsonKey(name: 'hand_width')
  dynamic handWidth;
  @JsonKey(name: 'hand_height')
  dynamic handHeight;
  @JsonKey(name: 'hand_length')
  dynamic handLength;
  @JsonKey(name: 'hand_weight')
  dynamic handWeight;
  @JsonKey(name: 'hold_width')
  dynamic holdWidth;
  @JsonKey(name: 'hold_height')
  dynamic holdHeight;
  @JsonKey(name: 'hold_length')
  dynamic holdLength;
  @JsonKey(name: 'hold_dimensions_sum')
  dynamic holdDimensionsSum;
  @JsonKey(name: 'hold_weight')
  dynamic holdWeight;

  FlightSearchResponseBaglimit({this.handWidth, this.handHeight, this.handLength, this.handWeight, this.holdWidth, this.holdHeight, this.holdLength, this.holdDimensionsSum, this.holdWeight});

  factory  FlightSearchResponseBaglimit.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseBaglimitFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseBaglimitToJson(this);


}

@JsonSerializable()
class FlightSearchResponseAvailability {
  int seats;

  FlightSearchResponseAvailability({this.seats});

  factory  FlightSearchResponseAvailability.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseAvailabilityFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseAvailabilityToJson(this);


}

@JsonSerializable()
class FlightSearchResponseConversion {
  dynamic eur;

  FlightSearchResponseConversion({this.eur});

  factory  FlightSearchResponseConversion.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseConversionFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseConversionToJson(this);


}

@JsonSerializable()
class FlightSearchResponseDisplayRateInfoWithMarkup {
  double totalPriceWithMarkup;
  double baseRate;
  double taxAndOtherCharges;
  double otaTax;
  double markup;
  double supplierBaseRate;
  double supplierTotalCost;
  String currency;

  FlightSearchResponseDisplayRateInfoWithMarkup({this.totalPriceWithMarkup, this.baseRate, this.taxAndOtherCharges, this.otaTax, this.markup, this.supplierBaseRate, this.supplierTotalCost, this.currency});

  factory  FlightSearchResponseDisplayRateInfoWithMarkup.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseDisplayRateInfoWithMarkupFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseDisplayRateInfoWithMarkupToJson(this);


}

@JsonSerializable()
class FlightSearchResponseOptions {
  String key;
  String value;

  FlightSearchResponseOptions({this.key, this.value});

  factory  FlightSearchResponseOptions.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseOptionsToJson(this);


}

@JsonSerializable()
class FlightSearchResponseAirlinesFilters extends Equatable{
  String code;
  int count;
  dynamic minprice;
  double minpriceWithMarkup;
  FlightSearchResponseAirlinesMeta meta;

  FlightSearchResponseAirlinesFilters({this.code, this.count, this.minprice, this.minpriceWithMarkup, this.meta});

  factory  FlightSearchResponseAirlinesFilters.fromJson(Map<String, dynamic> json) => _$FlightSearchResponseAirlinesFiltersFromJson(json);
  Map<String, dynamic> toJson() => _$FlightSearchResponseAirlinesFiltersToJson(this);

  List<Object> get props => [this.meta];
  bool contains(Object element) {
    return false;
  }


}

