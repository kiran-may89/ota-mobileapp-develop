import 'package:ota/models/transfers/search_transfer_response_entity.dart';

searchTransferResponseEntityFromJson(SearchTransferResponseEntity data, Map<String, dynamic> json) {
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
		data.result = new SearchTransferResponseResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> searchTransferResponseEntityToJson(SearchTransferResponseEntity entity) {
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

searchTransferResponseResultFromJson(SearchTransferResponseResult data, Map<String, dynamic> json) {
	if (json['vechiles'] != null) {
		data.vechiles = new List<SearchTransferResponseResultVechile>();
		(json['vechiles'] as List).forEach((v) {
			data.vechiles.add(new SearchTransferResponseResultVechile().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> searchTransferResponseResultToJson(SearchTransferResponseResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.vechiles != null) {
		data['vechiles'] =  entity.vechiles.map((v) => v.toJson()).toList();
	}
	return data;
}

searchTransferResponseResultVechileFromJson(SearchTransferResponseResultVechile data, Map<String, dynamic> json) {
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['reverse_price'] != null) {
		data.reversePrice = json['reverse_price']?.toDouble();
	}
	if (json['displayRateInfoWithMarkup'] != null) {
		data.displayRateInfoWithMarkup = new SearchTransferResponseResultVechilesDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['reverse_displayRateInfoWithMarkup'] != null) {
		data.reverseDisplayrateinfowithmarkup = new SearchTransferResponseResultVechilesReverseDisplayrateinfowithmarkup().fromJson(json['reverse_displayRateInfoWithMarkup']);
	}
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['service_id'] != null) {
		data.serviceId = json['service_id']?.toInt();
	}
	if (json['car_class'] != null) {
		data.carClass = new SearchTransferResponseResultVechilesCarClass().fromJson(json['car_class']);
	}
	if (json['allowable_subaddress'] != null) {
		data.allowableSubaddress = json['allowable_subaddress']?.toInt();
	}
	if (json['price_subaddress'] != null) {
		data.priceSubaddress = json['price_subaddress']?.toDouble();
	}
	if (json['displayRateInfoWithMarkup_subaddress'] != null) {
		data.displayrateinfowithmarkupSubaddress = new SearchTransferResponseResultVechilesDisplayrateinfowithmarkupSubaddress().fromJson(json['displayRateInfoWithMarkup_subaddress']);
	}
	if (json['cancellation_time'] != null) {
		data.cancellationTime = json['cancellation_time']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['minimum_duration'] != null) {
		data.minimumDuration = json['minimum_duration']?.toInt();
	}
	if (json['start_place'] != null) {
		data.startPlace = new SearchTransferResponseResultVechilesStartPlace().fromJson(json['start_place']);
	}
	if (json['finish_place'] != null) {
		data.finishPlace = new SearchTransferResponseResultVechilesFinishPlace().fromJson(json['finish_place']);
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toInt();
	}
	if (json['tpaName'] != null) {
		data.tpaName = json['tpaName']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<SearchTransferResponseResultVechilesOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new SearchTransferResponseResultVechilesOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> searchTransferResponseResultVechileToJson(SearchTransferResponseResultVechile entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['price'] = entity.price;
	data['reverse_price'] = entity.reversePrice;
	if (entity.displayRateInfoWithMarkup != null) {
		data['displayRateInfoWithMarkup'] = entity.displayRateInfoWithMarkup.toJson();
	}
	if (entity.reverseDisplayrateinfowithmarkup != null) {
		data['reverse_displayRateInfoWithMarkup'] = entity.reverseDisplayrateinfowithmarkup.toJson();
	}
	data['currency'] = entity.currency;
	data['service_id'] = entity.serviceId;
	if (entity.carClass != null) {
		data['car_class'] = entity.carClass.toJson();
	}
	data['allowable_subaddress'] = entity.allowableSubaddress;
	data['price_subaddress'] = entity.priceSubaddress;
	if (entity.displayrateinfowithmarkupSubaddress != null) {
		data['displayRateInfoWithMarkup_subaddress'] = entity.displayrateinfowithmarkupSubaddress.toJson();
	}
	data['cancellation_time'] = entity.cancellationTime;
	data['type'] = entity.type;
	data['minimum_duration'] = entity.minimumDuration;
	if (entity.startPlace != null) {
		data['start_place'] = entity.startPlace.toJson();
	}
	if (entity.finishPlace != null) {
		data['finish_place'] = entity.finishPlace.toJson();
	}
	data['tpa'] = entity.tpa;
	data['tpaName'] = entity.tpaName;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	return data;
}

searchTransferResponseResultVechilesDisplayRateInfoWithMarkupFromJson(SearchTransferResponseResultVechilesDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> searchTransferResponseResultVechilesDisplayRateInfoWithMarkupToJson(SearchTransferResponseResultVechilesDisplayRateInfoWithMarkup entity) {
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

searchTransferResponseResultVechilesReverseDisplayrateinfowithmarkupFromJson(SearchTransferResponseResultVechilesReverseDisplayrateinfowithmarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> searchTransferResponseResultVechilesReverseDisplayrateinfowithmarkupToJson(SearchTransferResponseResultVechilesReverseDisplayrateinfowithmarkup entity) {
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

searchTransferResponseResultVechilesCarClassFromJson(SearchTransferResponseResultVechilesCarClass data, Map<String, dynamic> json) {
	if (json['car_class_id'] != null) {
		data.carClassId = json['car_class_id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['models'] != null) {
		data.models = json['models']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['photo'] != null) {
		data.photo = json['photo']?.toString();
	}
	if (json['capacity'] != null) {
		data.capacity = json['capacity']?.toInt();
	}
	return data;
}

Map<String, dynamic> searchTransferResponseResultVechilesCarClassToJson(SearchTransferResponseResultVechilesCarClass entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['car_class_id'] = entity.carClassId;
	data['title'] = entity.title;
	data['models'] = entity.models;
	data['photo'] = entity.photo;
	data['capacity'] = entity.capacity;
	return data;
}

searchTransferResponseResultVechilesDisplayrateinfowithmarkupSubaddressFromJson(SearchTransferResponseResultVechilesDisplayrateinfowithmarkupSubaddress data, Map<String, dynamic> json) {
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

Map<String, dynamic> searchTransferResponseResultVechilesDisplayrateinfowithmarkupSubaddressToJson(SearchTransferResponseResultVechilesDisplayrateinfowithmarkupSubaddress entity) {
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

searchTransferResponseResultVechilesStartPlaceFromJson(SearchTransferResponseResultVechilesStartPlace data, Map<String, dynamic> json) {
	if (json['place_id'] != null) {
		data.placeId = json['place_id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['type_title'] != null) {
		data.typeTitle = json['type_title']?.toString();
	}
	if (json['terminal'] != null) {
		data.terminal = new List<dynamic>();
		data.terminal.addAll(json['terminal']);
	}
	return data;
}

Map<String, dynamic> searchTransferResponseResultVechilesStartPlaceToJson(SearchTransferResponseResultVechilesStartPlace entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['place_id'] = entity.placeId;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['type_title'] = entity.typeTitle;
	if (entity.terminal != null) {
		data['terminal'] =  [];
	}
	return data;
}

searchTransferResponseResultVechilesFinishPlaceFromJson(SearchTransferResponseResultVechilesFinishPlace data, Map<String, dynamic> json) {
	if (json['place_id'] != null) {
		data.placeId = json['place_id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['type_title'] != null) {
		data.typeTitle = json['type_title']?.toString();
	}
	if (json['terminal'] != null) {
		data.terminal = json['terminal']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> searchTransferResponseResultVechilesFinishPlaceToJson(SearchTransferResponseResultVechilesFinishPlace entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['place_id'] = entity.placeId;
	data['title'] = entity.title;
	data['type'] = entity.type;
	data['type_title'] = entity.typeTitle;
	data['terminal'] = entity.terminal;
	return data;
}

searchTransferResponseResultVechilesOptionFromJson(SearchTransferResponseResultVechilesOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> searchTransferResponseResultVechilesOptionToJson(SearchTransferResponseResultVechilesOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}