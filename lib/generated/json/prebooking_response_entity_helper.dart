import 'package:ota/models/activity/prebooking_response_entity.dart';

prebookingResponseEntityFromJson(PrebookingResponseEntity data, Map<String, dynamic> json) {
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
		data.result = new PrebookingResponseResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> prebookingResponseEntityToJson(PrebookingResponseEntity entity) {
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

prebookingResponseResultFromJson(PrebookingResponseResult data, Map<String, dynamic> json) {
	if (json['operationId'] != null) {
		data.operationId = json['operationId']?.toString();
	}
	if (json['auditData'] != null) {
		data.auditData = new PrebookingResponseResultAuditData().fromJson(json['auditData']);
	}
	if (json['booking'] != null) {
		data.booking = new PrebookingResponseResultBooking().fromJson(json['booking']);
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultToJson(PrebookingResponseResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['operationId'] = entity.operationId;
	if (entity.auditData != null) {
		data['auditData'] = entity.auditData.toJson();
	}
	if (entity.booking != null) {
		data['booking'] = entity.booking.toJson();
	}
	return data;
}

prebookingResponseResultAuditDataFromJson(PrebookingResponseResultAuditData data, Map<String, dynamic> json) {
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

Map<String, dynamic> prebookingResponseResultAuditDataToJson(PrebookingResponseResultAuditData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['processTime'] = entity.processTime;
	data['time'] = entity.time;
	data['serverId'] = entity.serverId;
	data['environment'] = entity.environment;
	return data;
}

prebookingResponseResultBookingFromJson(PrebookingResponseResultBooking data, Map<String, dynamic> json) {
	if (json['reference'] != null) {
		data.reference = json['reference']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['currency'] != null) {
		data.currency = json['currency']?.toString();
	}
	if (json['pendingAmount'] != null) {
		data.pendingAmount = json['pendingAmount']?.toDouble();
	}
	if (json['pendingAmountWithMarkup'] != null) {
		data.pendingAmountWithMarkup = json['pendingAmountWithMarkup']?.toDouble();
	}
	if (json['agency'] != null) {
		data.agency = new PrebookingResponseResultBookingAgency().fromJson(json['agency']);
	}
	if (json['creationDate'] != null) {
		data.creationDate = json['creationDate']?.toString();
	}
	if (json['paymentData'] != null) {
		data.paymentData = new PrebookingResponseResultBookingPaymentData().fromJson(json['paymentData']);
	}
	if (json['clientReference'] != null) {
		data.clientReference = json['clientReference']?.toString();
	}
	if (json['holder'] != null) {
		data.holder = new PrebookingResponseResultBookingHolder().fromJson(json['holder']);
	}
	if (json['total'] != null) {
		data.total = json['total']?.toDouble();
	}
	if (json['totalWithMarkup'] != null) {
		data.totalWithMarkup = json['totalWithMarkup']?.toDouble();
	}
	if (json['totalNet'] != null) {
		data.totalNet = json['totalNet']?.toDouble();
	}
	if (json['totalNetWithMarkup'] != null) {
		data.totalNetWithMarkup = json['totalNetWithMarkup']?.toDouble();
	}
	if (json['activities'] != null) {
		data.activities = new List<PrebookingResponseResultBookingActivity>();
		(json['activities'] as List).forEach((v) {
			data.activities.add(new PrebookingResponseResultBookingActivity().fromJson(v));
		});
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toInt();
	}
	if (json['tpaName'] != null) {
		data.tpaName = json['tpaName']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<PrebookingResponseResultBookingOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new PrebookingResponseResultBookingOption().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingToJson(PrebookingResponseResultBooking entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['reference'] = entity.reference;
	data['status'] = entity.status;
	data['currency'] = entity.currency;
	data['pendingAmount'] = entity.pendingAmount;
	data['pendingAmountWithMarkup'] = entity.pendingAmountWithMarkup;
	if (entity.agency != null) {
		data['agency'] = entity.agency.toJson();
	}
	data['creationDate'] = entity.creationDate;
	if (entity.paymentData != null) {
		data['paymentData'] = entity.paymentData.toJson();
	}
	data['clientReference'] = entity.clientReference;
	if (entity.holder != null) {
		data['holder'] = entity.holder.toJson();
	}
	data['total'] = entity.total;
	data['totalWithMarkup'] = entity.totalWithMarkup;
	data['totalNet'] = entity.totalNet;
	data['totalNetWithMarkup'] = entity.totalNetWithMarkup;
	if (entity.activities != null) {
		data['activities'] =  entity.activities.map((v) => v.toJson()).toList();
	}
	data['tpa'] = entity.tpa;
	data['tpaName'] = entity.tpaName;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	return data;
}

prebookingResponseResultBookingAgencyFromJson(PrebookingResponseResultBookingAgency data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['branch'] != null) {
		data.branch = json['branch']?.toInt();
	}
	if (json['comments'] != null) {
		data.comments = json['comments']?.toString();
	}
	if (json['sucursal'] != null) {
		data.sucursal = new PrebookingResponseResultBookingAgencySucursal().fromJson(json['sucursal']);
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingAgencyToJson(PrebookingResponseResultBookingAgency entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['branch'] = entity.branch;
	data['comments'] = entity.comments;
	if (entity.sucursal != null) {
		data['sucursal'] = entity.sucursal.toJson();
	}
	return data;
}

prebookingResponseResultBookingAgencySucursalFromJson(PrebookingResponseResultBookingAgencySucursal data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['street'] != null) {
		data.street = json['street']?.toString();
	}
	if (json['zip'] != null) {
		data.zip = json['zip']?.toString();
	}
	if (json['city'] != null) {
		data.city = json['city']?.toString();
	}
	if (json['email'] != null) {
		data.email = json['email']?.toString();
	}
	if (json['region'] != null) {
		data.region = json['region']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingAgencySucursalToJson(PrebookingResponseResultBookingAgencySucursal entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['street'] = entity.street;
	data['zip'] = entity.zip;
	data['city'] = entity.city;
	data['email'] = entity.email;
	data['region'] = entity.region;
	return data;
}

prebookingResponseResultBookingPaymentDataFromJson(PrebookingResponseResultBookingPaymentData data, Map<String, dynamic> json) {
	if (json['paymentType'] != null) {
		data.paymentType = new PrebookingResponseResultBookingPaymentDataPaymentType().fromJson(json['paymentType']);
	}
	if (json['invoicingCompany'] != null) {
		data.invoicingCompany = new PrebookingResponseResultBookingPaymentDataInvoicingCompany().fromJson(json['invoicingCompany']);
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingPaymentDataToJson(PrebookingResponseResultBookingPaymentData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.paymentType != null) {
		data['paymentType'] = entity.paymentType.toJson();
	}
	if (entity.invoicingCompany != null) {
		data['invoicingCompany'] = entity.invoicingCompany.toJson();
	}
	data['description'] = entity.description;
	return data;
}

prebookingResponseResultBookingPaymentDataPaymentTypeFromJson(PrebookingResponseResultBookingPaymentDataPaymentType data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingPaymentDataPaymentTypeToJson(PrebookingResponseResultBookingPaymentDataPaymentType entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	return data;
}

prebookingResponseResultBookingPaymentDataInvoicingCompanyFromJson(PrebookingResponseResultBookingPaymentDataInvoicingCompany data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['registrationNumber'] != null) {
		data.registrationNumber = json['registrationNumber']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingPaymentDataInvoicingCompanyToJson(PrebookingResponseResultBookingPaymentDataInvoicingCompany entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	data['registrationNumber'] = entity.registrationNumber;
	return data;
}

prebookingResponseResultBookingHolderFromJson(PrebookingResponseResultBookingHolder data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['email'] != null) {
		data.email = json['email']?.toString();
	}
	if (json['mailing'] != null) {
		data.mailing = json['mailing']?.toString();
	}
	if (json['surname'] != null) {
		data.surname = json['surname']?.toString();
	}
	if (json['telephones'] != null) {
		data.telephones = json['telephones']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingHolderToJson(PrebookingResponseResultBookingHolder entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['title'] = entity.title;
	data['email'] = entity.email;
	data['mailing'] = entity.mailing;
	data['surname'] = entity.surname;
	data['telephones'] = entity.telephones;
	return data;
}

prebookingResponseResultBookingActivityFromJson(PrebookingResponseResultBookingActivity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['countryCode'] != null) {
		data.countryCode = json['countryCode'];
	}
	if (json['source'] != null) {
		data.source = json['source'];
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['currency'] != null) {
		data.currency = json['currency'];
	}
	if (json['modalities'] != null) {
		data.modalities = json['modalities'];
	}
	if (json['content'] != null) {
		data.content = json['content'];
	}
	if (json['order'] != null) {
		data.order = json['order']?.toInt();
	}
	if (json['amountsFrom'] != null) {
		data.amountsFrom = json['amountsFrom'];
	}
	if (json['amountsFromWithMarkup'] != null) {
		data.amountsFromWithMarkup = new List<dynamic>();
		data.amountsFromWithMarkup.addAll(json['amountsFromWithMarkup']);
	}
	if (json['currencyName'] != null) {
		data.currencyName = json['currencyName'];
	}
	if (json['country'] != null) {
		data.country = json['country'];
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['supplier'] != null) {
		data.supplier = new PrebookingResponseResultBookingActivitiesSupplier().fromJson(json['supplier']);
	}
	if (json['comments'] != null) {
		data.comments = new List<PrebookingResponseResultBookingActivitiesCommants>();
		(json['comments'] as List).forEach((v) {
			data.comments.add(new PrebookingResponseResultBookingActivitiesCommants().fromJson(v));
		});
	}
	if (json['vouchers'] != null) {
		data.vouchers = json['vouchers'];
	}
	if (json['activityReference'] != null) {
		data.activityReference = json['activityReference']?.toString();
	}
	if (json['modality'] != null) {
		data.modality = new PrebookingResponseResultBookingActivitiesModality().fromJson(json['modality']);
	}
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['dateTo'] != null) {
		data.dateTo = json['dateTo']?.toString();
	}
	if (json['rateBreakdown'] != null) {
		data.rateBreakdown = json['rateBreakdown'];
	}
	if (json['rateBreakdownWithMarkup'] != null) {
		data.rateBreakdownWithMarkup = json['rateBreakdownWithMarkup'];
	}
	if (json['cancellationPolicies'] != null) {
		data.cancellationPolicies = new List<PrebookingResponseResultBookingActivitiesCancellationPolicy>();
		(json['cancellationPolicies'] as List).forEach((v) {
			data.cancellationPolicies.add(new PrebookingResponseResultBookingActivitiesCancellationPolicy().fromJson(v));
		});
	}
	if (json['cancellationPoliciesWithMarkup'] != null) {
		data.cancellationPoliciesWithMarkup = new List<PrebookingResponseResultBookingActivitiesCancellationPoliciesWithMarkup>();
		(json['cancellationPoliciesWithMarkup'] as List).forEach((v) {
			data.cancellationPoliciesWithMarkup.add(new PrebookingResponseResultBookingActivitiesCancellationPoliciesWithMarkup().fromJson(v));
		});
	}
	if (json['paxes'] != null) {
		data.paxes = new List<PrebookingResponseResultBookingActivitiesPaxis>();
		(json['paxes'] as List).forEach((v) {
			data.paxes.add(new PrebookingResponseResultBookingActivitiesPaxis().fromJson(v));
		});
	}
	if (json['questions'] != null) {
		data.questions = new List<PrebookingResponseResultBookingActivitiesQuestion>();
		(json['questions'] as List).forEach((v) {
			data.questions.add(new PrebookingResponseResultBookingActivitiesQuestion().fromJson(v));
		});
	}
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['agencyCommission'] != null) {
		data.agencyCommission = new PrebookingResponseResultBookingActivitiesAgencyCommission().fromJson(json['agencyCommission']);
	}
	if (json['agencyCommissionWithMarkup'] != null) {
		data.agencyCommissionWithMarkup = new PrebookingResponseResultBookingActivitiesAgencyCommissionWithMarkup().fromJson(json['agencyCommissionWithMarkup']);
	}
	if (json['contactInfo'] != null) {
		data.contactInfo = new PrebookingResponseResultBookingActivitiesContactInfo().fromJson(json['contactInfo']);
	}
	if (json['amountDetail'] != null) {
		data.amountDetail = new PrebookingResponseResultBookingActivitiesAmountDetail().fromJson(json['amountDetail']);
	}
	if (json['amountDetailWithMarkup'] != null) {
		data.amountDetailWithMarkup = new PrebookingResponseResultBookingActivitiesAmountDetailWithMarkup().fromJson(json['amountDetailWithMarkup']);
	}
	if (json['extraData'] != null) {
		data.extraData = new List<PrebookingResponseResultBookingActivitiesExtraData>();
		(json['extraData'] as List).forEach((v) {
			data.extraData.add(new PrebookingResponseResultBookingActivitiesExtraData().fromJson(v));
		});
	}
	if (json['providerInformation'] != null) {
		data.providerInformation = new PrebookingResponseResultBookingActivitiesProviderInformation().fromJson(json['providerInformation']);
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
		data.tpaName = json['tpaName'];
	}
	if (json['options'] != null) {
		data.options = json['options'];
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivityToJson(PrebookingResponseResultBookingActivity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['type'] = entity.type;
	data['countryCode'] = entity.countryCode;
	data['source'] = entity.source;
	data['name'] = entity.name;
	data['currency'] = entity.currency;
	data['modalities'] = entity.modalities;
	data['content'] = entity.content;
	data['order'] = entity.order;
	data['amountsFrom'] = entity.amountsFrom;
	if (entity.amountsFromWithMarkup != null) {
		data['amountsFromWithMarkup'] =  [];
	}
	data['currencyName'] = entity.currencyName;
	data['country'] = entity.country;
	data['status'] = entity.status;
	if (entity.supplier != null) {
		data['supplier'] = entity.supplier.toJson();
	}
	if (entity.comments != null) {
		data['comments'] =  entity.comments.map((v) => v.toJson()).toList();
	}
	data['vouchers'] = entity.vouchers;
	data['activityReference'] = entity.activityReference;
	if (entity.modality != null) {
		data['modality'] = entity.modality.toJson();
	}
	data['dateFrom'] = entity.dateFrom;
	data['dateTo'] = entity.dateTo;
	data['rateBreakdown'] = entity.rateBreakdown;
	data['rateBreakdownWithMarkup'] = entity.rateBreakdownWithMarkup;
	if (entity.cancellationPolicies != null) {
		data['cancellationPolicies'] =  entity.cancellationPolicies.map((v) => v.toJson()).toList();
	}
	if (entity.cancellationPoliciesWithMarkup != null) {
		data['cancellationPoliciesWithMarkup'] =  entity.cancellationPoliciesWithMarkup.map((v) => v.toJson()).toList();
	}
	if (entity.paxes != null) {
		data['paxes'] =  entity.paxes.map((v) => v.toJson()).toList();
	}
	if (entity.questions != null) {
		data['questions'] =  entity.questions.map((v) => v.toJson()).toList();
	}
	data['id'] = entity.id;
	if (entity.agencyCommission != null) {
		data['agencyCommission'] = entity.agencyCommission.toJson();
	}
	if (entity.agencyCommissionWithMarkup != null) {
		data['agencyCommissionWithMarkup'] = entity.agencyCommissionWithMarkup.toJson();
	}
	if (entity.contactInfo != null) {
		data['contactInfo'] = entity.contactInfo.toJson();
	}
	if (entity.amountDetail != null) {
		data['amountDetail'] = entity.amountDetail.toJson();
	}
	if (entity.amountDetailWithMarkup != null) {
		data['amountDetailWithMarkup'] = entity.amountDetailWithMarkup.toJson();
	}
	if (entity.extraData != null) {
		data['extraData'] =  entity.extraData.map((v) => v.toJson()).toList();
	}
	if (entity.providerInformation != null) {
		data['providerInformation'] = entity.providerInformation.toJson();
	}
	data['totalAmountFromSearchCalculated'] = entity.totalAmountFromSearchCalculated;
	data['totalAmountFromSearchCalculatedWithMarkup'] = entity.totalAmountFromSearchCalculatedWithMarkup;
	data['tpa'] = entity.tpa;
	data['tpaName'] = entity.tpaName;
	data['options'] = entity.options;
	return data;
}

prebookingResponseResultBookingActivitiesSupplierFromJson(PrebookingResponseResultBookingActivitiesSupplier data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['vatNumber'] != null) {
		data.vatNumber = json['vatNumber']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesSupplierToJson(PrebookingResponseResultBookingActivitiesSupplier entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['vatNumber'] = entity.vatNumber;
	return data;
}

prebookingResponseResultBookingActivitiesCommantsFromJson(PrebookingResponseResultBookingActivitiesCommants data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesCommantsToJson(PrebookingResponseResultBookingActivitiesCommants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	data['text'] = entity.text;
	return data;
}

prebookingResponseResultBookingActivitiesModalityFromJson(PrebookingResponseResultBookingActivitiesModality data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['rates'] != null) {
		data.rates = new List<PrebookingResponseResultBookingActivitiesModalityRate>();
		(json['rates'] as List).forEach((v) {
			data.rates.add(new PrebookingResponseResultBookingActivitiesModalityRate().fromJson(v));
		});
	}
	if (json['amountUnitType'] != null) {
		data.amountUnitType = json['amountUnitType']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesModalityToJson(PrebookingResponseResultBookingActivitiesModality entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.rates != null) {
		data['rates'] =  entity.rates.map((v) => v.toJson()).toList();
	}
	data['amountUnitType'] = entity.amountUnitType;
	return data;
}

prebookingResponseResultBookingActivitiesModalityRateFromJson(PrebookingResponseResultBookingActivitiesModalityRate data, Map<String, dynamic> json) {
	if (json['rateCode'] != null) {
		data.rateCode = json['rateCode'];
	}
	if (json['rateClass'] != null) {
		data.rateClass = json['rateClass'];
	}
	if (json['name'] != null) {
		data.name = json['name'];
	}
	if (json['rateDetails'] != null) {
		data.rateDetails = new List<PrebookingResponseResultBookingActivitiesModalityRatesRateDetail>();
		(json['rateDetails'] as List).forEach((v) {
			data.rateDetails.add(new PrebookingResponseResultBookingActivitiesModalityRatesRateDetail().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesModalityRateToJson(PrebookingResponseResultBookingActivitiesModalityRate entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['rateCode'] = entity.rateCode;
	data['rateClass'] = entity.rateClass;
	data['name'] = entity.name;
	if (entity.rateDetails != null) {
		data['rateDetails'] =  entity.rateDetails.map((v) => v.toJson()).toList();
	}
	return data;
}

prebookingResponseResultBookingActivitiesModalityRatesRateDetailFromJson(PrebookingResponseResultBookingActivitiesModalityRatesRateDetail data, Map<String, dynamic> json) {
	if (json['rateKey'] != null) {
		data.rateKey = json['rateKey'];
	}
	if (json['operationDates'] != null) {
		data.operationDates = json['operationDates'];
	}
	if (json['operationDatesWithMarkup'] != null) {
		data.operationDatesWithMarkup = json['operationDatesWithMarkup'];
	}
	if (json['languages'] != null) {
		data.languages = new List<PrebookingResponseResultBookingActivitiesModalityRatesRateDetailsLanguage>();
		(json['languages'] as List).forEach((v) {
			data.languages.add(new PrebookingResponseResultBookingActivitiesModalityRatesRateDetailsLanguage().fromJson(v));
		});
	}
	if (json['sessions'] != null) {
		data.sessions = json['sessions'];
	}
	if (json['minimumDuration'] != null) {
		data.minimumDuration = json['minimumDuration'];
	}
	if (json['maximumDuration'] != null) {
		data.maximumDuration = json['maximumDuration'];
	}
	if (json['totalAmount'] != null) {
		data.totalAmount = json['totalAmount'];
	}
	if (json['totalAmountWithMarkup'] != null) {
		data.totalAmountWithMarkup = json['totalAmountWithMarkup'];
	}
	if (json['paxAmounts'] != null) {
		data.paxAmounts = json['paxAmounts'];
	}
	if (json['paxAmountsWithMarkup'] != null) {
		data.paxAmountsWithMarkup = json['paxAmountsWithMarkup'];
	}
	if (json['agencyCommission'] != null) {
		data.agencyCommission = json['agencyCommission'];
	}
	if (json['agencyCommissionWithMarkup'] != null) {
		data.agencyCommissionWithMarkup = json['agencyCommissionWithMarkup'];
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toInt();
	}
	if (json['tpaName'] != null) {
		data.tpaName = json['tpaName'];
	}
	if (json['options'] != null) {
		data.options = json['options'];
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesModalityRatesRateDetailToJson(PrebookingResponseResultBookingActivitiesModalityRatesRateDetail entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['rateKey'] = entity.rateKey;
	data['operationDates'] = entity.operationDates;
	data['operationDatesWithMarkup'] = entity.operationDatesWithMarkup;
	if (entity.languages != null) {
		data['languages'] =  entity.languages.map((v) => v.toJson()).toList();
	}
	data['sessions'] = entity.sessions;
	data['minimumDuration'] = entity.minimumDuration;
	data['maximumDuration'] = entity.maximumDuration;
	data['totalAmount'] = entity.totalAmount;
	data['totalAmountWithMarkup'] = entity.totalAmountWithMarkup;
	data['paxAmounts'] = entity.paxAmounts;
	data['paxAmountsWithMarkup'] = entity.paxAmountsWithMarkup;
	data['agencyCommission'] = entity.agencyCommission;
	data['agencyCommissionWithMarkup'] = entity.agencyCommissionWithMarkup;
	data['tpa'] = entity.tpa;
	data['tpaName'] = entity.tpaName;
	data['options'] = entity.options;
	return data;
}

prebookingResponseResultBookingActivitiesModalityRatesRateDetailsLanguageFromJson(PrebookingResponseResultBookingActivitiesModalityRatesRateDetailsLanguage data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesModalityRatesRateDetailsLanguageToJson(PrebookingResponseResultBookingActivitiesModalityRatesRateDetailsLanguage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	return data;
}

prebookingResponseResultBookingActivitiesCancellationPolicyFromJson(PrebookingResponseResultBookingActivitiesCancellationPolicy data, Map<String, dynamic> json) {
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesCancellationPolicyToJson(PrebookingResponseResultBookingActivitiesCancellationPolicy entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateFrom'] = entity.dateFrom;
	data['amount'] = entity.amount;
	return data;
}

prebookingResponseResultBookingActivitiesCancellationPoliciesWithMarkupFromJson(PrebookingResponseResultBookingActivitiesCancellationPoliciesWithMarkup data, Map<String, dynamic> json) {
	if (json['dateFrom'] != null) {
		data.dateFrom = json['dateFrom']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesCancellationPoliciesWithMarkupToJson(PrebookingResponseResultBookingActivitiesCancellationPoliciesWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dateFrom'] = entity.dateFrom;
	data['amount'] = entity.amount;
	return data;
}

prebookingResponseResultBookingActivitiesPaxisFromJson(PrebookingResponseResultBookingActivitiesPaxis data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['mailing'] != null) {
		data.mailing = json['mailing']?.toString();
	}
	if (json['surname'] != null) {
		data.surname = json['surname']?.toString();
	}
	if (json['customerId'] != null) {
		data.customerId = json['customerId']?.toString();
	}
	if (json['age'] != null) {
		data.age = json['age']?.toInt();
	}
	if (json['paxType'] != null) {
		data.paxType = json['paxType']?.toString();
	}
	if (json['passport'] != null) {
		data.passport = json['passport']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesPaxisToJson(PrebookingResponseResultBookingActivitiesPaxis entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['mailing'] = entity.mailing;
	data['surname'] = entity.surname;
	data['customerId'] = entity.customerId;
	data['age'] = entity.age;
	data['paxType'] = entity.paxType;
	data['passport'] = entity.passport;
	return data;
}

prebookingResponseResultBookingActivitiesQuestionFromJson(PrebookingResponseResultBookingActivitiesQuestion data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'];
	}
	if (json['text'] != null) {
		data.text = json['text'];
	}
	if (json['required'] != null) {
		data.required = json['required'];
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesQuestionToJson(PrebookingResponseResultBookingActivitiesQuestion entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['text'] = entity.text;
	data['required'] = entity.required;
	return data;
}

prebookingResponseResultBookingActivitiesAgencyCommissionFromJson(PrebookingResponseResultBookingActivitiesAgencyCommission data, Map<String, dynamic> json) {
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

Map<String, dynamic> prebookingResponseResultBookingActivitiesAgencyCommissionToJson(PrebookingResponseResultBookingActivitiesAgencyCommission entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['percentage'] = entity.percentage;
	data['amount'] = entity.amount;
	data['vatPercentage'] = entity.vatPercentage;
	data['vatAmount'] = entity.vatAmount;
	return data;
}

prebookingResponseResultBookingActivitiesAgencyCommissionWithMarkupFromJson(PrebookingResponseResultBookingActivitiesAgencyCommissionWithMarkup data, Map<String, dynamic> json) {
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

Map<String, dynamic> prebookingResponseResultBookingActivitiesAgencyCommissionWithMarkupToJson(PrebookingResponseResultBookingActivitiesAgencyCommissionWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['percentage'] = entity.percentage;
	data['amount'] = entity.amount;
	data['vatPercentage'] = entity.vatPercentage;
	data['vatAmount'] = entity.vatAmount;
	return data;
}

prebookingResponseResultBookingActivitiesContactInfoFromJson(PrebookingResponseResultBookingActivitiesContactInfo data, Map<String, dynamic> json) {
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['postalCode'] != null) {
		data.postalCode = json['postalCode'];
	}
	if (json['country'] != null) {
		data.country = new PrebookingResponseResultBookingActivitiesContactInfoCountry().fromJson(json['country']);
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesContactInfoToJson(PrebookingResponseResultBookingActivitiesContactInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['address'] = entity.address;
	data['postalCode'] = entity.postalCode;
	if (entity.country != null) {
		data['country'] = entity.country.toJson();
	}
	return data;
}

prebookingResponseResultBookingActivitiesContactInfoCountryFromJson(PrebookingResponseResultBookingActivitiesContactInfoCountry data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'];
	}
	if (json['name'] != null) {
		data.name = json['name'];
	}
	if (json['destinations'] != null) {
		data.destinations = new List<PrebookingResponseResultBookingActivitiesContactInfoCountryDestination>();
		(json['destinations'] as List).forEach((v) {
			data.destinations.add(new PrebookingResponseResultBookingActivitiesContactInfoCountryDestination().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesContactInfoCountryToJson(PrebookingResponseResultBookingActivitiesContactInfoCountry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	if (entity.destinations != null) {
		data['destinations'] =  entity.destinations.map((v) => v.toJson()).toList();
	}
	return data;
}

prebookingResponseResultBookingActivitiesContactInfoCountryDestinationFromJson(PrebookingResponseResultBookingActivitiesContactInfoCountryDestination data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesContactInfoCountryDestinationToJson(PrebookingResponseResultBookingActivitiesContactInfoCountryDestination entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['name'] = entity.name;
	return data;
}

prebookingResponseResultBookingActivitiesAmountDetailFromJson(PrebookingResponseResultBookingActivitiesAmountDetail data, Map<String, dynamic> json) {
	if (json['paxAmounts'] != null) {
		data.paxAmounts = new List<PrebookingResponseResultBookingActivitiesAmountDetailPaxAmount>();
		(json['paxAmounts'] as List).forEach((v) {
			data.paxAmounts.add(new PrebookingResponseResultBookingActivitiesAmountDetailPaxAmount().fromJson(v));
		});
	}
	if (json['totalAmount'] != null) {
		data.totalAmount = new PrebookingResponseResultBookingActivitiesAmountDetailTotalAmount().fromJson(json['totalAmount']);
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesAmountDetailToJson(PrebookingResponseResultBookingActivitiesAmountDetail entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.paxAmounts != null) {
		data['paxAmounts'] =  entity.paxAmounts.map((v) => v.toJson()).toList();
	}
	if (entity.totalAmount != null) {
		data['totalAmount'] = entity.totalAmount.toJson();
	}
	return data;
}

prebookingResponseResultBookingActivitiesAmountDetailPaxAmountFromJson(PrebookingResponseResultBookingActivitiesAmountDetailPaxAmount data, Map<String, dynamic> json) {
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
		data.mandatoryApplyAmount = json['mandatoryApplyAmount'];
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesAmountDetailPaxAmountToJson(PrebookingResponseResultBookingActivitiesAmountDetailPaxAmount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

prebookingResponseResultBookingActivitiesAmountDetailTotalAmountFromJson(PrebookingResponseResultBookingActivitiesAmountDetailTotalAmount data, Map<String, dynamic> json) {
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount'];
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesAmountDetailTotalAmountToJson(PrebookingResponseResultBookingActivitiesAmountDetailTotalAmount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

prebookingResponseResultBookingActivitiesAmountDetailWithMarkupFromJson(PrebookingResponseResultBookingActivitiesAmountDetailWithMarkup data, Map<String, dynamic> json) {
	if (json['paxAmounts'] != null) {
		data.paxAmounts = new List<PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupPaxAmount>();
		(json['paxAmounts'] as List).forEach((v) {
			data.paxAmounts.add(new PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupPaxAmount().fromJson(v));
		});
	}
	if (json['totalAmount'] != null) {
		data.totalAmount = new PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupTotalAmount().fromJson(json['totalAmount']);
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesAmountDetailWithMarkupToJson(PrebookingResponseResultBookingActivitiesAmountDetailWithMarkup entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.paxAmounts != null) {
		data['paxAmounts'] =  entity.paxAmounts.map((v) => v.toJson()).toList();
	}
	if (entity.totalAmount != null) {
		data['totalAmount'] = entity.totalAmount.toJson();
	}
	return data;
}

prebookingResponseResultBookingActivitiesAmountDetailWithMarkupPaxAmountFromJson(PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupPaxAmount data, Map<String, dynamic> json) {
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
		data.mandatoryApplyAmount = json['mandatoryApplyAmount'];
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesAmountDetailWithMarkupPaxAmountToJson(PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupPaxAmount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['paxType'] = entity.paxType;
	data['ageFrom'] = entity.ageFrom;
	data['ageTo'] = entity.ageTo;
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

prebookingResponseResultBookingActivitiesAmountDetailWithMarkupTotalAmountFromJson(PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupTotalAmount data, Map<String, dynamic> json) {
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	if (json['boxOfficeAmount'] != null) {
		data.boxOfficeAmount = json['boxOfficeAmount']?.toDouble();
	}
	if (json['mandatoryApplyAmount'] != null) {
		data.mandatoryApplyAmount = json['mandatoryApplyAmount'];
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesAmountDetailWithMarkupTotalAmountToJson(PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupTotalAmount entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['amount'] = entity.amount;
	data['boxOfficeAmount'] = entity.boxOfficeAmount;
	data['mandatoryApplyAmount'] = entity.mandatoryApplyAmount;
	return data;
}

prebookingResponseResultBookingActivitiesExtraDataFromJson(PrebookingResponseResultBookingActivitiesExtraData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesExtraDataToJson(PrebookingResponseResultBookingActivitiesExtraData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['value'] = entity.value;
	return data;
}

prebookingResponseResultBookingActivitiesProviderInformationFromJson(PrebookingResponseResultBookingActivitiesProviderInformation data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingActivitiesProviderInformationToJson(PrebookingResponseResultBookingActivitiesProviderInformation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	return data;
}

prebookingResponseResultBookingOptionFromJson(PrebookingResponseResultBookingOption data, Map<String, dynamic> json) {
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> prebookingResponseResultBookingOptionToJson(PrebookingResponseResultBookingOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['key'] = entity.key;
	data['value'] = entity.value;
	return data;
}