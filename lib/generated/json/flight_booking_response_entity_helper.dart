import 'package:ota/models/flights/flight_booking_response_entity.dart';

flightBookingResponseEntityFromJson(FlightBookingResponseEntity data, Map<String, dynamic> json) {
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
		data.result = new FlightBookingResponseResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> flightBookingResponseEntityToJson(FlightBookingResponseEntity entity) {
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

flightBookingResponseResultFromJson(FlightBookingResponseResult data, Map<String, dynamic> json) {
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<FlightBookingResponseResultOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new FlightBookingResponseResultOption().fromJson(v));
		});
	}
	if (json['airlinesMeta'] != null) {
		data.airlinesMeta = new List<dynamic>();
		data.airlinesMeta.addAll(json['airlinesMeta']);
	}
	if (json['server_time'] != null) {
		data.serverTime = json['server_time'];
	}
	if (json['pnum'] != null) {
		data.pnum = json['pnum'];
	}
	if (json['flights'] != null) {
		data.flights = new List<dynamic>();
		data.flights.addAll(json['flights']);
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
		data.maxPassengers = json['max_passengers'];
	}
	if (json['infants_conditions'] != null) {
		data.infantsConditions = json['infants_conditions'];
	}
	if (json['document_options'] != null) {
		data.documentOptions = json['document_options'];
	}
	if (json['visas_agreement_requiered'] != null) {
		data.visasAgreementRequiered = json['visas_agreement_requiered'];
	}
	if (json['transfers'] != null) {
		data.transfers = new List<dynamic>();
		data.transfers.addAll(json['transfers']);
	}
	if (json['route'] != null) {
		data.route = new List<dynamic>();
		data.route.addAll(json['route']);
	}
	if (json['book_fee'] != null) {
		data.bookFee = json['book_fee'];
	}
	if (json['fee_airline'] != null) {
		data.feeAirline = json['fee_airline'];
	}
	if (json['extra_fee'] != null) {
		data.extraFee = json['extra_fee'];
	}
	if (json['flights_price'] != null) {
		data.flightsPrice = json['flights_price'];
	}
	if (json['total'] != null) {
		data.total = json['total'];
	}
	if (json['sp_fee'] != null) {
		data.spFee = json['sp_fee'];
	}
	if (json['flight_real_price'] != null) {
		data.flightRealPrice = json['flight_real_price'];
	}
	if (json['one_passenger'] != null) {
		data.onePassenger = json['one_passenger'];
	}
	if (json['credits_price'] != null) {
		data.creditsPrice = json['credits_price'];
	}
	if (json['orig_price_usage'] != null) {
		data.origPriceUsage = json['orig_price_usage'];
	}
	if (json['price_change'] != null) {
		data.priceChange = json['price_change'];
	}
	if (json['tickets_price'] != null) {
		data.ticketsPrice = json['tickets_price'];
	}
	if (json['orig_price'] != null) {
		data.origPrice = json['orig_price'];
	}
	if (json['insurance_data'] != null) {
		data.insuranceData = json['insurance_data'];
	}
	if (json['insurance_price'] != null) {
		data.insurancePrice = json['insurance_price'];
	}
	if (json['adults_price'] != null) {
		data.adultsPrice = json['adults_price'];
	}
	if (json['children_price'] != null) {
		data.childrenPrice = json['children_price'];
	}
	if (json['infants_price'] != null) {
		data.infantsPrice = json['infants_price'];
	}
	if (json['bags'] != null) {
		data.bags = json['bags'];
	}
	if (json['bags_fee'] != null) {
		data.bagsFee = json['bags_fee'];
	}
	if (json['bags_fee_split'] != null) {
		data.bagsFeeSplit = json['bags_fee_split'];
	}
	if (json['bags_price'] != null) {
		data.bagsPrice = new FlightBookingResponseResultBagsPrice().fromJson(json['bags_price']);
	}
	if (json['bags_price_split'] != null) {
		data.bagsPriceSplit = json['bags_price_split'];
	}
	if (json['hand_bags_price'] != null) {
		data.handBagsPrice = json['hand_bags_price'];
	}
	if (json['bags_restrictions'] != null) {
		data.bagsRestrictions = json['bags_restrictions'];
	}
	if (json['additional_order_baggage_fee'] != null) {
		data.additionalOrderBaggageFee = json['additional_order_baggage_fee'];
	}
	if (json['luggage'] != null) {
		data.luggage = new List<dynamic>();
		data.luggage.addAll(json['luggage']);
	}
	if (json['sandbox'] != null) {
		data.sandbox = json['sandbox'];
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['promocode'] != null) {
		data.promocode = json['promocode'];
	}
	if (json['passengers'] != null) {
		data.passengers = new List<dynamic>();
		data.passengers.addAll(json['passengers']);
	}
	if (json['auth_token'] != null) {
		data.authToken = json['auth_token'];
	}
	if (json['booking_id'] != null) {
		data.bookingId = json['booking_id'];
	}
	if (json['transaction_id'] != null) {
		data.transactionId = json['transaction_id'];
	}
	if (json['status_code'] != null) {
		data.statusCode = json['status_code'];
	}
	if (json['zooz_token'] != null) {
		data.zoozToken = json['zooz_token'];
	}
	if (json['eur_payment_price'] != null) {
		data.eurPaymentPrice = json['eur_payment_price'];
	}
	if (json['book_feeWithMarkup'] != null) {
		data.bookFeewithmarkup = json['book_feeWithMarkup'];
	}
	if (json['fee_airlineWithMarkup'] != null) {
		data.feeAirlinewithmarkup = json['fee_airlineWithMarkup'];
	}
	if (json['extra_feeWithMarkup'] != null) {
		data.extraFeewithmarkup = json['extra_feeWithMarkup'];
	}
	if (json['flights_priceWithMarkup'] != null) {
		data.flightsPricewithmarkup = json['flights_priceWithMarkup'];
	}
	if (json['totalWithMarkup'] != null) {
		data.totalWithMarkup = json['totalWithMarkup'];
	}
	if (json['sp_feeWithMarkup'] != null) {
		data.spFeewithmarkup = json['sp_feeWithMarkup'];
	}
	if (json['flight_real_priceWithMarkup'] != null) {
		data.flightRealPricewithmarkup = json['flight_real_priceWithMarkup'];
	}
	return data;
}

