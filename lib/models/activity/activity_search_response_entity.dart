import 'package:ota/generated/json/base/json_convert_content.dart';

class ActivitySearchResponseEntity with JsonConvert<ActivitySearchResponseEntity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	ActivitySearchResponseResult result;
}

class ActivitySearchResponseResult with JsonConvert<ActivitySearchResponseResult> {
	String operationId;
	ActivitySearchResponseResultPagination pagination;
	ActivitySearchResponseResultAuditData auditData;
	List<ActivitySearchResponseResultActivity> activities;
	String summaryLog;
}

class ActivitySearchResponseResultPagination with JsonConvert<ActivitySearchResponseResultPagination> {
	int itemsPerPage;
	int page;
	int totalItems;
}

class ActivitySearchResponseResultAuditData with JsonConvert<ActivitySearchResponseResultAuditData> {
	double processTime;
	String time;
	String serverId;
	String environment;
}

class ActivitySearchResponseResultActivity with JsonConvert<ActivitySearchResponseResultActivity> {
	String code;
	String type;
	String countryCode;
	String source;
	String name;
	String currency;
	List<ActivitySearchResponseResultActivitiesModality> modalities;
	ActivitySearchResponseResultActivitiesContent content;
	int order;
	List<ActivitySearchResponseResultActivitiesAmountsFrom> amountsFrom;
	List<ActivitySearchResponseResultActivitiesAmountsFromWithMarkup> amountsFromWithMarkup;
	String currencyName;
	ActivitySearchResponseResultActivitiesCountry country;
	dynamic status;
	dynamic supplier;
	dynamic comments;
	dynamic vouchers;
	dynamic activityReference;
	dynamic modality;
	dynamic dateFrom;
	dynamic dateTo;
	dynamic rateBreakdown;
	dynamic rateBreakdownWithMarkup;
	dynamic cancellationPolicies;
	dynamic cancellationPoliciesWithMarkup;
	dynamic paxes;
	dynamic questions;
	dynamic id;
	dynamic agencyCommission;
	dynamic agencyCommissionWithMarkup;
	dynamic contactInfo;
	dynamic amountDetail;
	dynamic amountDetailWithMarkup;
	dynamic extraData;
	dynamic providerInformation;
	double totalAmountFromSearchCalculated;
	double totalAmountFromSearchCalculatedWithMarkup;
	int tpa;
	String tpaName;
	List<ActivitySearchResponseResultActivitiesOption> options;
}

class ActivitySearchResponseResultActivitiesModality with JsonConvert<ActivitySearchResponseResultActivitiesModality> {
	String code;
	String name;
	String rateCode;
	ActivitySearchResponseResultActivitiesModalitiesDuration duration;
	List<ActivitySearchResponseResultActivitiesModalitiesAmountsFrom> amountsFrom;
	List<ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkup> amountsFromWithMarkup;
	List<ActivitySearchResponseResultActivitiesModalitiesCancellationPolicy> cancellationPolicies;
	List<ActivitySearchResponseResultActivitiesModalitiesCancellationPoliciesWithMarkup> cancellationPoliciesWithMarkup;
	String uniqueIdentifier;
}

class ActivitySearchResponseResultActivitiesModalitiesDuration with JsonConvert<ActivitySearchResponseResultActivitiesModalitiesDuration> {
	double value;
	String metric;
}

