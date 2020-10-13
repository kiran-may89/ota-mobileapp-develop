import 'package:ota/models/activity/small_details_response_entity.dart';

smallDetailsResponseEntityFromJson(SmallDetailsResponseEntity data, Map<String, dynamic> json) {
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
		data.result = new SmallDetailsResponseResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseEntityToJson(SmallDetailsResponseEntity entity) {
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

smallDetailsResponseResultFromJson(SmallDetailsResponseResult data, Map<String, dynamic> json) {
	if (json['operationId'] != null) {
		data.operationId = json['operationId']?.toString();
	}
	if (json['auditData'] != null) {
		data.auditData = new SmallDetailsResponseResultAuditData().fromJson(json['auditData']);
	}
	if (json['activity'] != null) {
		data.activity = new SmallDetailsResponseResultActivity().fromJson(json['activity']);
	}
	if (json['errors'] != null) {
		data.errors = json['errors'];
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultToJson(SmallDetailsResponseResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['operationId'] = entity.operationId;
	if (entity.auditData != null) {
		data['auditData'] = entity.auditData.toJson();
	}
	if (entity.activity != null) {
		data['activity'] = entity.activity.toJson();
	}
	data['errors'] = entity.errors;
	return data;
}

smallDetailsResponseResultAuditDataFromJson(SmallDetailsResponseResultAuditData data, Map<String, dynamic> json) {
	if (json['processTime'] != null) {
		data.processTime = json['processTime']?.toInt();
	}
	if (json['time'] != null) {
		data.time = json['time']?.toString();
	}
	if (json['serverId'] != null) {
		data.serverId = json['serverId']?.toString();
	}
	if (json['environment'] != null) {
		data.environment = json['environment']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultAuditDataToJson(SmallDetailsResponseResultAuditData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['processTime'] = entity.processTime;
	data['time'] = entity.time;
	data['serverId'] = entity.serverId;
	data['environment'] = entity.environment;
	return data;
}

smallDetailsResponseResultActivityFromJson(SmallDetailsResponseResultActivity data, Map<String, dynamic> json) {
	if (json['activityCode'] != null) {
		data.activityCode = json['activityCode']?.toString();
	}
	if (json['country'] != null) {
		data.country = new SmallDetailsResponseResultActivityCountry().fromJson(json['country']);
	}
	if (json['operationDays'] != null) {
		data.operationDays = new List<SmallDetailsResponseResultActivityOperationDay>();
		(json['operationDays'] as List).forEach((v) {
			data.operationDays.add(new SmallDetailsResponseResultActivityOperationDay().fromJson(v));
		});
	}
	if (json['modalities'] != null) {
		data.modalities = new List<SmallDetailsResponseResultActivityModality>();
		(json['modalities'] as List).forEach((v) {
			data.modalities.add(new SmallDetailsResponseResultActivityModality().fromJson(v));
		});
	}
	if (json['currencyName'] != null) {
		data.currencyName = json['currencyName']?.toString();
	}
	if (json['amountsFrom'] != null) {
		data.amountsFrom = new List<SmallDetailsResponseResultActivityAmountsFrom>();
		(json['amountsFrom'] as List).forEach((v) {
			data.amountsFrom.add(new SmallDetailsResponseResultActivityAmountsFrom().fromJson(v));
		});
	}
	if (json['amountsFromWithMarkup'] != null) {
		data.amountsFromWithMarkup = new List<SmallDetailsResponseResultActivityAmountsFromWithMarkup>();
		(json['amountsFromWithMarkup'] as List).forEach((v) {
			data.amountsFromWithMarkup.add(new SmallDetailsResponseResultActivityAmountsFromWithMarkup().fromJson(v));
		});
	}
	if (json['content'] != null) {
		data.content = new SmallDetailsResponseResultActivityContent().fromJson(json['content']);
	}
	if (json['order'] != null) {
		data.order = json['order']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toInt();
	}
	if (json['tpaName'] != null) {
		data.tpaName = json['tpaName']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<SmallDetailsResponseResultActivityOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new SmallDetailsResponseResultActivityOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityToJson(SmallDetailsResponseResultActivity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['activityCode'] = entity.activityCode;
	if (entity.country != null) {
		data['country'] = entity.country.toJson();
	}
	if (entity.operationDays != null) {
		data['operationDays'] =  entity.operationDays.map((v) => v.toJson()).toList();
	}
	if (entity.modalities != null) {
		data['modalities'] =  entity.modalities.map((v) => v.toJson()).toList();
	}
	data['currencyName'] = entity.currencyName;
	if (entity.amountsFrom != null) {
		data['amountsFrom'] =  entity.amountsFrom.map((v) => v.toJson()).toList();
	}
	if (entity.amountsFromWithMarkup != null) {
		data['amountsFromWithMarkup'] =  entity.amountsFromWithMarkup.map((v) => v.toJson()).toList();
	}
	if (entity.content != null) {
		data['content'] = entity.content.toJson();
	}
	data['order'] = entity.order;
	data['name'] = entity.name;
	data['currency'] = entity.currency;
	data['code'] = entity.code;
	data['type'] = entity.type;
	data['tpa'] = entity.tpa;
	data['tpaName'] = entity.tpaName;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityCountryFromJson(SmallDetailsResponseResultActivityCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<SmallDetailsResponseResultActivityCountryDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new SmallDetailsResponseResultActivityCountryDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityCountryToJson(SmallDetailsResponseResultActivityCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityCountryDestinationFromJson(SmallDetailsResponseResultActivityCountryDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityCountryDestinationToJson(SmallDetailsResponseResultActivityCountryDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

smallDetailsResponseResultActivityOperationDayFromJson(SmallDetailsResponseResultActivityOperationDay data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityOperationDayToJson(SmallDetailsResponseResultActivityOperationDay entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

smallDetailsResponseResultActivityModalityFromJson(SmallDetailsResponseResultActivityModality data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['duration'] != null) {
		data.duration = new SmallDetailsResponseResultActivityModalitiesDuration().fromJson(json['duration']);
	}
	if (json['questions'] != null) {
		data.questions = new List<SmallDetailsResponseResultActivityModalitiesQuestion>();
		(json['questions'] as List).forEach((v) {
			data.questions.add(new SmallDetailsResponseResultActivityModalitiesQuestion().fromJson(v));
		});
	}
	if (json['comments'] != null) {
		data.comments = new List<SmallDetailsResponseResultActivityModalitiesCommants>();
		(json['comments'] as List).forEach((v) {
			data.comments.add(new SmallDetailsResponseResultActivityModalitiesCommants().fromJson(v));
		});
	}
	if (json['supplierInformation'] != null) {
		data.supplierInformation = new SmallDetailsResponseResultActivityModalitiesSupplierInformation().fromJson(json['supplierInformation']);
	}
	if (json['providerInformation'] != null) {
		data.providerInformation = new SmallDetailsResponseResultActivityModalitiesProviderInformation().fromJson(json['providerInformation']);
	}
	if (json['destinationCode'] != null) {
		data.destinationCode = json['destinationCode']?.toString();
	}
	if (json['contract'] != null) {
		data.contract = new SmallDetailsResponseResultActivityModalitiesContract().fromJson(json['contract']);
	}
	if (json['languages'] != null) {
		data.languages = new List<dynamic>();
		data.languages.addAll(json['languages']);
	}
	if (json['amountsFrom'] != null) {
		data.amountsFrom = new List<SmallDetailsResponseResultActivityModalitiesAmountsFrom>();
		(json['amountsFrom'] as List).forEach((v) {
			data.amountsFrom.add(new SmallDetailsResponseResultActivityModalitiesAmountsFrom().fromJson(v));
		});
	}
	if (json['amountsFromWithMarkup'] != null) {
		data.amountsFromWithMarkup = new List<SmallDetailsResponseResultActivityModalitiesAmountsFromWithMarkup>();
		(json['amountsFromWithMarkup'] as List).forEach((v) {
			data.amountsFromWithMarkup.add(new SmallDetailsResponseResultActivityModalitiesAmountsFromWithMarkup().fromJson(v));
		});
	}
	if (json['rates'] != null) {
		data.rates = new List<SmallDetailsResponseResultActivityModalitiesRate>();
		(json['rates'] as List).forEach((v) {
			data.rates.add(new SmallDetailsResponseResultActivityModalitiesRate().fromJson(v));
		});
	}
	if (json['amountUnitType'] != null) {
		data.amountUnitType = json['amountUnitType']?.toString();
	}
	if (json['uniqueIdentifier'] != null) {
		data.uniqueIdentifier = json['uniqueIdentifier']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalityToJson(SmallDetailsResponseResultActivityModality entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.duration != null) {
		data['duration'] = entity.duration.toJson();
	}
	if (entity.questions != null) {
		data['questions'] =  entity.questions.map((v) => v.toJson()).toList();
	}
	if (entity.comments != null) {
		data['comments'] =  entity.comments.map((v) => v.toJson()).toList();
	}
	if (entity.supplierInformation != null) {
		data['supplierInformation'] = entity.supplierInformation.toJson();
	}
	if (entity.providerInformation != null) {
		data['providerInformation'] = entity.providerInformation.toJson();
	}
	data['destinationCode'] = entity.destinationCode;
	if (entity.contract != null) {
		data['contract'] = entity.contract.toJson();
	}
	if (entity.languages != null) {
		data['languages'] =  [];
	}
	if (entity.amountsFrom != null) {
		data['amountsFrom'] =  entity.amountsFrom.map((v) => v.toJson()).toList();
	}
	if (entity.amountsFromWithMarkup != null) {
		data['amountsFromWithMarkup'] =  entity.amountsFromWithMarkup.map((v) => v.toJson()).toList();
	}
	if (entity.rates != null) {
		data['rates'] =  entity.rates.map((v) => v.toJson()).toList();
	}
	data['amountUnitType'] = entity.amountUnitType;
	data['uniqueIdentifier'] = entity.uniqueIdentifier;
	return data;
}

smallDetailsResponseResultActivityModalitiesDurationFromJson(SmallDetailsResponseResultActivityModalitiesDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesDurationToJson(SmallDetailsResponseResultActivityModalitiesDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

smallDetailsResponseResultActivityModalitiesQuestionFromJson(SmallDetailsResponseResultActivityModalitiesQuestion data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['required'] != null) {
		data.required = json['required']?.toString();
	}
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesQuestionToJson(SmallDetailsResponseResultActivityModalitiesQuestion entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['required'] = entity.required;
	data['text'] = entity.text;
	return data;
}

smallDetailsResponseResultActivityModalitiesCommantsFromJson(SmallDetailsResponseResultActivityModalitiesCommants data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesCommantsToJson(SmallDetailsResponseResultActivityModalitiesCommants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['text'] = entity.text;
	return data;
}

smallDetailsResponseResultActivityModalitiesSupplierInformationFromJson(SmallDetailsResponseResultActivityModalitiesSupplierInformation data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['vatNumber'] != null) {
		data.vatNumber = json['vatNumber']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesSupplierInformationToJson(SmallDetailsResponseResultActivityModalitiesSupplierInformation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['vatNumber'] = entity.vatNumber;
	return data;
}

smallDetailsResponseResultActivityModalitiesProviderInformationFromJson(SmallDetailsResponseResultActivityModalitiesProviderInformation data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesProviderInformationToJson(SmallDetailsResponseResultActivityModalitiesProviderInformation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	return data;
}

smallDetailsResponseResultActivityModalitiesContractFromJson(SmallDetailsResponseResultActivityModalitiesContract data, Map<String, dynamic> json) {
	if (json['incomingOffice'] != null) {
		data.incomingOffice = json['incomingOffice']?.toInt();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesContractToJson(SmallDetailsResponseResultActivityModalitiesContract entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['incomingOffice'] = entity.incomingOffice;
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

smallDetailsResponseResultActivityModalitiesAmountsFromFromJson(SmallDetailsResponseResultActivityModalitiesAmountsFrom data, Map<String, dynamic> json) {
	if (json['paxType'] != null) {
		data.paxType = json['paxType']?.toString();
	}
	if (json['ageFrom'] != null) {
		data.ageFrom = json['ageFrom']?.toInt();
	}
	if (json['ageTo'] != null) {
		data.ageTo = json['ageTo']?.toInt();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesAmountsFromToJson(SmallDetailsResponseResultActivityModalitiesAmountsFrom entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

smallDetailsResponseResultActivityModalitiesAmountsFromWithMarkupFromJson(SmallDetailsResponseResultActivityModalitiesAmountsFromWithMarkup data, Map<String, dynamic> json) {
	if (json['paxType'] != null) {
		data.paxType = json['paxType']?.toString();
	}
	if (json['ageFrom'] != null) {
		data.ageFrom = json['ageFrom']?.toInt();
	}
	if (json['ageTo'] != null) {
		data.ageTo = json['ageTo']?.toInt();
	}
	if (json['displayRateInfoWithMarkup'] != null) {
		data.displayRateInfoWithMarkup = new SmallDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesAmountsFromWithMarkupToJson(SmallDetailsResponseResultActivityModalitiesAmountsFromWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	if (entity.displayRateInfoWithMarkup != null) {
		data['displayRateInfoWithMarkup'] = entity.displayRateInfoWithMarkup.toJson();
	}
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

smallDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupFromJson(SmallDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
	if (json['totalPriceWithMarkup'] != null) {
		data.totalPriceWithMarkup = json['totalPriceWithMarkup']?.toDouble();
	}
	if (json['baseRate'] != null) {
		data.baseRate = json['baseRate']?.toInt();
	}
	if (json['taxAndOtherCharges'] != null) {
		data.taxAndOtherCharges = json['taxAndOtherCharges']?.toInt();
	}
	if (json['otaTax'] != null) {
		data.otaTax = json['otaTax']?.toInt();
	}
	if (json['markup'] != null) {
		data.markup = json['markup']?.toInt();
	}
	if (json['supplierBaseRate'] != null) {
		data.supplierBaseRate = json['supplierBaseRate']?.toInt();
	}
	if (json['supplierTotalCost'] != null) {
		data.supplierTotalCost = json['supplierTotalCost']?.toInt();
	}
	if (json['currency'] != null) {
		data.currency = json['currency'];
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupToJson(SmallDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['totalPriceWithMarkup'] = entity.totalPriceWithMarkup;
	data['baseRate'] = entity.baseRate;
	data['taxAndOtherCharges'] = entity.taxAndOtherCharges;
	data['otaTax'] = entity.otaTax;
	data['markup'] = entity.markup;
	data['supplierBaseRate'] = entity.supplierBaseRate;
	data['supplierTotalCost'] = entity.supplierTotalCost;
	data['currency'] = entity.currency;
	return data;
}

smallDetailsResponseResultActivityModalitiesRateFromJson(SmallDetailsResponseResultActivityModalitiesRate data, Map<String, dynamic> json) {
	if (json['rateCode'] != null) {
		data.rateCode = json['rateCode']?.toString();
	}
	if (json['rateClass'] != null) {
		data.rateClass = json['rateClass']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['rateDetails'] != null) {
		data.rateDetails = new List<SmallDetailsResponseResultActivityModalitiesRatesRateDetail>();
		(json['rateDetails'] as List).forEach((v) {
			data.rateDetails.add(new SmallDetailsResponseResultActivityModalitiesRatesRateDetail().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRateToJson(SmallDetailsResponseResultActivityModalitiesRate entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['rateCode'] = entity.rateCode;
	data['rateClass'] = entity.rateClass;
	data['name'] = entity.name;
	if (entity.rateDetails != null) {
		data['rateDetails'] =  entity.rateDetails.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetail data, Map<String, dynamic> json) {
	if (json['rateKey'] != null) {
		data.rateKey = json['rateKey']?.toString();
	}
	if (json['operationDates'] != null) {
		data.operationDates = new List<SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate>();
		(json['operationDates'] as List).forEach((v) {
			data.operationDates.add(new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate().fromJson(v));
		});
	}
	if (json['operationDatesWithMarkup'] != null) {
		data.operationDatesWithMarkup = new List<SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup>();
		(json['operationDatesWithMarkup'] as List).forEach((v) {
			data.operationDatesWithMarkup.add(new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup().fromJson(v));
		});
	}
	if (json['languages'] != null) {
		data.languages = new List<dynamic>();
		data.languages.addAll(json['languages']);
	}
	if (json['sessions'] != null) {
		data.sessions = new List<dynamic>();
		data.sessions.addAll(json['sessions']);
	}
	if (json['minimumDuration'] != null) {
		data.minimumDuration = new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDuration().fromJson(json['minimumDuration']);
	}
	if (json['maximumDuration'] != null) {
		data.maximumDuration = new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDuration().fromJson(json['maximumDuration']);
	}
	if (json['totalAmount'] != null) {
		data.totalAmount = new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmount().fromJson(json['totalAmount']);
	}
	if (json['totalAmountWithMarkup'] != null) {
		data.totalAmountWithMarkup = new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkup().fromJson(json['totalAmountWithMarkup']);
	}
	if (json['paxAmounts'] != null) {
		data.paxAmounts = new List<SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount>();
		(json['paxAmounts'] as List).forEach((v) {
			data.paxAmounts.add(new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount().fromJson(v));
		});
	}
	if (json['paxAmountsWithMarkup'] != null) {
		data.paxAmountsWithMarkup = new List<SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup>();
		(json['paxAmountsWithMarkup'] as List).forEach((v) {
			data.paxAmountsWithMarkup.add(new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup().fromJson(v));
		});
	}
	if (json['agencyCommission'] != null) {
		data.agencyCommission = new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommission().fromJson(json['agencyCommission']);
	}
	if (json['agencyCommissionWithMarkup'] != null) {
		data.agencyCommissionWithMarkup = new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkup().fromJson(json['agencyCommissionWithMarkup']);
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toInt();
	}
	if (json['tpaName'] != null) {
		data.tpaName = json['tpaName']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetail entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['rateKey'] = entity.rateKey;
	if (entity.operationDates != null) {
		data['operationDates'] =  entity.operationDates.map((v) => v.toJson()).toList();
	}
	if (entity.operationDatesWithMarkup != null) {
		data['operationDatesWithMarkup'] =  entity.operationDatesWithMarkup.map((v) => v.toJson()).toList();
	}
	if (entity.languages != null) {
		data['languages'] =  [];
	}
	if (entity.sessions != null) {
		data['sessions'] =  [];
	}
	if (entity.minimumDuration != null) {
		data['minimumDuration'] = entity.minimumDuration.toJson();
	}
	if (entity.maximumDuration != null) {
		data['maximumDuration'] = entity.maximumDuration.toJson();
	}
	if (entity.totalAmount != null) {
		data['totalAmount'] = entity.totalAmount.toJson();
	}
	if (entity.totalAmountWithMarkup != null) {
		data['totalAmountWithMarkup'] = entity.totalAmountWithMarkup.toJson();
	}
	if (entity.paxAmounts != null) {
		data['paxAmounts'] =  entity.paxAmounts.map((v) => v.toJson()).toList();
	}
	if (entity.paxAmountsWithMarkup != null) {
		data['paxAmountsWithMarkup'] =  entity.paxAmountsWithMarkup.map((v) => v.toJson()).toList();
	}
	if (entity.agencyCommission != null) {
		data['agencyCommission'] = entity.agencyCommission.toJson();
	}
	if (entity.agencyCommissionWithMarkup != null) {
		data['agencyCommissionWithMarkup'] = entity.agencyCommissionWithMarkup.toJson();
	}
	data['tpa'] = entity.tpa;
	data['tpaName'] = entity.tpaName;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDateFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate data, Map<String, dynamic> json) {
	if (json['from'] != null) {
		data.from = json['from']?.toString();
	}
	if (json['to'] != null) {
		data.to = json['to']?.toString();
	}
	if (json['cancellationPolicies'] != null) {
		data.cancellationPolicies = new List<SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy>();
		(json['cancellationPolicies'] as List).forEach((v) {
			data.cancellationPolicies.add(new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDateToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['from'] = entity.from;
	data['to'] = entity.to;
	if (entity.cancellationPolicies != null) {
		data['cancellationPolicies'] =  entity.cancellationPolicies.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicyFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy data, Map<String, dynamic> json) {
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicyToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateFrom'] = entity.dateFrom;
	data['amount'] = entity.amount;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup data, Map<String, dynamic> json) {
	if (json['from'] != null) {
		data.from = json['from']?.toString();
	}
	if (json['to'] != null) {
		data.to = json['to']?.toString();
	}
	if (json['cancellationPolicies'] != null) {
		data.cancellationPolicies = new List<SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy>();
		(json['cancellationPolicies'] as List).forEach((v) {
			data.cancellationPolicies.add(new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['from'] = entity.from;
	data['to'] = entity.to;
	if (entity.cancellationPolicies != null) {
		data['cancellationPolicies'] =  entity.cancellationPolicies.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicyFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy data, Map<String, dynamic> json) {
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicyToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateFrom'] = entity.dateFrom;
	data['amount'] = entity.amount;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDurationFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDurationToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDurationFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDurationToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmount data, Map<String, dynamic> json) {
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkup data, Map<String, dynamic> json) {
	if (json['displayRateInfoWithMarkup'] != null) {
		data.displayRateInfoWithMarkup = new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.displayRateInfoWithMarkup != null) {
		data['displayRateInfoWithMarkup'] = entity.displayRateInfoWithMarkup.toJson();
	}
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkupFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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
	if (json['currency'] != null) {
		data.currency = json['currency'];
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkupToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['totalPriceWithMarkup'] = entity.totalPriceWithMarkup;
	data['baseRate'] = entity.baseRate;
	data['taxAndOtherCharges'] = entity.taxAndOtherCharges;
	data['otaTax'] = entity.otaTax;
	data['markup'] = entity.markup;
	data['supplierBaseRate'] = entity.supplierBaseRate;
	data['supplierTotalCost'] = entity.supplierTotalCost;
	data['currency'] = entity.currency;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount data, Map<String, dynamic> json) {
	if (json['paxType'] != null) {
		data.paxType = json['paxType']?.toString();
	}
	if (json['ageFrom'] != null) {
		data.ageFrom = json['ageFrom']?.toInt();
	}
	if (json['ageTo'] != null) {
		data.ageTo = json['ageTo']?.toInt();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toInt();
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toInt();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup data, Map<String, dynamic> json) {
	if (json['paxType'] != null) {
		data.paxType = json['paxType']?.toString();
	}
	if (json['ageFrom'] != null) {
		data.ageFrom = json['ageFrom']?.toInt();
	}
	if (json['ageTo'] != null) {
		data.ageTo = json['ageTo']?.toInt();
	}
	if (json['displayRateInfoWithMarkup'] != null) {
		data.displayRateInfoWithMarkup = new SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toInt();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	if (entity.displayRateInfoWithMarkup != null) {
		data['displayRateInfoWithMarkup'] = entity.displayRateInfoWithMarkup.toJson();
	}
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkupFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
	if (json['totalPriceWithMarkup'] != null) {
		data.totalPriceWithMarkup = json['totalPriceWithMarkup']?.toInt();
	}
	if (json['baseRate'] != null) {
		data.baseRate = json['baseRate']?.toInt();
	}
	if (json['taxAndOtherCharges'] != null) {
		data.taxAndOtherCharges = json['taxAndOtherCharges']?.toInt();
	}
	if (json['otaTax'] != null) {
		data.otaTax = json['otaTax']?.toInt();
	}
	if (json['markup'] != null) {
		data.markup = json['markup']?.toInt();
	}
	if (json['supplierBaseRate'] != null) {
		data.supplierBaseRate = json['supplierBaseRate']?.toInt();
	}
	if (json['supplierTotalCost'] != null) {
		data.supplierTotalCost = json['supplierTotalCost']?.toInt();
	}
	if (json['currency'] != null) {
		data.currency = json['currency'];
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkupToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['totalPriceWithMarkup'] = entity.totalPriceWithMarkup;
	data['baseRate'] = entity.baseRate;
	data['taxAndOtherCharges'] = entity.taxAndOtherCharges;
	data['otaTax'] = entity.otaTax;
	data['markup'] = entity.markup;
	data['supplierBaseRate'] = entity.supplierBaseRate;
	data['supplierTotalCost'] = entity.supplierTotalCost;
	data['currency'] = entity.currency;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommission data, Map<String, dynamic> json) {
	if (json['percentage'] != null) {
		data.percentage = json['percentage']?.toDouble();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['vatPercentage'] != null) {
		data.vatPercentage = json['vatPercentage']?.toInt();
	}
	if (json['vatAmount'] != null) {
		data.vatAmount = json['vatAmount']?.toInt();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommission entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['percentage'] = entity.percentage;
	data['amount'] = entity.amount;
	data['vatPercentage'] = entity.vatPercentage;
	data['vatAmount'] = entity.vatAmount;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkupFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkup data, Map<String, dynamic> json) {
	if (json['percentage'] != null) {
		data.percentage = json['percentage']?.toDouble();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['vatPercentage'] != null) {
		data.vatPercentage = json['vatPercentage']?.toInt();
	}
	if (json['vatAmount'] != null) {
		data.vatAmount = json['vatAmount']?.toInt();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkupToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['percentage'] = entity.percentage;
	data['amount'] = entity.amount;
	data['vatPercentage'] = entity.vatPercentage;
	data['vatAmount'] = entity.vatAmount;
	return data;
}

smallDetailsResponseResultActivityModalitiesRatesRateDetailsOptionFromJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityModalitiesRatesRateDetailsOptionToJson(SmallDetailsResponseResultActivityModalitiesRatesRateDetailsOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}

smallDetailsResponseResultActivityAmountsFromFromJson(SmallDetailsResponseResultActivityAmountsFrom data, Map<String, dynamic> json) {
	if (json['paxType'] != null) {
		data.paxType = json['paxType']?.toString();
	}
	if (json['ageFrom'] != null) {
		data.ageFrom = json['ageFrom']?.toInt();
	}
	if (json['ageTo'] != null) {
		data.ageTo = json['ageTo']?.toInt();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityAmountsFromToJson(SmallDetailsResponseResultActivityAmountsFrom entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

smallDetailsResponseResultActivityAmountsFromWithMarkupFromJson(SmallDetailsResponseResultActivityAmountsFromWithMarkup data, Map<String, dynamic> json) {
	if (json['paxType'] != null) {
		data.paxType = json['paxType']?.toString();
	}
	if (json['ageFrom'] != null) {
		data.ageFrom = json['ageFrom']?.toInt();
	}
	if (json['ageTo'] != null) {
		data.ageTo = json['ageTo']?.toInt();
	}
	if (json['displayRateInfoWithMarkup'] != null) {
		data.displayRateInfoWithMarkup = new SmallDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityAmountsFromWithMarkupToJson(SmallDetailsResponseResultActivityAmountsFromWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	if (entity.displayRateInfoWithMarkup != null) {
		data['displayRateInfoWithMarkup'] = entity.displayRateInfoWithMarkup.toJson();
	}
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

smallDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkupFromJson(SmallDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
	if (json['totalPriceWithMarkup'] != null) {
		data.totalPriceWithMarkup = json['totalPriceWithMarkup']?.toDouble();
	}
	if (json['baseRate'] != null) {
		data.baseRate = json['baseRate']?.toInt();
	}
	if (json['taxAndOtherCharges'] != null) {
		data.taxAndOtherCharges = json['taxAndOtherCharges']?.toInt();
	}
	if (json['otaTax'] != null) {
		data.otaTax = json['otaTax']?.toInt();
	}
	if (json['markup'] != null) {
		data.markup = json['markup']?.toInt();
	}
	if (json['supplierBaseRate'] != null) {
		data.supplierBaseRate = json['supplierBaseRate']?.toInt();
	}
	if (json['supplierTotalCost'] != null) {
		data.supplierTotalCost = json['supplierTotalCost']?.toInt();
	}
	if (json['currency'] != null) {
		data.currency = json['currency'];
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkupToJson(SmallDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['totalPriceWithMarkup'] = entity.totalPriceWithMarkup;
	data['baseRate'] = entity.baseRate;
	data['taxAndOtherCharges'] = entity.taxAndOtherCharges;
	data['otaTax'] = entity.otaTax;
	data['markup'] = entity.markup;
	data['supplierBaseRate'] = entity.supplierBaseRate;
	data['supplierTotalCost'] = entity.supplierTotalCost;
	data['currency'] = entity.currency;
	return data;
}

smallDetailsResponseResultActivityContentFromJson(SmallDetailsResponseResultActivityContent data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['detailedInfo'] != null) {
		data.detailedInfo = new List<dynamic>();
		data.detailedInfo.addAll(json['detailedInfo']);
	}
	if (json['featureGroups'] != null) {
		data.featureGroups = new List<SmallDetailsResponseResultActivityContentFeatureGroup>();
		(json['featureGroups'] as List).forEach((v) {
			data.featureGroups.add(new SmallDetailsResponseResultActivityContentFeatureGroup().fromJson(v));
		});
	}
	if (json['guidingOptions'] != null) {
		data.guidingOptions = new SmallDetailsResponseResultActivityContentGuidingOptions().fromJson(json['guidingOptions']);
	}
	if (json['location'] != null) {
		data.location = new SmallDetailsResponseResultActivityContentLocation().fromJson(json['location']);
	}
	if (json['media'] != null) {
		data.media = new SmallDetailsResponseResultActivityContentMedia().fromJson(json['media']);
	}
	if (json['redeemInfo'] != null) {
		data.redeemInfo = new SmallDetailsResponseResultActivityContentRedeemInfo().fromJson(json['redeemInfo']);
	}
	if (json['routes'] != null) {
		data.routes = new List<SmallDetailsResponseResultActivityContentRoute>();
		(json['routes'] as List).forEach((v) {
			data.routes.add(new SmallDetailsResponseResultActivityContentRoute().fromJson(v));
		});
	}
	if (json['scheduling'] != null) {
		data.scheduling = new SmallDetailsResponseResultActivityContentScheduling().fromJson(json['scheduling']);
	}
	if (json['segmentationGroups'] != null) {
		data.segmentationGroups = new List<SmallDetailsResponseResultActivityContentSegmantationGroups>();
		(json['segmentationGroups'] as List).forEach((v) {
			data.segmentationGroups.add(new SmallDetailsResponseResultActivityContentSegmantationGroups().fromJson(v));
		});
	}
	if (json['activityFactsheetType'] != null) {
		data.activityFactsheetType = json['activityFactsheetType']?.toString();
	}
	if (json['activityCode'] != null) {
		data.activityCode = json['activityCode']?.toString();
	}
	if (json['modalityCode'] != null) {
		data.modalityCode = json['modalityCode']?.toString();
	}
	if (json['modalityName'] != null) {
		data.modalityName = json['modalityName']?.toString();
	}
	if (json['contentId'] != null) {
		data.contentId = json['contentId']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['lastUpdate'] != null) {
		data.lastUpdate = json['lastUpdate']?.toString();
	}
	if (json['summary'] != null) {
		data.summary = json['summary']?.toString();
	}
	if (json['advancedTips'] != null) {
		data.advancedTips = new List<dynamic>();
		data.advancedTips.addAll(json['advancedTips']);
	}
	if (json['countries'] != null) {
		data.countries = new List<SmallDetailsResponseResultActivityContentCountry>();
		(json['countries'] as List).forEach((v) {
			data.countries.add(new SmallDetailsResponseResultActivityContentCountry().fromJson(v));
		});
	}
	if (json['highligths'] != null) {
		data.highligths = json['highligths']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentToJson(SmallDetailsResponseResultActivityContent entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	if (entity.detailedInfo != null) {
		data['detailedInfo'] =  [];
	}
	if (entity.featureGroups != null) {
		data['featureGroups'] =  entity.featureGroups.map((v) => v.toJson()).toList();
	}
	if (entity.guidingOptions != null) {
		data['guidingOptions'] = entity.guidingOptions.toJson();
	}
	if (entity.location != null) {
		data['location'] = entity.location.toJson();
	}
	if (entity.media != null) {
		data['media'] = entity.media.toJson();
	}
	if (entity.redeemInfo != null) {
		data['redeemInfo'] = entity.redeemInfo.toJson();
	}
	if (entity.routes != null) {
		data['routes'] =  entity.routes.map((v) => v.toJson()).toList();
	}
	if (entity.scheduling != null) {
		data['scheduling'] = entity.scheduling.toJson();
	}
	if (entity.segmentationGroups != null) {
		data['segmentationGroups'] =  entity.segmentationGroups.map((v) => v.toJson()).toList();
	}
	data['activityFactsheetType'] = entity.activityFactsheetType;
	data['activityCode'] = entity.activityCode;
	data['modalityCode'] = entity.modalityCode;
	data['modalityName'] = entity.modalityName;
	data['contentId'] = entity.contentId;
	data['description'] = entity.description;
	data['lastUpdate'] = entity.lastUpdate;
	data['summary'] = entity.summary;
	if (entity.advancedTips != null) {
		data['advancedTips'] =  [];
	}
	if (entity.countries != null) {
		data['countries'] =  entity.countries.map((v) => v.toJson()).toList();
	}
	data['highligths'] = entity.highligths;
	return data;
}

smallDetailsResponseResultActivityContentFeatureGroupFromJson(SmallDetailsResponseResultActivityContentFeatureGroup data, Map<String, dynamic> json) {
	if (json['groupCode'] != null) {
		data.groupCode = json['groupCode']?.toString();
	}
	if (json['included'] != null) {
		data.included = new List<SmallDetailsResponseResultActivityContentFeatureGroupsIncluded>();
		(json['included'] as List).forEach((v) {
			data.included.add(new SmallDetailsResponseResultActivityContentFeatureGroupsIncluded().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentFeatureGroupToJson(SmallDetailsResponseResultActivityContentFeatureGroup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['groupCode'] = entity.groupCode;
	if (entity.included != null) {
		data['included'] =  entity.included.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityContentFeatureGroupsIncludedFromJson(SmallDetailsResponseResultActivityContentFeatureGroupsIncluded data, Map<String, dynamic> json) {
	if (json['featureType'] != null) {
		data.featureType = json['featureType']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentFeatureGroupsIncludedToJson(SmallDetailsResponseResultActivityContentFeatureGroupsIncluded entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['featureType'] = entity.featureType;
	data['description'] = entity.description;
	return data;
}

smallDetailsResponseResultActivityContentGuidingOptionsFromJson(SmallDetailsResponseResultActivityContentGuidingOptions data, Map<String, dynamic> json) {
	if (json['guideType'] != null) {
		data.guideType = json['guideType']?.toString();
	}
	if (json['included'] != null) {
		data.included = json['included']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentGuidingOptionsToJson(SmallDetailsResponseResultActivityContentGuidingOptions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['guideType'] = entity.guideType;
	data['included'] = entity.included;
	return data;
}

smallDetailsResponseResultActivityContentLocationFromJson(SmallDetailsResponseResultActivityContentLocation data, Map<String, dynamic> json) {
	if (json['endPoints'] != null) {
		data.endPoints = new List<SmallDetailsResponseResultActivityContentLocationEndPoint>();
		(json['endPoints'] as List).forEach((v) {
			data.endPoints.add(new SmallDetailsResponseResultActivityContentLocationEndPoint().fromJson(v));
		});
	}
	if (json['startingPoints'] != null) {
		data.startingPoints = new List<SmallDetailsResponseResultActivityContentLocationStartingPoint>();
		(json['startingPoints'] as List).forEach((v) {
			data.startingPoints.add(new SmallDetailsResponseResultActivityContentLocationStartingPoint().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentLocationToJson(SmallDetailsResponseResultActivityContentLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.endPoints != null) {
		data['endPoints'] =  entity.endPoints.map((v) => v.toJson()).toList();
	}
	if (entity.startingPoints != null) {
		data['startingPoints'] =  entity.startingPoints.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityContentLocationEndPointFromJson(SmallDetailsResponseResultActivityContentLocationEndPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentLocationEndPointToJson(SmallDetailsResponseResultActivityContentLocationEndPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['description'] = entity.description;
	return data;
}

smallDetailsResponseResultActivityContentLocationStartingPointFromJson(SmallDetailsResponseResultActivityContentLocationStartingPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['meetingPoint'] != null) {
		data.meetingPoint = new SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPoint().fromJson(json['meetingPoint']);
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentLocationStartingPointToJson(SmallDetailsResponseResultActivityContentLocationStartingPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.meetingPoint != null) {
		data['meetingPoint'] = entity.meetingPoint.toJson();
	}
	return data;
}

smallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointFromJson(SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['geolocation'] != null) {
		data.geolocation = new SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointGeolocation().fromJson(json['geolocation']);
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['country'] != null) {
		data.country = new SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountry().fromJson(json['country']);
	}
	if (json['zip'] != null) {
		data.zip = json['zip']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointToJson(SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.geolocation != null) {
		data['geolocation'] = entity.geolocation.toJson();
	}
	data['address'] = entity.address;
	if (entity.country != null) {
		data['country'] = entity.country.toJson();
	}
	data['zip'] = entity.zip;
	data['description'] = entity.description;
	return data;
}

smallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointGeolocationFromJson(SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointGeolocation data, Map<String, dynamic> json) {
	if (json['latitude'] != null) {
		data.latitude = json['latitude']?.toDouble();
	}
	if (json['longitude'] != null) {
		data.longitude = json['longitude']?.toDouble();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointGeolocationToJson(SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointGeolocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	return data;
}

smallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryFromJson(SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryToJson(SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestinationFromJson(SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestinationToJson(SmallDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

smallDetailsResponseResultActivityContentMediaFromJson(SmallDetailsResponseResultActivityContentMedia data, Map<String, dynamic> json) {
	if (json['images'] != null) {
		data.images = new List<SmallDetailsResponseResultActivityContentMediaImage>();
		(json['images'] as List).forEach((v) {
			data.images.add(new SmallDetailsResponseResultActivityContentMediaImage().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentMediaToJson(SmallDetailsResponseResultActivityContentMedia entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.images != null) {
		data['images'] =  entity.images.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityContentMediaImageFromJson(SmallDetailsResponseResultActivityContentMediaImage data, Map<String, dynamic> json) {
	if (json['visualizationOrder'] != null) {
		data.visualizationOrder = json['visualizationOrder']?.toInt();
	}
	if (json['mimeType'] != null) {
		data.mimeType = json['mimeType']?.toString();
	}
	if (json['language'] != null) {
		data.language = json['language']?.toString();
	}
	if (json['urls'] != null) {
		data.urls = new List<SmallDetailsResponseResultActivityContentMediaImagesUrl>();
		(json['urls'] as List).forEach((v) {
			data.urls.add(new SmallDetailsResponseResultActivityContentMediaImagesUrl().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentMediaImageToJson(SmallDetailsResponseResultActivityContentMediaImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['visualizationOrder'] = entity.visualizationOrder;
	data['mimeType'] = entity.mimeType;
	data['language'] = entity.language;
	if (entity.urls != null) {
		data['urls'] =  entity.urls.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityContentMediaImagesUrlFromJson(SmallDetailsResponseResultActivityContentMediaImagesUrl data, Map<String, dynamic> json) {
	if (json['dpi'] != null) {
		data.dpi = json['dpi']?.toInt();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toInt();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toInt();
	}
	if (json['resource'] != null) {
		data.resource = json['resource']?.toString();
	}
	if (json['sizeType'] != null) {
		data.sizeType = json['sizeType']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentMediaImagesUrlToJson(SmallDetailsResponseResultActivityContentMediaImagesUrl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dpi'] = entity.dpi;
	data['height'] = entity.height;
	data['width'] = entity.width;
	data['resource'] = entity.resource;
	data['sizeType'] = entity.sizeType;
	return data;
}

smallDetailsResponseResultActivityContentRedeemInfoFromJson(SmallDetailsResponseResultActivityContentRedeemInfo data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['directEntrance'] != null) {
		data.directEntrance = json['directEntrance']?.toString();
	}
	if (json['comments'] != null) {
		data.comments = new List<SmallDetailsResponseResultActivityContentRedeemInfoCommants>();
		(json['comments'] as List).forEach((v) {
			data.comments.add(new SmallDetailsResponseResultActivityContentRedeemInfoCommants().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentRedeemInfoToJson(SmallDetailsResponseResultActivityContentRedeemInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['directEntrance'] = entity.directEntrance;
	if (entity.comments != null) {
		data['comments'] =  entity.comments.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityContentRedeemInfoCommantsFromJson(SmallDetailsResponseResultActivityContentRedeemInfoCommants data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'];
	}
	if (json['text'] != null) {
		data.text = json['text'];
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentRedeemInfoCommantsToJson(SmallDetailsResponseResultActivityContentRedeemInfoCommants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['text'] = entity.text;
	return data;
}

smallDetailsResponseResultActivityContentRouteFromJson(SmallDetailsResponseResultActivityContentRoute data, Map<String, dynamic> json) {
	if (json['duration'] != null) {
		data.duration = new SmallDetailsResponseResultActivityContentRoutesDuration().fromJson(json['duration']);
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['timeFrom'] != null) {
		data.timeFrom = json['timeFrom']?.toString();
	}
	if (json['timeTo'] != null) {
		data.timeTo = json['timeTo']?.toString();
	}
	if (json['points'] != null) {
		data.points = new List<SmallDetailsResponseResultActivityContentRoutesPoint>();
		(json['points'] as List).forEach((v) {
			data.points.add(new SmallDetailsResponseResultActivityContentRoutesPoint().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentRouteToJson(SmallDetailsResponseResultActivityContentRoute entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.duration != null) {
		data['duration'] = entity.duration.toJson();
	}
	data['description'] = entity.description;
	data['timeFrom'] = entity.timeFrom;
	data['timeTo'] = entity.timeTo;
	if (entity.points != null) {
		data['points'] =  entity.points.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityContentRoutesDurationFromJson(SmallDetailsResponseResultActivityContentRoutesDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentRoutesDurationToJson(SmallDetailsResponseResultActivityContentRoutesDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

smallDetailsResponseResultActivityContentRoutesPointFromJson(SmallDetailsResponseResultActivityContentRoutesPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['order'] != null) {
		data.order = json['order']?.toInt();
	}
	if (json['stop'] != null) {
		data.stop = json['stop'];
	}
	if (json['pointOfInterest'] != null) {
		data.pointOfInterest = new SmallDetailsResponseResultActivityContentRoutesPointsPointOfInterest().fromJson(json['pointOfInterest']);
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentRoutesPointToJson(SmallDetailsResponseResultActivityContentRoutesPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['order'] = entity.order;
	data['stop'] = entity.stop;
	if (entity.pointOfInterest != null) {
		data['pointOfInterest'] = entity.pointOfInterest.toJson();
	}
	return data;
}

smallDetailsResponseResultActivityContentRoutesPointsPointOfInterestFromJson(SmallDetailsResponseResultActivityContentRoutesPointsPointOfInterest data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['geolocation'] != null) {
		data.geolocation = new SmallDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocation().fromJson(json['geolocation']);
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['country'] != null) {
		data.country = new SmallDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountry().fromJson(json['country']);
	}
	if (json['city'] != null) {
		data.city = json['city']?.toString();
	}
	if (json['zip'] != null) {
		data.zip = json['zip']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentRoutesPointsPointOfInterestToJson(SmallDetailsResponseResultActivityContentRoutesPointsPointOfInterest entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.geolocation != null) {
		data['geolocation'] = entity.geolocation.toJson();
	}
	data['address'] = entity.address;
	if (entity.country != null) {
		data['country'] = entity.country.toJson();
	}
	data['city'] = entity.city;
	data['zip'] = entity.zip;
	data['description'] = entity.description;
	return data;
}

smallDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocationFromJson(SmallDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocation data, Map<String, dynamic> json) {
	if (json['latitude'] != null) {
		data.latitude = json['latitude']?.toDouble();
	}
	if (json['longitude'] != null) {
		data.longitude = json['longitude']?.toDouble();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocationToJson(SmallDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	return data;
}

smallDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountryFromJson(SmallDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountryToJson(SmallDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	return data;
}

smallDetailsResponseResultActivityContentSchedulingFromJson(SmallDetailsResponseResultActivityContentScheduling data, Map<String, dynamic> json) {
	if (json['duration'] != null) {
		data.duration = new SmallDetailsResponseResultActivityContentSchedulingDuration().fromJson(json['duration']);
	}
	if (json['opened'] != null) {
		data.opened = json['opened'];
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentSchedulingToJson(SmallDetailsResponseResultActivityContentScheduling entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.duration != null) {
		data['duration'] = entity.duration.toJson();
	}
	data['opened'] = entity.opened;
	return data;
}

smallDetailsResponseResultActivityContentSchedulingDurationFromJson(SmallDetailsResponseResultActivityContentSchedulingDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toInt();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentSchedulingDurationToJson(SmallDetailsResponseResultActivityContentSchedulingDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

smallDetailsResponseResultActivityContentSegmantationGroupsFromJson(SmallDetailsResponseResultActivityContentSegmantationGroups data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['segments'] != null) {
		data.segments = new List<SmallDetailsResponseResultActivityContentSegmantationGroupsSegmants>();
		(json['segments'] as List).forEach((v) {
			data.segments.add(new SmallDetailsResponseResultActivityContentSegmantationGroupsSegmants().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentSegmantationGroupsToJson(SmallDetailsResponseResultActivityContentSegmantationGroups entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.segments != null) {
		data['segments'] =  entity.segments.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityContentSegmantationGroupsSegmantsFromJson(SmallDetailsResponseResultActivityContentSegmantationGroupsSegmants data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentSegmantationGroupsSegmantsToJson(SmallDetailsResponseResultActivityContentSegmantationGroupsSegmants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

smallDetailsResponseResultActivityContentCountryFromJson(SmallDetailsResponseResultActivityContentCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<SmallDetailsResponseResultActivityContentCountriesDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new SmallDetailsResponseResultActivityContentCountriesDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentCountryToJson(SmallDetailsResponseResultActivityContentCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

smallDetailsResponseResultActivityContentCountriesDestinationFromJson(SmallDetailsResponseResultActivityContentCountriesDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityContentCountriesDestinationToJson(SmallDetailsResponseResultActivityContentCountriesDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

smallDetailsResponseResultActivityOptionFromJson(SmallDetailsResponseResultActivityOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> smallDetailsResponseResultActivityOptionToJson(SmallDetailsResponseResultActivityOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}