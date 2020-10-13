import 'package:ota/models/flights/flight_search_response_entity.dart';

flightSearchResponseEntityFromJson(FlightSearchResponseEntity data, Map<String, dynamic> json) {
	if (json['version'] != null) {
		data.version = json['version'];
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['isError'] != null) {
		data.isError = json['isError'];
	}
	if (json['responseException'] != null) {
		data.responseException = json['responseException'];
	}
	if (json['result'] != null) {
		data.result = new FlightSearchResponseResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> flightSearchResponseEntityToJson(FlightSearchResponseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['version'] = entity.version;
	data['message'] = entity.message;
	data['isError'] = entity.isError;
	data['responseException'] = entity.responseException;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

flightSearchResponseResultFromJson(FlightSearchResponseResult data, Map<String, dynamic> json) {
	if (json['flights'] != null) {
		data.flights = new List<FlightSearchResponseResultFlight>();
		(json['flights'] as List).forEach((v) {
			data.flights.add(new FlightSearchResponseResultFlight().fromJson(v));
		});
	}
	if (json['datePrices'] != null) {
		data.datePrices = new FlightSearchResponseResultDatePrices().fromJson(json['datePrices']);
	}
	if (json['datePricesWithMarkup'] != null) {
		data.datePricesWithMarkup = new FlightSearchResponseResultDatePricesWithMarkup().fromJson(json['datePricesWithMarkup']);
	}
	if (json['airlinesFilters'] != null) {
		data.airlinesFilters = new List<FlightSearchResponseResultAirlinesFilter>();
		(json['airlinesFilters'] as List).forEach((v) {
			data.airlinesFilters.add(new FlightSearchResponseResultAirlinesFilter().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultToJson(FlightSearchResponseResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.flights != null) {
		data['flights'] =  entity.flights.map((v) => v.toJson()).toList();
	}
	if (entity.datePrices != null) {
		data['datePrices'] = entity.datePrices.toJson();
	}
	if (entity.datePricesWithMarkup != null) {
		data['datePricesWithMarkup'] = entity.datePricesWithMarkup.toJson();
	}
	if (entity.airlinesFilters != null) {
		data['airlinesFilters'] =  entity.airlinesFilters.map((v) => v.toJson()).toList();
	}
	return data;
}

flightSearchResponseResultFlightFromJson(FlightSearchResponseResultFlight data, Map<String, dynamic> json) {
	if (json['route'] != null) {
		data.route = new List<FlightSearchResponseResultFlightsRoute>();
		(json['route'] as List).forEach((v) {
			data.route.add(new FlightSearchResponseResultFlightsRoute().fromJson(v));
		});
	}
	if (json['nightsInDest'] != null) {
		data.nightsInDest = json['nightsInDest']?.toInt();
	}
	if (json['duration'] != null) {
		data.duration = new FlightSearchResponseResultFlightsDuration().fromJson(json['duration']);
	}
	if (json['flyFrom'] != null) {
		data.flyFrom = json['flyFrom']?.toString();
	}
	if (json['cityFrom'] != null) {
		data.cityFrom = json['cityFrom']?.toString();
	}
	if (json['cityCodeFrom'] != null) {
		data.cityCodeFrom = json['cityCodeFrom']?.toString();
	}
	if (json['countryFrom'] != null) {
		data.countryFrom = new FlightSearchResponseResultFlightsCountryFrom().fromJson(json['countryFrom']);
	}
	if (json['flyTo'] != null) {
		data.flyTo = json['flyTo']?.toString();
	}
	if (json['cityTo'] != null) {
		data.cityTo = json['cityTo']?.toString();
	}
	if (json['cityCodeTo'] != null) {
		data.cityCodeTo = json['cityCodeTo']?.toString();
	}
	if (json['countryTo'] != null) {
		data.countryTo = new FlightSearchResponseResultFlightsCountryTo().fromJson(json['countryTo']);
	}
	if (json['distance'] != null) {
		data.distance = json['distance']?.toDouble();
	}
	if (json['airlinesMeta'] != null) {
		data.airlinesMeta = new List<FlightSearchResponseResultFlightsAirlinesMetum>();
		(json['airlinesMeta'] as List).forEach((v) {
			data.airlinesMeta.add(new FlightSearchResponseResultFlightsAirlinesMetum().fromJson(v));
		});
	}
	if (json['has_airport_change'] != null) {
		data.hasAirportChange = json['has_airport_change'];
	}
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['bags_price'] != null) {
		data.bagsPrice = new FlightSearchResponseResultFlightsBagsPrice().fromJson(json['bags_price']);
	}
	if (json['baglimit'] != null) {
		data.baglimit = new FlightSearchResponseResultFlightsBaglimit().fromJson(json['baglimit']);
	}
	if (json['facilitated_booking_available'] != null) {
		data.facilitatedBookingAvailable = json['facilitated_booking_available'];
	}
	if (json['conversion'] != null) {
		data.conversion = new FlightSearchResponseResultFlightsConversion().fromJson(json['conversion']);
	}
	if (json['onewaystops_count'] != null) {
		data.onewaystopsCount = json['onewaystops_count']?.toInt();
	}
	if (json['returnwaystops_count'] != null) {
		data.returnwaystopsCount = json['returnwaystops_count']?.toInt();
	}
	if (json['oneway_local_arrival'] != null) {
		data.onewayLocalArrival = json['oneway_local_arrival']?.toString();
	}
	if (json['oneway_utc_arrival'] != null) {
		data.onewayUtcArrival = json['oneway_utc_arrival']?.toString();
	}
	if (json['oneway_local_departure'] != null) {
		data.onewayLocalDeparture = json['oneway_local_departure']?.toString();
	}
	if (json['oneway_utc_departure'] != null) {
		data.onewayUtcDeparture = json['oneway_utc_departure']?.toString();
	}
	if (json['return_local_arrival'] != null) {
		data.returnLocalArrival = json['return_local_arrival']?.toString();
	}
	if (json['return_utc_arrival'] != null) {
		data.returnUtcArrival = json['return_utc_arrival']?.toString();
	}
	if (json['return_local_departure'] != null) {
		data.returnLocalDeparture = json['return_local_departure']?.toString();
	}
	if (json['return_utc_departure'] != null) {
		data.returnUtcDeparture = json['return_utc_departure']?.toString();
	}
	if (json['displayRateInfoWithMarkup'] != null) {
		data.displayRateInfoWithMarkup = new FlightSearchResponseResultFlightsDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<FlightSearchResponseResultFlightsOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new FlightSearchResponseResultFlightsOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightToJson(FlightSearchResponseResultFlight entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.route != null) {
		data['route'] =  entity.route.map((v) => v.toJson()).toList();
	}
	data['nightsInDest'] = entity.nightsInDest;
	if (entity.duration != null) {
		data['duration'] = entity.duration.toJson();
	}
	data['flyFrom'] = entity.flyFrom;
	data['cityFrom'] = entity.cityFrom;
	data['cityCodeFrom'] = entity.cityCodeFrom;
	if (entity.countryFrom != null) {
		data['countryFrom'] = entity.countryFrom.toJson();
	}
	data['flyTo'] = entity.flyTo;
	data['cityTo'] = entity.cityTo;
	data['cityCodeTo'] = entity.cityCodeTo;
	if (entity.countryTo != null) {
		data['countryTo'] = entity.countryTo.toJson();
	}
	data['distance'] = entity.distance;
	if (entity.airlinesMeta != null) {
		data['airlinesMeta'] =  entity.airlinesMeta.map((v) => v.toJson()).toList();
	}
	data['has_airport_change'] = entity.hasAirportChange;
	data['price'] = entity.price;
	if (entity.bagsPrice != null) {
		data['bags_price'] = entity.bagsPrice.toJson();
	}
	if (entity.baglimit != null) {
		data['baglimit'] = entity.baglimit.toJson();
	}
	data['facilitated_booking_available'] = entity.facilitatedBookingAvailable;
	if (entity.conversion != null) {
		data['conversion'] = entity.conversion.toJson();
	}
	data['onewaystops_count'] = entity.onewaystopsCount;
	data['returnwaystops_count'] = entity.returnwaystopsCount;
	data['oneway_local_arrival'] = entity.onewayLocalArrival;
	data['oneway_utc_arrival'] = entity.onewayUtcArrival;
	data['oneway_local_departure'] = entity.onewayLocalDeparture;
	data['oneway_utc_departure'] = entity.onewayUtcDeparture;
	data['return_local_arrival'] = entity.returnLocalArrival;
	data['return_utc_arrival'] = entity.returnUtcArrival;
	data['return_local_departure'] = entity.returnLocalDeparture;
	data['return_utc_departure'] = entity.returnUtcDeparture;
	if (entity.displayRateInfoWithMarkup != null) {
		data['displayRateInfoWithMarkup'] = entity.displayRateInfoWithMarkup.toJson();
	}
	data['tpa'] = entity.tpa;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	return data;
}

flightSearchResponseResultFlightsRouteFromJson(FlightSearchResponseResultFlightsRoute data, Map<String, dynamic> json) {
	if (json['fare_category'] != null) {
		data.fareCategory = json['fare_category']?.toString();
	}
	if (json['fare_classes'] != null) {
		data.fareClasses = json['fare_classes']?.toString();
	}
	if (json['fare_family'] != null) {
		data.fareFamily = json['fare_family']?.toString();
	}
	if (json['return'] != null) {
		data.xReturn = json['return']?.toInt();
	}
	if (json['bags_recheck_required'] != null) {
		data.bagsRecheckRequired = json['bags_recheck_required'];
	}
	if (json['cityTo'] != null) {
		data.cityTo = json['cityTo']?.toString();
	}
	if (json['cityFrom'] != null) {
		data.cityFrom = json['cityFrom']?.toString();
	}
	if (json['cityCodeFrom'] != null) {
		data.cityCodeFrom = json['cityCodeFrom']?.toString();
	}
	if (json['cityCodeTo'] != null) {
		data.cityCodeTo = json['cityCodeTo']?.toString();
	}
	if (json['flyTo'] != null) {
		data.flyTo = json['flyTo']?.toString();
	}
	if (json['flyFrom'] != null) {
		data.flyFrom = json['flyFrom']?.toString();
	}
	if (json['airline'] != null) {
		data.airline = json['airline']?.toString();
	}
	if (json['operating_carrier'] != null) {
		data.operatingCarrier = json['operating_carrier']?.toString();
	}
	if (json['flight_no'] != null) {
		data.flightNo = json['flight_no']?.toInt();
	}
	if (json['operating_flight_no'] != null) {
		data.operatingFlightNo = json['operating_flight_no']?.toString();
	}
	if (json['local_arrival'] != null) {
		data.localArrival = json['local_arrival']?.toString();
	}
	if (json['utc_arrival'] != null) {
		data.utcArrival = json['utc_arrival']?.toString();
	}
	if (json['local_departure'] != null) {
		data.localDeparture = json['local_departure']?.toString();
	}
	if (json['utc_departure'] != null) {
		data.utcDeparture = json['utc_departure']?.toString();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightsRouteToJson(FlightSearchResponseResultFlightsRoute entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['fare_category'] = entity.fareCategory;
	data['fare_classes'] = entity.fareClasses;
	data['fare_family'] = entity.fareFamily;
	data['return'] = entity.xReturn;
	data['bags_recheck_required'] = entity.bagsRecheckRequired;
	data['cityTo'] = entity.cityTo;
	data['cityFrom'] = entity.cityFrom;
	data['cityCodeFrom'] = entity.cityCodeFrom;
	data['cityCodeTo'] = entity.cityCodeTo;
	data['flyTo'] = entity.flyTo;
	data['flyFrom'] = entity.flyFrom;
	data['airline'] = entity.airline;
	data['operating_carrier'] = entity.operatingCarrier;
	data['flight_no'] = entity.flightNo;
	data['operating_flight_no'] = entity.operatingFlightNo;
	data['local_arrival'] = entity.localArrival;
	data['utc_arrival'] = entity.utcArrival;
	data['local_departure'] = entity.localDeparture;
	data['utc_departure'] = entity.utcDeparture;
	return data;
}

flightSearchResponseResultFlightsDurationFromJson(FlightSearchResponseResultFlightsDuration data, Map<String, dynamic> json) {
	if (json['departure'] != null) {
		data.departure = json['departure']?.toInt();
	}
	if (json['return'] != null) {
		data.xReturn = json['return']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightsDurationToJson(FlightSearchResponseResultFlightsDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['departure'] = entity.departure;
	data['return'] = entity.xReturn;
	data['total'] = entity.total;
	return data;
}

flightSearchResponseResultFlightsCountryFromFromJson(FlightSearchResponseResultFlightsCountryFrom data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightsCountryFromToJson(FlightSearchResponseResultFlightsCountryFrom entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

flightSearchResponseResultFlightsCountryToFromJson(FlightSearchResponseResultFlightsCountryTo data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightsCountryToToJson(FlightSearchResponseResultFlightsCountryTo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

flightSearchResponseResultFlightsAirlinesMetumFromJson(FlightSearchResponseResultFlightsAirlinesMetum data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['lcc'] != null) {
		data.lcc = json['lcc']?.toInt();
	}
	if (json['image32'] != null) {
		data.image32 = json['image32']?.toString();
	}
	if (json['image64'] != null) {
		data.image64 = json['image64']?.toString();
	}
	if (json['image128'] != null) {
		data.image128 = json['image128']?.toString();
	}
	if (json['isDeleted'] != null) {
		data.isDeleted = json['isDeleted'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['uid'] != null) {
		data.uid = json['uid']?.toString();
	}
	if (json['createdBy'] != null) {
		data.createdBy = json['createdBy']?.toString();
	}
	if (json['createdDate'] != null) {
		data.createdDate = json['createdDate']?.toString();
	}
	if (json['updatedBy'] != null) {
		data.updatedBy = json['updatedBy'];
	}
	if (json['updatedDate'] != null) {
		data.updatedDate = json['updatedDate']?.toString();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightsAirlinesMetumToJson(FlightSearchResponseResultFlightsAirlinesMetum entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['type'] = entity.type;
	data['name'] = entity.name;
	data['lcc'] = entity.lcc;
	data['image32'] = entity.image32;
	data['image64'] = entity.image64;
	data['image128'] = entity.image128;
	data['isDeleted'] = entity.isDeleted;
	data['id'] = entity.id;
	data['uid'] = entity.uid;
	data['createdBy'] = entity.createdBy;
	data['createdDate'] = entity.createdDate;
	data['updatedBy'] = entity.updatedBy;
	data['updatedDate'] = entity.updatedDate;
	return data;
}

flightSearchResponseResultFlightsBagsPriceFromJson(FlightSearchResponseResultFlightsBagsPrice data, Map<String, dynamic> json) {
	if (json['__invalid_name__1'] != null) {
		data.dInvalidName1 = json['__invalid_name__1']?.toDouble();
	}
	if (json['__invalid_name__2'] != null) {
		data.nInvalidName2 = json['__invalid_name__2'];
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightsBagsPriceToJson(FlightSearchResponseResultFlightsBagsPrice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['__invalid_name__1'] = entity.dInvalidName1;
	data['__invalid_name__2'] = entity.nInvalidName2;
	return data;
}

flightSearchResponseResultFlightsBaglimitFromJson(FlightSearchResponseResultFlightsBaglimit data, Map<String, dynamic> json) {
	if (json['hand_width'] != null) {
		data.handWidth = json['hand_width']?.toInt();
	}
	if (json['hand_height'] != null) {
		data.handHeight = json['hand_height']?.toInt();
	}
	if (json['hand_length'] != null) {
		data.handLength = json['hand_length']?.toInt();
	}
	if (json['hand_weight'] != null) {
		data.handWeight = json['hand_weight']?.toInt();
	}
	if (json['hold_width'] != null) {
		data.holdWidth = json['hold_width']?.toInt();
	}
	if (json['hold_height'] != null) {
		data.holdHeight = json['hold_height']?.toInt();
	}
	if (json['hold_length'] != null) {
		data.holdLength = json['hold_length']?.toInt();
	}
	if (json['hold_dimensions_sum'] != null) {
		data.holdDimensionsSum = json['hold_dimensions_sum']?.toInt();
	}
	if (json['hold_weight'] != null) {
		data.holdWeight = json['hold_weight']?.toInt();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightsBaglimitToJson(FlightSearchResponseResultFlightsBaglimit entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['hand_width'] = entity.handWidth;
	data['hand_height'] = entity.handHeight;
	data['hand_length'] = entity.handLength;
	data['hand_weight'] = entity.handWeight;
	data['hold_width'] = entity.holdWidth;
	data['hold_height'] = entity.holdHeight;
	data['hold_length'] = entity.holdLength;
	data['hold_dimensions_sum'] = entity.holdDimensionsSum;
	data['hold_weight'] = entity.holdWeight;
	return data;
}

flightSearchResponseResultFlightsConversionFromJson(FlightSearchResponseResultFlightsConversion data, Map<String, dynamic> json) {
	if (json['eur'] != null) {
		data.eur = json['eur']?.toDouble();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightsConversionToJson(FlightSearchResponseResultFlightsConversion entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['eur'] = entity.eur;
	return data;
}

flightSearchResponseResultFlightsDisplayRateInfoWithMarkupFromJson(FlightSearchResponseResultFlightsDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
	if (json['totalPriceWithMarkup'] != null) {
		data.totalPriceWithMarkup = json['totalPriceWithMarkup']?.toDouble();
	}
	if (json['baseRate'] != null) {
		data.baseRate = json['baseRate']?.toDouble();
	}
	if (json['taxAndOtherCharges'] != null) {
		data.taxAndOtherCharges = json['taxAndOtherCharges']?.toDouble();
	}
	if (json['otaTax'] != null) {
		data.otaTax = json['otaTax']?.toDouble();
	}
	if (json['markup'] != null) {
		data.markup = json['markup']?.toDouble();
	}
	if (json['supplierBaseRate'] != null) {
		data.supplierBaseRate = json['supplierBaseRate']?.toDouble();
	}
	if (json['supplierTotalCost'] != null) {
		data.supplierTotalCost = json['supplierTotalCost']?.toDouble();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightsDisplayRateInfoWithMarkupToJson(FlightSearchResponseResultFlightsDisplayRateInfoWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['totalPriceWithMarkup'] = entity.totalPriceWithMarkup;
	data['baseRate'] = entity.baseRate;
	data['taxAndOtherCharges'] = entity.taxAndOtherCharges;
	data['otaTax'] = entity.otaTax;
	data['markup'] = entity.markup;
	data['supplierBaseRate'] = entity.supplierBaseRate;
	data['supplierTotalCost'] = entity.supplierTotalCost;
	return data;
}

flightSearchResponseResultFlightsOptionFromJson(FlightSearchResponseResultFlightsOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultFlightsOptionToJson(FlightSearchResponseResultFlightsOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}

flightSearchResponseResultDatePricesFromJson(FlightSearchResponseResultDatePrices data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<FlightSearchResponseResultDatePricesData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new FlightSearchResponseResultDatePricesData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultDatePricesToJson(FlightSearchResponseResultDatePrices entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

flightSearchResponseResultDatePricesDataFromJson(FlightSearchResponseResultDatePricesData data, Map<String, dynamic> json) {
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultDatePricesDataToJson(FlightSearchResponseResultDatePricesData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['date'] = entity.date;
	data['price'] = entity.price;
	return data;
}

flightSearchResponseResultDatePricesWithMarkupFromJson(FlightSearchResponseResultDatePricesWithMarkup data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<FlightSearchResponseResultDatePricesWithMarkupData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new FlightSearchResponseResultDatePricesWithMarkupData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultDatePricesWithMarkupToJson(FlightSearchResponseResultDatePricesWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

flightSearchResponseResultDatePricesWithMarkupDataFromJson(FlightSearchResponseResultDatePricesWithMarkupData data, Map<String, dynamic> json) {
	if (json['date'] != null) {
		data.date = json['date']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultDatePricesWithMarkupDataToJson(FlightSearchResponseResultDatePricesWithMarkupData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['date'] = entity.date;
	data['price'] = entity.price;
	return data;
}

flightSearchResponseResultAirlinesFilterFromJson(FlightSearchResponseResultAirlinesFilter data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['count'] != null) {
		data.count = json['count']?.toInt();
	}
	if (json['minprice'] != null) {
		data.minprice = json['minprice']?.toDouble();
	}
	if (json['minpriceWithMarkup'] != null) {
		data.minpriceWithMarkup = json['minpriceWithMarkup']?.toDouble();
	}
	if (json['meta'] != null) {
		data.meta = new FlightSearchResponseResultAirlinesFiltersMeta().fromJson(json['meta']);
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultAirlinesFilterToJson(FlightSearchResponseResultAirlinesFilter entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['count'] = entity.count;
	data['minprice'] = entity.minprice;
	data['minpriceWithMarkup'] = entity.minpriceWithMarkup;
	if (entity.meta != null) {
		data['meta'] = entity.meta.toJson();
	}
	return data;
}

flightSearchResponseResultAirlinesFiltersMetaFromJson(FlightSearchResponseResultAirlinesFiltersMeta data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['lcc'] != null) {
		data.lcc = json['lcc']?.toInt();
	}
	if (json['image32'] != null) {
		data.image32 = json['image32']?.toString();
	}
	if (json['image64'] != null) {
		data.image64 = json['image64']?.toString();
	}
	if (json['image128'] != null) {
		data.image128 = json['image128']?.toString();
	}
	if (json['isDeleted'] != null) {
		data.isDeleted = json['isDeleted'];
	}
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['uid'] != null) {
		data.uid = json['uid']?.toString();
	}
	if (json['createdBy'] != null) {
		data.createdBy = json['createdBy']?.toString();
	}
	if (json['createdDate'] != null) {
		data.createdDate = json['createdDate']?.toString();
	}
	if (json['updatedBy'] != null) {
		data.updatedBy = json['updatedBy'];
	}
	if (json['updatedDate'] != null) {
		data.updatedDate = json['updatedDate']?.toString();
	}
	return data;
}

Map<String, dynamic> flightSearchResponseResultAirlinesFiltersMetaToJson(FlightSearchResponseResultAirlinesFiltersMeta entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['type'] = entity.type;
	data['name'] = entity.name;
	data['lcc'] = entity.lcc;
	data['image32'] = entity.image32;
	data['image64'] = entity.image64;
	data['image128'] = entity.image128;
	data['isDeleted'] = entity.isDeleted;
	data['id'] = entity.id;
	data['uid'] = entity.uid;
	data['createdBy'] = entity.createdBy;
	data['createdDate'] = entity.createdDate;
	data['updatedBy'] = entity.updatedBy;
	data['updatedDate'] = entity.updatedDate;
	return data;
}