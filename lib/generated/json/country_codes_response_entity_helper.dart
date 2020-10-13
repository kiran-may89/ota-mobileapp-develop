import 'package:ota/models/common/country_codes_response_entity.dart';

countryCodesResponseEntityFromJson(CountryCodesResponseEntity data, Map<String, dynamic> json) {
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['isError'] != null) {
		data.isError = json['isError'];
	}
	if (json['result'] != null) {
		data.result = new List<CountryCodesResponseResult>();
		(json['result'] as List).forEach((v) {
			data.result.add(new CountryCodesResponseResult().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> countryCodesResponseEntityToJson(CountryCodesResponseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['message'] = entity.message;
	data['isError'] = entity.isError;
	if (entity.result != null) {
		data['result'] =  entity.result.map((v) => v.toJson()).toList();
	}
	return data;
}

countryCodesResponseResultFromJson(CountryCodesResponseResult data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['uid'] != null) {
		data.uid = json['uid']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['alpha2Code'] != null) {
		data.alpha2Code = json['alpha2Code']?.toString();
	}
	if (json['alpha3Code'] != null) {
		data.alpha3Code = json['alpha3Code']?.toString();
	}
	if (json['telephoneCode'] != null) {
		data.telephoneCode = json['telephoneCode']?.toString();
	}
	if (json['currencyCode'] != null) {
		data.currencyCode = json['currencyCode']?.toString();
	}
	if (json['currencySymbol'] != null) {
		data.currencySymbol = json['currencySymbol']?.toString();
	}
	if (json['flagUrl'] != null) {
		data.flagUrl = json['flagUrl']?.toString();
	}
	if (json['latitude'] != null) {
		data.latitude = json['latitude']?.toInt();
	}
	if (json['longitude'] != null) {
		data.longitude = json['longitude']?.toInt();
	}
	if (json['region'] != null) {
		data.region = json['region']?.toString();
	}
	if (json['subRegion'] != null) {
		data.subRegion = json['subRegion']?.toString();
	}
	if (json['timeZone'] != null) {
		data.timeZone = json['timeZone']?.toString();
	}
	if (json['isDeleted'] != null) {
		data.isDeleted = json['isDeleted'];
	}
	return data;
}

Map<String, dynamic> countryCodesResponseResultToJson(CountryCodesResponseResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['uid'] = entity.uid;
	data['name'] = entity.name;
	data['alpha2Code'] = entity.alpha2Code;
	data['alpha3Code'] = entity.alpha3Code;
	data['telephoneCode'] = entity.telephoneCode;
	data['currencyCode'] = entity.currencyCode;
	data['currencySymbol'] = entity.currencySymbol;
	data['flagUrl'] = entity.flagUrl;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	data['region'] = entity.region;
	data['subRegion'] = entity.subRegion;
	data['timeZone'] = entity.timeZone;
	data['isDeleted'] = entity.isDeleted;
	return data;
}