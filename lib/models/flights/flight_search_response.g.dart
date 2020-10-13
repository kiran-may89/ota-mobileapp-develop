// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightSearchResponse _$FlightSearchResponseFromJson(Map<String, dynamic> json) {
  return FlightSearchResponse(
    version: json['version'],
    message: json['message'] as String,
    isError: json['isError'] as bool,
    responseException: json['responseException'],
    result: json['result'] == null
        ? null
        : FlightSearchResponseResult.fromJson(
            json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FlightSearchResponseToJson(
        FlightSearchResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'message': instance.message,
      'isError': instance.isError,
      'responseException': instance.responseException,
      'result': instance.result,
    };

FlightSearchResponseResult _$FlightSearchResponseResultFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseResult(
    flights: (json['flights'] as List)
        ?.map((e) => e == null
            ? null
            : FlightSearchResponseFlights.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    airlinesFilters: (json['airlinesFilters'] as List)
        ?.map((e) => e == null
            ? null
            : FlightSearchResponseAirlinesFilters.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FlightSearchResponseResultToJson(
        FlightSearchResponseResult instance) =>
    <String, dynamic>{
      'flights': instance.flights,
      'airlinesFilters': instance.airlinesFilters,
    };

FlightSearchResponseFlights _$FlightSearchResponseFlightsFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseFlights(
    route: (json['route'] as List)
        ?.map((e) => e == null
            ? null
            : FlightSearchResponseRoute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nightsInDest: json['nightsInDest'],
    duration: json['duration'] == null
        ? null
        : FlightSearchResponseDuration.fromJson(
            json['duration'] as Map<String, dynamic>),
    flyFrom: json['flyFrom'] as String,
    cityFrom: json['cityFrom'] as String,
    cityCodeFrom: json['cityCodeFrom'] as String,
    countryFrom: json['countryFrom'] == null
        ? null
        : FlightSearchResponseCountryFrom.fromJson(
            json['countryFrom'] as Map<String, dynamic>),
    flyTo: json['flyTo'] as String,
    cityTo: json['cityTo'] as String,
    cityCodeTo: json['cityCodeTo'] as String,
    countryTo: json['countryTo'] == null
        ? null
        : FlightSearchResponseCountryFrom.fromJson(
            json['countryTo'] as Map<String, dynamic>),
    distance: json['distance'],
    routes: (json['routes'] as List)?.map((e) => e as List)?.toList(),
    airlines: (json['airlines'] as List)?.map((e) => e as String)?.toList(),
    airlinesMeta: (json['airlinesMeta'] as List)
        ?.map((e) => e == null
            ? null
            : FlightSearchResponseAirlinesMeta.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    pnrCount: json['pnr_count'],
    virtualInterlining: json['virtual_interlining'] as bool,
    hasAirportChange: json['has_airport_change'] as bool,
    technicalStops: json['technical_stops'] as int,
    price: json['price'],
    bagsPrice: json['bags_price'] == null
        ? null
        : FlightSearchResponseBagsPrice.fromJson(
            json['bags_price'] as Map<String, dynamic>),
    baglimit: json['baglimit'] == null
        ? null
        : FlightSearchResponseBaglimit.fromJson(
            json['baglimit'] as Map<String, dynamic>),
    availability: json['availability'] == null
        ? null
        : FlightSearchResponseAvailability.fromJson(
            json['availability'] as Map<String, dynamic>),
    facilitatedBookingAvailable: json['facilitated_booking_available'] as bool,
    transfers: json['transfers'] as List,
    typeFlights:
        (json['type_flights'] as List)?.map((e) => e as String)?.toList(),
    conversion: json['conversion'] == null
        ? null
        : FlightSearchResponseConversion.fromJson(
            json['conversion'] as Map<String, dynamic>),
    localArrival: json['local_arrival'] as String,
    utcArrival: json['utc_arrival'] as String,
    localDeparture: json['local_departure'] as String,
    utcDeparture: json['utc_departure'] as String,
    deepLink: json['deep_link'] as String,
    onewaystopsCount: json['onewaystops_count'] as int,
    returnwaystopsCount: json['returnwaystops_count'] as int,
    onewayLocalArrival: json['oneway_local_arrival'] as String,
    onewayUtcArrival: json['oneway_utc_arrival'] as String,
    onewayLocalDeparture: json['oneway_local_departure'] as String,
    onewayUtcDeparture: json['oneway_utc_departure'] as String,
    returnLocalArrival: json['return_local_arrival'] as String,
    returnUtcArrival: json['return_utc_arrival'] as String,
    returnLocalDeparture: json['return_local_departure'] as String,
    returnUtcDeparture: json['return_utc_departure'] as String,
    displayRateInfoWithMarkup: json['displayRateInfoWithMarkup'] == null
        ? null
        : FlightSearchResponseDisplayRateInfoWithMarkup.fromJson(
            json['displayRateInfoWithMarkup'] as Map<String, dynamic>),
    tpa: json['tpa'] as String,
    options: (json['options'] as List)
        ?.map((e) => e == null
            ? null
            : FlightSearchResponseOptions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FlightSearchResponseFlightsToJson(
        FlightSearchResponseFlights instance) =>
    <String, dynamic>{
      'route': instance.route,
      'nightsInDest': instance.nightsInDest,
      'duration': instance.duration,
      'flyFrom': instance.flyFrom,
      'cityFrom': instance.cityFrom,
      'cityCodeFrom': instance.cityCodeFrom,
      'countryFrom': instance.countryFrom,
      'flyTo': instance.flyTo,
      'cityTo': instance.cityTo,
      'cityCodeTo': instance.cityCodeTo,
      'countryTo': instance.countryTo,
      'distance': instance.distance,
      'routes': instance.routes,
      'airlines': instance.airlines,
      'airlinesMeta': instance.airlinesMeta,
      'pnr_count': instance.pnrCount,
      'virtual_interlining': instance.virtualInterlining,
      'has_airport_change': instance.hasAirportChange,
      'technical_stops': instance.technicalStops,
      'price': instance.price,
      'bags_price': instance.bagsPrice,
      'baglimit': instance.baglimit,
      'availability': instance.availability,
      'facilitated_booking_available': instance.facilitatedBookingAvailable,
      'transfers': instance.transfers,
      'type_flights': instance.typeFlights,
      'conversion': instance.conversion,
      'local_arrival': instance.localArrival,
      'utc_arrival': instance.utcArrival,
      'local_departure': instance.localDeparture,
      'utc_departure': instance.utcDeparture,
      'deep_link': instance.deepLink,
      'onewaystops_count': instance.onewaystopsCount,
      'returnwaystops_count': instance.returnwaystopsCount,
      'oneway_local_arrival': instance.onewayLocalArrival,
      'oneway_utc_arrival': instance.onewayUtcArrival,
      'oneway_local_departure': instance.onewayLocalDeparture,
      'oneway_utc_departure': instance.onewayUtcDeparture,
      'return_local_arrival': instance.returnLocalArrival,
      'return_utc_arrival': instance.returnUtcArrival,
      'return_local_departure': instance.returnLocalDeparture,
      'return_utc_departure': instance.returnUtcDeparture,
      'displayRateInfoWithMarkup': instance.displayRateInfoWithMarkup,
      'tpa': instance.tpa,
      'options': instance.options,
    };

FlightSearchResponseRoute _$FlightSearchResponseRouteFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseRoute(
    fareBasis: json['fare_basis'] as String,
    fareCategory: json['fare_category'] as String,
    fareClasses: json['fare_classes'] as String,
    fareFamily: json['fare_family'] as String,
    lastSeen: json['last_seen'] as String,
    refreshTimestamp: json['refresh_timestamp'] as String,
    return__: json['return'] as int,
    bagsRecheckRequired: json['bags_recheck_required'] as bool,
    guarantee: json['guarantee'] as bool,
    cityTo: json['cityTo'] as String,
    cityFrom: json['cityFrom'] as String,
    cityCodeFrom: json['cityCodeFrom'] as String,
    cityCodeTo: json['cityCodeTo'] as String,
    flyTo: json['flyTo'] as String,
    flyFrom: json['flyFrom'] as String,
    airline: json['airline'] as String,
    operatingCarrier: json['operating_carrier'] as String,
    equipment: json['equipment'],
    flightNo: json['flight_no'] as int,
    vehicleType: json['vehicle_type'] as String,
    operatingFlightNo: json['operating_flight_no'] as String,
    localArrival: json['local_arrival'] as String,
    utcArrival: json['utc_arrival'] as String,
    localDeparture: json['local_departure'] as String,
    utcDeparture: json['utc_departure'] as String,
  );
}

Map<String, dynamic> _$FlightSearchResponseRouteToJson(
        FlightSearchResponseRoute instance) =>
    <String, dynamic>{
      'fare_basis': instance.fareBasis,
      'fare_category': instance.fareCategory,
      'fare_classes': instance.fareClasses,
      'fare_family': instance.fareFamily,
      'last_seen': instance.lastSeen,
      'refresh_timestamp': instance.refreshTimestamp,
      'return': instance.return__,
      'bags_recheck_required': instance.bagsRecheckRequired,
      'guarantee': instance.guarantee,
      'cityTo': instance.cityTo,
      'cityFrom': instance.cityFrom,
      'cityCodeFrom': instance.cityCodeFrom,
      'cityCodeTo': instance.cityCodeTo,
      'flyTo': instance.flyTo,
      'flyFrom': instance.flyFrom,
      'airline': instance.airline,
      'operating_carrier': instance.operatingCarrier,
      'equipment': instance.equipment,
      'flight_no': instance.flightNo,
      'vehicle_type': instance.vehicleType,
      'operating_flight_no': instance.operatingFlightNo,
      'local_arrival': instance.localArrival,
      'utc_arrival': instance.utcArrival,
      'local_departure': instance.localDeparture,
      'utc_departure': instance.utcDeparture,
    };

FlightSearchResponseDuration _$FlightSearchResponseDurationFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseDuration(
    departure: json['departure'],
    return_: json['return'] as int,
    total: json['total'],
  );
}

Map<String, dynamic> _$FlightSearchResponseDurationToJson(
        FlightSearchResponseDuration instance) =>
    <String, dynamic>{
      'departure': instance.departure,
      'return': instance.return_,
      'total': instance.total,
    };

FlightSearchResponseCountryFrom _$FlightSearchResponseCountryFromFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseCountryFrom(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$FlightSearchResponseCountryFromToJson(
        FlightSearchResponseCountryFrom instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

FlightSearchResponseAirlinesMeta _$FlightSearchResponseAirlinesMetaFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseAirlinesMeta(
    code: json['code'] as String,
    type: json['type'] as String,
    name: json['name'] as String,
    lcc: json['lcc'],
    image32: json['image32'] as String,
    image64: json['image64'] as String,
    image128: json['image128'] as String,
    isDeleted: json['isDeleted'] as bool,
    id: json['id'],
    uid: json['uid'] as String,
    createdBy: json['createdBy'] as String,
    createdDate: json['createdDate'] as String,
    updatedBy: json['updatedBy'],
    updatedDate: json['updatedDate'] as String,
  );
}

Map<String, dynamic> _$FlightSearchResponseAirlinesMetaToJson(
        FlightSearchResponseAirlinesMeta instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': instance.type,
      'name': instance.name,
      'lcc': instance.lcc,
      'image32': instance.image32,
      'image64': instance.image64,
      'image128': instance.image128,
      'isDeleted': instance.isDeleted,
      'id': instance.id,
      'uid': instance.uid,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'updatedBy': instance.updatedBy,
      'updatedDate': instance.updatedDate,
    };

FlightSearchResponseBagsPrice _$FlightSearchResponseBagsPriceFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseBagsPrice(
    iInvalidName1: json['__invalid_name__1'],
    nInvalidName2: json['__invalid_name__2'],
  );
}

Map<String, dynamic> _$FlightSearchResponseBagsPriceToJson(
        FlightSearchResponseBagsPrice instance) =>
    <String, dynamic>{
      '__invalid_name__1': instance.iInvalidName1,
      '__invalid_name__2': instance.nInvalidName2,
    };

FlightSearchResponseBaglimit _$FlightSearchResponseBaglimitFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseBaglimit(
    handWidth: json['hand_width'],
    handHeight: json['hand_height'],
    handLength: json['hand_length'],
    handWeight: json['hand_weight'],
    holdWidth: json['hold_width'],
    holdHeight: json['hold_height'],
    holdLength: json['hold_length'],
    holdDimensionsSum: json['hold_dimensions_sum'],
    holdWeight: json['hold_weight'],
  );
}

Map<String, dynamic> _$FlightSearchResponseBaglimitToJson(
        FlightSearchResponseBaglimit instance) =>
    <String, dynamic>{
      'hand_width': instance.handWidth,
      'hand_height': instance.handHeight,
      'hand_length': instance.handLength,
      'hand_weight': instance.handWeight,
      'hold_width': instance.holdWidth,
      'hold_height': instance.holdHeight,
      'hold_length': instance.holdLength,
      'hold_dimensions_sum': instance.holdDimensionsSum,
      'hold_weight': instance.holdWeight,
    };

FlightSearchResponseAvailability _$FlightSearchResponseAvailabilityFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseAvailability(
    seats: json['seats'] as int,
  );
}

Map<String, dynamic> _$FlightSearchResponseAvailabilityToJson(
        FlightSearchResponseAvailability instance) =>
    <String, dynamic>{
      'seats': instance.seats,
    };

FlightSearchResponseConversion _$FlightSearchResponseConversionFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseConversion(
    eur: json['eur'],
  );
}

Map<String, dynamic> _$FlightSearchResponseConversionToJson(
        FlightSearchResponseConversion instance) =>
    <String, dynamic>{
      'eur': instance.eur,
    };

FlightSearchResponseDisplayRateInfoWithMarkup
    _$FlightSearchResponseDisplayRateInfoWithMarkupFromJson(
        Map<String, dynamic> json) {
  return FlightSearchResponseDisplayRateInfoWithMarkup(
    totalPriceWithMarkup: (json['totalPriceWithMarkup'] as num)?.toDouble(),
    baseRate: (json['baseRate'] as num)?.toDouble(),
    taxAndOtherCharges: (json['taxAndOtherCharges'] as num)?.toDouble(),
    otaTax: (json['otaTax'] as num)?.toDouble(),
    markup: (json['markup'] as num)?.toDouble(),
    supplierBaseRate: (json['supplierBaseRate'] as num)?.toDouble(),
    supplierTotalCost: (json['supplierTotalCost'] as num)?.toDouble(),
    currency: json['currency'] as String,
  );
}

Map<String, dynamic> _$FlightSearchResponseDisplayRateInfoWithMarkupToJson(
        FlightSearchResponseDisplayRateInfoWithMarkup instance) =>
    <String, dynamic>{
      'totalPriceWithMarkup': instance.totalPriceWithMarkup,
      'baseRate': instance.baseRate,
      'taxAndOtherCharges': instance.taxAndOtherCharges,
      'otaTax': instance.otaTax,
      'markup': instance.markup,
      'supplierBaseRate': instance.supplierBaseRate,
      'supplierTotalCost': instance.supplierTotalCost,
      'currency': instance.currency,
    };

FlightSearchResponseOptions _$FlightSearchResponseOptionsFromJson(
    Map<String, dynamic> json) {
  return FlightSearchResponseOptions(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$FlightSearchResponseOptionsToJson(
        FlightSearchResponseOptions instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

FlightSearchResponseAirlinesFilters
    _$FlightSearchResponseAirlinesFiltersFromJson(Map<String, dynamic> json) {
  return FlightSearchResponseAirlinesFilters(
    code: json['code'] as String,
    count: json['count'] as int,
    minprice: json['minprice'],
    minpriceWithMarkup: (json['minpriceWithMarkup'] as num)?.toDouble(),
    meta: json['meta'] == null
        ? null
        : FlightSearchResponseAirlinesMeta.fromJson(
            json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FlightSearchResponseAirlinesFiltersToJson(
        FlightSearchResponseAirlinesFilters instance) =>
    <String, dynamic>{
      'code': instance.code,
      'count': instance.count,
      'minprice': instance.minprice,
      'minpriceWithMarkup': instance.minpriceWithMarkup,
      'meta': instance.meta,
    };
