

import 'package:json_annotation/json_annotation.dart';

part 'full_details_response.g.dart';


@JsonSerializable()
class FullDetailsResponse {
  dynamic version;
  String message;
  bool isError;
  dynamic responseException;
  FullDetailsResponseResult result;

  FullDetailsResponse(
      {this.version,
        this.message,
        this.isError,
        this.responseException,
        this.result});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseToJson(this) ;


  factory  FullDetailsResponse.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseFromJson(json);

}


@JsonSerializable()
class FullDetailsResponseResult {
  String operationId;
  FullDetailsResponseAuditData auditData;
  FullDetailsResponseActivity activity;
  dynamic errors;

  FullDetailsResponseResult({this.operationId, this.auditData, this.activity, this.errors});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseResultToJson(this) ;


  factory  FullDetailsResponseResult.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseResultFromJson(json);



}


@JsonSerializable()
class FullDetailsResponseAuditData {
  dynamic processTime;
  String time;
  String serverId;
  String environment;

  FullDetailsResponseAuditData({this.processTime, this.time, this.serverId, this.environment});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseAuditDataToJson(this) ;


  factory   FullDetailsResponseAuditData.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseAuditDataFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseActivity {
  String activityCode;
  FullDetailsResponseCountry country;
  List<FullDetailsResponseOperationDays> operationDays;
  List<FullDetailsResponseModalities> modalities;
  String currencyName;
  List<FullDetailsResponseAmountsFromWithMarkup> amountsFromWithMarkup;
  FullDetailsResponseContent content;
  dynamic order;
  String name;
  String currency;
  String code;
  String type;
  int tpa;
  String tpaName;


  FullDetailsResponseActivity(
      {this.activityCode,
        this.country,
        this.operationDays,
        this.modalities,
        this.currencyName,
        this.amountsFromWithMarkup,
        this.content,
        this.order,
        this.name,
        this.currency,
        this.code,
        this.type,
        this.tpa,
        this.tpaName,
      });

  Map<String, dynamic>toJson()=>_$FullDetailsResponseActivityToJson(this) ;


  factory    FullDetailsResponseActivity.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseActivityFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseCountry {
  String code;
  String name;
  List<FullDetailsResponseDestinations> destinations;

  FullDetailsResponseCountry({this.code, this.name, this.destinations});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseCountryToJson(this) ;


  factory FullDetailsResponseCountry.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseCountryFromJson(json);




}


@JsonSerializable()
class FullDetailsResponseDestinations {
  String code;
  String name;

  FullDetailsResponseDestinations({this.code, this.name});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseDestinationsToJson(this) ;


  factory  FullDetailsResponseDestinations.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseDestinationsFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseModalities {
  String code;
  String name;
  FullDetailsResponseDuration duration;
  List<FullDetailsResponseQuestions> questions;
  List<FullDetailsResponseComments> comments;
  FullDetailsResponseSupplierInformation supplierInformation;
  FullDetailsResponseProviderInformation providerInformation;
  String destinationCode;
  FullDetailsResponseContract contract;
  List<dynamic> languages;
  List<FullDetailsResponseAmountsFromWithMarkup> amountsFromWithMarkup;
  List<FullDetailsResponseRates> rates;
  String amountUnitType;
  String uniqueIdentifier;

  FullDetailsResponseModalities(
      {this.code,
        this.name,
        this.duration,
        this.questions,
        this.comments,
        this.supplierInformation,
        this.providerInformation,
        this.destinationCode,
        this.contract,
        this.languages,
        this.amountsFromWithMarkup,
        this.rates,
        this.amountUnitType,
        this.uniqueIdentifier});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseModalitiesToJson(this) ;


  factory  FullDetailsResponseModalities.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseModalitiesFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseOperationDays {
  String code;
  String name;

  FullDetailsResponseOperationDays({this.code, this.name});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseOperationDaysToJson(this) ;


  factory FullDetailsResponseOperationDays.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseOperationDaysFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseDuration {
  dynamic value;
  String metric;

  FullDetailsResponseDuration({this.value, this.metric});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseDurationToJson(this) ;


  factory    FullDetailsResponseDuration.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseDurationFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseQuestions {
  String code;
  String text;
  String required;

  FullDetailsResponseQuestions({this.code, this.text, this.required});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseQuestionsToJson(this) ;


  factory    FullDetailsResponseQuestions.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseQuestionsFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseComments {
  String type;
  String text;

  FullDetailsResponseComments({this.type, this.text});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseCommentsToJson(this) ;


  factory    FullDetailsResponseComments.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseCommentsFromJson(json);

}


@JsonSerializable()
class FullDetailsResponseSupplierInformation {
  String name;
  String vatNumber;

  FullDetailsResponseSupplierInformation({this.name, this.vatNumber});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseSupplierInformationToJson(this) ;


  factory  FullDetailsResponseSupplierInformation.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseSupplierInformationFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseProviderInformation {
  String name;

  FullDetailsResponseProviderInformation({this.name});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseProviderInformationToJson(this) ;


  factory  FullDetailsResponseProviderInformation.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseProviderInformationFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseContract {
  dynamic incomingOffice;
  dynamic code;
  String name;

  FullDetailsResponseContract({this.incomingOffice, this.code, this.name});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseContractToJson(this) ;


  factory  FullDetailsResponseContract.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseContractFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseAmountsFromWithMarkup {
  String paxType;
  dynamic ageFrom;
  dynamic ageTo;
  FullDetailsResponseDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  double boxOfficeAmount;
  String mandatoryApplyAmount;

  FullDetailsResponseAmountsFromWithMarkup(
      {this.paxType,
        this.ageFrom,
        this.ageTo,
        this.displayRateInfoWithMarkup,
        this.boxOfficeAmount,
        this.mandatoryApplyAmount});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseAmountsFromWithMarkupToJson(this) ;


  factory    FullDetailsResponseAmountsFromWithMarkup.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseAmountsFromWithMarkupFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseDisplayRateInfoWithMarkup {
  double totalPriceWithMarkup;
  dynamic baseRate;
  dynamic taxAndOtherCharges;
  dynamic otaTax;
  dynamic markup;
  dynamic supplierBaseRate;
  dynamic supplierTotalCost;
  dynamic currency;

  FullDetailsResponseDisplayRateInfoWithMarkup(
      {this.totalPriceWithMarkup,
        this.baseRate,
        this.taxAndOtherCharges,
        this.otaTax,
        this.markup,
        this.supplierBaseRate,
        this.supplierTotalCost,
        this.currency});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseDisplayRateInfoWithMarkupToJson(this) ;


  factory    FullDetailsResponseDisplayRateInfoWithMarkup.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseDisplayRateInfoWithMarkupFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseRates {
  String rateCode;
  String rateClass;
  String name;
  List<FullDetailsResponseRateDetails> rateDetails;

  FullDetailsResponseRates({this.rateCode, this.rateClass, this.name, this.rateDetails});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseRatesToJson(this) ;


  factory    FullDetailsResponseRates.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseRatesFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseRateDetails {
  String rateKey;
  FullDetailsResponseDuration minimumDuration;
  FullDetailsResponseDuration maximumDuration;


  int tpa;
  String tpaName;


  FullDetailsResponseRateDetails(
      {this.rateKey,

        this.minimumDuration,
        this.maximumDuration,
        this.tpa,
        this.tpaName,
      });

  Map<String, dynamic>toJson()=>_$FullDetailsResponseRateDetailsToJson(this) ;


  factory    FullDetailsResponseRateDetails.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseRateDetailsFromJson(json);


}









@JsonSerializable()
class FullDetailsResponseContent {
  String name;
  List<FullDetailsResponseFeatureGroups> featureGroups;
  FullDetailsResponseGuidingOptions guidingOptions;
  FullDetailsResponseLocation location;
  FullDetailsResponseMedia media;
  List<FullDetailsResponseRoutes> routes;
  FullDetailsResponseScheduling scheduling;
  List<FullDetailsResponseSegmentationGroups> segmentationGroups;
  String activityFactsheetType;
  String activityCode;
  String modalityCode;
  String modalityName;
  String contentId;
  String description;
  String lastUpdate;
  String summary;

  List<String> highligths;

  FullDetailsResponseContent(
      {this.name,

        this.featureGroups,
        this.guidingOptions,

        this.media,
        this.routes,
        this.scheduling,
        this.segmentationGroups,
        this.activityFactsheetType,
        this.activityCode,
        this.modalityCode,
        this.modalityName,
        this.contentId,
        this.description,
        this.lastUpdate,
        this.summary,

        this.highligths});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseContentToJson(this) ;


  factory   FullDetailsResponseContent.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseContentFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseLocation {
  List<FullDetailsResponseEndPoints> endPoints;
  List<FullDetailsResponseStartingPoints> startingPoints;

  FullDetailsResponseLocation({this.endPoints, this.startingPoints});


  Map<String, dynamic>toJson()=>_$FullDetailsResponseLocationToJson(this) ;


  factory   FullDetailsResponseLocation.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseLocationFromJson(json);



}

@JsonSerializable()
class FullDetailsResponseEndPoints {
  String type;
  String description;

  FullDetailsResponseEndPoints({this.type, this.description});


  Map<String, dynamic>toJson()=>_$FullDetailsResponseEndPointsToJson(this) ;


  factory   FullDetailsResponseEndPoints.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseEndPointsFromJson(json);



}


@JsonSerializable()
class FullDetailsResponseStartingPoints {
  String type;
  FullDetailsResponseMeetingPoint meetingPoint;

  FullDetailsResponseStartingPoints({this.type, this.meetingPoint});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseStartingPointsToJson(this) ;


  factory   FullDetailsResponseStartingPoints.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseStartingPointsFromJson(json);



}


@JsonSerializable()
class FullDetailsResponseMeetingPoint {
  String type;
  FullDetailsResponseGeolocation geolocation;
  String address;
  FullDetailsResponseCountry country;
  dynamic zip;
  String description;

  FullDetailsResponseMeetingPoint(
      {this.type,
        this.geolocation,
        this.address,
        this.country,
        this.zip,
        this.description});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseMeetingPointToJson(this) ;


  factory   FullDetailsResponseMeetingPoint.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseMeetingPointFromJson(json);



}


@JsonSerializable()
class FullDetailsResponseFeatureGroups {
  String groupCode;
  List<FullDetailsResponseIncluded> included;

  FullDetailsResponseFeatureGroups({this.groupCode, this.included});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseFeatureGroupsToJson(this);


  factory    FullDetailsResponseFeatureGroups.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseFeatureGroupsFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseIncluded {
  String featureType;
  String description;

  FullDetailsResponseIncluded({this.featureType, this.description});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseIncludedToJson(this) ;


  factory    FullDetailsResponseIncluded.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseIncludedFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseGuidingOptions {
  String guideType;
  String included;

  FullDetailsResponseGuidingOptions({this.guideType, this.included});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseGuidingOptionsToJson(this) ;


  factory    FullDetailsResponseGuidingOptions.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseGuidingOptionsFromJson(json);


}




@JsonSerializable()
class FullDetailsResponseMedia {
  List<FullDetailsResponseImages> images;

  FullDetailsResponseMedia({this.images});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseMediaToJson(this) ;


  factory   FullDetailsResponseMedia.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseMediaFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseImages {
  int visualizationOrder;
  String mimeType;
  String language;
  List<FullDetailsResponseUrls> urls;

  FullDetailsResponseImages({this.visualizationOrder, this.mimeType, this.language, this.urls});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseImagesToJson(this) ;


  factory   FullDetailsResponseImages.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseImagesFromJson(json);

}


@JsonSerializable()
class FullDetailsResponseUrls {
  dynamic dpi;
  int height;
  int width;
  String resource;
  String sizeType;

  FullDetailsResponseUrls({this.dpi, this.height, this.width, this.resource, this.sizeType});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseUrlsToJson(this) ;


  factory   FullDetailsResponseUrls.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseUrlsFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseRoutes {
  FullDetailsResponseDuration duration;
  String description;
  String timeFrom;
  String timeTo;
  List<FullDetailsResponsePoints> points;

  FullDetailsResponseRoutes(
      {this.duration,
        this.description,
        this.timeFrom,
        this.timeTo,
        this.points});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseRoutesToJson(this) ;


  factory    FullDetailsResponseRoutes.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseRoutesFromJson(json);


}


@JsonSerializable()
class FullDetailsResponsePoints {
  String type;
  int order;
  bool stop;
  FullDetailsResponsePointOfInterest pointOfInterest;

  FullDetailsResponsePoints({this.type, this.order, this.stop, this.pointOfInterest});

  Map<String, dynamic>toJson()=>_$FullDetailsResponsePointsToJson(this) ;


  factory   FullDetailsResponsePoints.fromJson(Map<String, dynamic> json) => _$FullDetailsResponsePointsFromJson(json);


}


@JsonSerializable()
class FullDetailsResponsePointOfInterest {
  String type;
  FullDetailsResponseGeolocation geolocation;
  String address;
  FullDetailsResponseCountry country;
  String city;
  String zip;
  String description;

  FullDetailsResponsePointOfInterest(
      {this.type,
        this.geolocation,
        this.address,
        this.country,
        this.city,
        this.zip,
        this.description});

  Map<String, dynamic>toJson()=>_$FullDetailsResponsePointOfInterestToJson(this) ;


  factory    FullDetailsResponsePointOfInterest.fromJson(Map<String, dynamic> json) => _$FullDetailsResponsePointOfInterestFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseGeolocation {
  double latitude;
  double longitude;

  FullDetailsResponseGeolocation({this.latitude, this.longitude});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseGeolocationToJson(this) ;


  factory   FullDetailsResponseGeolocation.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseGeolocationFromJson(json);


}




@JsonSerializable()
class FullDetailsResponseScheduling {
  FullDetailsResponseDuration duration;
  List<FullDetailsResponseOpened> opened;

  FullDetailsResponseScheduling({this.duration, this.opened});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseSchedulingToJson(this) ;


  factory   FullDetailsResponseScheduling.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseSchedulingFromJson(json);


}




@JsonSerializable()
class FullDetailsResponseOpened {
  dynamic from;
  dynamic to;
  String openingTime;
  String closeTime;
  List<dynamic> weekDays;

  FullDetailsResponseOpened({this.from, this.to, this.openingTime, this.closeTime, this.weekDays});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseOpenedToJson(this) ;


  factory    FullDetailsResponseOpened.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseOpenedFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseSegmentationGroups {
  int code;
  String name;
  List<FullDetailsResponseSegments> segments;

  FullDetailsResponseSegmentationGroups({this.code, this.name, this.segments});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseSegmentationGroupsToJson(this);


  factory   FullDetailsResponseSegmentationGroups.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseSegmentationGroupsFromJson(json);


}


@JsonSerializable()
class FullDetailsResponseSegments {
  int code;
  String name;

  FullDetailsResponseSegments({this.code, this.name});

  Map<String, dynamic>toJson()=>_$FullDetailsResponseSegmentsToJson(this) ;


  factory    FullDetailsResponseSegments.fromJson(Map<String, dynamic> json) => _$FullDetailsResponseSegmentsFromJson(json);


}