Map<String, dynamic> flightBookingResponseResultToJson(FlightBookingResponseResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tpa'] = entity.tpa;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	if (entity.airlinesMeta != null) {
		data['airlinesMeta'] =  [];
	}
	data['server_time'] = entity.serverTime;
	data['pnum'] = entity.pnum;
	if (entity.flights != null) {
		data['flights'] =  [];
	}
	data['flights_checked'] = entity.flightsChecked;
	data['flights_to_check'] = entity.flightsToCheck;
	data['flights_real_checked'] = entity.flightsRealChecked;
	data['flights_invalid'] = entity.flightsInvalid;
	data['max_passengers'] = entity.maxPassengers;
	data['infants_conditions'] = entity.infantsConditions;
	data['document_options'] = entity.documentOptions;
	data['visas_agreement_requiered'] = entity.visasAgreementRequiered;
	if (entity.transfers != null) {
		data['transfers'] =  [];
	}
	if (entity.route != null) {
		data['route'] =  [];
	}
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
	data['insurance_data'] = entity.insuranceData;
	data['insurance_price'] = entity.insurancePrice;
	data['adults_price'] = entity.adultsPrice;
	data['children_price'] = entity.childrenPrice;
	data['infants_price'] = entity.infantsPrice;
	data['bags'] = entity.bags;
	data['bags_fee'] = entity.bagsFee;
	data['bags_fee_split'] = entity.bagsFeeSplit;
	if (entity.bagsPrice != null) {
		data['bags_price'] = entity.bagsPrice.toJson();
	}
	data['bags_price_split'] = entity.bagsPriceSplit;
	data['hand_bags_price'] = entity.handBagsPrice;
	data['bags_restrictions'] = entity.bagsRestrictions;
	data['additional_order_baggage_fee'] = entity.additionalOrderBaggageFee;
	if (entity.luggage != null) {
		data['luggage'] =  [];
	}
	data['sandbox'] = entity.sandbox;
	data['status'] = entity.status;
	data['promocode'] = entity.promocode;
	if (entity.passengers != null) {
		data['passengers'] =  [];
	}
	data['auth_token'] = entity.authToken;
	data['booking_id'] = entity.bookingId;
	data['transaction_id'] = entity.transactionId;
	data['status_code'] = entity.statusCode;
	data['zooz_token'] = entity.zoozToken;
	data['eur_payment_price'] = entity.eurPaymentPrice;
	data['book_feeWithMarkup'] = entity.bookFeewithmarkup;
	data['fee_airlineWithMarkup'] = entity.feeAirlinewithmarkup;
	data['extra_feeWithMarkup'] = entity.extraFeewithmarkup;
	data['flights_priceWithMarkup'] = entity.flightsPricewithmarkup;
	data['totalWithMarkup'] = entity.totalWithMarkup;
	data['sp_feeWithMarkup'] = entity.spFeewithmarkup;
	data['flight_real_priceWithMarkup'] = entity.flightRealPricewithmarkup;
	return data;
}

flightBookingResponseResultOptionFromJson(FlightBookingResponseResultOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> flightBookingResponseResultOptionToJson(FlightBookingResponseResultOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}

flightBookingResponseResultBagsPriceFromJson(FlightBookingResponseResultBagsPrice data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> flightBookingResponseResultBagsPriceToJson(FlightBookingResponseResultBagsPrice entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}