class ActivitySearchResponseResultActivitiesModalitiesAmountsFrom with JsonConvert<ActivitySearchResponseResultActivitiesModalitiesAmountsFrom> {
	String paxType;
	int ageFrom;
	int ageTo;
	double amount;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkup with JsonConvert<ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkup> {
	String paxType;
	int ageFrom;
	int ageTo;
	ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup with JsonConvert<ActivitySearchResponseResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
}

class ActivitySearchResponseResultActivitiesModalitiesCancellationPolicy with JsonConvert<ActivitySearchResponseResultActivitiesModalitiesCancellationPolicy> {
	String dateFrom;
	double amount;
}

class ActivitySearchResponseResultActivitiesModalitiesCancellationPoliciesWithMarkup with JsonConvert<ActivitySearchResponseResultActivitiesModalitiesCancellationPoliciesWithMarkup> {
	String dateFrom;
	double amount;
}

class ActivitySearchResponseResultActivitiesContent with JsonConvert<ActivitySearchResponseResultActivitiesContent> {
	String name;
	List<dynamic> detailedInfo;
	List<ActivitySearchResponseResultActivitiesContentFeatureGroup> featureGroups;
	ActivitySearchResponseResultActivitiesContentGuidingOptions guidingOptions;
	dynamic importantInfo;
	ActivitySearchResponseResultActivitiesContentLocation location;
	ActivitySearchResponseResultActivitiesContentMedia media;
	ActivitySearchResponseResultActivitiesContentRedeemInfo redeemInfo;
	List<dynamic> routes;
	ActivitySearchResponseResultActivitiesContentScheduling scheduling;
	List<ActivitySearchResponseResultActivitiesContentSegmantationGroups> segmentationGroups;
	String activityFactsheetType;
	String activityCode;
	String modalityCode;
	String modalityName;
	String contentId;
	String description;
	String lastUpdate;
	dynamic summary;
	List<dynamic> advancedTips;
	List<ActivitySearchResponseResultActivitiesContentCountry> countries;
	List<dynamic> highligths;
}

class ActivitySearchResponseResultActivitiesContentFeatureGroup with JsonConvert<ActivitySearchResponseResultActivitiesContentFeatureGroup> {
	String groupCode;
	dynamic excluded;
}

class ActivitySearchResponseResultActivitiesContentGuidingOptions with JsonConvert<ActivitySearchResponseResultActivitiesContentGuidingOptions> {
	String guideType;
	String included;
}

class ActivitySearchResponseResultActivitiesContentLocation with JsonConvert<ActivitySearchResponseResultActivitiesContentLocation> {
	List<ActivitySearchResponseResultActivitiesContentLocationEndPoint> endPoints;
	List<ActivitySearchResponseResultActivitiesContentLocationStartingPoint> startingPoints;
}

class ActivitySearchResponseResultActivitiesContentLocationEndPoint with JsonConvert<ActivitySearchResponseResultActivitiesContentLocationEndPoint> {
	String type;
	String description;
}

class ActivitySearchResponseResultActivitiesContentLocationStartingPoint with JsonConvert<ActivitySearchResponseResultActivitiesContentLocationStartingPoint> {
	String type;
	ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPoint meetingPoint;
}

class ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPoint with JsonConvert<ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPoint> {
	String type;
	dynamic geolocation;
	dynamic address;
	ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountry country;
	dynamic zip;
	String description;
}

class ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountry with JsonConvert<ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountry> {
	String code;
	String name;
	List<ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination> destinations;
}

class ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination with JsonConvert<ActivitySearchResponseResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination> {
	String code;
	String name;
}

class ActivitySearchResponseResultActivitiesContentMedia with JsonConvert<ActivitySearchResponseResultActivitiesContentMedia> {
	List<ActivitySearchResponseResultActivitiesContentMediaImage> images;
}

class ActivitySearchResponseResultActivitiesContentMediaImage with JsonConvert<ActivitySearchResponseResultActivitiesContentMediaImage> {
	int visualizationOrder;
	String mimeType;
	String language;
	List<ActivitySearchResponseResultActivitiesContentMediaImagesUrl> urls;
}

class ActivitySearchResponseResultActivitiesContentMediaImagesUrl with JsonConvert<ActivitySearchResponseResultActivitiesContentMediaImagesUrl> {
	int dpi;
	int height;
	int width;
	String resource;
	String sizeType;
}

class ActivitySearchResponseResultActivitiesContentRedeemInfo with JsonConvert<ActivitySearchResponseResultActivitiesContentRedeemInfo> {
	String type;
	String directEntrance;
	List<ActivitySearchResponseResultActivitiesContentRedeemInfoCommants> comments;
}

class ActivitySearchResponseResultActivitiesContentRedeemInfoCommants with JsonConvert<ActivitySearchResponseResultActivitiesContentRedeemInfoCommants> {
	dynamic type;
	dynamic text;
}

class ActivitySearchResponseResultActivitiesContentScheduling with JsonConvert<ActivitySearchResponseResultActivitiesContentScheduling> {
	ActivitySearchResponseResultActivitiesContentSchedulingDuration duration;
	dynamic closed;
	List<ActivitySearchResponseResultActivitiesContentSchedulingOpened> opened;
}

class ActivitySearchResponseResultActivitiesContentSchedulingDuration with JsonConvert<ActivitySearchResponseResultActivitiesContentSchedulingDuration> {
	double value;
	String metric;
}

class ActivitySearchResponseResultActivitiesContentSchedulingOpened with JsonConvert<ActivitySearchResponseResultActivitiesContentSchedulingOpened> {
	dynamic from;
	dynamic to;
	String openingTime;
	String closeTime;
	List<dynamic> weekDays;
}

class ActivitySearchResponseResultActivitiesContentSegmantationGroups with JsonConvert<ActivitySearchResponseResultActivitiesContentSegmantationGroups> {
	int code;
	String name;
	List<ActivitySearchResponseResultActivitiesContentSegmantationGroupsSegmants> segments;
}

class ActivitySearchResponseResultActivitiesContentSegmantationGroupsSegmants with JsonConvert<ActivitySearchResponseResultActivitiesContentSegmantationGroupsSegmants> {
	int code;
	String name;
}

class ActivitySearchResponseResultActivitiesContentCountry with JsonConvert<ActivitySearchResponseResultActivitiesContentCountry> {
	String code;
	String name;
	List<ActivitySearchResponseResultActivitiesContentCountriesDestination> destinations;
}

class ActivitySearchResponseResultActivitiesContentCountriesDestination with JsonConvert<ActivitySearchResponseResultActivitiesContentCountriesDestination> {
	String code;
	String name;
}

class ActivitySearchResponseResultActivitiesAmountsFrom with JsonConvert<ActivitySearchResponseResultActivitiesAmountsFrom> {
	String paxType;
	int ageFrom;
	int ageTo;
	double amount;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class ActivitySearchResponseResultActivitiesAmountsFromWithMarkup with JsonConvert<ActivitySearchResponseResultActivitiesAmountsFromWithMarkup> {
	String paxType;
	int ageFrom;
	int ageTo;
	ActivitySearchResponseResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class ActivitySearchResponseResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup with JsonConvert<ActivitySearchResponseResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
}

class ActivitySearchResponseResultActivitiesCountry with JsonConvert<ActivitySearchResponseResultActivitiesCountry> {
	String code;
	String name;
	List<ActivitySearchResponseResultActivitiesCountryDestination> destinations;
}

class ActivitySearchResponseResultActivitiesCountryDestination with JsonConvert<ActivitySearchResponseResultActivitiesCountryDestination> {
	String code;
	String name;
}

class ActivitySearchResponseResultActivitiesOption with JsonConvert<ActivitySearchResponseResultActivitiesOption> {
	String key;
	String value;
}
