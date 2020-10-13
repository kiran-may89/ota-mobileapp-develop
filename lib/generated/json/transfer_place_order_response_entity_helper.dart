import 'package:ota/models/transfers/transfer_place_order_response_entity.dart';

transferPlaceOrderResponseEntityFromJson(TransferPlaceOrderResponseEntity data, Map<String, dynamic> json) {
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
		data.result = new TransferPlaceOrderResponseResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderResponseEntityToJson(TransferPlaceOrderResponseEntity entity) {
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

transferPlaceOrderResponseResultFromJson(TransferPlaceOrderResponseResult data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = new List<TransferPlaceOrderResponseResultResult>();
		(json['result'] as List).forEach((v) {
			data.result.add(new TransferPlaceOrderResponseResultResult().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderResponseResultToJson(TransferPlaceOrderResponseResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.result != null) {
		data['result'] =  entity.result.map((v) => v.toJson()).toList();
	}
	return data;
}

transferPlaceOrderResponseResultResultFromJson(TransferPlaceOrderResponseResultResult data, Map<String, dynamic> json) {
	if (json['order_id'] != null) {
		data.orderId = json['order_id']?.toInt();
	}
	if (json['transaction'] != null) {
		data.transaction = json['transaction']?.toInt();
	}
	if (json['booker_number'] != null) {
		data.bookerNumber = json['booker_number']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['priceWithMarkup'] != null) {
		data.priceWithMarkup = json['priceWithMarkup']?.toDouble();
	}
	if (json['payable_status'] != null) {
		data.payableStatus = json['payable_status']?.toInt();
	}
	if (json['service_id'] != null) {
		data.serviceId = json['service_id']?.toInt();
	}
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['passengers'] != null) {
		data.passengers = new List<TransferPlaceOrderResponseResultResultPassenger>();
		(json['passengers'] as List).forEach((v) {
			data.passengers.add(new TransferPlaceOrderResponseResultResultPassenger().fromJson(v));
		});
	}
	if (json['additional_change_itinerary'] != null) {
		data.additionalChangeItinerary = json['additional_change_itinerary']?.toDouble();
	}
	if (json['additional_wait'] != null) {
		data.additionalWait = json['additional_wait']?.toInt();
	}
	if (json['fare_on_toll_road'] != null) {
		data.fareOnTollRoad = json['fare_on_toll_road']?.toInt();
	}
	if (json['send_params'] != null) {
		data.sendParams = new TransferPlaceOrderResponseResultResultSendParams().fromJson(json['send_params']);
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toInt();
	}
	if (json['tpaName'] != null) {
		data.tpaName = json['tpaName']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<TransferPlaceOrderResponseResultResultOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new TransferPlaceOrderResponseResultResultOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderResponseResultResultToJson(TransferPlaceOrderResponseResultResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['order_id'] = entity.orderId;
	data['transaction'] = entity.transaction;
	data['booker_number'] = entity.bookerNumber;
	data['price'] = entity.price;
	data['priceWithMarkup'] = entity.priceWithMarkup;
	data['payable_status'] = entity.payableStatus;
	data['service_id'] = entity.serviceId;
	data['currency'] = entity.currency;
	data['status'] = entity.status;
	if (entity.passengers != null) {
		data['passengers'] =  entity.passengers.map((v) => v.toJson()).toList();
	}
	data['additional_change_itinerary'] = entity.additionalChangeItinerary;
	data['additional_wait'] = entity.additionalWait;
	data['fare_on_toll_road'] = entity.fareOnTollRoad;
	if (entity.sendParams != null) {
		data['send_params'] = entity.sendParams.toJson();
	}
	data['tpa'] = entity.tpa;
	data['tpaName'] = entity.tpaName;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	return data;
}

transferPlaceOrderResponseResultResultPassengerFromJson(TransferPlaceOrderResponseResultResultPassenger data, Map<String, dynamic> json) {
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

Map<String, dynamic> transferPlaceOrderResponseResultResultPassengerToJson(TransferPlaceOrderResponseResultResultPassenger entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['email'] = entity.email;
	data['phone'] = entity.phone;
	return data;
}

transferPlaceOrderResponseResultResultSendParamsFromJson(TransferPlaceOrderResponseResultResultSendParams data, Map<String, dynamic> json) {
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

Map<String, dynamic> transferPlaceOrderResponseResultResultSendParamsToJson(TransferPlaceOrderResponseResultResultSendParams entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['send_client_voucher'] = entity.sendClientVoucher;
	data['send_admin_voucher'] = entity.sendAdminVoucher;
	data['send_client_doc'] = entity.sendClientDoc;
	data['send_admin_doc'] = entity.sendAdminDoc;
	return data;
}

transferPlaceOrderResponseResultResultOptionFromJson(TransferPlaceOrderResponseResultResultOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> transferPlaceOrderResponseResultResultOptionToJson(TransferPlaceOrderResponseResultResultOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}