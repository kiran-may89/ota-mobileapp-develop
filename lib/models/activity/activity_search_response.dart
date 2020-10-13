import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity_search_response.g.dart';

@JsonSerializable()
class ActivitySearchResponse {
  String message;
  bool isError;
  dynamic responseException;
  ActivitySearchResponseResult result;

  ActivitySearchResponse({this.message, this.isError, this.responseException, this.result});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseToJson(this);

  factory ActivitySearchResponse.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseResult {
  String operationId;
  ActivitySearchResponsePagination pagination;
  ActivitySearchResponseAuditData auditData;
  List<ActivitySearchResponseActivities> activities;
  String summaryLog;

  ActivitySearchResponseResult({this.operationId, this.pagination, this.auditData, this.activities, this.summaryLog});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseResultToJson(this);

  factory ActivitySearchResponseResult.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseResultFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponsePagination {
  int itemsPerPage;
  int page;
  int totalItems;

  ActivitySearchResponsePagination({this.itemsPerPage, this.page, this.totalItems});

  Map<String, dynamic> toJson() => _$ActivitySearchResponsePaginationToJson(this);

  factory ActivitySearchResponsePagination.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponsePaginationFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseAuditData {
  dynamic processTime;
  String time;
  String serverId;
  String environment;

  ActivitySearchResponseAuditData({this.processTime, this.time, this.serverId, this.environment});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseAuditDataToJson(this);

  factory ActivitySearchResponseAuditData.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseAuditDataFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseActivities {
  String code;
  String type;
  String countryCode;
  String source;
  String name;
  String currency;
  ActivitySearchResponseContent content;
  int order;
  List<ActivitySearchResponseAmountsFromWithMarkup> amountsFromWithMarkup;
  String currencyName;
  ActivitySearchResponseCountries country;
  int tpa;
  String tpaName;
  List<ActivitySearchResponseOptions> options;

  ActivitySearchResponseActivities(
      {this.code,
      this.type,
      this.countryCode,
      this.source,
      this.name,
      this.currency,
      this.content,
      this.order,
      this.amountsFromWithMarkup,
      this.currencyName,
      this.country,
      this.tpa,
      this.tpaName,
      this.options});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseActivitiesToJson(this);

  factory ActivitySearchResponseActivities.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseActivitiesFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseContent {
  String name;
  ActivitySearchResponseScheduling scheduling;
  ActivitySearchResponseMedia media;
  List<ActivitySearchResponseSegmentationGroups> segmentationGroups;
  String activityFactsheetType;
  String activityCode;
  String modalityCode;
  String modalityName;
  String contentId;
  String lastUpdate;
  String summary;

  List<ActivitySearchResponseCountries> countries;

  ActivitySearchResponseContent(
      {this.name,
      this.media,
      this.segmentationGroups,
      this.activityFactsheetType,
      this.activityCode,
      this.modalityCode,
      this.modalityName,
      this.contentId,
      this.lastUpdate,
      this.summary,
      this.countries});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseContentToJson(this);

  factory ActivitySearchResponseContent.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseContentFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseMedia {
  List<ActivitySearchResponseImages> images;

  ActivitySearchResponseMedia({this.images});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseMediaToJson(this);

  factory ActivitySearchResponseMedia.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseMediaFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseScheduling {
  ActivitySearchResponseDuration duration;
  List<ActivitySearchResponseClosed> closed;
  List<ActivitySearchResponseOpened> opened;

  ActivitySearchResponseScheduling({this.duration, this.closed, this.opened});

  factory ActivitySearchResponseScheduling.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseSchedulingFromJson(json);

  Map<String, dynamic> toJson() => _$ActivitySearchResponseSchedulingToJson(this);
}

@JsonSerializable()
class ActivitySearchResponseOpened {
  String from;
  String to;
  String openingTime;
  String closeTime;
  List<String> weekDays;

  ActivitySearchResponseOpened({this.from, this.to, this.openingTime, this.closeTime, this.weekDays});

  factory ActivitySearchResponseOpened.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseOpenedFromJson(json);

  Map<String, dynamic> toJson() => _$ActivitySearchResponseOpenedToJson(this);
}

@JsonSerializable()
class ActivitySearchResponseDuration {
  dynamic value;
  String metric;

  ActivitySearchResponseDuration({this.value, this.metric});

  factory ActivitySearchResponseDuration.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseDurationFromJson(json);

  Map<String, dynamic> toJson() => _$ActivitySearchResponseDurationToJson(this);
}

@JsonSerializable()
class ActivitySearchResponseClosed {
  String from;
  String to;
  String openingTime;
  String closeTime;
  List<String> weekDays;

  ActivitySearchResponseClosed({this.from, this.to, this.openingTime, this.closeTime, this.weekDays});

  factory ActivitySearchResponseClosed.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseClosedFromJson(json);

  Map<String, dynamic> toJson() => _$ActivitySearchResponseClosedToJson(this);
}

@JsonSerializable()
class ActivitySearchResponseImages {
  int visualizationOrder;
  String mimeType;
  String language;
  List<ActivitySearchResponseUrls> urls;

  ActivitySearchResponseImages({this.visualizationOrder, this.mimeType, this.language, this.urls});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseImagesToJson(this);

  factory ActivitySearchResponseImages.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseImagesFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseUrls {
  dynamic dpi;
  int height;
  int width;
  String resource;
  String sizeType;

  ActivitySearchResponseUrls({this.dpi, this.height, this.width, this.resource, this.sizeType});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseUrlsToJson(this);

  factory ActivitySearchResponseUrls.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseUrlsFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseSegmentationGroups {
  dynamic code;
  String name;
  List<ActivitySearchResponseSegments> segments;

  ActivitySearchResponseSegmentationGroups({this.code, this.name, this.segments});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseSegmentationGroupsToJson(this);

  factory ActivitySearchResponseSegmentationGroups.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseSegmentationGroupsFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseSegments extends Equatable {
  int code;
  String name;

  ActivitySearchResponseSegments({this.code, this.name});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseSegmentsToJson(this);

  factory ActivitySearchResponseSegments.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseSegmentsFromJson(json);

  @override
  // TODO: implement props
  List<Object> get props => [this.name];
  bool contains(Object element) {
    return false;
  }
}

@JsonSerializable()
class ActivitySearchResponseCountries {
  String code;
  String name;
  List<ActivitySearchResponseDestinations> destinations;

  ActivitySearchResponseCountries({this.code, this.name, this.destinations});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseCountriesToJson(this);

  factory ActivitySearchResponseCountries.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseCountriesFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseDestinations {
  String code;
  String name;

  ActivitySearchResponseDestinations({this.code, this.name});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseDestinationsToJson(this);

  factory ActivitySearchResponseDestinations.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseDestinationsFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseAmountsFromWithMarkup {
  String paxType;
  int ageFrom;
  int ageTo;
  ActivitySearchResponseDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  double boxOfficeAmount;
  String mandatoryApplyAmount;

  ActivitySearchResponseAmountsFromWithMarkup(
      {this.paxType, this.ageFrom, this.ageTo, this.displayRateInfoWithMarkup, this.boxOfficeAmount, this.mandatoryApplyAmount});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseAmountsFromWithMarkupToJson(this);

  factory ActivitySearchResponseAmountsFromWithMarkup.fromJson(Map<String, dynamic> json) =>
      _$ActivitySearchResponseAmountsFromWithMarkupFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseDisplayRateInfoWithMarkup {
  double totalPriceWithMarkup;
  double baseRate;
  double taxAndOtherCharges;
  double otaTax;
  double markup;
  double supplierBaseRate;
  double supplierTotalCost;
  String currency;

  ActivitySearchResponseDisplayRateInfoWithMarkup(
      {this.totalPriceWithMarkup,
      this.baseRate,
      this.taxAndOtherCharges,
      this.otaTax,
      this.markup,
      this.supplierBaseRate,
      this.supplierTotalCost,
      this.currency});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseDisplayRateInfoWithMarkupToJson(this);

  factory ActivitySearchResponseDisplayRateInfoWithMarkup.fromJson(Map<String, dynamic> json) =>
      _$ActivitySearchResponseDisplayRateInfoWithMarkupFromJson(json);
}

@JsonSerializable()
class ActivitySearchResponseOptions {
  String key;
  String value;

  ActivitySearchResponseOptions({this.key, this.value});

  Map<String, dynamic> toJson() => _$ActivitySearchResponseOptionsToJson(this);

  factory ActivitySearchResponseOptions.fromJson(Map<String, dynamic> json) => _$ActivitySearchResponseOptionsFromJson(json);
}
