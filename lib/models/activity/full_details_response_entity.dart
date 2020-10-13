import 'package:ota/generated/json/base/json_convert_content.dart';

class FullDetailsResponseEntity with JsonConvert<FullDetailsResponseEntity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	FullDetailsResponseResult result;
}

class FullDetailsResponseResult with JsonConvert<FullDetailsResponseResult> {
	String operationId;
	FullDetailsResponseResultAuditData auditData;
	FullDetailsResponseResultActivity activity;
	dynamic errors;
}

class FullDetailsResponseResultAuditData with JsonConvert<FullDetailsResponseResultAuditData> {
	double processTime;
	String time;
	String serverId;
	String environment;
}

class FullDetailsResponseResultActivity with JsonConvert<FullDetailsResponseResultActivity> {
	String activityCode;
	FullDetailsResponseResultActivityCountry country;
	List<FullDetailsResponseResultActivityOperationDay> operationDays;
	List<FullDetailsResponseResultActivityModality> modalities;
	String currencyName;
	List<FullDetailsResponseResultActivityAmountsFrom> amountsFrom;
	List<FullDetailsResponseResultActivityAmountsFromWithMarkup> amountsFromWithMarkup;
	FullDetailsResponseResultActivityContent content;
	int order;
	String name;
	String currency;
	String code;
	String type;
	int tpa;
	String tpaName;
	List<FullDetailsResponseResultActivityOption> options;
}

class FullDetailsResponseResultActivityCountry with JsonConvert<FullDetailsResponseResultActivityCountry> {
	String code;
	String name;
	List<FullDetailsResponseResultActivityCountryDestination> destinations;
}

class FullDetailsResponseResultActivityCountryDestination with JsonConvert<FullDetailsResponseResultActivityCountryDestination> {
	String code;
	String name;
}

class FullDetailsResponseResultActivityOperationDay with JsonConvert<FullDetailsResponseResultActivityOperationDay> {
	String code;
	String name;
}

class FullDetailsResponseResultActivityModality with JsonConvert<FullDetailsResponseResultActivityModality> {
	String code;
	String name;
	FullDetailsResponseResultActivityModalitiesDuration duration;
	List<FullDetailsResponseResultActivityModalitiesQuestion> questions;
	List<FullDetailsResponseResultActivityModalitiesCommants> comments;
	FullDetailsResponseResultActivityModalitiesSupplierInformation supplierInformation;
	FullDetailsResponseResultActivityModalitiesProviderInformation providerInformation;
	String destinationCode;
	FullDetailsResponseResultActivityModalitiesContract contract;
	List<dynamic> languages;
	List<FullDetailsResponseResultActivityModalitiesAmountsFrom> amountsFrom;
	List<FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkup> amountsFromWithMarkup;
	List<FullDetailsResponseResultActivityModalitiesRate> rates;
	String amountUnitType;
	String uniqueIdentifier;
}

class FullDetailsResponseResultActivityModalitiesDuration with JsonConvert<FullDetailsResponseResultActivityModalitiesDuration> {
	double value;
	String metric;
}

class FullDetailsResponseResultActivityModalitiesQuestion with JsonConvert<FullDetailsResponseResultActivityModalitiesQuestion> {
	String code;
	String text;
	String required;
}

class FullDetailsResponseResultActivityModalitiesCommants with JsonConvert<FullDetailsResponseResultActivityModalitiesCommants> {
	String type;
	String text;
}

class FullDetailsResponseResultActivityModalitiesSupplierInformation with JsonConvert<FullDetailsResponseResultActivityModalitiesSupplierInformation> {
	String name;
	String vatNumber;
}

class FullDetailsResponseResultActivityModalitiesProviderInformation with JsonConvert<FullDetailsResponseResultActivityModalitiesProviderInformation> {
	String name;
}

class FullDetailsResponseResultActivityModalitiesContract with JsonConvert<FullDetailsResponseResultActivityModalitiesContract> {
	int incomingOffice;
	int code;
	String name;
}

