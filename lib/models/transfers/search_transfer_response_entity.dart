import 'package:ota/generated/json/base/json_convert_content.dart';
import 'package:ota/generated/json/base/json_filed.dart';

class SearchTransferResponseEntity with JsonConvert<SearchTransferResponseEntity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	SearchTransferResponseResult result;
}

class SearchTransferResponseResult with JsonConvert<SearchTransferResponseResult> {
	List<SearchTransferResponseResultVechile> vechiles;
}

class SearchTransferResponseResultVechile with JsonConvert<SearchTransferResponseResultVechile> {
	double price;
	@JSONField(name: "reverse_price")
	double reversePrice;
	SearchTransferResponseResultVechilesDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	@JSONField(name: "reverse_displayRateInfoWithMarkup")
	SearchTransferResponseResultVechilesReverseDisplayrateinfowithmarkup reverseDisplayrateinfowithmarkup;
	String currency;
	@JSONField(name: "service_id")
	int serviceId;
	@JSONField(name: "car_class")
	SearchTransferResponseResultVechilesCarClass carClass;
	@JSONField(name: "allowable_subaddress")
	int allowableSubaddress;
	@JSONField(name: "price_subaddress")
	double priceSubaddress;
	@JSONField(name: "displayRateInfoWithMarkup_subaddress")
	SearchTransferResponseResultVechilesDisplayrateinfowithmarkupSubaddress displayrateinfowithmarkupSubaddress;
	@JSONField(name: "cancellation_time")
	int cancellationTime;
	int type;
	@JSONField(name: "minimum_duration")
	int minimumDuration;
	@JSONField(name: "start_place")
	SearchTransferResponseResultVechilesStartPlace startPlace;
	@JSONField(name: "finish_place")
	SearchTransferResponseResultVechilesFinishPlace finishPlace;
	int tpa;
	String tpaName;
	List<SearchTransferResponseResultVechilesOption> options;
}

class SearchTransferResponseResultVechilesDisplayRateInfoWithMarkup with JsonConvert<SearchTransferResponseResultVechilesDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
}

class SearchTransferResponseResultVechilesReverseDisplayrateinfowithmarkup with JsonConvert<SearchTransferResponseResultVechilesReverseDisplayrateinfowithmarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
}

class SearchTransferResponseResultVechilesCarClass with JsonConvert<SearchTransferResponseResultVechilesCarClass> {
	@JSONField(name: "car_class_id")
	int carClassId;
	String title;
	List<String> models;
	String photo;
	int capacity;
}

class SearchTransferResponseResultVechilesDisplayrateinfowithmarkupSubaddress with JsonConvert<SearchTransferResponseResultVechilesDisplayrateinfowithmarkupSubaddress> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
}

class SearchTransferResponseResultVechilesStartPlace with JsonConvert<SearchTransferResponseResultVechilesStartPlace> {
	@JSONField(name: "place_id")
	int placeId;
	String title;
	int type;
	@JSONField(name: "type_title")
	String typeTitle;
	List<dynamic> terminal;
}

class SearchTransferResponseResultVechilesFinishPlace with JsonConvert<SearchTransferResponseResultVechilesFinishPlace> {
	@JSONField(name: "place_id")
	int placeId;
	String title;
	int type;
	@JSONField(name: "type_title")
	String typeTitle;
	List<String> terminal;
}

class SearchTransferResponseResultVechilesOption with JsonConvert<SearchTransferResponseResultVechilesOption> {
	String key;
	String value;
}
