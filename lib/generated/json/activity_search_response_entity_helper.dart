import 'package:ota/models/activity/activity_search_response_entity.dart';

activitySearchResponseEntityFromJson(ActivitySearchResponseEntity data, Map<String, dynamic> json) {
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
		data.result = new ActivitySearchResponseResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> activitySearchResponseEntityToJson(ActivitySearchResponseEntity entity) {
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

activitySearchResponseResultFromJson(ActivitySearchResponseResult data, Map<String, dynamic> json) {
	if (json['operationId'] != null) {
		data.operationId = json['operationId']?.toString();
	}
	if (json['pagination'] != null) {
		data.pagination = new ActivitySearchResponseResultPagination().fromJson(json['pagination']);
	}
	if (json['auditData'] != null) {
		data.auditData = new ActivitySearchResponseResultAuditData().fromJson(json['auditData']);
	}
	if (json['activities'] != null) {
		data.activities = new List<ActivitySearchResponseResultActivity>();
		(json['activities'] as List).forEach((v) {
			data.activities.add(new ActivitySearchResponseResultActivity().fromJson(v));
		});
	}
	if (json['summaryLog'] != null) {
		data.summaryLog = json['summaryLog']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultToJson(ActivitySearchResponseResult entity) {
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

activitySearchResponseResultPaginationFromJson(ActivitySearchResponseResultPagination data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponseResultPaginationToJson(ActivitySearchResponseResultPagination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['itemsPerPage'] = entity.itemsPerPage;
	data['page'] = entity.page;
	data['totalItems'] = entity.totalItems;
	return data;
}

activitySearchResponseResultAuditDataFromJson(ActivitySearchResponseResultAuditData data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponseResultAuditDataToJson(ActivitySearchResponseResultAuditData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['processTime'] = entity.processTime;
	data['time'] = entity.time;
	data['serverId'] = entity.serverId;
	data['environment'] = entity.environment;
	return data;
}

activitySearchResponseResultActivityFromJson(ActivitySearchResponseResultActivity data, Map<String, dynamic> json) {
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
		data.modalities = new List<ActivitySearchResponseResultActivitiesModality>();
		(json['modalities'] as List).forEach((v) {
			data.modalities.add(new ActivitySearchResponseResultActivitiesModality().fromJson(v));
		});
	}
	if (json['content'] != null) {
		data.content = new ActivitySearchResponseResultActivitiesContent().fromJson(json['content']);
	}
	if (json['order'] != null) {
		data.order = json['order']?.toInt();
	}
	if (json['amountsFrom'] != null) {
		data.amountsFrom = new List<ActivitySearchResponseResultActivitiesAmountsFrom>();
		(json['amountsFrom'] as List).forEach((v) {
			data.amountsFrom.add(new ActivitySearchResponseResultActivitiesAmountsFrom().fromJson(v));
		});
	}
	if (json['amountsFromWithMarkup'] != null) {
		data.amountsFromWithMarkup = new List<ActivitySearchResponseResultActivitiesAmountsFromWithMarkup>();
		(json['amountsFromWithMarkup'] as List).forEach((v) {
			data.amountsFromWithMarkup.add(new ActivitySearchResponseResultActivitiesAmountsFromWithMarkup().fromJson(v));
		});
	}
	if (json['currencyName'] != null) {
		data.currencyName = json['currencyName']?.toString();
	}
	if (json['country'] != null) {
		data.country = new ActivitySearchResponseResultActivitiesCountry().fromJson(json['country']);
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
		data.options = new List<ActivitySearchResponseResultActivitiesOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new ActivitySearchResponseResultActivitiesOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivityToJson(ActivitySearchResponseResultActivity entity) {
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

activitySearchResponseResultActivitiesModalityFromJson(ActivitySearchResponseResultActivitiesModality data, Map<String, dynamic> json) {
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
		data.duration = new ActivitySearchResponseResultActivitiesModalitiesDuration().fromJson(json['duration']);
	}
	if (json['amountsFrom'] != null) {
		data.amountsFrom = new List<ActivitySearchResponseResultActivitiesModalitiesAmountsFrom>();
		(json['amountsFrom'] as List).forEach((v) {
			data.amountsFrom.add(new ActivitySearchResponseResultActivitiesModalitiesAmountsFrom().fromJson(v));
		});
	}
	if (json['amountsFromWithMarkup'] != null) {
		data.amountsFromWithMarkup = new List<ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkup>();
		(json['amountsFromWithMarkup'] as List).forEach((v) {
			data.amountsFromWithMarkup.add(new ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkup().fromJson(v));
		});
	}
	if (json['cancellationPolicies'] != null) {
		data.cancellationPolicies = new List<ActivitySearchResponseResultActivitiesModalitiesCancellationPolicy>();
		(json['cancellationPolicies'] as List).forEach((v) {
			data.cancellationPolicies.add(new ActivitySearchResponseResultActivitiesModalitiesCancellationPolicy().fromJson(v));
		});
	}
	if (json['cancellationPoliciesWithMarkup'] != null) {
		data.cancellationPoliciesWithMarkup = new List<ActivitySearchResponseResultActivitiesModalitiesCancellationPoliciesWithMarkup>();
		(json['cancellationPoliciesWithMarkup'] as List).forEach((v) {
			data.cancellationPoliciesWithMarkup.add(new ActivitySearchResponseResultActivitiesModalitiesCancellationPoliciesWithMarkup().fromJson(v));
		});
	}
	if (json['uniqueIdentifier'] != null) {
		data.uniqueIdentifier = json['uniqueIdentifier']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesModalityToJson(ActivitySearchResponseResultActivitiesModality entity) {
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

activitySearchResponseResultActivitiesModalitiesDurationFromJson(ActivitySearchResponseResultActivitiesModalitiesDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesModalitiesDurationToJson(ActivitySearchResponseResultActivitiesModalitiesDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

activitySearchResponseResultActivitiesModalitiesAmountsFromFromJson(ActivitySearchResponseResultActivitiesModalitiesAmountsFrom data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponseResultActivitiesModalitiesAmountsFromToJson(ActivitySearchResponseResultActivitiesModalitiesAmountsFrom entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

activitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkupFromJson(ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkup data, Map<String, dynamic> json) {
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
		data.displayRateInfoWithMarkup = new ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkupToJson(ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkup entity) {
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

activitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupFromJson(ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupToJson(ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup entity) {
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

activitySearchResponseResultActivitiesModalitiesCancellationPolicyFromJson(ActivitySearchResponseResultActivitiesModalitiesCancellationPolicy data, Map<String, dynamic> json) {
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesModalitiesCancellationPolicyToJson(ActivitySearchResponseResultActivitiesModalitiesCancellationPolicy entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateFrom'] = entity.dateFrom;
	data['amount'] = entity.amount;
	return data;
}

activitySearchResponseResultActivitiesModalitiesCancellationPoliciesWithMarkupFromJson(ActivitySearchResponseResultActivitiesModalitiesCancellationPoliciesWithMarkup data, Map<String, dynamic> json) {
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesModalitiesCancellationPoliciesWithMarkupToJson(ActivitySearchResponseResultActivitiesModalitiesCancellationPoliciesWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateFrom'] = entity.dateFrom;
	data['amount'] = entity.amount;
	return data;
}

activitySearchResponseResultActivitiesContentFromJson(ActivitySearchResponseResultActivitiesContent data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['detailedInfo'] != null) {
		data.detailedInfo = new List<dynamic>();
		data.detailedInfo.addAll(json['detailedInfo']);
	}
	if (json['featureGroups'] != null) {
		data.featureGroups = new List<ActivitySearchResponseResultActivitiesContentFeatureGroup>();
		(json['featureGroups'] as List).forEach((v) {
			data.featureGroups.add(new ActivitySearchResponseResultActivitiesContentFeatureGroup().fromJson(v));
		});
	}
	if (json['guidingOptions'] != null) {
		data.guidingOptions = new ActivitySearchResponseResultActivitiesContentGuidingOptions().fromJson(json['guidingOptions']);
	}
	if (json['importantInfo'] != null) {
		data.importantInfo = json['importantInfo'];
	}
	if (json['location'] != null) {
		data.location = new ActivitySearchResponseResultActivitiesContentLocation().fromJson(json['location']);
	}
	if (json['media'] != null) {
		data.media = new ActivitySearchResponseResultActivitiesContentMedia().fromJson(json['media']);
	}
	if (json['redeemInfo'] != null) {
		data.redeemInfo = new ActivitySearchResponseResultActivitiesContentRedeemInfo().fromJson(json['redeemInfo']);
	}
	if (json['routes'] != null) {
		data.routes = new List<dynamic>();
		data.routes.addAll(json['routes']);
	}
	if (json['scheduling'] != null) {
		data.scheduling = new ActivitySearchResponseResultActivitiesContentScheduling().fromJson(json['scheduling']);
	}
	if (json['segmentationGroups'] != null) {
		data.segmentationGroups = new List<ActivitySearchResponseResultActivitiesContentSegmantationGroups>();
		(json['segmentationGroups'] as List).forEach((v) {
			data.segmentationGroups.add(new ActivitySearchResponseResultActivitiesContentSegmantationGroups().fromJson(v));
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
		data.summary = json['summary'];
	}
	if (json['advancedTips'] != null) {
		data.advancedTips = new List<dynamic>();
		data.advancedTips.addAll(json['advancedTips']);
	}
	if (json['countries'] != null) {
		data.countries = new List<ActivitySearchResponseResultActivitiesContentCountry>();
		(json['countries'] as List).forEach((v) {
			data.countries.add(new ActivitySearchResponseResultActivitiesContentCountry().fromJson(v));
		});
	}
	if (json['highligths'] != null) {
		data.highligths = new List<dynamic>();
		data.highligths.addAll(json['highligths']);
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentToJson(ActivitySearchResponseResultActivitiesContent entity) {
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
		data['routes'] =  [];
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
	if (entity.highligths != null) {
		data['highligths'] =  [];
	}
	return data;
}

activitySearchResponseResultActivitiesContentFeatureGroupFromJson(ActivitySearchResponseResultActivitiesContentFeatureGroup data, Map<String, dynamic> json) {
	if (json['groupCode'] != null) {
		data.groupCode = json['groupCode']?.toString();
	}
	if (json['excluded'] != null) {
		data.excluded = json['excluded'];
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentFeatureGroupToJson(ActivitySearchResponseResultActivitiesContentFeatureGroup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['groupCode'] = entity.groupCode;
	data['excluded'] = entity.excluded;
	return data;
}

activitySearchResponseResultActivitiesContentGuidingOptionsFromJson(ActivitySearchResponseResultActivitiesContentGuidingOptions data, Map<String, dynamic> json) {
	if (json['guideType'] != null) {
		data.guideType = json['guideType']?.toString();
	}
	if (json['included'] != null) {
		data.included = json['included']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentGuidingOptionsToJson(ActivitySearchResponseResultActivitiesContentGuidingOptions entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['guideType'] = entity.guideType;
	data['included'] = entity.included;
	return data;
}

activitySearchResponseResultActivitiesContentLocationFromJson(ActivitySearchResponseResultActivitiesContentLocation data, Map<String, dynamic> json) {
	if (json['endPoints'] != null) {
		data.endPoints = new List<ActivitySearchResponseResultActivitiesContentLocationEndPoint>();
		(json['endPoints'] as List).forEach((v) {
			data.endPoints.add(new ActivitySearchResponseResultActivitiesContentLocationEndPoint().fromJson(v));
		});
	}
	if (json['startingPoints'] != null) {
		data.startingPoints = new List<ActivitySearchResponseResultActivitiesContentLocationStartingPoint>();
		(json['startingPoints'] as List).forEach((v) {
			data.startingPoints.add(new ActivitySearchResponseResultActivitiesContentLocationStartingPoint().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentLocationToJson(ActivitySearchResponseResultActivitiesContentLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.endPoints != null) {
		data['endPoints'] =  entity.endPoints.map((v) => v.toJson()).toList();
	}
	if (entity.startingPoints != null) {
		data['startingPoints'] =  entity.startingPoints.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponseResultActivitiesContentLocationEndPointFromJson(ActivitySearchResponseResultActivitiesContentLocationEndPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentLocationEndPointToJson(ActivitySearchResponseResultActivitiesContentLocationEndPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['description'] = entity.description;
	return data;
}

activitySearchResponseResultActivitiesContentLocationStartingPointFromJson(ActivitySearchResponseResultActivitiesContentLocationStartingPoint data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['meetingPoint'] != null) {
		data.meetingPoint = new ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPoint().fromJson(json['meetingPoint']);
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentLocationStartingPointToJson(ActivitySearchResponseResultActivitiesContentLocationStartingPoint entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.meetingPoint != null) {
		data['meetingPoint'] = entity.meetingPoint.toJson();
	}
	return data;
}

activitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointFromJson(ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPoint data, Map<String, dynamic> json) {
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
		data.country = new ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountry().fromJson(json['country']);
	}
	if (json['zip'] != null) {
		data.zip = json['zip'];
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointToJson(ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPoint entity) {
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

activitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryFromJson(ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryToJson(ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryDestinationFromJson(ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryDestinationToJson(ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

activitySearchResponseResultActivitiesContentMediaFromJson(ActivitySearchResponseResultActivitiesContentMedia data, Map<String, dynamic> json) {
	if (json['images'] != null) {
		data.images = new List<ActivitySearchResponseResultActivitiesContentMediaImage>();
		(json['images'] as List).forEach((v) {
			data.images.add(new ActivitySearchResponseResultActivitiesContentMediaImage().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentMediaToJson(ActivitySearchResponseResultActivitiesContentMedia entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.images != null) {
		data['images'] =  entity.images.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponseResultActivitiesContentMediaImageFromJson(ActivitySearchResponseResultActivitiesContentMediaImage data, Map<String, dynamic> json) {
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
		data.urls = new List<ActivitySearchResponseResultActivitiesContentMediaImagesUrl>();
		(json['urls'] as List).forEach((v) {
			data.urls.add(new ActivitySearchResponseResultActivitiesContentMediaImagesUrl().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentMediaImageToJson(ActivitySearchResponseResultActivitiesContentMediaImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['visualizationOrder'] = entity.visualizationOrder;
	data['mimeType'] = entity.mimeType;
	data['language'] = entity.language;
	if (entity.urls != null) {
		data['urls'] =  entity.urls.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponseResultActivitiesContentMediaImagesUrlFromJson(ActivitySearchResponseResultActivitiesContentMediaImagesUrl data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponseResultActivitiesContentMediaImagesUrlToJson(ActivitySearchResponseResultActivitiesContentMediaImagesUrl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dpi'] = entity.dpi;
	data['height'] = entity.height;
	data['width'] = entity.width;
	data['resource'] = entity.resource;
	data['sizeType'] = entity.sizeType;
	return data;
}

activitySearchResponseResultActivitiesContentRedeemInfoFromJson(ActivitySearchResponseResultActivitiesContentRedeemInfo data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['directEntrance'] != null) {
		data.directEntrance = json['directEntrance']?.toString();
	}
	if (json['comments'] != null) {
		data.comments = new List<ActivitySearchResponseResultActivitiesContentRedeemInfoCommants>();
		(json['comments'] as List).forEach((v) {
			data.comments.add(new ActivitySearchResponseResultActivitiesContentRedeemInfoCommants().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentRedeemInfoToJson(ActivitySearchResponseResultActivitiesContentRedeemInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['directEntrance'] = entity.directEntrance;
	if (entity.comments != null) {
		data['comments'] =  entity.comments.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponseResultActivitiesContentRedeemInfoCommantsFromJson(ActivitySearchResponseResultActivitiesContentRedeemInfoCommants data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type'];
	}
	if (json['text'] != null) {
		data.text = json['text'];
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentRedeemInfoCommantsToJson(ActivitySearchResponseResultActivitiesContentRedeemInfoCommants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['text'] = entity.text;
	return data;
}

activitySearchResponseResultActivitiesContentSchedulingFromJson(ActivitySearchResponseResultActivitiesContentScheduling data, Map<String, dynamic> json) {
	if (json['duration'] != null) {
		data.duration = new ActivitySearchResponseResultActivitiesContentSchedulingDuration().fromJson(json['duration']);
	}
	if (json['closed'] != null) {
		data.closed = json['closed'];
	}
	if (json['opened'] != null) {
		data.opened = new List<ActivitySearchResponseResultActivitiesContentSchedulingOpened>();
		(json['opened'] as List).forEach((v) {
			data.opened.add(new ActivitySearchResponseResultActivitiesContentSchedulingOpened().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentSchedulingToJson(ActivitySearchResponseResultActivitiesContentScheduling entity) {
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

activitySearchResponseResultActivitiesContentSchedulingDurationFromJson(ActivitySearchResponseResultActivitiesContentSchedulingDuration data, Map<String, dynamic> json) {
	if (json['value'] != null) {
		data.value = json['value']?.toDouble();
	}
	if (json['metric'] != null) {
		data.metric = json['metric']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentSchedulingDurationToJson(ActivitySearchResponseResultActivitiesContentSchedulingDuration entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['value'] = entity.value;
	data['metric'] = entity.metric;
	return data;
}

activitySearchResponseResultActivitiesContentSchedulingOpenedFromJson(ActivitySearchResponseResultActivitiesContentSchedulingOpened data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponseResultActivitiesContentSchedulingOpenedToJson(ActivitySearchResponseResultActivitiesContentSchedulingOpened entity) {
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

activitySearchResponseResultActivitiesContentSegmantationGroupsFromJson(ActivitySearchResponseResultActivitiesContentSegmantationGroups data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['segments'] != null) {
		data.segments = new List<ActivitySearchResponseResultActivitiesContentSegmantationGroupsSegmants>();
		(json['segments'] as List).forEach((v) {
			data.segments.add(new ActivitySearchResponseResultActivitiesContentSegmantationGroupsSegmants().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentSegmantationGroupsToJson(ActivitySearchResponseResultActivitiesContentSegmantationGroups entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.segments != null) {
		data['segments'] =  entity.segments.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponseResultActivitiesContentSegmantationGroupsSegmantsFromJson(ActivitySearchResponseResultActivitiesContentSegmantationGroupsSegmants data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentSegmantationGroupsSegmantsToJson(ActivitySearchResponseResultActivitiesContentSegmantationGroupsSegmants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

activitySearchResponseResultActivitiesContentCountryFromJson(ActivitySearchResponseResultActivitiesContentCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<ActivitySearchResponseResultActivitiesContentCountriesDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new ActivitySearchResponseResultActivitiesContentCountriesDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentCountryToJson(ActivitySearchResponseResultActivitiesContentCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponseResultActivitiesContentCountriesDestinationFromJson(ActivitySearchResponseResultActivitiesContentCountriesDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesContentCountriesDestinationToJson(ActivitySearchResponseResultActivitiesContentCountriesDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

activitySearchResponseResultActivitiesAmountsFromFromJson(ActivitySearchResponseResultActivitiesAmountsFrom data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponseResultActivitiesAmountsFromToJson(ActivitySearchResponseResultActivitiesAmountsFrom entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

activitySearchResponseResultActivitiesAmountsFromWithMarkupFromJson(ActivitySearchResponseResultActivitiesAmountsFromWithMarkup data, Map<String, dynamic> json) {
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
		data.displayRateInfoWithMarkup = new ActivitySearchResponseResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesAmountsFromWithMarkupToJson(ActivitySearchResponseResultActivitiesAmountsFromWithMarkup entity) {
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

activitySearchResponseResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupFromJson(ActivitySearchResponseResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> activitySearchResponseResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkupToJson(ActivitySearchResponseResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup entity) {
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

activitySearchResponseResultActivitiesCountryFromJson(ActivitySearchResponseResultActivitiesCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['destinations'] != null) {
		data.destinations = new List<ActivitySearchResponseResultActivitiesCountryDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new ActivitySearchResponseResultActivitiesCountryDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesCountryToJson(ActivitySearchResponseResultActivitiesCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

activitySearchResponseResultActivitiesCountryDestinationFromJson(ActivitySearchResponseResultActivitiesCountryDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesCountryDestinationToJson(ActivitySearchResponseResultActivitiesCountryDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

activitySearchResponseResultActivitiesOptionFromJson(ActivitySearchResponseResultActivitiesOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> activitySearchResponseResultActivitiesOptionToJson(ActivitySearchResponseResultActivitiesOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}