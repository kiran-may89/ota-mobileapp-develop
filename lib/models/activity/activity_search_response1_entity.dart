import 'package:ota/generated/json/base/json_convert_content.dart';

class ActivitySearchResponse1Entity with JsonConvert<ActivitySearchResponse1Entity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	ActivitySearchResponse1Result result;
}

class ActivitySearchResponse1Result with JsonConvert<ActivitySearchResponse1Result> {
	String operationId;
	ActivitySearchResponse1ResultPagination pagination;
	ActivitySearchResponse1ResultAuditData auditData;
	List<ActivitySearchResponse1ResultActivity> activities;
	String summaryLog;
}

class ActivitySearchResponse1ResultPagination with JsonConvert<ActivitySearchResponse1ResultPagination> {
	int itemsPerPage;
	int page;
	int totalItems;
}

class ActivitySearchResponse1ResultAuditData with JsonConvert<ActivitySearchResponse1ResultAuditData> {
	double processTime;
	String time;
	String serverId;
	String environment;
}

class ActivitySearchResponse1ResultActivity with JsonConvert<ActivitySearchResponse1ResultActivity> {
	String code;
	String type;
	String countryCode;
	String source;
	String name;
	String currency;
	List<ActivitySearchResponse1ResultActivitiesModality> modalities;
	ActivitySearchResponse1ResultActivitiesContent content;
	int order;
	List<ActivitySearchResponse1ResultActivitiesAmountsFrom> amountsFrom;
	List<ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkup> amountsFromWithMarkup;
	String currencyName;
	ActivitySearchResponse1ResultActivitiesCountry country;
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
	List<ActivitySearchResponse1ResultActivitiesOption> options;
}

class ActivitySearchResponse1ResultActivitiesModality with JsonConvert<ActivitySearchResponse1ResultActivitiesModality> {
	String code;
	String name;
	String rateCode;
	ActivitySearchResponse1ResultActivitiesModalitiesDuration duration;
	List<ActivitySearchResponse1ResultActivitiesModalitiesAmountsFrom> amountsFrom;
	List<ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkup> amountsFromWithMarkup;
	List<ActivitySearchResponse1ResultActivitiesModalitiesCancellationPolicy> cancellationPolicies;
	List<ActivitySearchResponse1ResultActivitiesModalitiesCancellationPoliciesWithMarkup> cancellationPoliciesWithMarkup;
	String uniqueIdentifier;
}

class ActivitySearchResponse1ResultActivitiesModalitiesDuration with JsonConvert<ActivitySearchResponse1ResultActivitiesModalitiesDuration> {
	double value;
	String metric;
}

