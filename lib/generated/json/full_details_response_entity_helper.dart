import 'package:ota/models/activity/full_details_response_entity.dart';

fullDetailsResponseEntityFromJson(FullDetailsResponseEntity data, Map<String, dynamic> json) {
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
		data.result = new FullDetailsResponseResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseEntityToJson(FullDetailsResponseEntity entity) {
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

fullDetailsResponseResultFromJson(FullDetailsResponseResult data, Map<String, dynamic> json) {
	if (json['operationId'] != null) {
		data.operationId = json['operationId']?.toString();
	}
	if (json['auditData'] != null) {
		data.auditData = new FullDetailsResponseResultAuditData().fromJson(json['auditData']);
	}
	if (json['activity'] != null) {
		data.activity = new FullDetailsResponseResultActivity().fromJson(json['activity']);
	}
	if (json['errors'] != null) {
		data.errors = json['errors'];
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultToJson(FullDetailsResponseResult entity) {
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

fullDetailsResponseResultAuditDataFromJson(FullDetailsResponseResultAuditData data, Map<String, dynamic> json) {
	if (json['processTime'] != null) {
		data.processTime = json['processTime']?.toDouble();
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

Map<String, dynamic> fullDetailsResponseResultAuditDataToJson(FullDetailsResponseResultAuditData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['processTime'] = entity.processTime;
	data['time'] = entity.time;
	data['serverId'] = entity.serverId;
	data['environment'] = entity.environment;
	return data;
}

fullDetailsResponseResultActivityFromJson(FullDetailsResponseResultActivity data, Map<String, dynamic> json) {
	if (json['activityCode'] != null) {
		data.activityCode = json['activityCode']?.toString();
	}
	if (json['country'] != null) {
		data.country = new FullDetailsResponseResultActivityCountry().fromJson(json['country']);
	}
	if (json['operationDays'] != null) {
		data.operationDays = new List<FullDetailsResponseResultActivityOperationDay>();
		(json['operationDays'] as List).forEach((v) {
			data.operationDays.add(new FullDetailsResponseResultActivityOperationDay().fromJson(v));
		});
	}
	if (json['modalities'] != null) {
		data.modalities = new List<FullDetailsResponseResultActivityModality>();
		(json['modalities'] as List).forEach((v) {
			data.modalities.add(new FullDetailsResponseResultActivityModality().fromJson(v));
		});
	}
	if (json['currencyName'] != null) {
		data.currencyName = json['currencyName']?.toString();
	}
	if (json['amountsFrom'] != null) {
		data.amountsFrom = new List<FullDetailsResponseResultActivityAmountsFrom>();
		(json['amountsFrom'] as List).forEach((v) {
			data.amountsFrom.add(new FullDetailsResponseResultActivityAmountsFrom().fromJson(v));
		});
	}
	if (json['amountsFromWithMarkup'] != null) {
		data.amountsFromWithMarkup = new List<FullDetailsResponseResultActivityAmountsFromWithMarkup>();
		(json['amountsFromWithMarkup'] as List).forEach((v) {
			data.amountsFromWithMarkup.add(new FullDetailsResponseResultActivityAmountsFromWithMarkup().fromJson(v));
		});
	}
	if (json['content'] != null) {
		data.content = new FullDetailsResponseResultActivityContent().fromJson(json['content']);
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
		data.options = new List<FullDetailsResponseResultActivityOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new FullDetailsResponseResultActivityOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityToJson(FullDetailsResponseResultActivity entity) {
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

fullDetailsResponseResultActivityCountryFromJson(FullDetailsResponseResultActivityCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<FullDetailsResponseResultActivityCountryDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new FullDetailsResponseResultActivityCountryDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityCountryToJson(FullDetailsResponseResultActivityCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityCountryDestinationFromJson(FullDetailsResponseResultActivityCountryDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityCountryDestinationToJson(FullDetailsResponseResultActivityCountryDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

fullDetailsResponseResultActivityOperationDayFromJson(FullDetailsResponseResultActivityOperationDay data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityOperationDayToJson(FullDetailsResponseResultActivityOperationDay entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

fullDetailsResponseResultActivityModalityFromJson(FullDetailsResponseResultActivityModality data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['duration'] != null) {
		data.duration = new FullDetailsResponseResultActivityModalitiesDuration().fromJson(json['duration']);
	}
	if (json['questions'] != null) {
		data.questions = new List<FullDetailsResponseResultActivityModalitiesQuestion>();
		(json['questions'] as List).forEach((v) {
			data.questions.add(new FullDetailsResponseResultActivityModalitiesQuestion().fromJson(v));
		});
	}
	if (json['comments'] != null) {
		data.comments = new List<FullDetailsResponseResultActivityModalitiesCommants>();
		(json['comments'] as List).forEach((v) {
			data.comments.add(new FullDetailsResponseResultActivityModalitiesCommants().fromJson(v));
		});
	}
	if (json['supplierInformation'] != null) {
		data.supplierInformation = new FullDetailsResponseResultActivityModalitiesSupplierInformation().fromJson(json['supplierInformation']);
	}
	if (json['providerInformation'] != null) {
		data.providerInformation = new FullDetailsResponseResultActivityModalitiesProviderInformation().fromJson(json['providerInformation']);
	}
	if (json['destinationCode'] != null) {
		data.destinationCode = json['destinationCode']?.toString();
	}
	if (json['contract'] != null) {
		data.contract = new FullDetailsResponseResultActivityModalitiesContract().fromJson(json['contract']);
	}
	if (json['languages'] != null) {
		data.languages = new List<dynamic>();
		data.languages.addAll(json['languages']);
	}
	if (json['amountsFrom'] != null) {
		data.amountsFrom = new List<FullDetailsResponseResultActivityModalitiesAmountsFrom>();
		(json['amountsFrom'] as List).forEach((v) {
			data.amountsFrom.add(new FullDetailsResponseResultActivityModalitiesAmountsFrom().fromJson(v));
		});
	}
	if (json['amountsFromWithMarkup'] != null) {
		data.amountsFromWithMarkup = new List<FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkup>();
		(json['amountsFromWithMarkup'] as List).forEach((v) {
			data.amountsFromWithMarkup.add(new FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkup().fromJson(v));
		});
	}
	if (json['rates'] != null) {
		data.rates = new List<FullDetailsResponseResultActivityModalitiesRate>();
		(json['rates'] as List).forEach((v) {
			data.rates.add(new FullDetailsResponseResultActivityModalitiesRate().fromJson(v));
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

Map<String, dynamic> fullDetailsResponseResultActivityModalityToJson(FullDetailsResponseResultActivityModality entity) {
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

fullDetailsResponseResultActivityModalitiesDurationFromJson(FullDetailsResponseResultActivityModalitiesDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesDurationToJson(FullDetailsResponseResultActivityModalitiesDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

fullDetailsResponseResultActivityModalitiesQuestionFromJson(FullDetailsResponseResultActivityModalitiesQuestion data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['required'] != null) {
		data.required = json['required']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesQuestionToJson(FullDetailsResponseResultActivityModalitiesQuestion entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['text'] = entity.text;
	data['required'] = entity.required;
	return data;
}

fullDetailsResponseResultActivityModalitiesCommantsFromJson(FullDetailsResponseResultActivityModalitiesCommants data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesCommantsToJson(FullDetailsResponseResultActivityModalitiesCommants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['text'] = entity.text;
	return data;
}

fullDetailsResponseResultActivityModalitiesSupplierInformationFromJson(FullDetailsResponseResultActivityModalitiesSupplierInformation data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['vatNumber'] != null) {
		data.vatNumber = json['vatNumber']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesSupplierInformationToJson(FullDetailsResponseResultActivityModalitiesSupplierInformation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['vatNumber'] = entity.vatNumber;
	return data;
}

fullDetailsResponseResultActivityModalitiesProviderInformationFromJson(FullDetailsResponseResultActivityModalitiesProviderInformation data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesProviderInformationToJson(FullDetailsResponseResultActivityModalitiesProviderInformation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	return data;
}

fullDetailsResponseResultActivityModalitiesContractFromJson(FullDetailsResponseResultActivityModalitiesContract data, Map<String, dynamic> json) {
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

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesContractToJson(FullDetailsResponseResultActivityModalitiesContract entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['incomingOffice'] = entity.incomingOffice;
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

fullDetailsResponseResultActivityModalitiesAmountsFromFromJson(FullDetailsResponseResultActivityModalitiesAmountsFrom data, Map<String, dynamic> json) {
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

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesAmountsFromToJson(FullDetailsResponseResultActivityModalitiesAmountsFrom entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

fullDetailsResponseResultActivityModalitiesAmountsFromWithMarkupFromJson(FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkup data, Map<String, dynamic> json) {
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
		data.displayRateInfoWithMarkup = new FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesAmountsFromWithMarkupToJson(FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkup entity) {
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

fullDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupFromJson(FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupToJson(FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup entity) {
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

fullDetailsResponseResultActivityModalitiesRateFromJson(FullDetailsResponseResultActivityModalitiesRate data, Map<String, dynamic> json) {
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
		data.rateDetails = new List<FullDetailsResponseResultActivityModalitiesRatesRateDetail>();
		(json['rateDetails'] as List).forEach((v) {
			data.rateDetails.add(new FullDetailsResponseResultActivityModalitiesRatesRateDetail().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRateToJson(FullDetailsResponseResultActivityModalitiesRate entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['rateCode'] = entity.rateCode;
	data['rateClass'] = entity.rateClass;
	data['name'] = entity.name;
	if (entity.rateDetails != null) {
		data['rateDetails'] =  entity.rateDetails.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetail data, Map<String, dynamic> json) {
	if (json['rateKey'] != null) {
		data.rateKey = json['rateKey']?.toString();
	}
	if (json['operationDates'] != null) {
		data.operationDates = new List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate>();
		(json['operationDates'] as List).forEach((v) {
			data.operationDates.add(new FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate().fromJson(v));
		});
	}
	if (json['operationDatesWithMarkup'] != null) {
		data.operationDatesWithMarkup = new List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup>();
		(json['operationDatesWithMarkup'] as List).forEach((v) {
			data.operationDatesWithMarkup.add(new FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup().fromJson(v));
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
		data.minimumDuration = new FullDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDuration().fromJson(json['minimumDuration']);
	}
	if (json['maximumDuration'] != null) {
		data.maximumDuration = new FullDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDuration().fromJson(json['maximumDuration']);
	}
	if (json['totalAmount'] != null) {
		data.totalAmount = new FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmount().fromJson(json['totalAmount']);
	}
	if (json['totalAmountWithMarkup'] != null) {
		data.totalAmountWithMarkup = new FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkup().fromJson(json['totalAmountWithMarkup']);
	}
	if (json['paxAmounts'] != null) {
		data.paxAmounts = new List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount>();
		(json['paxAmounts'] as List).forEach((v) {
			data.paxAmounts.add(new FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount().fromJson(v));
		});
	}
	if (json['paxAmountsWithMarkup'] != null) {
		data.paxAmountsWithMarkup = new List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup>();
		(json['paxAmountsWithMarkup'] as List).forEach((v) {
			data.paxAmountsWithMarkup.add(new FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup().fromJson(v));
		});
	}
	if (json['agencyCommission'] != null) {
		data.agencyCommission = new FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommission().fromJson(json['agencyCommission']);
	}
	if (json['agencyCommissionWithMarkup'] != null) {
		data.agencyCommissionWithMarkup = new FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkup().fromJson(json['agencyCommissionWithMarkup']);
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toInt();
	}
	if (json['tpaName'] != null) {
		data.tpaName = json['tpaName']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new FullDetailsResponseResultActivityModalitiesRatesRateDetailsOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetail entity) {
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

fullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDateFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate data, Map<String, dynamic> json) {
	if (json['from'] != null) {
		data.from = json['from']?.toString();
	}
	if (json['to'] != null) {
		data.to = json['to']?.toString();
	}
	if (json['cancellationPolicies'] != null) {
		data.cancellationPolicies = new List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy>();
		(json['cancellationPolicies'] as List).forEach((v) {
			data.cancellationPolicies.add(new FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDateToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['from'] = entity.from;
	data['to'] = entity.to;
	if (entity.cancellationPolicies != null) {
		data['cancellationPolicies'] =  entity.cancellationPolicies.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicyFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy data, Map<String, dynamic> json) {
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicyToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateFrom'] = entity.dateFrom;
	data['amount'] = entity.amount;
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup data, Map<String, dynamic> json) {
	if (json['from'] != null) {
		data.from = json['from']?.toString();
	}
	if (json['to'] != null) {
		data.to = json['to']?.toString();
	}
	if (json['cancellationPolicies'] != null) {
		data.cancellationPolicies = new List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy>();
		(json['cancellationPolicies'] as List).forEach((v) {
			data.cancellationPolicies.add(new FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['from'] = entity.from;
	data['to'] = entity.to;
	if (entity.cancellationPolicies != null) {
		data['cancellationPolicies'] =  entity.cancellationPolicies.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicyFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy data, Map<String, dynamic> json) {
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicyToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateFrom'] = entity.dateFrom;
	data['amount'] = entity.amount;
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDurationFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDurationToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDurationFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDurationToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmount data, Map<String, dynamic> json) {
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

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkup data, Map<String, dynamic> json) {
	if (json['displayRateInfoWithMarkup'] != null) {
		data.displayRateInfoWithMarkup = new FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.displayRateInfoWithMarkup != null) {
		data['displayRateInfoWithMarkup'] = entity.displayRateInfoWithMarkup.toJson();
	}
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkupFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkupToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkup entity) {
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

fullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount data, Map<String, dynamic> json) {
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

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup data, Map<String, dynamic> json) {
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
		data.displayRateInfoWithMarkup = new FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup entity) {
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

fullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkupFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkupToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkup entity) {
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

fullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommission data, Map<String, dynamic> json) {
	if (json['percentage'] != null) {
		data.percentage = json['percentage']?.toDouble();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['vatPercentage'] != null) {
		data.vatPercentage = json['vatPercentage']?.toDouble();
	}
	if (json['vatAmount'] != null) {
		data.vatAmount = json['vatAmount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommission entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['percentage'] = entity.percentage;
	data['amount'] = entity.amount;
	data['vatPercentage'] = entity.vatPercentage;
	data['vatAmount'] = entity.vatAmount;
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkupFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkup data, Map<String, dynamic> json) {
	if (json['percentage'] != null) {
		data.percentage = json['percentage']?.toDouble();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['vatPercentage'] != null) {
		data.vatPercentage = json['vatPercentage']?.toDouble();
	}
	if (json['vatAmount'] != null) {
		data.vatAmount = json['vatAmount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkupToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['percentage'] = entity.percentage;
	data['amount'] = entity.amount;
	data['vatPercentage'] = entity.vatPercentage;
	data['vatAmount'] = entity.vatAmount;
	return data;
}

fullDetailsResponseResultActivityModalitiesRatesRateDetailsOptionFromJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityModalitiesRatesRateDetailsOptionToJson(FullDetailsResponseResultActivityModalitiesRatesRateDetailsOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}

fullDetailsResponseResultActivityAmountsFromFromJson(FullDetailsResponseResultActivityAmountsFrom data, Map<String, dynamic> json) {
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

Map<String, dynamic> fullDetailsResponseResultActivityAmountsFromToJson(FullDetailsResponseResultActivityAmountsFrom entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

fullDetailsResponseResultActivityAmountsFromWithMarkupFromJson(FullDetailsResponseResultActivityAmountsFromWithMarkup data, Map<String, dynamic> json) {
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
		data.displayRateInfoWithMarkup = new FullDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityAmountsFromWithMarkupToJson(FullDetailsResponseResultActivityAmountsFromWithMarkup entity) {
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

fullDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkupFromJson(FullDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> fullDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkupToJson(FullDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkup entity) {
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

fullDetailsResponseResultActivityContentFromJson(FullDetailsResponseResultActivityContent data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['detailedInfo'] != null) {
		data.detailedInfo = new List<dynamic>();
		data.detailedInfo.addAll(json['detailedInfo']);
	}
	if (json['featureGroups'] != null) {
		data.featureGroups = new List<FullDetailsResponseResultActivityContentFeatureGroup>();
		(json['featureGroups'] as List).forEach((v) {
			data.featureGroups.add(new FullDetailsResponseResultActivityContentFeatureGroup().fromJson(v));
		});
	}
	if (json['guidingOptions'] != null) {
		data.guidingOptions = new FullDetailsResponseResultActivityContentGuidingOptions().fromJson(json['guidingOptions']);
	}
	if (json['location'] != null) {
		data.location = new FullDetailsResponseResultActivityContentLocation().fromJson(json['location']);
	}
	if (json['media'] != null) {
		data.media = new FullDetailsResponseResultActivityContentMedia().fromJson(json['media']);
	}
	if (json['redeemInfo'] != null) {
		data.redeemInfo = new FullDetailsResponseResultActivityContentRedeemInfo().fromJson(json['redeemInfo']);
	}
	if (json['routes'] != null) {
		data.routes = new List<FullDetailsResponseResultActivityContentRoute>();
		(json['routes'] as List).forEach((v) {
			data.routes.add(new FullDetailsResponseResultActivityContentRoute().fromJson(v));
		});
	}
	if (json['scheduling'] != null) {
		data.scheduling = new FullDetailsResponseResultActivityContentScheduling().fromJson(json['scheduling']);
	}
	if (json['segmentationGroups'] != null) {
		data.segmentationGroups = new List<FullDetailsResponseResultActivityContentSegmantationGroups>();
		(json['segmentationGroups'] as List).forEach((v) {
			data.segmentationGroups.add(new FullDetailsResponseResultActivityContentSegmantationGroups().fromJson(v));
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
		data.countries = new List<FullDetailsResponseResultActivityContentCountry>();
		(json['countries'] as List).forEach((v) {
			data.countries.add(new FullDetailsResponseResultActivityContentCountry().fromJson(v));
		});
	}
	if (json['highligths'] != null) {
		data.highligths = json['highligths']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentToJson(FullDetailsResponseResultActivityContent entity) {
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

fullDetailsResponseResultActivityContentFeatureGroupFromJson(FullDetailsResponseResultActivityContentFeatureGroup data, Map<String, dynamic> json) {
	if (json['groupCode'] != null) {
		data.groupCode = json['groupCode']?.toString();
	}
	if (json['included'] != null) {
		data.included = new List<FullDetailsResponseResultActivityContentFeatureGroupsIncluded>();
		(json['included'] as List).forEach((v) {
			data.included.add(new FullDetailsResponseResultActivityContentFeatureGroupsIncluded().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentFeatureGroupToJson(FullDetailsResponseResultActivityContentFeatureGroup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['groupCode'] = entity.groupCode;
	if (entity.included != null) {
		data['included'] =  entity.included.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityContentFeatureGroupsIncludedFromJson(FullDetailsResponseResultActivityContentFeatureGroupsIncluded data, Map<String, dynamic> json) {
	if (json['featureType'] != null) {
		data.featureType = json['featureType']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentFeatureGroupsIncludedToJson(FullDetailsResponseResultActivityContentFeatureGroupsIncluded entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['featureType'] = entity.featureType;
	data['description'] = entity.description;
	return data;
}

fullDetailsResponseResultActivityContentGuidingOptionsFromJson(FullDetailsResponseResultActivityContentGuidingOptions data, Map<String, dynamic> json) {
	if (json['guideType'] != null) {
		data.guideType = json['guideType']?.toString();
	}
	if (json['included'] != null) {
		data.included = json['included']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentGuidingOptionsToJson(FullDetailsResponseResultActivityContentGuidingOptions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['guideType'] = entity.guideType;
	data['included'] = entity.included;
	return data;
}

fullDetailsResponseResultActivityContentLocationFromJson(FullDetailsResponseResultActivityContentLocation data, Map<String, dynamic> json) {
	if (json['endPoints'] != null) {
		data.endPoints = new List<FullDetailsResponseResultActivityContentLocationEndPoint>();
		(json['endPoints'] as List).forEach((v) {
			data.endPoints.add(new FullDetailsResponseResultActivityContentLocationEndPoint().fromJson(v));
		});
	}
	if (json['startingPoints'] != null) {
		data.startingPoints = new List<FullDetailsResponseResultActivityContentLocationStartingPoint>();
		(json['startingPoints'] as List).forEach((v) {
			data.startingPoints.add(new FullDetailsResponseResultActivityContentLocationStartingPoint().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentLocationToJson(FullDetailsResponseResultActivityContentLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.endPoints != null) {
		data['endPoints'] =  entity.endPoints.map((v) => v.toJson()).toList();
	}
	if (entity.startingPoints != null) {
		data['startingPoints'] =  entity.startingPoints.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityContentLocationEndPointFromJson(FullDetailsResponseResultActivityContentLocationEndPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentLocationEndPointToJson(FullDetailsResponseResultActivityContentLocationEndPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['description'] = entity.description;
	return data;
}

fullDetailsResponseResultActivityContentLocationStartingPointFromJson(FullDetailsResponseResultActivityContentLocationStartingPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['meetingPoint'] != null) {
		data.meetingPoint = new FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPoint().fromJson(json['meetingPoint']);
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentLocationStartingPointToJson(FullDetailsResponseResultActivityContentLocationStartingPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.meetingPoint != null) {
		data['meetingPoint'] = entity.meetingPoint.toJson();
	}
	return data;
}

fullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointFromJson(FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['geolocation'] != null) {
		data.geolocation = json['geolocation'];
	}
	if (json['address'] != null) {
		data.address = json['address'];
	}
	if (json['country'] != null) {
		data.country = new FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountry().fromJson(json['country']);
	}
	if (json['zip'] != null) {
		data.zip = json['zip'];
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointToJson(FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['geolocation'] = entity.geolocation;
	data['address'] = entity.address;
	if (entity.country != null) {
		data['country'] = entity.country.toJson();
	}
	data['zip'] = entity.zip;
	data['description'] = entity.description;
	return data;
}

fullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryFromJson(FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryToJson(FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestinationFromJson(FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestinationToJson(FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

fullDetailsResponseResultActivityContentMediaFromJson(FullDetailsResponseResultActivityContentMedia data, Map<String, dynamic> json) {
	if (json['images'] != null) {
		data.images = new List<FullDetailsResponseResultActivityContentMediaImage>();
		(json['images'] as List).forEach((v) {
			data.images.add(new FullDetailsResponseResultActivityContentMediaImage().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentMediaToJson(FullDetailsResponseResultActivityContentMedia entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.images != null) {
		data['images'] =  entity.images.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityContentMediaImageFromJson(FullDetailsResponseResultActivityContentMediaImage data, Map<String, dynamic> json) {
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
		data.urls = new List<FullDetailsResponseResultActivityContentMediaImagesUrl>();
		(json['urls'] as List).forEach((v) {
			data.urls.add(new FullDetailsResponseResultActivityContentMediaImagesUrl().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentMediaImageToJson(FullDetailsResponseResultActivityContentMediaImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['visualizationOrder'] = entity.visualizationOrder;
	data['mimeType'] = entity.mimeType;
	data['language'] = entity.language;
	if (entity.urls != null) {
		data['urls'] =  entity.urls.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityContentMediaImagesUrlFromJson(FullDetailsResponseResultActivityContentMediaImagesUrl data, Map<String, dynamic> json) {
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

Map<String, dynamic> fullDetailsResponseResultActivityContentMediaImagesUrlToJson(FullDetailsResponseResultActivityContentMediaImagesUrl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dpi'] = entity.dpi;
	data['height'] = entity.height;
	data['width'] = entity.width;
	data['resource'] = entity.resource;
	data['sizeType'] = entity.sizeType;
	return data;
}

fullDetailsResponseResultActivityContentRedeemInfoFromJson(FullDetailsResponseResultActivityContentRedeemInfo data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['directEntrance'] != null) {
		data.directEntrance = json['directEntrance']?.toString();
	}
	if (json['comments'] != null) {
		data.comments = new List<FullDetailsResponseResultActivityContentRedeemInfoCommants>();
		(json['comments'] as List).forEach((v) {
			data.comments.add(new FullDetailsResponseResultActivityContentRedeemInfoCommants().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentRedeemInfoToJson(FullDetailsResponseResultActivityContentRedeemInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['directEntrance'] = entity.directEntrance;
	if (entity.comments != null) {
		data['comments'] =  entity.comments.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityContentRedeemInfoCommantsFromJson(FullDetailsResponseResultActivityContentRedeemInfoCommants data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'];
	}
	if (json['text'] != null) {
		data.text = json['text'];
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentRedeemInfoCommantsToJson(FullDetailsResponseResultActivityContentRedeemInfoCommants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['text'] = entity.text;
	return data;
}

fullDetailsResponseResultActivityContentRouteFromJson(FullDetailsResponseResultActivityContentRoute data, Map<String, dynamic> json) {
	if (json['duration'] != null) {
		data.duration = new FullDetailsResponseResultActivityContentRoutesDuration().fromJson(json['duration']);
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
		data.points = new List<FullDetailsResponseResultActivityContentRoutesPoint>();
		(json['points'] as List).forEach((v) {
			data.points.add(new FullDetailsResponseResultActivityContentRoutesPoint().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentRouteToJson(FullDetailsResponseResultActivityContentRoute entity) {
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

fullDetailsResponseResultActivityContentRoutesDurationFromJson(FullDetailsResponseResultActivityContentRoutesDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentRoutesDurationToJson(FullDetailsResponseResultActivityContentRoutesDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

fullDetailsResponseResultActivityContentRoutesPointFromJson(FullDetailsResponseResultActivityContentRoutesPoint data, Map<String, dynamic> json) {
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
		data.pointOfInterest = new FullDetailsResponseResultActivityContentRoutesPointsPointOfInterest().fromJson(json['pointOfInterest']);
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentRoutesPointToJson(FullDetailsResponseResultActivityContentRoutesPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['order'] = entity.order;
	data['stop'] = entity.stop;
	if (entity.pointOfInterest != null) {
		data['pointOfInterest'] = entity.pointOfInterest.toJson();
	}
	return data;
}

fullDetailsResponseResultActivityContentRoutesPointsPointOfInterestFromJson(FullDetailsResponseResultActivityContentRoutesPointsPointOfInterest data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['geolocation'] != null) {
		data.geolocation = new FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocation().fromJson(json['geolocation']);
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['country'] != null) {
		data.country = new FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountry().fromJson(json['country']);
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

Map<String, dynamic> fullDetailsResponseResultActivityContentRoutesPointsPointOfInterestToJson(FullDetailsResponseResultActivityContentRoutesPointsPointOfInterest entity) {
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

fullDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocationFromJson(FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocation data, Map<String, dynamic> json) {
	if (json['latitude'] != null) {
		data.latitude = json['latitude']?.toDouble();
	}
	if (json['longitude'] != null) {
		data.longitude = json['longitude']?.toDouble();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocationToJson(FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	return data;
}

fullDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountryFromJson(FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountryToJson(FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	return data;
}

fullDetailsResponseResultActivityContentSchedulingFromJson(FullDetailsResponseResultActivityContentScheduling data, Map<String, dynamic> json) {
	if (json['duration'] != null) {
		data.duration = new FullDetailsResponseResultActivityContentSchedulingDuration().fromJson(json['duration']);
	}
	if (json['opened'] != null) {
		data.opened = new List<FullDetailsResponseResultActivityContentSchedulingOpened>();
		(json['opened'] as List).forEach((v) {
			data.opened.add(new FullDetailsResponseResultActivityContentSchedulingOpened().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentSchedulingToJson(FullDetailsResponseResultActivityContentScheduling entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.duration != null) {
		data['duration'] = entity.duration.toJson();
	}
	if (entity.opened != null) {
		data['opened'] =  entity.opened.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityContentSchedulingDurationFromJson(FullDetailsResponseResultActivityContentSchedulingDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentSchedulingDurationToJson(FullDetailsResponseResultActivityContentSchedulingDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

fullDetailsResponseResultActivityContentSchedulingOpenedFromJson(FullDetailsResponseResultActivityContentSchedulingOpened data, Map<String, dynamic> json) {
	if (json['from'] != null) {
		data.from = json['from'];
	}
	if (json['to'] != null) {
		data.to = json['to'];
	}
	if (json['openingTime'] != null) {
		data.openingTime = json['openingTime']?.toString();
	}
	if (json['closeTime'] != null) {
		data.closeTime = json['closeTime']?.toString();
	}
	if (json['weekDays'] != null) {
		data.weekDays = new List<dynamic>();
		data.weekDays.addAll(json['weekDays']);
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentSchedulingOpenedToJson(FullDetailsResponseResultActivityContentSchedulingOpened entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['from'] = entity.from;
	data['to'] = entity.to;
	data['openingTime'] = entity.openingTime;
	data['closeTime'] = entity.closeTime;
	if (entity.weekDays != null) {
		data['weekDays'] =  [];
	}
	return data;
}

fullDetailsResponseResultActivityContentSegmantationGroupsFromJson(FullDetailsResponseResultActivityContentSegmantationGroups data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['segments'] != null) {
		data.segments = new List<FullDetailsResponseResultActivityContentSegmantationGroupsSegmants>();
		(json['segments'] as List).forEach((v) {
			data.segments.add(new FullDetailsResponseResultActivityContentSegmantationGroupsSegmants().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentSegmantationGroupsToJson(FullDetailsResponseResultActivityContentSegmantationGroups entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.segments != null) {
		data['segments'] =  entity.segments.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityContentSegmantationGroupsSegmantsFromJson(FullDetailsResponseResultActivityContentSegmantationGroupsSegmants data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentSegmantationGroupsSegmantsToJson(FullDetailsResponseResultActivityContentSegmantationGroupsSegmants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

fullDetailsResponseResultActivityContentCountryFromJson(FullDetailsResponseResultActivityContentCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<FullDetailsResponseResultActivityContentCountriesDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new FullDetailsResponseResultActivityContentCountriesDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentCountryToJson(FullDetailsResponseResultActivityContentCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

fullDetailsResponseResultActivityContentCountriesDestinationFromJson(FullDetailsResponseResultActivityContentCountriesDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityContentCountriesDestinationToJson(FullDetailsResponseResultActivityContentCountriesDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

fullDetailsResponseResultActivityOptionFromJson(FullDetailsResponseResultActivityOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> fullDetailsResponseResultActivityOptionToJson(FullDetailsResponseResultActivityOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}