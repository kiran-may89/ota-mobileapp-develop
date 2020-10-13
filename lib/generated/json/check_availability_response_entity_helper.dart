import 'package:ota/models/flights/check_availability_response_entity.dart';

checkAvailabilityResponseEntityFromJson(CheckAvailabilityResponseEntity data, Map<String, dynamic> json) {
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
		data.result = new CheckAvailabilityResponseResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseEntityToJson(CheckAvailabilityResponseEntity entity) {
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

checkAvailabilityResponseResultFromJson(CheckAvailabilityResponseResult data, Map<String, dynamic> json) {
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<CheckAvailabilityResponseResultOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new CheckAvailabilityResponseResultOption().fromJson(v));
		});
	}
	if (json['airlinesMeta'] != null) {
		data.airlinesMeta = new List<CheckAvailabilityResponseResultAirlinesMetum>();
		(json['airlinesMeta'] as List).forEach((v) {
			data.airlinesMeta.add(new CheckAvailabilityResponseResultAirlinesMetum().fromJson(v));
		});
	}
	if (json['server_time'] != null) {
		data.serverTime = json['server_time']?.toDouble();
	}
	if (json['pnum'] != null) {
		data.pnum = json['pnum']?.toDouble();
	}
	if (json['flights'] != null) {
		data.flights = new List<CheckAvailabilityResponseResultFlight>();
		(json['flights'] as List).forEach((v) {
			data.flights.add(new CheckAvailabilityResponseResultFlight().fromJson(v));
		});
	}
	if (json['flights_checked'] != null) {
		data.flightsChecked = json['flights_checked'];
	}
	if (json['flights_to_check'] != null) {
		data.flightsToCheck = json['flights_to_check'];
	}
	if (json['flights_real_checked'] != null) {
		data.flightsRealChecked = json['flights_real_checked'];
	}
	if (json['flights_invalid'] != null) {
		data.flightsInvalid = json['flights_invalid'];
	}
	if (json['max_passengers'] != null) {
		data.maxPassengers = json['max_passengers']?.toDouble();
	}
	if (json['infants_conditions'] != null) {
		data.infantsConditions = new CheckAvailabilityResponseResultInfantsConditions().fromJson(json['infants_conditions']);
	}
	if (json['document_options'] != null) {
		data.documentOptions = new CheckAvailabilityResponseResultDocumentOptions().fromJson(json['document_options']);
	}
	if (json['visas_agreement_requiered'] != null) {
		data.visasAgreementRequiered = json['visas_agreement_requiered'];
	}
	if (json['transfers'] != null) {
		data.transfers = new List<dynamic>();
		data.transfers.addAll(json['transfers']);
	}
	if (json['route'] != null) {
		data.route = json['route']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['book_fee'] != null) {
		data.bookFee = json['book_fee']?.toDouble();
	}
	if (json['fee_airline'] != null) {
		data.feeAirline = json['fee_airline']?.toDouble();
	}
	if (json['extra_fee'] != null) {
		data.extraFee = json['extra_fee']?.toDouble();
	}
	if (json['flights_price'] != null) {
		data.flightsPrice = json['flights_price']?.toDouble();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toDouble();
	}
	if (json['sp_fee'] != null) {
		data.spFee = json['sp_fee']?.toDouble();
	}
	if (json['flight_real_price'] != null) {
		data.flightRealPrice = json['flight_real_price']?.toDouble();
	}
	if (json['one_passenger'] != null) {
		data.onePassenger = json['one_passenger']?.toDouble();
	}
	if (json['credits_price'] != null) {
		data.creditsPrice = json['credits_price']?.toDouble();
	}
	if (json['orig_price_usage'] != null) {
		data.origPriceUsage = json['orig_price_usage'];
	}
	if (json['price_change'] != null) {
		data.priceChange = json['price_change'];
	}
	if (json['tickets_price'] != null) {
		data.ticketsPrice = json['tickets_price']?.toDouble();
	}
	if (json['orig_price'] != null) {
		data.origPrice = json['orig_price']?.toDouble();
	}
	if (json['insurance_data'] != null) {
		data.insuranceData = new CheckAvailabilityResponseResultInsuranceData().fromJson(json['insurance_data']);
	}
	if (json['insurance_price'] != null) {
		data.insurancePrice = new CheckAvailabilityResponseResultInsurancePrice().fromJson(json['insurance_price']);
	}
	if (json['adults_price'] != null) {
		data.adultsPrice = json['adults_price']?.toDouble();
	}
	if (json['children_price'] != null) {
		data.childrenPrice = json['children_price']?.toDouble();
	}
	if (json['infants_price'] != null) {
		data.infantsPrice = json['infants_price']?.toDouble();
	}
	if (json['bags'] != null) {
		data.bags = new CheckAvailabilityResponseResultBags().fromJson(json['bags']);
	}
	if (json['bags_fee'] != null) {
		data.bagsFee = json['bags_fee']?.toDouble();
	}
	if (json['bags_fee_split'] != null) {
		data.bagsFeeSplit = new CheckAvailabilityResponseResultBagsFeeSplit().fromJson(json['bags_fee_split']);
	}
	if (json['bags_price'] != null) {
		data.bagsPrice = new CheckAvailabilityResponseResultBagsPrice().fromJson(json['bags_price']);
	}
	if (json['bags_price_split'] != null) {
		data.bagsPriceSplit = new CheckAvailabilityResponseResultBagsPriceSplit().fromJson(json['bags_price_split']);
	}
	if (json['hand_bags_price'] != null) {
		data.handBagsPrice = new CheckAvailabilityResponseResultHandBagsPrice().fromJson(json['hand_bags_price']);
	}
	if (json['bags_restrictions'] != null) {
		data.bagsRestrictions = new CheckAvailabilityResponseResultBagsRestrictions().fromJson(json['bags_restrictions']);
	}
	if (json['additional_order_baggage_fee'] != null) {
		data.additionalOrderBaggageFee = json['additional_order_baggage_fee']?.toDouble();
	}
	if (json['luggage'] != null) {
		data.luggage = json['luggage']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['segments'] != null) {
		data.segments = new List<dynamic>();
		data.segments.addAll(json['segments']);
	}
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['conversion'] != null) {
		data.conversion = new CheckAvailabilityResponseResultConversion().fromJson(json['conversion']);
	}
	if (json['booking_token'] != null) {
		data.bookingToken = json['booking_token']?.toString();
	}
	if (json['adult_threshold'] != null) {
		data.adultThreshold = json['adult_threshold']?.toDouble();
	}
	if (json['age_category_thresholds'] != null) {
		data.ageCategoryThresholds = new CheckAvailabilityResponseResultAgeCategoryThresholds().fromJson(json['age_category_thresholds']);
	}
	if (json['additional_services'] != null) {
		data.additionalServices = new CheckAvailabilityResponseResultAdditionalServices().fromJson(json['additional_services']);
	}
	if (json['baggage'] != null) {
		data.baggage = new CheckAvailabilityResponseResultBaggage().fromJson(json['baggage']);
	}
	if (json['has_us_segment'] != null) {
		data.hasUsSegment = json['has_us_segment'];
	}
	if (json['eur_payment_price'] != null) {
		data.eurPaymentPrice = json['eur_payment_price']?.toDouble();
	}
	if (json['book_feeWithMarkup'] != null) {
		data.bookFeewithmarkup = json['book_feeWithMarkup']?.toDouble();
	}
	if (json['fee_airlineWithMarkup'] != null) {
		data.feeAirlinewithmarkup = json['fee_airlineWithMarkup']?.toDouble();
	}
	if (json['extra_feeWithMarkup'] != null) {
		data.extraFeewithmarkup = json['extra_feeWithMarkup']?.toDouble();
	}
	if (json['flights_priceWithMarkup'] != null) {
		data.flightsPricewithmarkup = json['flights_priceWithMarkup']?.toDouble();
	}
	if (json['displayRateInfoWithMarkup'] != null) {
		data.displayRateInfoWithMarkup = new CheckAvailabilityResponseResultDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['sp_feeWithMarkup'] != null) {
		data.spFeewithmarkup = json['sp_feeWithMarkup']?.toDouble();
	}
	if (json['flight_real_priceWithMarkup'] != null) {
		data.flightRealPricewithmarkup = json['flight_real_priceWithMarkup']?.toDouble();
	}
	if (json['eur_payment_priceWithMarkup'] != null) {
		data.eurPaymentPricewithmarkup = json['eur_payment_priceWithMarkup']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultToJson(CheckAvailabilityResponseResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tpa'] = entity.tpa;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	if (entity.airlinesMeta != null) {
		data['airlinesMeta'] =  entity.airlinesMeta.map((v) => v.toJson()).toList();
	}
	data['server_time'] = entity.serverTime;
	data['pnum'] = entity.pnum;
	if (entity.flights != null) {
		data['flights'] =  entity.flights.map((v) => v.toJson()).toList();
	}
	data['flights_checked'] = entity.flightsChecked;
	data['flights_to_check'] = entity.flightsToCheck;
	data['flights_real_checked'] = entity.flightsRealChecked;
	data['flights_invalid'] = entity.flightsInvalid;
	data['max_passengers'] = entity.maxPassengers;
	if (entity.infantsConditions != null) {
		data['infants_conditions'] = entity.infantsConditions.toJson();
	}
	if (entity.documentOptions != null) {
		data['document_options'] = entity.documentOptions.toJson();
	}
	data['visas_agreement_requiered'] = entity.visasAgreementRequiered;
	if (entity.transfers != null) {
		data['transfers'] =  [];
	}
	data['route'] = entity.route;
	data['book_fee'] = entity.bookFee;
	data['fee_airline'] = entity.feeAirline;
	data['extra_fee'] = entity.extraFee;
	data['flights_price'] = entity.flightsPrice;
	data['total'] = entity.total;
	data['sp_fee'] = entity.spFee;
	data['flight_real_price'] = entity.flightRealPrice;
	data['one_passenger'] = entity.onePassenger;
	data['credits_price'] = entity.creditsPrice;
	data['orig_price_usage'] = entity.origPriceUsage;
	data['price_change'] = entity.priceChange;
	data['tickets_price'] = entity.ticketsPrice;
	data['orig_price'] = entity.origPrice;
	if (entity.insuranceData != null) {
		data['insurance_data'] = entity.insuranceData.toJson();
	}
	if (entity.insurancePrice != null) {
		data['insurance_price'] = entity.insurancePrice.toJson();
	}
	data['adults_price'] = entity.adultsPrice;
	data['children_price'] = entity.childrenPrice;
	data['infants_price'] = entity.infantsPrice;
	if (entity.bags != null) {
		data['bags'] = entity.bags.toJson();
	}
	data['bags_fee'] = entity.bagsFee;
	if (entity.bagsFeeSplit != null) {
		data['bags_fee_split'] = entity.bagsFeeSplit.toJson();
	}
	if (entity.bagsPrice != null) {
		data['bags_price'] = entity.bagsPrice.toJson();
	}
	if (entity.bagsPriceSplit != null) {
		data['bags_price_split'] = entity.bagsPriceSplit.toJson();
	}
	if (entity.handBagsPrice != null) {
		data['hand_bags_price'] = entity.handBagsPrice.toJson();
	}
	if (entity.bagsRestrictions != null) {
		data['bags_restrictions'] = entity.bagsRestrictions.toJson();
	}
	data['additional_order_baggage_fee'] = entity.additionalOrderBaggageFee;
	data['luggage'] = entity.luggage;
	if (entity.segments != null) {
		data['segments'] =  [];
	}
	data['currency'] = entity.currency;
	if (entity.conversion != null) {
		data['conversion'] = entity.conversion.toJson();
	}
	data['booking_token'] = entity.bookingToken;
	data['adult_threshold'] = entity.adultThreshold;
	if (entity.ageCategoryThresholds != null) {
		data['age_category_thresholds'] = entity.ageCategoryThresholds.toJson();
	}
	if (entity.additionalServices != null) {
		data['additional_services'] = entity.additionalServices.toJson();
	}
	if (entity.baggage != null) {
		data['baggage'] = entity.baggage.toJson();
	}
	data['has_us_segment'] = entity.hasUsSegment;
	data['eur_payment_price'] = entity.eurPaymentPrice;
	data['book_feeWithMarkup'] = entity.bookFeewithmarkup;
	data['fee_airlineWithMarkup'] = entity.feeAirlinewithmarkup;
	data['extra_feeWithMarkup'] = entity.extraFeewithmarkup;
	data['flights_priceWithMarkup'] = entity.flightsPricewithmarkup;
	if (entity.displayRateInfoWithMarkup != null) {
		data['displayRateInfoWithMarkup'] = entity.displayRateInfoWithMarkup.toJson();
	}
	data['sp_feeWithMarkup'] = entity.spFeewithmarkup;
	data['flight_real_priceWithMarkup'] = entity.flightRealPricewithmarkup;
	data['eur_payment_priceWithMarkup'] = entity.eurPaymentPricewithmarkup;
	return data;
}