class FullDetailsResponseResultActivityModalitiesAmountsFrom with JsonConvert<FullDetailsResponseResultActivityModalitiesAmountsFrom> {
	String paxType;
	int ageFrom;
	int ageTo;
	double amount;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkup with JsonConvert<FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkup> {
	String paxType;
	int ageFrom;
	int ageTo;
	FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup with JsonConvert<FullDetailsResponseResultActivityModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
	dynamic currency;
}

class FullDetailsResponseResultActivityModalitiesRate with JsonConvert<FullDetailsResponseResultActivityModalitiesRate> {
	String rateCode;
	String rateClass;
	String name;
	List<FullDetailsResponseResultActivityModalitiesRatesRateDetail> rateDetails;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetail with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetail> {
	String rateKey;
	List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate> operationDates;
	List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup> operationDatesWithMarkup;
	List<dynamic> languages;
	List<dynamic> sessions;
	FullDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDuration minimumDuration;
	FullDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDuration maximumDuration;
	FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmount totalAmount;
	FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkup totalAmountWithMarkup;
	List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount> paxAmounts;
	List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup> paxAmountsWithMarkup;
	FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommission agencyCommission;
	FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkup agencyCommissionWithMarkup;
	int tpa;
	String tpaName;
	List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOption> options;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDate> {
	String from;
	String to;
	List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy> cancellationPolicies;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesCancellationPolicy> {
	String dateFrom;
	double amount;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkup> {
	String from;
	String to;
	List<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy> cancellationPolicies;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOperationDatesWithMarkupCancellationPolicy> {
	String dateFrom;
	double amount;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDuration with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsMinimumDuration> {
	double value;
	String metric;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDuration with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsMaximumDuration> {
	double value;
	String metric;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmount with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmount> {
	double amount;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkup with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkup> {
	FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkup with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsTotalAmountWithMarkupDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
	dynamic currency;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmount> {
	String paxType;
	int ageFrom;
	int ageTo;
	double amount;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkup> {
	String paxType;
	int ageFrom;
	int ageTo;
	FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkup with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsPaxAmountsWithMarkupDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
	dynamic currency;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommission with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommission> {
	double percentage;
	double amount;
	double vatPercentage;
	double vatAmount;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkup with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsAgencyCommissionWithMarkup> {
	double percentage;
	double amount;
	double vatPercentage;
	double vatAmount;
}

class FullDetailsResponseResultActivityModalitiesRatesRateDetailsOption with JsonConvert<FullDetailsResponseResultActivityModalitiesRatesRateDetailsOption> {
	String key;
	String value;
}

class FullDetailsResponseResultActivityAmountsFrom with JsonConvert<FullDetailsResponseResultActivityAmountsFrom> {
	String paxType;
	int ageFrom;
	int ageTo;
	double amount;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class FullDetailsResponseResultActivityAmountsFromWithMarkup with JsonConvert<FullDetailsResponseResultActivityAmountsFromWithMarkup> {
	String paxType;
	int ageFrom;
	int ageTo;
	FullDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class FullDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkup with JsonConvert<FullDetailsResponseResultActivityAmountsFromWithMarkupDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
	dynamic currency;
}

class FullDetailsResponseResultActivityContent with JsonConvert<FullDetailsResponseResultActivityContent> {
	String name;
	List<dynamic> detailedInfo;
	List<FullDetailsResponseResultActivityContentFeatureGroup> featureGroups;
	FullDetailsResponseResultActivityContentGuidingOptions guidingOptions;
	FullDetailsResponseResultActivityContentLocation location;
	FullDetailsResponseResultActivityContentMedia media;
	FullDetailsResponseResultActivityContentRedeemInfo redeemInfo;
	List<FullDetailsResponseResultActivityContentRoute> routes;
	FullDetailsResponseResultActivityContentScheduling scheduling;
	List<FullDetailsResponseResultActivityContentSegmantationGroups> segmentationGroups;
	String activityFactsheetType;
	String activityCode;
	String modalityCode;
	String modalityName;
	String contentId;
	String description;
	String lastUpdate;
	String summary;
	List<dynamic> advancedTips;
	List<FullDetailsResponseResultActivityContentCountry> countries;
	List<String> highligths;
}

class FullDetailsResponseResultActivityContentFeatureGroup with JsonConvert<FullDetailsResponseResultActivityContentFeatureGroup> {
	String groupCode;
	List<FullDetailsResponseResultActivityContentFeatureGroupsIncluded> included;
}

class FullDetailsResponseResultActivityContentFeatureGroupsIncluded with JsonConvert<FullDetailsResponseResultActivityContentFeatureGroupsIncluded> {
	String featureType;
	String description;
}

class FullDetailsResponseResultActivityContentGuidingOptions with JsonConvert<FullDetailsResponseResultActivityContentGuidingOptions> {
	String guideType;
	String included;
}

class FullDetailsResponseResultActivityContentLocation with JsonConvert<FullDetailsResponseResultActivityContentLocation> {
	List<FullDetailsResponseResultActivityContentLocationEndPoint> endPoints;
	List<FullDetailsResponseResultActivityContentLocationStartingPoint> startingPoints;
}

class FullDetailsResponseResultActivityContentLocationEndPoint with JsonConvert<FullDetailsResponseResultActivityContentLocationEndPoint> {
	String type;
	String description;
}

class FullDetailsResponseResultActivityContentLocationStartingPoint with JsonConvert<FullDetailsResponseResultActivityContentLocationStartingPoint> {
	String type;
	FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPoint meetingPoint;
}

class FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPoint with JsonConvert<FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPoint> {
	String type;
	dynamic geolocation;
	dynamic address;
	FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountry country;
	dynamic zip;
	String description;
}

class FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountry with JsonConvert<FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountry> {
	String code;
	String name;
	List<FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination> destinations;
}

class FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination with JsonConvert<FullDetailsResponseResultActivityContentLocationStartingPointsMeetingPointCountryDestination> {
	String code;
	String name;
}

class FullDetailsResponseResultActivityContentMedia with JsonConvert<FullDetailsResponseResultActivityContentMedia> {
	List<FullDetailsResponseResultActivityContentMediaImage> images;
}

class FullDetailsResponseResultActivityContentMediaImage with JsonConvert<FullDetailsResponseResultActivityContentMediaImage> {
	int visualizationOrder;
	String mimeType;
	String language;
	List<FullDetailsResponseResultActivityContentMediaImagesUrl> urls;
}

class FullDetailsResponseResultActivityContentMediaImagesUrl with JsonConvert<FullDetailsResponseResultActivityContentMediaImagesUrl> {
	int dpi;
	int height;
	int width;
	String resource;
	String sizeType;
}

class FullDetailsResponseResultActivityContentRedeemInfo with JsonConvert<FullDetailsResponseResultActivityContentRedeemInfo> {
	String type;
	String directEntrance;
	List<FullDetailsResponseResultActivityContentRedeemInfoCommants> comments;
}

class FullDetailsResponseResultActivityContentRedeemInfoCommants with JsonConvert<FullDetailsResponseResultActivityContentRedeemInfoCommants> {
	dynamic type;
	dynamic text;
}

class FullDetailsResponseResultActivityContentRoute with JsonConvert<FullDetailsResponseResultActivityContentRoute> {
	FullDetailsResponseResultActivityContentRoutesDuration duration;
	String description;
	String timeFrom;
	String timeTo;
	List<FullDetailsResponseResultActivityContentRoutesPoint> points;
}

class FullDetailsResponseResultActivityContentRoutesDuration with JsonConvert<FullDetailsResponseResultActivityContentRoutesDuration> {
	double value;
	String metric;
}

class FullDetailsResponseResultActivityContentRoutesPoint with JsonConvert<FullDetailsResponseResultActivityContentRoutesPoint> {
	String type;
	int order;
	bool stop;
	FullDetailsResponseResultActivityContentRoutesPointsPointOfInterest pointOfInterest;
}

class FullDetailsResponseResultActivityContentRoutesPointsPointOfInterest with JsonConvert<FullDetailsResponseResultActivityContentRoutesPointsPointOfInterest> {
	String type;
	FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocation geolocation;
	String address;
	FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountry country;
	String city;
	String zip;
	String description;
}

class FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocation with JsonConvert<FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestGeolocation> {
	double latitude;
	double longitude;
}

class FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountry with JsonConvert<FullDetailsResponseResultActivityContentRoutesPointsPointOfInterestCountry> {
	String code;
}

class FullDetailsResponseResultActivityContentScheduling with JsonConvert<FullDetailsResponseResultActivityContentScheduling> {
	FullDetailsResponseResultActivityContentSchedulingDuration duration;
	List<FullDetailsResponseResultActivityContentSchedulingOpened> opened;
}

class FullDetailsResponseResultActivityContentSchedulingDuration with JsonConvert<FullDetailsResponseResultActivityContentSchedulingDuration> {
	double value;
	String metric;
}

class FullDetailsResponseResultActivityContentSchedulingOpened with JsonConvert<FullDetailsResponseResultActivityContentSchedulingOpened> {
	dynamic from;
	dynamic to;
	String openingTime;
	String closeTime;
	List<dynamic> weekDays;
}

class FullDetailsResponseResultActivityContentSegmantationGroups with JsonConvert<FullDetailsResponseResultActivityContentSegmantationGroups> {
	int code;
	String name;
	List<FullDetailsResponseResultActivityContentSegmantationGroupsSegmants> segments;
}

class FullDetailsResponseResultActivityContentSegmantationGroupsSegmants with JsonConvert<FullDetailsResponseResultActivityContentSegmantationGroupsSegmants> {
	int code;
	String name;
}

class FullDetailsResponseResultActivityContentCountry with JsonConvert<FullDetailsResponseResultActivityContentCountry> {
	String code;
	String name;
	List<FullDetailsResponseResultActivityContentCountriesDestination> destinations;
}

class FullDetailsResponseResultActivityContentCountriesDestination with JsonConvert<FullDetailsResponseResultActivityContentCountriesDestination> {
	String code;
	String name;
}

class FullDetailsResponseResultActivityOption with JsonConvert<FullDetailsResponseResultActivityOption> {
	String key;
	String value;
}
