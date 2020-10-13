import 'package:ota/models/activity/activity_search_response1_entity.dart';

activitySearchResponse1EntityFromJson(ActivitySearchResponse1Entity data, Map<String, dynamic> json) {
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
		data.result = new ActivitySearchResponse1Result().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1EntityToJson(ActivitySearchResponse1Entity entity) {
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

activitySearchResponse1ResultFromJson(ActivitySearchResponse1Result data, Map<String, dynamic> json) {
	if (json['operationId'] != null) {
		data.operationId = json['operationId']?.toString();
	}
	if (json['pagination'] != null) {
		data.pagination = new ActivitySearchResponse1ResultPagination().fromJson(json['pagination']);
	}
	if (json['auditData'] != null) {
		data.auditData = new ActivitySearchResponse1ResultAuditData().fromJson(json['auditData']);
	}
	if (json['activities'] != null) {
		data.activities = new List<ActivitySearchResponse1ResultActivity>();
		(json['activities'] as List).forEach((v) {
			data.activities.add(new ActivitySearchResponse1ResultActivity().fromJson(v));
		});
	}
	if (json['summaryLog'] != null) {
		data.summaryLog = json['summaryLog']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultToJson(ActivitySearchResponse1Result entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['operationId'] = entity.operationId;
	if (entity.pagination != null) {
		data['pagination'] = entity.pagination.toJson();
	}
	if (entity.auditData != null) {
		data['auditData'] = entity.auditData.toJson();
	}
	if (entity.activities != null) {
		data['activities'] =  entity.activities.map((v) => v.toJson()).toList();
	}
	data['summaryLog'] = entity.summaryLog;
	return data;
}

activitySearchResponse1ResultPaginationFromJson(ActivitySearchResponse1ResultPagination data, Map<String, dynamic> json) {
	if (json['itemsPerPage'] != null) {
		data.itemsPerPage = json['itemsPerPage']?.toInt();
	}
	if (json['page'] != null) {
		data.page = json['page']?.toInt();
	}
	if (json['totalItems'] != null) {
		data.totalItems = json['totalItems']?.toInt();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultPaginationToJson(ActivitySearchResponse1ResultPagination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['itemsPerPage'] = entity.itemsPerPage;
	data['page'] = entity.page;
	data['totalItems'] = entity.totalItems;
	return data;
}

activitySearchResponse1ResultAuditDataFromJson(ActivitySearchResponse1ResultAuditData data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponse1ResultAuditDataToJson(ActivitySearchResponse1ResultAuditData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['processTime'] = entity.processTime;
	data['time'] = entity.time;
	data['serverId'] = entity.serverId;
	data['environment'] = entity.environment;
	return data;
}

activitySearchResponse1ResultActivityFromJson(ActivitySearchResponse1ResultActivity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['countryCode'] != null) {
		data.countryCode = json['countryCode']?.toString();
	}
	if (json['source'] != null) {
		data.source = json['source']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['modalities'] != null) {
		data.modalities = new List<ActivitySearchResponse1ResultActivitiesModality>();
		(json['modalities'] as List).forEach((v) {
			data.modalities.add(new ActivitySearchResponse1ResultActivitiesModality().fromJson(v));
		});
	}
	if (json['content'] != null) {
		data.content = new ActivitySearchResponse1ResultActivitiesContent().fromJson(json['content']);
	}
	if (json['order'] != null) {
		data.order = json['order']?.toInt();
	}
	if (json['amountsFrom'] != null) {
		data.amountsFrom = new List<ActivitySearchResponse1ResultActivitiesAmountsFrom>();
		(json['amountsFrom'] as List).forEach((v) {
			data.amountsFrom.add(new ActivitySearchResponse1ResultActivitiesAmountsFrom().fromJson(v));
		});
	}
	if (json['amountsFromWithMarkup'] != null) {
		data.amountsFromWithMarkup = new List<ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkup>();
		(json['amountsFromWithMarkup'] as List).forEach((v) {
			data.amountsFromWithMarkup.add(new ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkup().fromJson(v));
		});
	}
	if (json['currencyName'] != null) {
		data.currencyName = json['currencyName']?.toString();
	}
	if (json['country'] != null) {
		data.country = new ActivitySearchResponse1ResultActivitiesCountry().fromJson(json['country']);
	}
	if (json['status'] != null) {
		data.status = json['status'];
	}
	if (json['supplier'] != null) {
		data.supplier = json['supplier'];
	}
	if (json['comments'] != null) {
		data.comments = json['comments'];
	}
	if (json['vouchers'] != null) {
		data.vouchers = json['vouchers'];
	}
	if (json['activityReference'] != null) {
		data.activityReference = json['activityReference'];
	}
	if (json['modality'] != null) {
		data.modality = json['modality'];
	}
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom'];
	}
	if (json['dateTo'] != null) {
		data.dateTo = json['dateTo'];
	}
	if (json['rateBreakdown'] != null) {
		data.rateBreakdown = json['rateBreakdown'];
	}
	if (json['rateBreakdownWithMarkup'] != null) {
		data.rateBreakdownWithMarkup = json['rateBreakdownWithMarkup'];
	}
	if (json['cancellationPolicies'] != null) {
		data.cancellationPolicies = json['cancellationPolicies'];
	}
	if (json['cancellationPoliciesWithMarkup'] != null) {
		data.cancellationPoliciesWithMarkup = json['cancellationPoliciesWithMarkup'];
	}
	if (json['paxes'] != null) {
		data.paxes = json['paxes'];
	}
	if (json['questions'] != null) {
		data.questions = json['questions'];
	}
	if (json['id'] != null) {
		data.id = json['id'];
	}
	if (json['agencyCommission'] != null) {
		data.agencyCommission = json['agencyCommission'];
	}
	if (json['agencyCommissionWithMarkup'] != null) {
		data.agencyCommissionWithMarkup = json['agencyCommissionWithMarkup'];
	}
	if (json['contactInfo'] != null) {
		data.contactInfo = json['contactInfo'];
	}
	if (json['amountDetail'] != null) {
		data.amountDetail = json['amountDetail'];
	}
	if (json['amountDetailWithMarkup'] != null) {
		data.amountDetailWithMarkup = json['amountDetailWithMarkup'];
	}
	if (json['extraData'] != null) {
		data.extraData = json['extraData'];
	}
	if (json['providerInformation'] != null) {
		data.providerInformation = json['providerInformation'];
	}
	if (json['totalAmountFromSearchCalculated'] != null) {
		data.totalAmountFromSearchCalculated = json['totalAmountFromSearchCalculated']?.toDouble();
	}
	if (json['totalAmountFromSearchCalculatedWithMarkup'] != null) {
		data.totalAmountFromSearchCalculatedWithMarkup = json['totalAmountFromSearchCalculatedWithMarkup']?.toDouble();
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toInt();
	}
	if (json['tpaName'] != null) {
		data.tpaName = json['tpaName']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<ActivitySearchResponse1ResultActivitiesOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new ActivitySearchResponse1ResultActivitiesOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivityToJson(ActivitySearchResponse1ResultActivity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['type'] = entity.type;
	data['countryCode'] = entity.countryCode;
	data['source'] = entity.source;
	data['name'] = entity.name;
	data['currency'] = entity.currency;
	if (entity.modalities != null) {
		data['modalities'] =  entity.modalities.map((v) => v.toJson()).toList();
	}
	if (entity.content != null) {
		data['content'] = entity.content.toJson();
	}
	data['order'] = entity.order;
	if (entity.amountsFrom != null) {
		data['amountsFrom'] =  entity.amountsFrom.map((v) => v.toJson()).toList();
	}
	if (entity.amountsFromWithMarkup != null) {
		data['amountsFromWithMarkup'] =  entity.amountsFromWithMarkup.map((v) => v.toJson()).toList();
	}
	data['currencyName'] = entity.currencyName;
	if (entity.country != null) {
		data['country'] = entity.country.toJson();
	}
	data['status'] = entity.status;
	data['supplier'] = entity.supplier;
	data['comments'] = entity.comments;
	data['vouchers'] = entity.vouchers;
	data['activityReference'] = entity.activityReference;
	data['modality'] = entity.modality;
	data['dateFrom'] = entity.dateFrom;
	data['dateTo'] = entity.dateTo;
	data['rateBreakdown'] = entity.rateBreakdown;
	data['rateBreakdownWithMarkup'] = entity.rateBreakdownWithMarkup;
	data['cancellationPolicies'] = entity.cancellationPolicies;
	data['cancellationPoliciesWithMarkup'] = entity.cancellationPoliciesWithMarkup;
	data['paxes'] = entity.paxes;
	data['questions'] = entity.questions;
	data['id'] = entity.id;
	data['agencyCommission'] = entity.agencyCommission;
	data['agencyCommissionWithMarkup'] = entity.agencyCommissionWithMarkup;
	data['contactInfo'] = entity.contactInfo;
	data['amountDetail'] = entity.amountDetail;
	data['amountDetailWithMarkup'] = entity.amountDetailWithMarkup;
	data['extraData'] = entity.extraData;
	data['providerInformation'] = entity.providerInformation;
	data['totalAmountFromSearchCalculated'] = entity.totalAmountFromSearchCalculated;
	data['totalAmountFromSearchCalculatedWithMarkup'] = entity.totalAmountFromSearchCalculatedWithMarkup;
	data['tpa'] = entity.tpa;
	data['tpaName'] = entity.tpaName;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponse1ResultActivitiesModalityFromJson(ActivitySearchResponse1ResultActivitiesModality data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['rateCode'] != null) {
		data.rateCode = json['rateCode']?.toString();
	}
	if (json['duration'] != null) {
		data.duration = new ActivitySearchResponse1ResultActivitiesModalitiesDuration().fromJson(json['duration']);
	}
	if (json['amountsFrom'] != null) {
		data.amountsFrom = new List<ActivitySearchResponse1ResultActivitiesModalitiesAmountsFrom>();
		(json['amountsFrom'] as List).forEach((v) {
			data.amountsFrom.add(new ActivitySearchResponse1ResultActivitiesModalitiesAmountsFrom().fromJson(v));
		});
	}
	if (json['amountsFromWithMarkup'] != null) {
		data.amountsFromWithMarkup = new List<ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkup>();
		(json['amountsFromWithMarkup'] as List).forEach((v) {
			data.amountsFromWithMarkup.add(new ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkup().fromJson(v));
		});
	}
	if (json['cancellationPolicies'] != null) {
		data.cancellationPolicies = new List<ActivitySearchResponse1ResultActivitiesModalitiesCancellationPolicy>();
		(json['cancellationPolicies'] as List).forEach((v) {
			data.cancellationPolicies.add(new ActivitySearchResponse1ResultActivitiesModalitiesCancellationPolicy().fromJson(v));
		});
	}
	if (json['cancellationPoliciesWithMarkup'] != null) {
		data.cancellationPoliciesWithMarkup = new List<ActivitySearchResponse1ResultActivitiesModalitiesCancellationPoliciesWithMarkup>();
		(json['cancellationPoliciesWithMarkup'] as List).forEach((v) {
			data.cancellationPoliciesWithMarkup.add(new ActivitySearchResponse1ResultActivitiesModalitiesCancellationPoliciesWithMarkup().fromJson(v));
		});
	}
	if (json['uniqueIdentifier'] != null) {
		data.uniqueIdentifier = json['uniqueIdentifier']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesModalityToJson(ActivitySearchResponse1ResultActivitiesModality entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	data['rateCode'] = entity.rateCode;
	if (entity.duration != null) {
		data['duration'] = entity.duration.toJson();
	}
	if (entity.amountsFrom != null) {
		data['amountsFrom'] =  entity.amountsFrom.map((v) => v.toJson()).toList();
	}
	if (entity.amountsFromWithMarkup != null) {
		data['amountsFromWithMarkup'] =  entity.amountsFromWithMarkup.map((v) => v.toJson()).toList();
	}
	if (entity.cancellationPolicies != null) {
		data['cancellationPolicies'] =  entity.cancellationPolicies.map((v) => v.toJson()).toList();
	}
	if (entity.cancellationPoliciesWithMarkup != null) {
		data['cancellationPoliciesWithMarkup'] =  entity.cancellationPoliciesWithMarkup.map((v) => v.toJson()).toList();
	}
	data['uniqueIdentifier'] = entity.uniqueIdentifier;
	return data;
}

activitySearchResponse1ResultActivitiesModalitiesDurationFromJson(ActivitySearchResponse1ResultActivitiesModalitiesDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesModalitiesDurationToJson(ActivitySearchResponse1ResultActivitiesModalitiesDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

activitySearchResponse1ResultActivitiesModalitiesAmountsFromFromJson(ActivitySearchResponse1ResultActivitiesModalitiesAmountsFrom data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponse1ResultActivitiesModalitiesAmountsFromToJson(ActivitySearchResponse1ResultActivitiesModalitiesAmountsFrom entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

activitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkupFromJson(ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkup data, Map<String, dynamic> json) {
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
		data.displayRateInfoWithMarkup = new ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkupToJson(ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkup entity) {
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

activitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupFromJson(ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupToJson(ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup entity) {
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

activitySearchResponse1ResultActivitiesModalitiesCancellationPolicyFromJson(ActivitySearchResponse1ResultActivitiesModalitiesCancellationPolicy data, Map<String, dynamic> json) {
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesModalitiesCancellationPolicyToJson(ActivitySearchResponse1ResultActivitiesModalitiesCancellationPolicy entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateFrom'] = entity.dateFrom;
	data['amount'] = entity.amount;
	return data;
}

activitySearchResponse1ResultActivitiesModalitiesCancellationPoliciesWithMarkupFromJson(ActivitySearchResponse1ResultActivitiesModalitiesCancellationPoliciesWithMarkup data, Map<String, dynamic> json) {
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesModalitiesCancellationPoliciesWithMarkupToJson(ActivitySearchResponse1ResultActivitiesModalitiesCancellationPoliciesWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateFrom'] = entity.dateFrom;
	data['amount'] = entity.amount;
	return data;
}

activitySearchResponse1ResultActivitiesContentFromJson(ActivitySearchResponse1ResultActivitiesContent data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['detailedInfo'] != null) {
		data.detailedInfo = new List<dynamic>();
		data.detailedInfo.addAll(json['detailedInfo']);
	}
	if (json['featureGroups'] != null) {
		data.featureGroups = new List<ActivitySearchResponse1ResultActivitiesContentFeatureGroup>();
		(json['featureGroups'] as List).forEach((v) {
			data.featureGroups.add(new ActivitySearchResponse1ResultActivitiesContentFeatureGroup().fromJson(v));
		});
	}
	if (json['guidingOptions'] != null) {
		data.guidingOptions = new ActivitySearchResponse1ResultActivitiesContentGuidingOptions().fromJson(json['guidingOptions']);
	}
	if (json['importantInfo'] != null) {
		data.importantInfo = json['importantInfo'];
	}
	if (json['location'] != null) {
		data.location = new ActivitySearchResponse1ResultActivitiesContentLocation().fromJson(json['location']);
	}
	if (json['media'] != null) {
		data.media = new ActivitySearchResponse1ResultActivitiesContentMedia().fromJson(json['media']);
	}
	if (json['redeemInfo'] != null) {
		data.redeemInfo = new ActivitySearchResponse1ResultActivitiesContentRedeemInfo().fromJson(json['redeemInfo']);
	}
	if (json['routes'] != null) {
		data.routes = new List<ActivitySearchResponse1ResultActivitiesContentRoute>();
		(json['routes'] as List).forEach((v) {
			data.routes.add(new ActivitySearchResponse1ResultActivitiesContentRoute().fromJson(v));
		});
	}
	if (json['scheduling'] != null) {
		data.scheduling = new ActivitySearchResponse1ResultActivitiesContentScheduling().fromJson(json['scheduling']);
	}
	if (json['segmentationGroups'] != null) {
		data.segmentationGroups = new List<ActivitySearchResponse1ResultActivitiesContentSegmantationGroups>();
		(json['segmentationGroups'] as List).forEach((v) {
			data.segmentationGroups.add(new ActivitySearchResponse1ResultActivitiesContentSegmantationGroups().fromJson(v));
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
		data.countries = new List<ActivitySearchResponse1ResultActivitiesContentCountry>();
		(json['countries'] as List).forEach((v) {
			data.countries.add(new ActivitySearchResponse1ResultActivitiesContentCountry().fromJson(v));
		});
	}
	if (json['highligths'] != null) {
		data.highligths = json['highligths']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentToJson(ActivitySearchResponse1ResultActivitiesContent entity) {
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
	data['importantInfo'] = entity.importantInfo;
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

activitySearchResponse1ResultActivitiesContentFeatureGroupFromJson(ActivitySearchResponse1ResultActivitiesContentFeatureGroup data, Map<String, dynamic> json) {
	if (json['groupCode'] != null) {
		data.groupCode = json['groupCode']?.toString();
	}
	if (json['excluded'] != null) {
		data.excluded = json['excluded'];
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentFeatureGroupToJson(ActivitySearchResponse1ResultActivitiesContentFeatureGroup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['groupCode'] = entity.groupCode;
	data['excluded'] = entity.excluded;
	return data;
}

activitySearchResponse1ResultActivitiesContentGuidingOptionsFromJson(ActivitySearchResponse1ResultActivitiesContentGuidingOptions data, Map<String, dynamic> json) {
	if (json['guideType'] != null) {
		data.guideType = json['guideType']?.toString();
	}
	if (json['included'] != null) {
		data.included = json['included']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentGuidingOptionsToJson(ActivitySearchResponse1ResultActivitiesContentGuidingOptions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['guideType'] = entity.guideType;
	data['included'] = entity.included;
	return data;
}

activitySearchResponse1ResultActivitiesContentLocationFromJson(ActivitySearchResponse1ResultActivitiesContentLocation data, Map<String, dynamic> json) {
	if (json['endPoints'] != null) {
		data.endPoints = new List<ActivitySearchResponse1ResultActivitiesContentLocationEndPoint>();
		(json['endPoints'] as List).forEach((v) {
			data.endPoints.add(new ActivitySearchResponse1ResultActivitiesContentLocationEndPoint().fromJson(v));
		});
	}
	if (json['startingPoints'] != null) {
		data.startingPoints = new List<ActivitySearchResponse1ResultActivitiesContentLocationStartingPoint>();
		(json['startingPoints'] as List).forEach((v) {
			data.startingPoints.add(new ActivitySearchResponse1ResultActivitiesContentLocationStartingPoint().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentLocationToJson(ActivitySearchResponse1ResultActivitiesContentLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.endPoints != null) {
		data['endPoints'] =  entity.endPoints.map((v) => v.toJson()).toList();
	}
	if (entity.startingPoints != null) {
		data['startingPoints'] =  entity.startingPoints.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponse1ResultActivitiesContentLocationEndPointFromJson(ActivitySearchResponse1ResultActivitiesContentLocationEndPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentLocationEndPointToJson(ActivitySearchResponse1ResultActivitiesContentLocationEndPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['description'] = entity.description;
	return data;
}

activitySearchResponse1ResultActivitiesContentLocationStartingPointFromJson(ActivitySearchResponse1ResultActivitiesContentLocationStartingPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['meetingPoint'] != null) {
		data.meetingPoint = new ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPoint().fromJson(json['meetingPoint']);
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentLocationStartingPointToJson(ActivitySearchResponse1ResultActivitiesContentLocationStartingPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.meetingPoint != null) {
		data['meetingPoint'] = entity.meetingPoint.toJson();
	}
	return data;
}

activitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointFromJson(ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPoint data, Map<String, dynamic> json) {
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
		data.country = new ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountry().fromJson(json['country']);
	}
	if (json['zip'] != null) {
		data.zip = json['zip'];
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointToJson(ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPoint entity) {
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

activitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryFromJson(ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryToJson(ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryDestinationFromJson(ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryDestinationToJson(ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

activitySearchResponse1ResultActivitiesContentMediaFromJson(ActivitySearchResponse1ResultActivitiesContentMedia data, Map<String, dynamic> json) {
	if (json['images'] != null) {
		data.images = new List<ActivitySearchResponse1ResultActivitiesContentMediaImage>();
		(json['images'] as List).forEach((v) {
			data.images.add(new ActivitySearchResponse1ResultActivitiesContentMediaImage().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentMediaToJson(ActivitySearchResponse1ResultActivitiesContentMedia entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.images != null) {
		data['images'] =  entity.images.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponse1ResultActivitiesContentMediaImageFromJson(ActivitySearchResponse1ResultActivitiesContentMediaImage data, Map<String, dynamic> json) {
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
		data.urls = new List<ActivitySearchResponse1ResultActivitiesContentMediaImagesUrl>();
		(json['urls'] as List).forEach((v) {
			data.urls.add(new ActivitySearchResponse1ResultActivitiesContentMediaImagesUrl().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentMediaImageToJson(ActivitySearchResponse1ResultActivitiesContentMediaImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['visualizationOrder'] = entity.visualizationOrder;
	data['mimeType'] = entity.mimeType;
	data['language'] = entity.language;
	if (entity.urls != null) {
		data['urls'] =  entity.urls.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponse1ResultActivitiesContentMediaImagesUrlFromJson(ActivitySearchResponse1ResultActivitiesContentMediaImagesUrl data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentMediaImagesUrlToJson(ActivitySearchResponse1ResultActivitiesContentMediaImagesUrl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dpi'] = entity.dpi;
	data['height'] = entity.height;
	data['width'] = entity.width;
	data['resource'] = entity.resource;
	data['sizeType'] = entity.sizeType;
	return data;
}

activitySearchResponse1ResultActivitiesContentRedeemInfoFromJson(ActivitySearchResponse1ResultActivitiesContentRedeemInfo data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['directEntrance'] != null) {
		data.directEntrance = json['directEntrance']?.toString();
	}
	if (json['comments'] != null) {
		data.comments = new List<ActivitySearchResponse1ResultActivitiesContentRedeemInfoCommants>();
		(json['comments'] as List).forEach((v) {
			data.comments.add(new ActivitySearchResponse1ResultActivitiesContentRedeemInfoCommants().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentRedeemInfoToJson(ActivitySearchResponse1ResultActivitiesContentRedeemInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['directEntrance'] = entity.directEntrance;
	if (entity.comments != null) {
		data['comments'] =  entity.comments.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponse1ResultActivitiesContentRedeemInfoCommantsFromJson(ActivitySearchResponse1ResultActivitiesContentRedeemInfoCommants data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'];
	}
	if (json['text'] != null) {
		data.text = json['text'];
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentRedeemInfoCommantsToJson(ActivitySearchResponse1ResultActivitiesContentRedeemInfoCommants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['text'] = entity.text;
	return data;
}

activitySearchResponse1ResultActivitiesContentRouteFromJson(ActivitySearchResponse1ResultActivitiesContentRoute data, Map<String, dynamic> json) {
	if (json['duration'] != null) {
		data.duration = new ActivitySearchResponse1ResultActivitiesContentRoutesDuration().fromJson(json['duration']);
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
		data.points = new List<ActivitySearchResponse1ResultActivitiesContentRoutesPoint>();
		(json['points'] as List).forEach((v) {
			data.points.add(new ActivitySearchResponse1ResultActivitiesContentRoutesPoint().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentRouteToJson(ActivitySearchResponse1ResultActivitiesContentRoute entity) {
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

activitySearchResponse1ResultActivitiesContentRoutesDurationFromJson(ActivitySearchResponse1ResultActivitiesContentRoutesDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentRoutesDurationToJson(ActivitySearchResponse1ResultActivitiesContentRoutesDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

activitySearchResponse1ResultActivitiesContentRoutesPointFromJson(ActivitySearchResponse1ResultActivitiesContentRoutesPoint data, Map<String, dynamic> json) {
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
		data.pointOfInterest = new ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterest().fromJson(json['pointOfInterest']);
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentRoutesPointToJson(ActivitySearchResponse1ResultActivitiesContentRoutesPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['order'] = entity.order;
	data['stop'] = entity.stop;
	if (entity.pointOfInterest != null) {
		data['pointOfInterest'] = entity.pointOfInterest.toJson();
	}
	return data;
}

activitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestFromJson(ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterest data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['geolocation'] != null) {
		data.geolocation = new ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestGeolocation().fromJson(json['geolocation']);
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['country'] != null) {
		data.country = new ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestCountry().fromJson(json['country']);
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

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestToJson(ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterest entity) {
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

activitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestGeolocationFromJson(ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestGeolocation data, Map<String, dynamic> json) {
	if (json['latitude'] != null) {
		data.latitude = json['latitude']?.toDouble();
	}
	if (json['longitude'] != null) {
		data.longitude = json['longitude']?.toDouble();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestGeolocationToJson(ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestGeolocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	return data;
}

activitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestCountryFromJson(ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestCountryToJson(ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	return data;
}

activitySearchResponse1ResultActivitiesContentSchedulingFromJson(ActivitySearchResponse1ResultActivitiesContentScheduling data, Map<String, dynamic> json) {
	if (json['duration'] != null) {
		data.duration = new ActivitySearchResponse1ResultActivitiesContentSchedulingDuration().fromJson(json['duration']);
	}
	if (json['closed'] != null) {
		data.closed = json['closed'];
	}
	if (json['opened'] != null) {
		data.opened = new List<ActivitySearchResponse1ResultActivitiesContentSchedulingOpened>();
		(json['opened'] as List).forEach((v) {
			data.opened.add(new ActivitySearchResponse1ResultActivitiesContentSchedulingOpened().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentSchedulingToJson(ActivitySearchResponse1ResultActivitiesContentScheduling entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.duration != null) {
		data['duration'] = entity.duration.toJson();
	}
	data['closed'] = entity.closed;
	if (entity.opened != null) {
		data['opened'] =  entity.opened.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponse1ResultActivitiesContentSchedulingDurationFromJson(ActivitySearchResponse1ResultActivitiesContentSchedulingDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentSchedulingDurationToJson(ActivitySearchResponse1ResultActivitiesContentSchedulingDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

activitySearchResponse1ResultActivitiesContentSchedulingOpenedFromJson(ActivitySearchResponse1ResultActivitiesContentSchedulingOpened data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentSchedulingOpenedToJson(ActivitySearchResponse1ResultActivitiesContentSchedulingOpened entity) {
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

activitySearchResponse1ResultActivitiesContentSegmantationGroupsFromJson(ActivitySearchResponse1ResultActivitiesContentSegmantationGroups data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['segments'] != null) {
		data.segments = new List<ActivitySearchResponse1ResultActivitiesContentSegmantationGroupsSegmants>();
		(json['segments'] as List).forEach((v) {
			data.segments.add(new ActivitySearchResponse1ResultActivitiesContentSegmantationGroupsSegmants().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentSegmantationGroupsToJson(ActivitySearchResponse1ResultActivitiesContentSegmantationGroups entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.segments != null) {
		data['segments'] =  entity.segments.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponse1ResultActivitiesContentSegmantationGroupsSegmantsFromJson(ActivitySearchResponse1ResultActivitiesContentSegmantationGroupsSegmants data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentSegmantationGroupsSegmantsToJson(ActivitySearchResponse1ResultActivitiesContentSegmantationGroupsSegmants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

activitySearchResponse1ResultActivitiesContentCountryFromJson(ActivitySearchResponse1ResultActivitiesContentCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<ActivitySearchResponse1ResultActivitiesContentCountriesDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new ActivitySearchResponse1ResultActivitiesContentCountriesDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentCountryToJson(ActivitySearchResponse1ResultActivitiesContentCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponse1ResultActivitiesContentCountriesDestinationFromJson(ActivitySearchResponse1ResultActivitiesContentCountriesDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesContentCountriesDestinationToJson(ActivitySearchResponse1ResultActivitiesContentCountriesDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

activitySearchResponse1ResultActivitiesAmountsFromFromJson(ActivitySearchResponse1ResultActivitiesAmountsFrom data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponse1ResultActivitiesAmountsFromToJson(ActivitySearchResponse1ResultActivitiesAmountsFrom entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

activitySearchResponse1ResultActivitiesAmountsFromWithMarkupFromJson(ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkup data, Map<String, dynamic> json) {
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
		data.displayRateInfoWithMarkup = new ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesAmountsFromWithMarkupToJson(ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkup entity) {
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

activitySearchResponse1ResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupFromJson(ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponse1ResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupToJson(ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup entity) {
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

activitySearchResponse1ResultActivitiesCountryFromJson(ActivitySearchResponse1ResultActivitiesCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<ActivitySearchResponse1ResultActivitiesCountryDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new ActivitySearchResponse1ResultActivitiesCountryDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesCountryToJson(ActivitySearchResponse1ResultActivitiesCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponse1ResultActivitiesCountryDestinationFromJson(ActivitySearchResponse1ResultActivitiesCountryDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesCountryDestinationToJson(ActivitySearchResponse1ResultActivitiesCountryDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

activitySearchResponse1ResultActivitiesOptionFromJson(ActivitySearchResponse1ResultActivitiesOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponse1ResultActivitiesOptionToJson(ActivitySearchResponse1ResultActivitiesOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}