checkAvailabilityResponseResultOptionFromJson(CheckAvailabilityResponseResultOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultOptionToJson(CheckAvailabilityResponseResultOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}

checkAvailabilityResponseResultAirlinesMetumFromJson(CheckAvailabilityResponseResultAirlinesMetum data, Map<String, dynamic> json) {
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

Map<String, dynamic> checkAvailabilityResponseResultAirlinesMetumToJson(CheckAvailabilityResponseResultAirlinesMetum entity) {
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

checkAvailabilityResponseResultFlightFromJson(CheckAvailabilityResponseResultFlight data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['combination_trip_id'] != null) {
		data.combinationTripId = json['combination_trip_id']?.toString();
	}
	if (json['original_trip_id'] != null) {
		data.originalTripId = json['original_trip_id']?.toString();
	}
	if (json['dst'] != null) {
		data.dst = json['dst']?.toString();
	}
	if (json['src'] != null) {
		data.src = json['src']?.toString();
	}
	if (json['flight_no'] != null) {
		data.flightNo = json['flight_no']?.toString();
	}
	if (json['airline'] != null) {
		data.airline = new CheckAvailabilityResponseResultFlightsAirline().fromJson(json['airline']);
	}
	if (json['operating_airline'] != null) {
		data.operatingAirline = new CheckAvailabilityResponseResultFlightsOperatingAirline().fromJson(json['operating_airline']);
	}
	if (json['source'] != null) {
		data.source = json['source']?.toString();
	}
	if (json['scraping_start'] != null) {
		data.scrapingStart = json['scraping_start']?.toDouble();
	}
	if (json['extras'] != null) {
		data.extras = json['extras']?.toString();
	}
	if (json['passengers_flight_check'] != null) {
		data.passengersFlightCheck = new CheckAvailabilityResponseResultFlightsPassengersFlightCheck().fromJson(json['passengers_flight_check']);
	}
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['eur'] != null) {
		data.eur = json['eur']?.toDouble();
	}
	if (json['found_on'] != null) {
		data.foundOn = json['found_on']?.toString();
	}
	if (json['invalid'] != null) {
		data.invalid = json['invalid']?.toDouble();
	}
	if (json['timestamp'] != null) {
		data.timestamp = json['timestamp']?.toString();
	}
	if (json['refreshed'] != null) {
		data.refreshed = json['refreshed']?.toString();
	}
	if (json['refresh_ttl'] != null) {
		data.refreshTtl = json['refresh_ttl']?.toDouble();
	}
	if (json['refresh_period'] != null) {
		data.refreshPeriod = json['refresh_period']?.toDouble();
	}
	if (json['fare_basis'] != null) {
		data.fareBasis = json['fare_basis']?.toString();
	}
	if (json['fare_category'] != null) {
		data.fareCategory = json['fare_category']?.toString();
	}
	if (json['fare_restriction'] != null) {
		data.fareRestriction = json['fare_restriction'];
	}
	if (json['fare_class'] != null) {
		data.fareClass = json['fare_class']?.toString();
	}
	if (json['baggage_fare'] != null) {
		data.baggageFare = json['baggage_fare']?.toString();
	}
	if (json['is_cabin_bags_with_priority_boarding'] != null) {
		data.isCabinBagsWithPriorityBoarding = json['is_cabin_bags_with_priority_boarding'];
	}
	if (json['source_name'] != null) {
		data.sourceName = json['source_name']?.toString();
	}
	if (json['source_url'] != null) {
		data.sourceUrl = json['source_url']?.toString();
	}
	if (json['checkin'] != null) {
		data.checkin = json['checkin']?.toString();
	}
	if (json['src_country'] != null) {
		data.srcCountry = json['src_country']?.toString();
	}
	if (json['dst_country'] != null) {
		data.dstCountry = json['dst_country']?.toString();
	}
	if (json['src_station'] != null) {
		data.srcStation = json['src_station']?.toString();
	}
	if (json['dst_station'] != null) {
		data.dstStation = json['dst_station']?.toString();
	}
	if (json['infants_conditions'] != null) {
		data.infantsConditions = new CheckAvailabilityResponseResultFlightsInfantsConditions().fromJson(json['infants_conditions']);
	}
	if (json['eur_infants'] != null) {
		data.eurInfants = json['eur_infants']?.toDouble();
	}
	if (json['eur_children'] != null) {
		data.eurChildren = json['eur_children']?.toDouble();
	}
	if (json['max_passengers_for_price'] != null) {
		data.maxPassengersForPrice = json['max_passengers_for_price']?.toDouble();
	}
	if (json['src_name'] != null) {
		data.srcName = json['src_name']?.toString();
	}
	if (json['dst_name'] != null) {
		data.dstName = json['dst_name']?.toString();
	}
	if (json['vehicle'] != null) {
		data.vehicle = new CheckAvailabilityResponseResultFlightsVehicle().fromJson(json['vehicle']);
	}
	if (json['return'] != null) {
		data.xReturn = json['return']?.toDouble();
	}
	if (json['guarantee'] != null) {
		data.guarantee = json['guarantee'];
	}
	if (json['guarantee_disclaimer'] != null) {
		data.guaranteeDisclaimer = json['guarantee_disclaimer']?.toString();
	}
	if (json['bags_recheck_required'] != null) {
		data.bagsRecheckRequired = json['bags_recheck_required'];
	}
	if (json['bags_recheck_disclaimer'] != null) {
		data.bagsRecheckDisclaimer = json['bags_recheck_disclaimer']?.toString();
	}
	if (json['segment_pricing'] != null) {
		data.segmentPricing = new CheckAvailabilityResponseResultFlightsSegmentPricing().fromJson(json['segment_pricing']);
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

Map<String, dynamic> checkAvailabilityResponseResultFlightToJson(CheckAvailabilityResponseResultFlight entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['combination_trip_id'] = entity.combinationTripId;
	data['original_trip_id'] = entity.originalTripId;
	data['dst'] = entity.dst;
	data['src'] = entity.src;
	data['flight_no'] = entity.flightNo;
	if (entity.airline != null) {
		data['airline'] = entity.airline.toJson();
	}
	if (entity.operatingAirline != null) {
		data['operating_airline'] = entity.operatingAirline.toJson();
	}
	data['source'] = entity.source;
	data['scraping_start'] = entity.scrapingStart;
	data['extras'] = entity.extras;
	if (entity.passengersFlightCheck != null) {
		data['passengers_flight_check'] = entity.passengersFlightCheck.toJson();
	}
	data['price'] = entity.price;
	data['eur'] = entity.eur;
	data['found_on'] = entity.foundOn;
	data['invalid'] = entity.invalid;
	data['timestamp'] = entity.timestamp;
	data['refreshed'] = entity.refreshed;
	data['refresh_ttl'] = entity.refreshTtl;
	data['refresh_period'] = entity.refreshPeriod;
	data['fare_basis'] = entity.fareBasis;
	data['fare_category'] = entity.fareCategory;
	data['fare_restriction'] = entity.fareRestriction;
	data['fare_class'] = entity.fareClass;
	data['baggage_fare'] = entity.baggageFare;
	data['is_cabin_bags_with_priority_boarding'] = entity.isCabinBagsWithPriorityBoarding;
	data['source_name'] = entity.sourceName;
	data['source_url'] = entity.sourceUrl;
	data['checkin'] = entity.checkin;
	data['src_country'] = entity.srcCountry;
	data['dst_country'] = entity.dstCountry;
	data['src_station'] = entity.srcStation;
	data['dst_station'] = entity.dstStation;
	if (entity.infantsConditions != null) {
		data['infants_conditions'] = entity.infantsConditions.toJson();
	}
	data['eur_infants'] = entity.eurInfants;
	data['eur_children'] = entity.eurChildren;
	data['max_passengers_for_price'] = entity.maxPassengersForPrice;
	data['src_name'] = entity.srcName;
	data['dst_name'] = entity.dstName;
	if (entity.vehicle != null) {
		data['vehicle'] = entity.vehicle.toJson();
	}
	data['return'] = entity.xReturn;
	data['guarantee'] = entity.guarantee;
	data['guarantee_disclaimer'] = entity.guaranteeDisclaimer;
	data['bags_recheck_required'] = entity.bagsRecheckRequired;
	data['bags_recheck_disclaimer'] = entity.bagsRecheckDisclaimer;
	if (entity.segmentPricing != null) {
		data['segment_pricing'] = entity.segmentPricing.toJson();
	}
	data['local_arrival'] = entity.localArrival;
	data['utc_arrival'] = entity.utcArrival;
	data['local_departure'] = entity.localDeparture;
	data['utc_departure'] = entity.utcDeparture;
	return data;
}

checkAvailabilityResponseResultFlightsAirlineFromJson(CheckAvailabilityResponseResultFlightsAirline data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toDouble();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['iata_code'] != null) {
		data.iataCode = json['iata_code']?.toString();
	}
	if (json['icao_code'] != null) {
		data.icaoCode = json['icao_code']?.toString();
	}
	if (json['code_public'] != null) {
		data.codePublic = json['code_public']?.toString();
	}
	if (json['airLineName'] != null) {
		data.airLineName = json['airLineName']?.toString();
	}
	if (json['alliance'] != null) {
		data.alliance = json['alliance'];
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['checkin'] != null) {
		data.checkin = json['checkin']?.toDouble();
	}
	if (json['close_booking_hours'] != null) {
		data.closeBookingHours = json['close_booking_hours']?.toDouble();
	}
	if (json['booking_doc_needed'] != null) {
		data.bookingDocNeeded = json['booking_doc_needed']?.toDouble();
	}
	if (json['airport_checkin'] != null) {
		data.airportCheckin = json['airport_checkin']?.toDouble();
	}
	if (json['passengers_in_search'] != null) {
		data.passengersInSearch = json['passengers_in_search']?.toDouble();
	}
	if (json['doing_online_checkin'] != null) {
		data.doingOnlineCheckin = json['doing_online_checkin']?.toDouble();
	}
	if (json['maximum_passengers'] != null) {
		data.maximumPassengers = json['maximum_passengers']?.toDouble();
	}
	if (json['grade'] != null) {
		data.grade = json['grade']?.toString();
	}
	if (json['virtual_card_req'] != null) {
		data.virtualCardReq = json['virtual_card_req'];
	}
	if (json['country'] != null) {
		data.country = json['country']?.toString();
	}
	if (json['carrier_type'] != null) {
		data.carrierType = json['carrier_type']?.toString();
	}
	if (json['parent_carrier'] != null) {
		data.parentCarrier = json['parent_carrier']?.toString();
	}
	if (json['checkin_closure'] != null) {
		data.checkinClosure = json['checkin_closure']?.toDouble();
	}
	if (json['shorter_stopovers_allowed'] != null) {
		data.shorterStopoversAllowed = json['shorter_stopovers_allowed']?.toDouble();
	}
	if (json['deprecated'] != null) {
		data.deprecated = json['deprecated'];
	}
	if (json['book_fee'] != null) {
		data.bookFee = json['book_fee']?.toDouble();
	}
	if (json['fee_airline'] != null) {
		data.feeAirline = json['fee_airline']?.toDouble();
	}
	if (json['search_priority'] != null) {
		data.searchPriority = json['search_priority'];
	}
	if (json['fee_instead'] != null) {
		data.feeInstead = json['fee_instead']?.toDouble();
	}
	if (json['fee_percent'] != null) {
		data.feePercent = json['fee_percent']?.toDouble();
	}
	if (json['flight_change_fee'] != null) {
		data.flightChangeFee = json['flight_change_fee']?.toDouble();
	}
	if (json['threshold_child'] != null) {
		data.thresholdChild = json['threshold_child']?.toString();
	}
	if (json['threshold_teen'] != null) {
		data.thresholdTeen = json['threshold_teen'];
	}
	if (json['threshold_adult'] != null) {
		data.thresholdAdult = json['threshold_adult']?.toString();
	}
	if (json['fees_per_source'] != null) {
		data.feesPerSource = new CheckAvailabilityResponseResultFlightsAirlineFeesPerSource().fromJson(json['fees_per_source']);
	}
	if (json['affil_url'] != null) {
		data.affilUrl = json['affil_url'];
	}
	if (json['temporary_disabled'] != null) {
		data.temporaryDisabled = json['temporary_disabled'];
	}
	if (json['non_active_reason'] != null) {
		data.nonActiveReason = json['non_active_reason'];
	}
	if (json['lcc'] != null) {
		data.lcc = json['lcc'];
	}
	if (json['active'] != null) {
		data.active = json['active']?.toDouble();
	}
	if (json['iatacode'] != null) {
		data.iatacode = json['iatacode']?.toString();
	}
	if (json['is_passenger_cardholder'] != null) {
		data.isPassengerCardholder = json['is_passenger_cardholder'];
	}
	if (json['is_private_fares_allowed'] != null) {
		data.isPrivateFaresAllowed = json['is_private_fares_allowed'];
	}
	if (json['luggage_only_during_checkin_airlines'] != null) {
		data.luggageOnlyDuringCheckinAirlines = json['luggage_only_during_checkin_airlines'];
	}
	if (json['luggage_only_on_web'] != null) {
		data.luggageOnlyOnWeb = json['luggage_only_on_web'];
	}
	if (json['mmb_link'] != null) {
		data.mmbLink = json['mmb_link'];
	}
	if (json['payment_card_copy_eticket_requirement'] != null) {
		data.paymentCardCopyEticketRequirement = json['payment_card_copy_eticket_requirement'];
	}
	if (json['skip_subairline_merge'] != null) {
		data.skipSubairlineMerge = json['skip_subairline_merge'];
	}
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['iata'] != null) {
		data.iata = json['iata']?.toString();
	}
	if (json['hand_length'] != null) {
		data.handLength = json['hand_length']?.toDouble();
	}
	if (json['hand_width'] != null) {
		data.handWidth = json['hand_width']?.toDouble();
	}
	if (json['hand_height'] != null) {
		data.handHeight = json['hand_height']?.toDouble();
	}
	if (json['hand_weight'] != null) {
		data.handWeight = json['hand_weight']?.toDouble();
	}
	if (json['hold_weight'] != null) {
		data.holdWeight = json['hold_weight']?.toDouble();
	}
	if (json['hold_length'] != null) {
		data.holdLength = json['hold_length']?.toDouble();
	}
	if (json['hold_width'] != null) {
		data.holdWidth = json['hold_width']?.toDouble();
	}
	if (json['hold_height'] != null) {
		data.holdHeight = json['hold_height']?.toDouble();
	}
	if (json['hand2_length'] != null) {
		data.hand2Length = json['hand2_length'];
	}
	if (json['hand2_width'] != null) {
		data.hand2Width = json['hand2_width'];
	}
	if (json['hand2_height'] != null) {
		data.hand2Height = json['hand2_height'];
	}
	if (json['hand2_weight'] != null) {
		data.hand2Weight = json['hand2_weight'];
	}
	if (json['hand2_note'] != null) {
		data.hand2Note = json['hand2_note']?.toString();
	}
	if (json['hand_note'] != null) {
		data.handNote = json['hand_note']?.toString();
	}
	if (json['hold_note'] != null) {
		data.holdNote = json['hold_note']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsAirlineToJson(CheckAvailabilityResponseResultFlightsAirline entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['code'] = entity.code;
	data['iata_code'] = entity.iataCode;
	data['icao_code'] = entity.icaoCode;
	data['code_public'] = entity.codePublic;
	data['airLineName'] = entity.airLineName;
	data['alliance'] = entity.alliance;
	data['url'] = entity.url;
	data['checkin'] = entity.checkin;
	data['close_booking_hours'] = entity.closeBookingHours;
	data['booking_doc_needed'] = entity.bookingDocNeeded;
	data['airport_checkin'] = entity.airportCheckin;
	data['passengers_in_search'] = entity.passengersInSearch;
	data['doing_online_checkin'] = entity.doingOnlineCheckin;
	data['maximum_passengers'] = entity.maximumPassengers;
	data['grade'] = entity.grade;
	data['virtual_card_req'] = entity.virtualCardReq;
	data['country'] = entity.country;
	data['carrier_type'] = entity.carrierType;
	data['parent_carrier'] = entity.parentCarrier;
	data['checkin_closure'] = entity.checkinClosure;
	data['shorter_stopovers_allowed'] = entity.shorterStopoversAllowed;
	data['deprecated'] = entity.deprecated;
	data['book_fee'] = entity.bookFee;
	data['fee_airline'] = entity.feeAirline;
	data['search_priority'] = entity.searchPriority;
	data['fee_instead'] = entity.feeInstead;
	data['fee_percent'] = entity.feePercent;
	data['flight_change_fee'] = entity.flightChangeFee;
	data['threshold_child'] = entity.thresholdChild;
	data['threshold_teen'] = entity.thresholdTeen;
	data['threshold_adult'] = entity.thresholdAdult;
	if (entity.feesPerSource != null) {
		data['fees_per_source'] = entity.feesPerSource.toJson();
	}
	data['affil_url'] = entity.affilUrl;
	data['temporary_disabled'] = entity.temporaryDisabled;
	data['non_active_reason'] = entity.nonActiveReason;
	data['lcc'] = entity.lcc;
	data['active'] = entity.active;
	data['iatacode'] = entity.iatacode;
	data['is_passenger_cardholder'] = entity.isPassengerCardholder;
	data['is_private_fares_allowed'] = entity.isPrivateFaresAllowed;
	data['luggage_only_during_checkin_airlines'] = entity.luggageOnlyDuringCheckinAirlines;
	data['luggage_only_on_web'] = entity.luggageOnlyOnWeb;
	data['mmb_link'] = entity.mmbLink;
	data['payment_card_copy_eticket_requirement'] = entity.paymentCardCopyEticketRequirement;
	data['skip_subairline_merge'] = entity.skipSubairlineMerge;
	data['Name'] = entity.name;
	data['iata'] = entity.iata;
	data['hand_length'] = entity.handLength;
	data['hand_width'] = entity.handWidth;
	data['hand_height'] = entity.handHeight;
	data['hand_weight'] = entity.handWeight;
	data['hold_weight'] = entity.holdWeight;
	data['hold_length'] = entity.holdLength;
	data['hold_width'] = entity.holdWidth;
	data['hold_height'] = entity.holdHeight;
	data['hand2_length'] = entity.hand2Length;
	data['hand2_width'] = entity.hand2Width;
	data['hand2_height'] = entity.hand2Height;
	data['hand2_weight'] = entity.hand2Weight;
	data['hand2_note'] = entity.hand2Note;
	data['hand_note'] = entity.handNote;
	data['hold_note'] = entity.holdNote;
	return data;
}

checkAvailabilityResponseResultFlightsAirlineFeesPerSourceFromJson(CheckAvailabilityResponseResultFlightsAirlineFeesPerSource data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsAirlineFeesPerSourceToJson(CheckAvailabilityResponseResultFlightsAirlineFeesPerSource entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

checkAvailabilityResponseResultFlightsOperatingAirlineFromJson(CheckAvailabilityResponseResultFlightsOperatingAirline data, Map<String, dynamic> json) {
	if (json['iata'] != null) {
		data.iata = json['iata']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsOperatingAirlineToJson(CheckAvailabilityResponseResultFlightsOperatingAirline entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['iata'] = entity.iata;
	data['name'] = entity.name;
	return data;
}

checkAvailabilityResponseResultFlightsPassengersFlightCheckFromJson(CheckAvailabilityResponseResultFlightsPassengersFlightCheck data, Map<String, dynamic> json) {
	if (json['1'] != null) {
		data.x1 = new CheckAvailabilityResponseResultFlightsPassengersFlightCheck1().fromJson(json['1']);
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsPassengersFlightCheckToJson(CheckAvailabilityResponseResultFlightsPassengersFlightCheck entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.x1 != null) {
		data['1'] = entity.x1.toJson();
	}
	return data;
}

checkAvailabilityResponseResultFlightsPassengersFlightCheck1FromJson(CheckAvailabilityResponseResultFlightsPassengersFlightCheck1 data, Map<String, dynamic> json) {
	if (json['eur'] != null) {
		data.eur = json['eur']?.toDouble();
	}
	if (json['invalid'] != null) {
		data.invalid = json['invalid'];
	}
	if (json['last_checked'] != null) {
		data.lastChecked = json['last_checked']?.toInt();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsPassengersFlightCheck1ToJson(CheckAvailabilityResponseResultFlightsPassengersFlightCheck1 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['eur'] = entity.eur;
	data['invalid'] = entity.invalid;
	data['last_checked'] = entity.lastChecked;
	return data;
}

checkAvailabilityResponseResultFlightsInfantsConditionsFromJson(CheckAvailabilityResponseResultFlightsInfantsConditions data, Map<String, dynamic> json) {
	if (json['trolley'] != null) {
		data.trolley = json['trolley'];
	}
	if (json['hand_weight'] != null) {
		data.handWeight = json['hand_weight']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsInfantsConditionsToJson(CheckAvailabilityResponseResultFlightsInfantsConditions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['trolley'] = entity.trolley;
	data['hand_weight'] = entity.handWeight;
	return data;
}

checkAvailabilityResponseResultFlightsVehicleFromJson(CheckAvailabilityResponseResultFlightsVehicle data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsVehicleToJson(CheckAvailabilityResponseResultFlightsVehicle entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	return data;
}

checkAvailabilityResponseResultFlightsSegmentPricingFromJson(CheckAvailabilityResponseResultFlightsSegmentPricing data, Map<String, dynamic> json) {
	if (json['adult'] != null) {
		data.adult = new CheckAvailabilityResponseResultFlightsSegmentPricingAdult().fromJson(json['adult']);
	}
	if (json['child'] != null) {
		data.child = new CheckAvailabilityResponseResultFlightsSegmentPricingChild().fromJson(json['child']);
	}
	if (json['infant'] != null) {
		data.infant = new CheckAvailabilityResponseResultFlightsSegmentPricingInfant().fromJson(json['infant']);
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsSegmentPricingToJson(CheckAvailabilityResponseResultFlightsSegmentPricing entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.adult != null) {
		data['adult'] = entity.adult.toJson();
	}
	if (entity.child != null) {
		data['child'] = entity.child.toJson();
	}
	if (entity.infant != null) {
		data['infant'] = entity.infant.toJson();
	}
	return data;
}

checkAvailabilityResponseResultFlightsSegmentPricingAdultFromJson(CheckAvailabilityResponseResultFlightsSegmentPricingAdult data, Map<String, dynamic> json) {
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toString();
	}
	if (json['base'] != null) {
		data.base = json['base']?.toString();
	}
	if (json['service'] != null) {
		data.service = json['service']?.toString();
	}
	if (json['service_flat'] != null) {
		data.serviceFlat = json['service_flat']?.toString();
	}
	if (json['merchant'] != null) {
		data.merchant = json['merchant']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsSegmentPricingAdultToJson(CheckAvailabilityResponseResultFlightsSegmentPricingAdult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currency'] = entity.currency;
	data['amount'] = entity.amount;
	data['base'] = entity.base;
	data['service'] = entity.service;
	data['service_flat'] = entity.serviceFlat;
	data['merchant'] = entity.merchant;
	return data;
}

checkAvailabilityResponseResultFlightsSegmentPricingChildFromJson(CheckAvailabilityResponseResultFlightsSegmentPricingChild data, Map<String, dynamic> json) {
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toString();
	}
	if (json['base'] != null) {
		data.base = json['base']?.toString();
	}
	if (json['service'] != null) {
		data.service = json['service']?.toString();
	}
	if (json['service_flat'] != null) {
		data.serviceFlat = json['service_flat']?.toString();
	}
	if (json['merchant'] != null) {
		data.merchant = json['merchant']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsSegmentPricingChildToJson(CheckAvailabilityResponseResultFlightsSegmentPricingChild entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currency'] = entity.currency;
	data['amount'] = entity.amount;
	data['base'] = entity.base;
	data['service'] = entity.service;
	data['service_flat'] = entity.serviceFlat;
	data['merchant'] = entity.merchant;
	return data;
}

checkAvailabilityResponseResultFlightsSegmentPricingInfantFromJson(CheckAvailabilityResponseResultFlightsSegmentPricingInfant data, Map<String, dynamic> json) {
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toString();
	}
	if (json['base'] != null) {
		data.base = json['base']?.toString();
	}
	if (json['service'] != null) {
		data.service = json['service']?.toString();
	}
	if (json['service_flat'] != null) {
		data.serviceFlat = json['service_flat']?.toString();
	}
	if (json['merchant'] != null) {
		data.merchant = json['merchant']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultFlightsSegmentPricingInfantToJson(CheckAvailabilityResponseResultFlightsSegmentPricingInfant entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currency'] = entity.currency;
	data['amount'] = entity.amount;
	data['base'] = entity.base;
	data['service'] = entity.service;
	data['service_flat'] = entity.serviceFlat;
	data['merchant'] = entity.merchant;
	return data;
}

checkAvailabilityResponseResultInfantsConditionsFromJson(CheckAvailabilityResponseResultInfantsConditions data, Map<String, dynamic> json) {
	if (json['trolley'] != null) {
		data.trolley = json['trolley'];
	}
	if (json['hand_weight'] != null) {
		data.handWeight = json['hand_weight']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultInfantsConditionsToJson(CheckAvailabilityResponseResultInfantsConditions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['trolley'] = entity.trolley;
	data['hand_weight'] = entity.handWeight;
	return data;
}

checkAvailabilityResponseResultDocumentOptionsFromJson(CheckAvailabilityResponseResultDocumentOptions data, Map<String, dynamic> json) {
	if (json['document_need'] != null) {
		data.documentNeed = json['document_need']?.toDouble();
	}
	if (json['checkin_date'] != null) {
		data.checkinDate = json['checkin_date']?.toDouble();
	}
	if (json['airport_checkin_price'] != null) {
		data.airportCheckinPrice = json['airport_checkin_price']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultDocumentOptionsToJson(CheckAvailabilityResponseResultDocumentOptions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['document_need'] = entity.documentNeed;
	data['checkin_date'] = entity.checkinDate;
	data['airport_checkin_price'] = entity.airportCheckinPrice;
	return data;
}

checkAvailabilityResponseResultInsuranceDataFromJson(CheckAvailabilityResponseResultInsuranceData data, Map<String, dynamic> json) {
	if (json['travel_basic'] != null) {
		data.travelBasic = new CheckAvailabilityResponseResultInsuranceDataTravelBasic().fromJson(json['travel_basic']);
	}
	if (json['travel_plus'] != null) {
		data.travelPlus = new CheckAvailabilityResponseResultInsuranceDataTravelPlus().fromJson(json['travel_plus']);
	}
	if (json['tarif'] != null) {
		data.tarif = json['tarif']?.toString();
	}
	if (json['valid_from'] != null) {
		data.validFrom = json['valid_from']?.toDouble();
	}
	if (json['valid_to'] != null) {
		data.validTo = json['valid_to']?.toDouble();
	}
	if (json['skysilver'] != null) {
		data.skysilver = new CheckAvailabilityResponseResultInsuranceDataSkysilver().fromJson(json['skysilver']);
	}
	if (json['skygold'] != null) {
		data.skygold = new CheckAvailabilityResponseResultInsuranceDataSkygold().fromJson(json['skygold']);
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultInsuranceDataToJson(CheckAvailabilityResponseResultInsuranceData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.travelBasic != null) {
		data['travel_basic'] = entity.travelBasic.toJson();
	}
	if (entity.travelPlus != null) {
		data['travel_plus'] = entity.travelPlus.toJson();
	}
	data['tarif'] = entity.tarif;
	data['valid_from'] = entity.validFrom;
	data['valid_to'] = entity.validTo;
	if (entity.skysilver != null) {
		data['skysilver'] = entity.skysilver.toJson();
	}
	if (entity.skygold != null) {
		data['skygold'] = entity.skygold.toJson();
	}
	return data;
}

checkAvailabilityResponseResultInsuranceDataTravelBasicFromJson(CheckAvailabilityResponseResultInsuranceDataTravelBasic data, Map<String, dynamic> json) {
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['product_num'] != null) {
		data.productNum = json['product_num']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultInsuranceDataTravelBasicToJson(CheckAvailabilityResponseResultInsuranceDataTravelBasic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['price'] = entity.price;
	data['product_num'] = entity.productNum;
	return data;
}

checkAvailabilityResponseResultInsuranceDataTravelPlusFromJson(CheckAvailabilityResponseResultInsuranceDataTravelPlus data, Map<String, dynamic> json) {
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['product_num'] != null) {
		data.productNum = json['product_num']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultInsuranceDataTravelPlusToJson(CheckAvailabilityResponseResultInsuranceDataTravelPlus entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['price'] = entity.price;
	data['product_num'] = entity.productNum;
	return data;
}

checkAvailabilityResponseResultInsuranceDataSkysilverFromJson(CheckAvailabilityResponseResultInsuranceDataSkysilver data, Map<String, dynamic> json) {
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['product_num'] != null) {
		data.productNum = json['product_num']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultInsuranceDataSkysilverToJson(CheckAvailabilityResponseResultInsuranceDataSkysilver entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['price'] = entity.price;
	data['product_num'] = entity.productNum;
	return data;
}

checkAvailabilityResponseResultInsuranceDataSkygoldFromJson(CheckAvailabilityResponseResultInsuranceDataSkygold data, Map<String, dynamic> json) {
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['product_num'] != null) {
		data.productNum = json['product_num']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultInsuranceDataSkygoldToJson(CheckAvailabilityResponseResultInsuranceDataSkygold entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['price'] = entity.price;
	data['product_num'] = entity.productNum;
	return data;
}

checkAvailabilityResponseResultInsurancePriceFromJson(CheckAvailabilityResponseResultInsurancePrice data, Map<String, dynamic> json) {
	if (json['travel_basic'] != null) {
		data.travelBasic = json['travel_basic']?.toDouble();
	}
	if (json['travel_plus'] != null) {
		data.travelPlus = json['travel_plus']?.toDouble();
	}
	if (json['skysilver'] != null) {
		data.skysilver = json['skysilver']?.toDouble();
	}
	if (json['skygold'] != null) {
		data.skygold = json['skygold']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultInsurancePriceToJson(CheckAvailabilityResponseResultInsurancePrice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['travel_basic'] = entity.travelBasic;
	data['travel_plus'] = entity.travelPlus;
	data['skysilver'] = entity.skysilver;
	data['skygold'] = entity.skygold;
	return data;
}

checkAvailabilityResponseResultBagsFromJson(CheckAvailabilityResponseResultBags data, Map<String, dynamic> json) {
	if (json['_is_deprecated'] != null) {
		data.bIsDeprecated = json['_is_deprecated'];
	}
	if (json['definitions'] != null) {
		data.definitions = new CheckAvailabilityResponseResultBagsDefinitions().fromJson(json['definitions']);
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBagsToJson(CheckAvailabilityResponseResultBags entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_is_deprecated'] = entity.bIsDeprecated;
	if (entity.definitions != null) {
		data['definitions'] = entity.definitions.toJson();
	}
	return data;
}

checkAvailabilityResponseResultBagsDefinitionsFromJson(CheckAvailabilityResponseResultBagsDefinitions data, Map<String, dynamic> json) {
	if (json['cabin_bag'] != null) {
		data.cabinBag = new List<CheckAvailabilityResponseResultBagsDefinitionsCabinBag>();
		(json['cabin_bag'] as List).forEach((v) {
			data.cabinBag.add(new CheckAvailabilityResponseResultBagsDefinitionsCabinBag().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBagsDefinitionsToJson(CheckAvailabilityResponseResultBagsDefinitions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.cabinBag != null) {
		data['cabin_bag'] =  entity.cabinBag.map((v) => v.toJson()).toList();
	}
	return data;
}

checkAvailabilityResponseResultBagsDefinitionsCabinBagFromJson(CheckAvailabilityResponseResultBagsDefinitionsCabinBag data, Map<String, dynamic> json) {
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['conditions'] != null) {
		data.conditions = new CheckAvailabilityResponseResultBagsDefinitionsCabinBagConditions().fromJson(json['conditions']);
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['restrictions'] != null) {
		data.restrictions = new CheckAvailabilityResponseResultBagsDefinitionsCabinBagRestrictions().fromJson(json['restrictions']);
	}
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['note'] != null) {
		data.note = json['note'];
	}
	if (json['_warning'] != null) {
		data.sWarning = json['_warning']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBagsDefinitionsCabinBagToJson(CheckAvailabilityResponseResultBagsDefinitionsCabinBag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['price'] = entity.price;
	if (entity.conditions != null) {
		data['conditions'] = entity.conditions.toJson();
	}
	data['category'] = entity.category;
	if (entity.restrictions != null) {
		data['restrictions'] = entity.restrictions.toJson();
	}
	data['currency'] = entity.currency;
	data['note'] = entity.note;
	data['_warning'] = entity.sWarning;
	return data;
}

checkAvailabilityResponseResultBagsDefinitionsCabinBagConditionsFromJson(CheckAvailabilityResponseResultBagsDefinitionsCabinBagConditions data, Map<String, dynamic> json) {
	if (json['passenger_groups'] != null) {
		data.passengerGroups = json['passenger_groups']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBagsDefinitionsCabinBagConditionsToJson(CheckAvailabilityResponseResultBagsDefinitionsCabinBagConditions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['passenger_groups'] = entity.passengerGroups;
	return data;
}

checkAvailabilityResponseResultBagsDefinitionsCabinBagRestrictionsFromJson(CheckAvailabilityResponseResultBagsDefinitionsCabinBagRestrictions data, Map<String, dynamic> json) {
	if (json['dimensions_sum'] != null) {
		data.dimensionsSum = json['dimensions_sum']?.toDouble();
	}
	if (json['weight'] != null) {
		data.weight = json['weight']?.toDouble();
	}
	if (json['length'] != null) {
		data.length = json['length']?.toDouble();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toDouble();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBagsDefinitionsCabinBagRestrictionsToJson(CheckAvailabilityResponseResultBagsDefinitionsCabinBagRestrictions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dimensions_sum'] = entity.dimensionsSum;
	data['weight'] = entity.weight;
	data['length'] = entity.length;
	data['height'] = entity.height;
	data['width'] = entity.width;
	return data;
}

checkAvailabilityResponseResultBagsFeeSplitFromJson(CheckAvailabilityResponseResultBagsFeeSplit data, Map<String, dynamic> json) {
	if (json['base'] != null) {
		data.base = json['base']?.toDouble();
	}
	if (json['service'] != null) {
		data.service = json['service']?.toDouble();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBagsFeeSplitToJson(CheckAvailabilityResponseResultBagsFeeSplit entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['base'] = entity.base;
	data['service'] = entity.service;
	data['amount'] = entity.amount;
	data['currency'] = entity.currency;
	return data;
}

checkAvailabilityResponseResultBagsPriceFromJson(CheckAvailabilityResponseResultBagsPrice data, Map<String, dynamic> json) {
	if (json['1'] != null) {
		data.x1 = json['1']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBagsPriceToJson(CheckAvailabilityResponseResultBagsPrice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['1'] = entity.x1;
	return data;
}

checkAvailabilityResponseResultBagsPriceSplitFromJson(CheckAvailabilityResponseResultBagsPriceSplit data, Map<String, dynamic> json) {
	if (json['_abp'] != null) {
		data.dAbp = json['_abp']?.toDouble();
	}
	if (json['1'] != null) {
		data.x1 = new CheckAvailabilityResponseResultBagsPriceSplit1().fromJson(json['1']);
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBagsPriceSplitToJson(CheckAvailabilityResponseResultBagsPriceSplit entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_abp'] = entity.dAbp;
	if (entity.x1 != null) {
		data['1'] = entity.x1.toJson();
	}
	return data;
}

checkAvailabilityResponseResultBagsPriceSplit1FromJson(CheckAvailabilityResponseResultBagsPriceSplit1 data, Map<String, dynamic> json) {
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toString();
	}
	if (json['base'] != null) {
		data.base = json['base']?.toString();
	}
	if (json['service'] != null) {
		data.service = json['service']?.toString();
	}
	if (json['service_flat'] != null) {
		data.serviceFlat = json['service_flat']?.toString();
	}
	if (json['merchant'] != null) {
		data.merchant = json['merchant']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBagsPriceSplit1ToJson(CheckAvailabilityResponseResultBagsPriceSplit1 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currency'] = entity.currency;
	data['amount'] = entity.amount;
	data['base'] = entity.base;
	data['service'] = entity.service;
	data['service_flat'] = entity.serviceFlat;
	data['merchant'] = entity.merchant;
	return data;
}

checkAvailabilityResponseResultHandBagsPriceFromJson(CheckAvailabilityResponseResultHandBagsPrice data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultHandBagsPriceToJson(CheckAvailabilityResponseResultHandBagsPrice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

checkAvailabilityResponseResultBagsRestrictionsFromJson(CheckAvailabilityResponseResultBagsRestrictions data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBagsRestrictionsToJson(CheckAvailabilityResponseResultBagsRestrictions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

checkAvailabilityResponseResultConversionFromJson(CheckAvailabilityResponseResultConversion data, Map<String, dynamic> json) {
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['bags_price'] != null) {
		data.bagsPrice = new CheckAvailabilityResponseResultConversionBagsPrice().fromJson(json['bags_price']);
	}
	if (json['additional_order_baggage_fee'] != null) {
		data.additionalOrderBaggageFee = json['additional_order_baggage_fee']?.toDouble();
	}
	if (json['adults_price'] != null) {
		data.adultsPrice = json['adults_price']?.toDouble();
	}
	if (json['children_price'] != null) {
		data.childrenPrice = json['children_price']?.toDouble();
	}
	if (json['infants_price'] != null) {
		data.infantsPrice = json['infants_price']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultConversionToJson(CheckAvailabilityResponseResultConversion entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currency'] = entity.currency;
	data['amount'] = entity.amount;
	if (entity.bagsPrice != null) {
		data['bags_price'] = entity.bagsPrice.toJson();
	}
	data['additional_order_baggage_fee'] = entity.additionalOrderBaggageFee;
	data['adults_price'] = entity.adultsPrice;
	data['children_price'] = entity.childrenPrice;
	data['infants_price'] = entity.infantsPrice;
	return data;
}

checkAvailabilityResponseResultConversionBagsPriceFromJson(CheckAvailabilityResponseResultConversionBagsPrice data, Map<String, dynamic> json) {
	if (json['1'] != null) {
		data.x1 = json['1']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultConversionBagsPriceToJson(CheckAvailabilityResponseResultConversionBagsPrice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['1'] = entity.x1;
	return data;
}

checkAvailabilityResponseResultAgeCategoryThresholdsFromJson(CheckAvailabilityResponseResultAgeCategoryThresholds data, Map<String, dynamic> json) {
	if (json['adult'] != null) {
		data.adult = json['adult']?.toString();
	}
	if (json['child'] != null) {
		data.child = json['child']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultAgeCategoryThresholdsToJson(CheckAvailabilityResponseResultAgeCategoryThresholds entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['adult'] = entity.adult;
	data['child'] = entity.child;
	return data;
}

checkAvailabilityResponseResultAdditionalServicesFromJson(CheckAvailabilityResponseResultAdditionalServices data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultAdditionalServicesToJson(CheckAvailabilityResponseResultAdditionalServices entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

checkAvailabilityResponseResultBaggageFromJson(CheckAvailabilityResponseResultBaggage data, Map<String, dynamic> json) {
	if (json['definitions'] != null) {
		data.definitions = new CheckAvailabilityResponseResultBaggageDefinitions().fromJson(json['definitions']);
	}
	if (json['combinations'] != null) {
		data.combinations = new CheckAvailabilityResponseResultBaggageCombinations().fromJson(json['combinations']);
	}
	if (json['notices'] != null) {
		data.notices = new CheckAvailabilityResponseResultBaggageNotices().fromJson(json['notices']);
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageToJson(CheckAvailabilityResponseResultBaggage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.definitions != null) {
		data['definitions'] = entity.definitions.toJson();
	}
	if (entity.combinations != null) {
		data['combinations'] = entity.combinations.toJson();
	}
	if (entity.notices != null) {
		data['notices'] = entity.notices.toJson();
	}
	return data;
}

checkAvailabilityResponseResultBaggageDefinitionsFromJson(CheckAvailabilityResponseResultBaggageDefinitions data, Map<String, dynamic> json) {
	if (json['hold_bag'] != null) {
		data.holdBag = new List<CheckAvailabilityResponseResultBaggageDefinitionsHoldBag>();
		(json['hold_bag'] as List).forEach((v) {
			data.holdBag.add(new CheckAvailabilityResponseResultBaggageDefinitionsHoldBag().fromJson(v));
		});
	}
	if (json['hand_bag'] != null) {
		data.handBag = new List<CheckAvailabilityResponseResultBaggageDefinitionsHandBag>();
		(json['hand_bag'] as List).forEach((v) {
			data.handBag.add(new CheckAvailabilityResponseResultBaggageDefinitionsHandBag().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageDefinitionsToJson(CheckAvailabilityResponseResultBaggageDefinitions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.holdBag != null) {
		data['hold_bag'] =  entity.holdBag.map((v) => v.toJson()).toList();
	}
	if (entity.handBag != null) {
		data['hand_bag'] =  entity.handBag.map((v) => v.toJson()).toList();
	}
	return data;
}

checkAvailabilityResponseResultBaggageDefinitionsHoldBagFromJson(CheckAvailabilityResponseResultBaggageDefinitionsHoldBag data, Map<String, dynamic> json) {
	if (json['price'] != null) {
		data.price = new CheckAvailabilityResponseResultBaggageDefinitionsHoldBagPrice().fromJson(json['price']);
	}
	if (json['conditions'] != null) {
		data.conditions = new CheckAvailabilityResponseResultBaggageDefinitionsHoldBagConditions().fromJson(json['conditions']);
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['restrictions'] != null) {
		data.restrictions = new CheckAvailabilityResponseResultBaggageDefinitionsHoldBagRestrictions().fromJson(json['restrictions']);
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageDefinitionsHoldBagToJson(CheckAvailabilityResponseResultBaggageDefinitionsHoldBag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.price != null) {
		data['price'] = entity.price.toJson();
	}
	if (entity.conditions != null) {
		data['conditions'] = entity.conditions.toJson();
	}
	data['category'] = entity.category;
	if (entity.restrictions != null) {
		data['restrictions'] = entity.restrictions.toJson();
	}
	return data;
}

checkAvailabilityResponseResultBaggageDefinitionsHoldBagPriceFromJson(CheckAvailabilityResponseResultBaggageDefinitionsHoldBagPrice data, Map<String, dynamic> json) {
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toString();
	}
	if (json['base'] != null) {
		data.base = json['base']?.toString();
	}
	if (json['service'] != null) {
		data.service = json['service']?.toString();
	}
	if (json['service_flat'] != null) {
		data.serviceFlat = json['service_flat']?.toString();
	}
	if (json['merchant'] != null) {
		data.merchant = json['merchant']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageDefinitionsHoldBagPriceToJson(CheckAvailabilityResponseResultBaggageDefinitionsHoldBagPrice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currency'] = entity.currency;
	data['amount'] = entity.amount;
	data['base'] = entity.base;
	data['service'] = entity.service;
	data['service_flat'] = entity.serviceFlat;
	data['merchant'] = entity.merchant;
	return data;
}

checkAvailabilityResponseResultBaggageDefinitionsHoldBagConditionsFromJson(CheckAvailabilityResponseResultBaggageDefinitionsHoldBagConditions data, Map<String, dynamic> json) {
	if (json['passenger_groups'] != null) {
		data.passengerGroups = json['passenger_groups']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageDefinitionsHoldBagConditionsToJson(CheckAvailabilityResponseResultBaggageDefinitionsHoldBagConditions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['passenger_groups'] = entity.passengerGroups;
	return data;
}

checkAvailabilityResponseResultBaggageDefinitionsHoldBagRestrictionsFromJson(CheckAvailabilityResponseResultBaggageDefinitionsHoldBagRestrictions data, Map<String, dynamic> json) {
	if (json['dimensions_sum'] != null) {
		data.dimensionsSum = json['dimensions_sum']?.toDouble();
	}
	if (json['weight'] != null) {
		data.weight = json['weight']?.toDouble();
	}
	if (json['length'] != null) {
		data.length = json['length']?.toDouble();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toDouble();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageDefinitionsHoldBagRestrictionsToJson(CheckAvailabilityResponseResultBaggageDefinitionsHoldBagRestrictions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dimensions_sum'] = entity.dimensionsSum;
	data['weight'] = entity.weight;
	data['length'] = entity.length;
	data['height'] = entity.height;
	data['width'] = entity.width;
	return data;
}

checkAvailabilityResponseResultBaggageDefinitionsHandBagFromJson(CheckAvailabilityResponseResultBaggageDefinitionsHandBag data, Map<String, dynamic> json) {
	if (json['price'] != null) {
		data.price = new CheckAvailabilityResponseResultBaggageDefinitionsHandBagPrice().fromJson(json['price']);
	}
	if (json['conditions'] != null) {
		data.conditions = new CheckAvailabilityResponseResultBaggageDefinitionsHandBagConditions().fromJson(json['conditions']);
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['restrictions'] != null) {
		data.restrictions = new CheckAvailabilityResponseResultBaggageDefinitionsHandBagRestrictions().fromJson(json['restrictions']);
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageDefinitionsHandBagToJson(CheckAvailabilityResponseResultBaggageDefinitionsHandBag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.price != null) {
		data['price'] = entity.price.toJson();
	}
	if (entity.conditions != null) {
		data['conditions'] = entity.conditions.toJson();
	}
	data['category'] = entity.category;
	if (entity.restrictions != null) {
		data['restrictions'] = entity.restrictions.toJson();
	}
	return data;
}

checkAvailabilityResponseResultBaggageDefinitionsHandBagPriceFromJson(CheckAvailabilityResponseResultBaggageDefinitionsHandBagPrice data, Map<String, dynamic> json) {
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toString();
	}
	if (json['base'] != null) {
		data.base = json['base']?.toString();
	}
	if (json['service'] != null) {
		data.service = json['service']?.toString();
	}
	if (json['service_flat'] != null) {
		data.serviceFlat = json['service_flat']?.toString();
	}
	if (json['merchant'] != null) {
		data.merchant = json['merchant']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageDefinitionsHandBagPriceToJson(CheckAvailabilityResponseResultBaggageDefinitionsHandBagPrice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currency'] = entity.currency;
	data['amount'] = entity.amount;
	data['base'] = entity.base;
	data['service'] = entity.service;
	data['service_flat'] = entity.serviceFlat;
	data['merchant'] = entity.merchant;
	return data;
}

checkAvailabilityResponseResultBaggageDefinitionsHandBagConditionsFromJson(CheckAvailabilityResponseResultBaggageDefinitionsHandBagConditions data, Map<String, dynamic> json) {
	if (json['passenger_groups'] != null) {
		data.passengerGroups = json['passenger_groups']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageDefinitionsHandBagConditionsToJson(CheckAvailabilityResponseResultBaggageDefinitionsHandBagConditions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['passenger_groups'] = entity.passengerGroups;
	return data;
}

checkAvailabilityResponseResultBaggageDefinitionsHandBagRestrictionsFromJson(CheckAvailabilityResponseResultBaggageDefinitionsHandBagRestrictions data, Map<String, dynamic> json) {
	if (json['dimensions_sum'] != null) {
		data.dimensionsSum = json['dimensions_sum']?.toDouble();
	}
	if (json['weight'] != null) {
		data.weight = json['weight']?.toDouble();
	}
	if (json['length'] != null) {
		data.length = json['length']?.toDouble();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toDouble();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toDouble();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageDefinitionsHandBagRestrictionsToJson(CheckAvailabilityResponseResultBaggageDefinitionsHandBagRestrictions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dimensions_sum'] = entity.dimensionsSum;
	data['weight'] = entity.weight;
	data['length'] = entity.length;
	data['height'] = entity.height;
	data['width'] = entity.width;
	return data;
}

checkAvailabilityResponseResultBaggageCombinationsFromJson(CheckAvailabilityResponseResultBaggageCombinations data, Map<String, dynamic> json) {
	if (json['hold_bag'] != null) {
		data.holdBag = new List<CheckAvailabilityResponseResultBaggageCombinationsHoldBag>();
		(json['hold_bag'] as List).forEach((v) {
			data.holdBag.add(new CheckAvailabilityResponseResultBaggageCombinationsHoldBag().fromJson(v));
		});
	}
	if (json['hand_bag'] != null) {
		data.handBag = new List<CheckAvailabilityResponseResultBaggageCombinationsHandBag>();
		(json['hand_bag'] as List).forEach((v) {
			data.handBag.add(new CheckAvailabilityResponseResultBaggageCombinationsHandBag().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageCombinationsToJson(CheckAvailabilityResponseResultBaggageCombinations entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.holdBag != null) {
		data['hold_bag'] =  entity.holdBag.map((v) => v.toJson()).toList();
	}
	if (entity.handBag != null) {
		data['hand_bag'] =  entity.handBag.map((v) => v.toJson()).toList();
	}
	return data;
}

checkAvailabilityResponseResultBaggageCombinationsHoldBagFromJson(CheckAvailabilityResponseResultBaggageCombinationsHoldBag data, Map<String, dynamic> json) {
	if (json['price'] != null) {
		data.price = new CheckAvailabilityResponseResultBaggageCombinationsHoldBagPrice().fromJson(json['price']);
	}
	if (json['conditions'] != null) {
		data.conditions = new CheckAvailabilityResponseResultBaggageCombinationsHoldBagConditions().fromJson(json['conditions']);
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['restrictions'] != null) {
		data.restrictions = json['restrictions'];
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageCombinationsHoldBagToJson(CheckAvailabilityResponseResultBaggageCombinationsHoldBag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.price != null) {
		data['price'] = entity.price.toJson();
	}
	if (entity.conditions != null) {
		data['conditions'] = entity.conditions.toJson();
	}
	data['category'] = entity.category;
	data['restrictions'] = entity.restrictions;
	return data;
}

checkAvailabilityResponseResultBaggageCombinationsHoldBagPriceFromJson(CheckAvailabilityResponseResultBaggageCombinationsHoldBagPrice data, Map<String, dynamic> json) {
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toString();
	}
	if (json['base'] != null) {
		data.base = json['base']?.toString();
	}
	if (json['service'] != null) {
		data.service = json['service']?.toString();
	}
	if (json['service_flat'] != null) {
		data.serviceFlat = json['service_flat']?.toString();
	}
	if (json['merchant'] != null) {
		data.merchant = json['merchant']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageCombinationsHoldBagPriceToJson(CheckAvailabilityResponseResultBaggageCombinationsHoldBagPrice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currency'] = entity.currency;
	data['amount'] = entity.amount;
	data['base'] = entity.base;
	data['service'] = entity.service;
	data['service_flat'] = entity.serviceFlat;
	data['merchant'] = entity.merchant;
	return data;
}

checkAvailabilityResponseResultBaggageCombinationsHoldBagConditionsFromJson(CheckAvailabilityResponseResultBaggageCombinationsHoldBagConditions data, Map<String, dynamic> json) {
	if (json['passenger_groups'] != null) {
		data.passengerGroups = json['passenger_groups']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageCombinationsHoldBagConditionsToJson(CheckAvailabilityResponseResultBaggageCombinationsHoldBagConditions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['passenger_groups'] = entity.passengerGroups;
	return data;
}

checkAvailabilityResponseResultBaggageCombinationsHandBagFromJson(CheckAvailabilityResponseResultBaggageCombinationsHandBag data, Map<String, dynamic> json) {
	if (json['price'] != null) {
		data.price = new CheckAvailabilityResponseResultBaggageCombinationsHandBagPrice().fromJson(json['price']);
	}
	if (json['conditions'] != null) {
		data.conditions = new CheckAvailabilityResponseResultBaggageCombinationsHandBagConditions().fromJson(json['conditions']);
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['restrictions'] != null) {
		data.restrictions = json['restrictions'];
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageCombinationsHandBagToJson(CheckAvailabilityResponseResultBaggageCombinationsHandBag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.price != null) {
		data['price'] = entity.price.toJson();
	}
	if (entity.conditions != null) {
		data['conditions'] = entity.conditions.toJson();
	}
	data['category'] = entity.category;
	data['restrictions'] = entity.restrictions;
	return data;
}

checkAvailabilityResponseResultBaggageCombinationsHandBagPriceFromJson(CheckAvailabilityResponseResultBaggageCombinationsHandBagPrice data, Map<String, dynamic> json) {
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toString();
	}
	if (json['base'] != null) {
		data.base = json['base']?.toString();
	}
	if (json['service'] != null) {
		data.service = json['service']?.toString();
	}
	if (json['service_flat'] != null) {
		data.serviceFlat = json['service_flat']?.toString();
	}
	if (json['merchant'] != null) {
		data.merchant = json['merchant']?.toString();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageCombinationsHandBagPriceToJson(CheckAvailabilityResponseResultBaggageCombinationsHandBagPrice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['currency'] = entity.currency;
	data['amount'] = entity.amount;
	data['base'] = entity.base;
	data['service'] = entity.service;
	data['service_flat'] = entity.serviceFlat;
	data['merchant'] = entity.merchant;
	return data;
}

checkAvailabilityResponseResultBaggageCombinationsHandBagConditionsFromJson(CheckAvailabilityResponseResultBaggageCombinationsHandBagConditions data, Map<String, dynamic> json) {
	if (json['passenger_groups'] != null) {
		data.passengerGroups = json['passenger_groups']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageCombinationsHandBagConditionsToJson(CheckAvailabilityResponseResultBaggageCombinationsHandBagConditions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['passenger_groups'] = entity.passengerGroups;
	return data;
}

checkAvailabilityResponseResultBaggageNoticesFromJson(CheckAvailabilityResponseResultBaggageNotices data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> checkAvailabilityResponseResultBaggageNoticesToJson(CheckAvailabilityResponseResultBaggageNotices entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}

checkAvailabilityResponseResultDisplayRateInfoWithMarkupFromJson(CheckAvailabilityResponseResultDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> checkAvailabilityResponseResultDisplayRateInfoWithMarkupToJson(CheckAvailabilityResponseResultDisplayRateInfoWithMarkup entity) {
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