// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_way_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OneWayResponse _$OneWayResponseFromJson(Map<String, dynamic> json) {
  return OneWayResponse(
    version: json['version'] as String,
    message: json['message'] as String,
    isError: json['isError'] as bool,
    responseException: json['responseException'],
    result: json['result'] == null
        ? null
        : OneWayResult.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OneWayResponseToJson(OneWayResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'message': instance.message,
      'isError': instance.isError,
      'responseException': instance.responseException,
      'result': instance.result,
    };

OneWayResult _$OneWayResultFromJson(Map<String, dynamic> json) {
  return OneWayResult(
    flights: (json['flights'] as List)
        ?.map((e) => e == null
            ? null
            : OneWayFlights.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    datePrices: json['datePrices'] == null
        ? null
        : DatePrices.fromJson(json['datePrices'] as Map<String, dynamic>),
    datePricesWithMarkup: json['datePricesWithMarkup'] == null
        ? null
        : DatePrices.fromJson(
            json['datePricesWithMarkup'] as Map<String, dynamic>),
    airlinesFilters: (json['airlinesFilters'] as List)
        ?.map((e) => e == null
            ? null
            : AirlinesFilters.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OneWayResultToJson(OneWayResult instance) =>
    <String, dynamic>{
      'flights': instance.flights,
      'datePrices': instance.datePrices,
      'datePricesWithMarkup': instance.datePricesWithMarkup,
      'airlinesFilters': instance.airlinesFilters,
    };

OneWayFlights _$OneWayFlightsFromJson(Map<String, dynamic> json) {
  return OneWayFlights(
    route: (json['route'] as List)
        ?.map((e) =>
            e == null ? null : OneWayRoute.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nightsInDest: json['nightsInDest'],
    duration: json['duration'] == null
        ? null
        : Durations.fromJson(json['duration'] as Map<String, dynamic>),
    flyFrom: json['flyFrom'] as String,
    cityFrom: json['cityFrom'] as String,
    cityCodeFrom: json['cityCodeFrom'] as String,
    flyTo: json['flyTo'] as String,
    cityTo: json['cityTo'] as String,
    cityCodeTo: json['cityCodeTo'] as String,
    airlinesMeta: (json['airlinesMeta'] as List)
        ?.map((e) =>
            e == null ? null : AirlinesMeta.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    price: json['price'],
    facilitatedBookingAvailable: json['facilitatedBookingAvailable'] as bool,
    onewaystopsCount: json['onewaystopsCount'] as int,
    returnwaystopsCount: json['returnwaystopsCount'],
    onewayLocalArrival: json['oneway_local_arrival'] as String,
    onewayUtcArrival: json['onewayUtcArrival'] as String,
    onewayLocalDeparture: json['onewayLocalDeparture'] as String,
    onewayUtcDeparture: json['onewayUtcDeparture'] as String,
    returnLocalArrival: json['returnLocalArrival'] as String,
    returnUtcArrival: json['returnUtcArrival'] as String,
    returnLocalDeparture: json['returnLocalDeparture'] as String,
    returnUtcDeparture: json['returnUtcDeparture'] as String,
    priceWithMarkup: (json['priceWithMarkup'] as num)?.toDouble(),
    tpa: json['tpa'] as String,
    options: (json['options'] as List)
        ?.map((e) =>
            e == null ? null : Options.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OneWayFlightsToJson(OneWayFlights instance) =>
    <String, dynamic>{
      'nightsInDest': instance.nightsInDest,
      'flyFrom': instance.flyFrom,
      'cityFrom': instance.cityFrom,
      'cityCodeFrom': instance.cityCodeFrom,
      'flyTo': instance.flyTo,
      'cityTo': instance.cityTo,
      'cityCodeTo': instance.cityCodeTo,
      'price': instance.price,
      'facilitatedBookingAvailable': instance.facilitatedBookingAvailable,
      'onewaystopsCount': instance.onewaystopsCount,
      'oneway_local_arrival': instance.onewayLocalArrival,
      'onewayUtcArrival': instance.onewayUtcArrival,
      'onewayLocalDeparture': instance.onewayLocalDeparture,
      'onewayUtcDeparture': instance.onewayUtcDeparture,
      'returnLocalArrival': instance.returnLocalArrival,
      'returnUtcArrival': instance.returnUtcArrival,
      'returnLocalDeparture': instance.returnLocalDeparture,
      'returnUtcDeparture': instance.returnUtcDeparture,
      'priceWithMarkup': instance.priceWithMarkup,
      'tpa': instance.tpa,
      'returnwaystopsCount': instance.returnwaystopsCount,
      'route': instance.route,
      'options': instance.options,
      'airlinesMeta': instance.airlinesMeta,
      'duration': instance.duration,
    };

OneWayRoute _$OneWayRouteFromJson(Map<String, dynamic> json) {
  return OneWayRoute(
    fareCategory: json['fareCategory'] as String,
    return_to: json['return_to'] as int,
    cityTo: json['cityTo'] as String,
    cityFrom: json['cityFrom'] as String,
    cityCodeFrom: json['cityCodeFrom'] as String,
    cityCodeTo: json['cityCodeTo'] as String,
    flyTo: json['flyTo'] as String,
    flyFrom: json['flyFrom'] as String,
    airline: json['airline'] as String,
    operatingCarrier: json['operatingCarrier'] as String,
    localArrival: json['localArrival'] as String,
    utcArrival: json['utcArrival'] as String,
    localDeparture: json['localDeparture'] as String,
    utcDeparture: json['utcDeparture'] as String,
  );
}

Map<String, dynamic> _$OneWayRouteToJson(OneWayRoute instance) =>
    <String, dynamic>{
      'fareCategory': instance.fareCategory,
      'return_to': instance.return_to,
      'cityTo': instance.cityTo,
      'cityFrom': instance.cityFrom,
      'cityCodeFrom': instance.cityCodeFrom,
      'cityCodeTo': instance.cityCodeTo,
      'flyTo': instance.flyTo,
      'flyFrom': instance.flyFrom,
      'airline': instance.airline,
      'operatingCarrier': instance.operatingCarrier,
      'localArrival': instance.localArrival,
      'utcArrival': instance.utcArrival,
      'localDeparture': instance.localDeparture,
      'utcDeparture': instance.utcDeparture,
    };

Durations _$DurationsFromJson(Map<String, dynamic> json) {
  return Durations(
    departure: json['departure'] as int,
    return_duration: json['return_duration'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$DurationsToJson(Durations instance) => <String, dynamic>{
      'departure': instance.departure,
      'return_duration': instance.return_duration,
      'total': instance.total,
    };

AirlinesMeta _$AirlinesMetaFromJson(Map<String, dynamic> json) {
  return AirlinesMeta(
    code: json['code'] as String,
    type: json['type'] as String,
    name: json['name'] as String,
    lcc: json['lcc'] as int,
    image32: json['image32'] as String,
    image64: json['image64'] as String,
    image128: json['image128'] as String,
    isDeleted: json['isDeleted'] as bool,
    id: json['id'] as int,
    uid: json['uid'] as String,
    createdBy: json['createdBy'] as String,
    createdDate: json['createdDate'] as String,
    updatedBy: json['updatedBy'],
    updatedDate: json['updatedDate'] as String,
  );
}

Map<String, dynamic> _$AirlinesMetaToJson(AirlinesMeta instance) =>
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

Options _$OptionsFromJson(Map<String, dynamic> json) {
  return Options(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

DatePrices _$DatePricesFromJson(Map<String, dynamic> json) {
  return DatePrices(
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DatePricesToJson(DatePrices instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    date: json['date'] as String,
    price: json['price'],
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'date': instance.date,
      'price': instance.price,
    };

AirlinesFilters _$AirlinesFiltersFromJson(Map<String, dynamic> json) {
  return AirlinesFilters(
    code: json['code'] as String,
    count: json['count'] as int,
    minprice: json['minprice'],
    minpriceWithMarkup: json['minpriceWithMarkup'],
    meta: json['meta'] == null
        ? null
        : AirlinesMeta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AirlinesFiltersToJson(AirlinesFilters instance) =>
    <String, dynamic>{
      'code': instance.code,
      'count': instance.count,
      'minprice': instance.minprice,
      'minpriceWithMarkup': instance.minpriceWithMarkup,
      'meta': instance.meta,
    };
