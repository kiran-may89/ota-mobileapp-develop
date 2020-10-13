

import 'package:json_annotation/json_annotation.dart';

part 'small_details_response.g.dart';


@JsonSerializable()
class SmallDetailsResponse {
  dynamic version;
  String message;
  bool isError;
  dynamic responseException;
  SmallDetailsResponseResult result;

  SmallDetailsResponse(
      {this.version,
        this.message,
        this.isError,
        this.responseException,
        this.result});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseToJson(this) ;


  factory  SmallDetailsResponse.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseFromJson(json);








}
@JsonSerializable()
class SmallDetailsResponseResult {
  String operationId;
  SmallDetailsResponseActivity activity;

  SmallDetailsResponseResult({this.operationId, this.activity});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseResultToJson(this) ;


  factory  SmallDetailsResponseResult.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseResultFromJson(json);


}
@JsonSerializable()
class SmallDetailsResponseActivity {
  String activityCode;
  SmallDetailsResponseCountry country;
  List<SmallDetailsResponseModalities> modalities;
  String currencyName;
  List<SmallDetailsResponseAmountsFromWithMarkup> amountsFromWithMarkup;
  int order;
  String name;
  String currency;
  String code;
  String type;
  int tpa;
  String tpaName;
  List<SmallDetailsResponseOptions> options;

  SmallDetailsResponseActivity(
      {this.activityCode,
        this.country,
        this.modalities,
        this.currencyName,
        this.amountsFromWithMarkup,
        this.order,
        this.name,
        this.currency,
        this.code,
        this.type,
        this.tpa,
        this.tpaName,
        this.options});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseActivityToJson(this) ;


  factory  SmallDetailsResponseActivity.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseActivityFromJson(json);


}
@JsonSerializable()
class SmallDetailsResponseCountry {
  String code;
  String name;
  List<SmallDetailsResponseDestinations> destinations;

  SmallDetailsResponseCountry({this.code, this.name, this.destinations});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseCountryToJson(this) ;


  factory  SmallDetailsResponseCountry.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseCountryFromJson(json);


}
@JsonSerializable()
class SmallDetailsResponseDestinations {
  String code;
  String name;

  SmallDetailsResponseDestinations({this.code, this.name});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseDestinationsToJson(this) ;


  factory  SmallDetailsResponseDestinations.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseDestinationsFromJson(json);


}
@JsonSerializable()
class SmallDetailsResponseModalities {
  String code;
  String name;
  SmallDetailsResponseDuration duration;
  List<SmallDetailsResponseQuestions> questions;
  List<SmallDetailsResponseAmountsFromWithMarkup> amountsFromWithMarkup;
  List<SmallDetailsResponseRates> rates;
  String amountUnitType;
  String uniqueIdentifier;
  List<SmallDetailsResponseComment> comments;
  SmallDetailsResponseSupplierInformation supplierInformation;
  SmallDetailsResponseProviderInformation providerInformation;
  String destinationCode;
  SmallDetailsResponseContract contract;
  List<dynamic> languages;
  List<SmallDetailsResponseAmountsFrom> amountsFrom;






  SmallDetailsResponseModalities(
      {this.code,
        this.name,
        this.duration,
        this.comments,
        this.questions,
        this.amountsFromWithMarkup,
        this.rates,
        this.amountUnitType,
        this.uniqueIdentifier});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseModalitiesToJson(this) ;


  factory  SmallDetailsResponseModalities.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseModalitiesFromJson(json);


}

@JsonSerializable()
class SmallDetailsResponseAmountsFrom {
  SmallDetailsResponseAmountsFrom({
    this.paxType,
    this.ageFrom,
    this.ageTo,
    this.amount,
    this.boxOfficeAmount,
    this.mandatoryApplyAmount,
    this.displayRateInfoWithMarkup,
  });

