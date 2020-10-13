import 'package:ota/models/transfers/requests/transfer_place_order_request_entity.dart';

transferPlaceOrderRequestEntityFromJson(TransferPlaceOrderRequestEntity data, Map<String, dynamic> json) {
	if (json['tenantId'] != null) {
		data.tenantId = json['tenantId']?.toString();
	}
	if (json['lang'] != null) {
		data.lang = json['lang']?.toString();
	}
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['trips'] != null) {
		data.trips = new List<TransferPlaceOrderRequestTrip>();
		(json['trips'] as List).forEach((v) {
			data.trips.add(new TransferPlaceOrderRequestTrip().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderRequestEntityToJson(TransferPlaceOrderRequestEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['tenantId'] = entity.tenantId;
	data['lang'] = entity.lang;
	data['currency'] = entity.currency;
	if (entity.trips != null) {
		data['trips'] =  entity.trips.map((v) => v.toJson()).toList();
	}
	return data;
}

transferPlaceOrderRequestTripFromJson(TransferPlaceOrderRequestTrip data, Map<String, dynamic> json) {
	if (json['start_location'] != null) {
		data.startLocation = new TransferPlaceOrderRequestTripsStartLocation().fromJson(json['start_location']);
	}
	if (json['finish_location'] != null) {
		data.finishLocation = new TransferPlaceOrderRequestTripsFinishLocation().fromJson(json['finish_location']);
	}
	if (json['additional_location'] != null) {
		data.additionalLocation = new List<TransferPlaceOrderRequestTripsAdditionalLocation>();
		(json['additional_location'] as List).forEach((v) {
			data.additionalLocation.add(new TransferPlaceOrderRequestTripsAdditionalLocation().fromJson(v));
		});
	}
	if (json['passengers'] != null) {
		data.passengers = new List<TransferPlaceOrderRequestTripsPassenger>();
		(json['passengers'] as List).forEach((v) {
			data.passengers.add(new TransferPlaceOrderRequestTripsPassenger().fromJson(v));
		});
	}
	if (json['passengers_number'] != null) {
		data.passengersNumber = json['passengers_number']?.toInt();
	}
	if (json['text_tablet'] != null) {
		data.textTablet = json['text_tablet']?.toString();
	}
	if (json['comment'] != null) {
		data.comment = json['comment']?.toString();
	}
	if (json['additional_change_itinerary'] != null) {
		data.additionalChangeItinerary = json['additional_change_itinerary']?.toInt();
	}
	if (json['additional_wait'] != null) {
		data.additionalWait = json['additional_wait']?.toInt();
	}
	if (json['fare_on_toll_road'] != null) {
		data.fareOnTollRoad = json['fare_on_toll_road']?.toInt();
	}
	if (json['send_params'] != null) {
		data.sendParams = new TransferPlaceOrderRequestTripsSendParams().fromJson(json['send_params']);
	}
	if (json['is_round_trip'] != null) {
		data.isRoundTrip = json['is_round_trip'];
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toInt();
	}
	if (json['tpaName'] != null) {
		data.tpaName = json['tpaName']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<TransferPlaceOrderRequestTripsOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new TransferPlaceOrderRequestTripsOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderRequestTripToJson(TransferPlaceOrderRequestTrip entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.startLocation != null) {
		data['start_location'] = entity.startLocation.toJson();
	}
	if (entity.finishLocation != null) {
		data['finish_location'] = entity.finishLocation.toJson();
	}
	if (entity.additionalLocation != null) {
		data['additional_location'] =  entity.additionalLocation.map((v) => v.toJson()).toList();
	}
	if (entity.passengers != null) {
		data['passengers'] =  entity.passengers.map((v) => v.toJson()).toList();
	}
	data['passengers_number'] = entity.passengersNumber;
	data['text_tablet'] = entity.textTablet;
	data['comment'] = entity.comment;
	data['additional_change_itinerary'] = entity.additionalChangeItinerary;
	data['additional_wait'] = entity.additionalWait;
	data['fare_on_toll_road'] = entity.fareOnTollRoad;
	if (entity.sendParams != null) {
		data['send_params'] = entity.sendParams.toJson();
	}
	data['is_round_trip'] = entity.isRoundTrip;
	data['tpa'] = entity.tpa;
	data['tpaName'] = entity.tpaName;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	return data;
}

transferPlaceOrderRequestTripsStartLocationFromJson(TransferPlaceOrderRequestTripsStartLocation data, Map<String, dynamic> json) {
	if (json['flight_number'] != null) {
		data.flightNumber = json['flight_number']?.toString();
	}
	if (json['terminal_number'] != null) {
		data.terminalNumber = json['terminal_number']?.toString();
	}
	if (json['train_number'] != null) {
		data.trainNumber = json['train_number']?.toString();
	}
	if (json['train_carriage_number'] != null) {
		data.trainCarriageNumber = json['train_carriage_number']?.toString();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['location'] != null) {
		data.location = json['location']?.toString();
	}
	if (json['time'] != null) {
		data.time = json['time']?.toString();
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderRequestTripsStartLocationToJson(TransferPlaceOrderRequestTripsStartLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['flight_number'] = entity.flightNumber;
	data['terminal_number'] = entity.terminalNumber;
	data['train_number'] = entity.trainNumber;
	data['train_carriage_number'] = entity.trainCarriageNumber;
	data['address'] = entity.address;
	data['location'] = entity.location;
	data['time'] = entity.time;
	return data;
}

transferPlaceOrderRequestTripsFinishLocationFromJson(TransferPlaceOrderRequestTripsFinishLocation data, Map<String, dynamic> json) {
	if (json['flight_number'] != null) {
		data.flightNumber = json['flight_number']?.toString();
	}
	if (json['terminal_number'] != null) {
		data.terminalNumber = json['terminal_number']?.toString();
	}
	if (json['train_number'] != null) {
		data.trainNumber = json['train_number']?.toString();
	}
	if (json['train_carriage_number'] != null) {
		data.trainCarriageNumber = json['train_carriage_number']?.toString();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['location'] != null) {
		data.location = json['location']?.toString();
	}
	if (json['time'] != null) {
		data.time = json['time']?.toString();
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderRequestTripsFinishLocationToJson(TransferPlaceOrderRequestTripsFinishLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['flight_number'] = entity.flightNumber;
	data['terminal_number'] = entity.terminalNumber;
	data['train_number'] = entity.trainNumber;
	data['train_carriage_number'] = entity.trainCarriageNumber;
	data['address'] = entity.address;
	data['location'] = entity.location;
	data['time'] = entity.time;
	return data;
}

transferPlaceOrderRequestTripsAdditionalLocationFromJson(TransferPlaceOrderRequestTripsAdditionalLocation data, Map<String, dynamic> json) {
	if (json['flight_number'] != null) {
		data.flightNumber = json['flight_number']?.toString();
	}
	if (json['terminal_number'] != null) {
		data.terminalNumber = json['terminal_number']?.toString();
	}
	if (json['train_number'] != null) {
		data.trainNumber = json['train_number']?.toString();
	}
	if (json['train_carriage_number'] != null) {
		data.trainCarriageNumber = json['train_carriage_number']?.toString();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['location'] != null) {
		data.location = json['location']?.toString();
	}
	if (json['time'] != null) {
		data.time = json['time']?.toString();
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderRequestTripsAdditionalLocationToJson(TransferPlaceOrderRequestTripsAdditionalLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['flight_number'] = entity.flightNumber;
	data['terminal_number'] = entity.terminalNumber;
	data['train_number'] = entity.trainNumber;
	data['train_carriage_number'] = entity.trainCarriageNumber;
	data['address'] = entity.address;
	data['location'] = entity.location;
	data['time'] = entity.time;
	return data;
}

transferPlaceOrderRequestTripsPassengerFromJson(TransferPlaceOrderRequestTripsPassenger data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['email'] != null) {
		data.email = json['email']?.toString();
	}
	if (json['phone'] != null) {
		data.phone = json['phone']?.toString();
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderRequestTripsPassengerToJson(TransferPlaceOrderRequestTripsPassenger entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['email'] = entity.email;
	data['phone'] = entity.phone;
	return data;
}

transferPlaceOrderRequestTripsSendParamsFromJson(TransferPlaceOrderRequestTripsSendParams data, Map<String, dynamic> json) {
	if (json['send_client_voucher'] != null) {
		data.sendClientVoucher = json['send_client_voucher']?.toString();
	}
	if (json['send_admin_voucher'] != null) {
		data.sendAdminVoucher = json['send_admin_voucher']?.toString();
	}
	if (json['send_client_doc'] != null) {
		data.sendClientDoc = json['send_client_doc']?.toString();
	}
	if (json['send_admin_doc'] != null) {
		data.sendAdminDoc = json['send_admin_doc']?.toString();
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderRequestTripsSendParamsToJson(TransferPlaceOrderRequestTripsSendParams entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['send_client_voucher'] = entity.sendClientVoucher;
	data['send_admin_voucher'] = entity.sendAdminVoucher;
	data['send_client_doc'] = entity.sendClientDoc;
	data['send_admin_doc'] = entity.sendAdminDoc;
	return data;
}

transferPlaceOrderRequestTripsOptionFromJson(TransferPlaceOrderRequestTripsOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderRequestTripsOptionToJson(TransferPlaceOrderRequestTripsOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}