class ActivitySearchResponse1ResultActivitiesModalitiesAmountsFrom with JsonConvert<ActivitySearchResponse1ResultActivitiesModalitiesAmountsFrom> {
	String paxType;
	int ageFrom;
	int ageTo;
	double amount;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkup with JsonConvert<ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkup> {
	String paxType;
	int ageFrom;
	int ageTo;
	ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup with JsonConvert<ActivitySearchResponse1ResultActivitiesModalitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
}

class ActivitySearchResponse1ResultActivitiesModalitiesCancellationPolicy with JsonConvert<ActivitySearchResponse1ResultActivitiesModalitiesCancellationPolicy> {
	String dateFrom;
	double amount;
}

class ActivitySearchResponse1ResultActivitiesModalitiesCancellationPoliciesWithMarkup with JsonConvert<ActivitySearchResponse1ResultActivitiesModalitiesCancellationPoliciesWithMarkup> {
	String dateFrom;
	double amount;
}

class ActivitySearchResponse1ResultActivitiesContent with JsonConvert<ActivitySearchResponse1ResultActivitiesContent> {
	String name;
	List<dynamic> detailedInfo;
	List<ActivitySearchResponse1ResultActivitiesContentFeatureGroup> featureGroups;
	ActivitySearchResponse1ResultActivitiesContentGuidingOptions guidingOptions;
	dynamic importantInfo;
	ActivitySearchResponse1ResultActivitiesContentLocation location;
	ActivitySearchResponse1ResultActivitiesContentMedia media;
	ActivitySearchResponse1ResultActivitiesContentRedeemInfo redeemInfo;
	List<ActivitySearchResponse1ResultActivitiesContentRoute> routes;
	ActivitySearchResponse1ResultActivitiesContentScheduling scheduling;
	List<ActivitySearchResponse1ResultActivitiesContentSegmantationGroups> segmentationGroups;
	String activityFactsheetType;
	String activityCode;
	String modalityCode;
	String modalityName;
	String contentId;
	String description;
	String lastUpdate;
	String summary;
	List<dynamic> advancedTips;
	List<ActivitySearchResponse1ResultActivitiesContentCountry> countries;
	List<String> highligths;
}

class ActivitySearchResponse1ResultActivitiesContentFeatureGroup with JsonConvert<ActivitySearchResponse1ResultActivitiesContentFeatureGroup> {
	String groupCode;
	dynamic excluded;
}

class ActivitySearchResponse1ResultActivitiesContentGuidingOptions with JsonConvert<ActivitySearchResponse1ResultActivitiesContentGuidingOptions> {
	String guideType;
	String included;
}

class ActivitySearchResponse1ResultActivitiesContentLocation with JsonConvert<ActivitySearchResponse1ResultActivitiesContentLocation> {
	List<ActivitySearchResponse1ResultActivitiesContentLocationEndPoint> endPoints;
	List<ActivitySearchResponse1ResultActivitiesContentLocationStartingPoint> startingPoints;
}

class ActivitySearchResponse1ResultActivitiesContentLocationEndPoint with JsonConvert<ActivitySearchResponse1ResultActivitiesContentLocationEndPoint> {
	String type;
	String description;
}

class ActivitySearchResponse1ResultActivitiesContentLocationStartingPoint with JsonConvert<ActivitySearchResponse1ResultActivitiesContentLocationStartingPoint> {
	String type;
	ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPoint meetingPoint;
}

class ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPoint with JsonConvert<ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPoint> {
	String type;
	dynamic geolocation;
	dynamic address;
	ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountry country;
	dynamic zip;
	String description;
}

class ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountry with JsonConvert<ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountry> {
	String code;
	String name;
	List<ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination> destinations;
}

class ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination with JsonConvert<ActivitySearchResponse1ResultActivitiesContentLocationStartingPointsMeetingPointCountryDestination> {
	String code;
	String name;
}

class ActivitySearchResponse1ResultActivitiesContentMedia with JsonConvert<ActivitySearchResponse1ResultActivitiesContentMedia> {
	List<ActivitySearchResponse1ResultActivitiesContentMediaImage> images;
}

class ActivitySearchResponse1ResultActivitiesContentMediaImage with JsonConvert<ActivitySearchResponse1ResultActivitiesContentMediaImage> {
	int visualizationOrder;
	String mimeType;
	String language;
	List<ActivitySearchResponse1ResultActivitiesContentMediaImagesUrl> urls;
}

class ActivitySearchResponse1ResultActivitiesContentMediaImagesUrl with JsonConvert<ActivitySearchResponse1ResultActivitiesContentMediaImagesUrl> {
	int dpi;
	int height;
	int width;
	String resource;
	String sizeType;
}

class ActivitySearchResponse1ResultActivitiesContentRedeemInfo with JsonConvert<ActivitySearchResponse1ResultActivitiesContentRedeemInfo> {
	String type;
	String directEntrance;
	List<ActivitySearchResponse1ResultActivitiesContentRedeemInfoCommants> comments;
}

class ActivitySearchResponse1ResultActivitiesContentRedeemInfoCommants with JsonConvert<ActivitySearchResponse1ResultActivitiesContentRedeemInfoCommants> {
	dynamic type;
	dynamic text;
}

class ActivitySearchResponse1ResultActivitiesContentRoute with JsonConvert<ActivitySearchResponse1ResultActivitiesContentRoute> {
	ActivitySearchResponse1ResultActivitiesContentRoutesDuration duration;
	String description;
	String timeFrom;
	String timeTo;
	List<ActivitySearchResponse1ResultActivitiesContentRoutesPoint> points;
}

class ActivitySearchResponse1ResultActivitiesContentRoutesDuration with JsonConvert<ActivitySearchResponse1ResultActivitiesContentRoutesDuration> {
	double value;
	String metric;
}

class ActivitySearchResponse1ResultActivitiesContentRoutesPoint with JsonConvert<ActivitySearchResponse1ResultActivitiesContentRoutesPoint> {
	String type;
	int order;
	bool stop;
	ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterest pointOfInterest;
}

class ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterest with JsonConvert<ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterest> {
	String type;
	ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestGeolocation geolocation;
	String address;
	ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestCountry country;
	String city;
	String zip;
	String description;
}

class ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestGeolocation with JsonConvert<ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestGeolocation> {
	double latitude;
	double longitude;
}

class ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestCountry with JsonConvert<ActivitySearchResponse1ResultActivitiesContentRoutesPointsPointOfInterestCountry> {
	String code;
}

class ActivitySearchResponse1ResultActivitiesContentScheduling with JsonConvert<ActivitySearchResponse1ResultActivitiesContentScheduling> {
	ActivitySearchResponse1ResultActivitiesContentSchedulingDuration duration;
	dynamic closed;
	List<ActivitySearchResponse1ResultActivitiesContentSchedulingOpened> opened;
}

class ActivitySearchResponse1ResultActivitiesContentSchedulingDuration with JsonConvert<ActivitySearchResponse1ResultActivitiesContentSchedulingDuration> {
	double value;
	String metric;
}

class ActivitySearchResponse1ResultActivitiesContentSchedulingOpened with JsonConvert<ActivitySearchResponse1ResultActivitiesContentSchedulingOpened> {
	dynamic from;
	dynamic to;
	String openingTime;
	String closeTime;
	List<dynamic> weekDays;
}

class ActivitySearchResponse1ResultActivitiesContentSegmantationGroups with JsonConvert<ActivitySearchResponse1ResultActivitiesContentSegmantationGroups> {
	int code;
	String name;
	List<ActivitySearchResponse1ResultActivitiesContentSegmantationGroupsSegmants> segments;
}

class ActivitySearchResponse1ResultActivitiesContentSegmantationGroupsSegmants with JsonConvert<ActivitySearchResponse1ResultActivitiesContentSegmantationGroupsSegmants> {
	int code;
	String name;
}

class ActivitySearchResponse1ResultActivitiesContentCountry with JsonConvert<ActivitySearchResponse1ResultActivitiesContentCountry> {
	String code;
	String name;
	List<ActivitySearchResponse1ResultActivitiesContentCountriesDestination> destinations;
}

class ActivitySearchResponse1ResultActivitiesContentCountriesDestination with JsonConvert<ActivitySearchResponse1ResultActivitiesContentCountriesDestination> {
	String code;
	String name;
}

class ActivitySearchResponse1ResultActivitiesAmountsFrom with JsonConvert<ActivitySearchResponse1ResultActivitiesAmountsFrom> {
	String paxType;
	int ageFrom;
	int ageTo;
	double amount;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkup with JsonConvert<ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkup> {
	String paxType;
	int ageFrom;
	int ageTo;
	ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	double boxOfficeAmount;
	String mandatoryApplyAmount;
}

class ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup with JsonConvert<ActivitySearchResponse1ResultActivitiesAmountsFromWithMarkupDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
}

class ActivitySearchResponse1ResultActivitiesCountry with JsonConvert<ActivitySearchResponse1ResultActivitiesCountry> {
	String code;
	String name;
	List<ActivitySearchResponse1ResultActivitiesCountryDestination> destinations;
}

class ActivitySearchResponse1ResultActivitiesCountryDestination with JsonConvert<ActivitySearchResponse1ResultActivitiesCountryDestination> {
	String code;
	String name;
}

class ActivitySearchResponse1ResultActivitiesOption with JsonConvert<ActivitySearchResponse1ResultActivitiesOption> {
	String key;
	String value;
}