  String paxType;
  int ageFrom;
  int ageTo;
  double amount;
  double boxOfficeAmount;
  String mandatoryApplyAmount;
  SmallDetailsResponseDisplayRateInfoWithMarkup displayRateInfoWithMarkup;


  Map<String, dynamic>toJson()=>_$SmallDetailsResponseAmountsFromToJson(this) ;


  factory  SmallDetailsResponseAmountsFrom.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseAmountsFromFromJson(json);



}


@JsonSerializable()
class SmallDetailsResponseSupplierInformation {
  SmallDetailsResponseSupplierInformation({
    this.name,
    this.vatNumber,
  });

  String name;
  String vatNumber;

  Map<String, dynamic>toJson()=>_$SmallDetailsResponseSupplierInformationToJson(this);


  factory  SmallDetailsResponseSupplierInformation.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseSupplierInformationFromJson(json);

}

@JsonSerializable()
class SmallDetailsResponseProviderInformation {
  SmallDetailsResponseProviderInformation({
    this.name,
  });

  String name;

  Map<String, dynamic>toJson()=>_$SmallDetailsResponseProviderInformationToJson(this);


  factory  SmallDetailsResponseProviderInformation.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseProviderInformationFromJson(json);


}

@JsonSerializable()
class  SmallDetailsResponseContract {
  SmallDetailsResponseContract({
    this.incomingOffice,
    this.code,
    this.name,
  });

  int incomingOffice;
  int code;
  String name;

  Map<String, dynamic>toJson()=>_$SmallDetailsResponseContractToJson(this);


  factory  SmallDetailsResponseContract.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseContractFromJson(json);


}
@JsonSerializable()
class SmallDetailsResponseComment {
  String type;
  String text;

  SmallDetailsResponseComment({
    this.type,
    this.text,
  });

  Map<String, dynamic>toJson()=>_$SmallDetailsResponseCommentToJson(this);


  factory  SmallDetailsResponseComment.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseCommentFromJson(json);


}


@JsonSerializable()
class SmallDetailsResponseQuestions {
  String code;
  String text;
  String required;

  SmallDetailsResponseQuestions({this.code, this.text, this.required});

  Map<String, dynamic>toJson()=>_$SmallDetailsResponseQuestionsToJson(this) ;

  factory    SmallDetailsResponseQuestions.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseQuestionsFromJson(json);


}


@JsonSerializable()
class SmallDetailsResponseDuration {
  dynamic value;
  String metric;

  SmallDetailsResponseDuration({this.value, this.metric});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseDurationToJson(this) ;


  factory  SmallDetailsResponseDuration.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseDurationFromJson(json);



}


@JsonSerializable()
class SmallDetailsResponseAmountsFromWithMarkup {
  String paxType;
  int ageFrom;
  int ageTo;
  SmallDetailsResponseDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  double boxOfficeAmount;
  String mandatoryApplyAmount;

  SmallDetailsResponseAmountsFromWithMarkup(
      {this.paxType,
        this.ageFrom,
        this.ageTo,
        this.displayRateInfoWithMarkup,
        this.boxOfficeAmount,
        this.mandatoryApplyAmount});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseAmountsFromWithMarkupToJson(this) ;


  factory  SmallDetailsResponseAmountsFromWithMarkup.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseAmountsFromWithMarkupFromJson(json);




}
@JsonSerializable()
class SmallDetailsResponseDisplayRateInfoWithMarkup {
  double totalPriceWithMarkup;
  double baseRate;
  double taxAndOtherCharges;
  double otaTax;
  double markup;
  double supplierBaseRate;
  double supplierTotalCost;
  String currency;

  SmallDetailsResponseDisplayRateInfoWithMarkup(
      {this.totalPriceWithMarkup,
        this.baseRate,
        this.taxAndOtherCharges,
        this.otaTax,
        this.markup,
        this.supplierBaseRate,
        this.supplierTotalCost,
        this.currency});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseDisplayRateInfoWithMarkupToJson(this) ;


  factory  SmallDetailsResponseDisplayRateInfoWithMarkup.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseDisplayRateInfoWithMarkupFromJson(json);


}
@JsonSerializable()
class SmallDetailsResponseRates {
  String rateCode;
  String rateClass;
  String name;
  List<SmallDetailsResponseRateDetails> rateDetails;

  SmallDetailsResponseRates({this.rateCode, this.rateClass, this.name, this.rateDetails});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseRatesToJson(this) ;


  factory  SmallDetailsResponseRates.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseRatesFromJson(json);


}
@JsonSerializable()
class SmallDetailsResponseRateDetails {
  String rateKey;
  List<SmallDetailsResponseOperationDatesWithMarkup> operationDatesWithMarkup;
  SmallDetailsResponseTotalAmountWithMarkup totalAmountWithMarkup;
  List<SmallDetailsResponsePaxAmountsWithMarkup> paxAmountsWithMarkup;
  int tpa;
  String tpaName;
  List<SmallDetailsResponseOptions> options;

  SmallDetailsResponseRateDetails(
      {this.rateKey,
        this.operationDatesWithMarkup,
        this.totalAmountWithMarkup,
        this.paxAmountsWithMarkup,
        this.tpa,
        this.tpaName,
        this.options});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseRateDetailsToJson(this) ;


  factory  SmallDetailsResponseRateDetails.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseRateDetailsFromJson(json);




}
@JsonSerializable()
class SmallDetailsResponseOperationDatesWithMarkup {
  String from;
  String to;
  List<SmallDetailsResponseCancellationPolicies> cancellationPolicies;

  SmallDetailsResponseOperationDatesWithMarkup({this.from, this.to, this.cancellationPolicies});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseOperationDatesWithMarkupToJson(this) ;


  factory  SmallDetailsResponseOperationDatesWithMarkup.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseOperationDatesWithMarkupFromJson(json);




}
@JsonSerializable()
class SmallDetailsResponseCancellationPolicies {
  String dateFrom;
  double amount;

  SmallDetailsResponseCancellationPolicies({this.dateFrom, this.amount});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseCancellationPoliciesToJson(this) ;


  factory  SmallDetailsResponseCancellationPolicies.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseCancellationPoliciesFromJson(json);


}
@JsonSerializable()
class SmallDetailsResponseTotalAmountWithMarkup {
  SmallDetailsResponseDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  double boxOfficeAmount;
  String mandatoryApplyAmount;

  SmallDetailsResponseTotalAmountWithMarkup(
      {this.displayRateInfoWithMarkup,
        this.boxOfficeAmount,
        this.mandatoryApplyAmount});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseTotalAmountWithMarkupToJson(this) ;


  factory  SmallDetailsResponseTotalAmountWithMarkup.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseTotalAmountWithMarkupFromJson(json);


}
@JsonSerializable()
class SmallDetailsResponseOptions {
  String key;
  String value;

  SmallDetailsResponseOptions({this.key, this.value});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponseOptionsToJson(this) ;


  factory  SmallDetailsResponseOptions.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponseOptionsFromJson(json);

}


@JsonSerializable()
class SmallDetailsResponsePaxAmountsWithMarkup {
  String paxType;
  int ageFrom;
  int ageTo;
  SmallDetailsResponseDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
  double boxOfficeAmount;
  String mandatoryApplyAmount;

  SmallDetailsResponsePaxAmountsWithMarkup({this.paxType,
    this.ageFrom,
    this.ageTo,
    this.displayRateInfoWithMarkup,
    this.boxOfficeAmount,
    this.mandatoryApplyAmount});

   Map<String, dynamic>toJson()=>_$SmallDetailsResponsePaxAmountsWithMarkupToJson(this) ;


  factory  SmallDetailsResponsePaxAmountsWithMarkup.fromJson(Map<String, dynamic> json) => _$SmallDetailsResponsePaxAmountsWithMarkupFromJson(json);

}


