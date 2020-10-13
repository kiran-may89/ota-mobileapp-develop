// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'small_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmallDetailsResponse _$SmallDetailsResponseFromJson(Map<String, dynamic> json) {
  return SmallDetailsResponse(
    version: json['version'],
    message: json['message'] as String,
    isError: json['isError'] as bool,
    responseException: json['responseException'],
    result: json['result'] == null
        ? null
        : SmallDetailsResponseResult.fromJson(
            json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SmallDetailsResponseToJson(
        SmallDetailsResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'message': instance.message,
      'isError': instance.isError,
      'responseException': instance.responseException,
      'result': instance.result,
    };

SmallDetailsResponseResult _$SmallDetailsResponseResultFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseResult(
    operationId: json['operationId'] as String,
    activity: json['activity'] == null
        ? null
        : SmallDetailsResponseActivity.fromJson(
            json['activity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SmallDetailsResponseResultToJson(
        SmallDetailsResponseResult instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'activity': instance.activity,
    };

SmallDetailsResponseActivity _$SmallDetailsResponseActivityFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseActivity(
    activityCode: json['activityCode'] as String,
    country: json['country'] == null
        ? null
        : SmallDetailsResponseCountry.fromJson(
            json['country'] as Map<String, dynamic>),
    modalities: (json['modalities'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseModalities.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    currencyName: json['currencyName'] as String,
    amountsFromWithMarkup: (json['amountsFromWithMarkup'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseAmountsFromWithMarkup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    order: json['order'] as int,
    name: json['name'] as String,
    currency: json['currency'] as String,
    code: json['code'] as String,
    type: json['type'] as String,
    tpa: json['tpa'] as int,
    tpaName: json['tpaName'] as String,
    options: (json['options'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseOptions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SmallDetailsResponseActivityToJson(
        SmallDetailsResponseActivity instance) =>
    <String, dynamic>{
      'activityCode': instance.activityCode,
      'country': instance.country,
      'modalities': instance.modalities,
      'currencyName': instance.currencyName,
      'amountsFromWithMarkup': instance.amountsFromWithMarkup,
      'order': instance.order,
      'name': instance.name,
      'currency': instance.currency,
      'code': instance.code,
      'type': instance.type,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
      'options': instance.options,
    };

SmallDetailsResponseCountry _$SmallDetailsResponseCountryFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseCountry(
    code: json['code'] as String,
    name: json['name'] as String,
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseDestinations.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SmallDetailsResponseCountryToJson(
        SmallDetailsResponseCountry instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'destinations': instance.destinations,
    };

SmallDetailsResponseDestinations _$SmallDetailsResponseDestinationsFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseDestinations(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseDestinationsToJson(
        SmallDetailsResponseDestinations instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

SmallDetailsResponseModalities _$SmallDetailsResponseModalitiesFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseModalities(
    code: json['code'] as String,
    name: json['name'] as String,
    duration: json['duration'] == null
        ? null
        : SmallDetailsResponseDuration.fromJson(
            json['duration'] as Map<String, dynamic>),
    comments: (json['comments'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseComment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    questions: (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseQuestions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    amountsFromWithMarkup: (json['amountsFromWithMarkup'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseAmountsFromWithMarkup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    rates: (json['rates'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseRates.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    amountUnitType: json['amountUnitType'] as String,
    uniqueIdentifier: json['uniqueIdentifier'] as String,
  )
    ..supplierInformation = json['supplierInformation'] == null
        ? null
        : SmallDetailsResponseSupplierInformation.fromJson(
            json['supplierInformation'] as Map<String, dynamic>)
    ..providerInformation = json['providerInformation'] == null
        ? null
        : SmallDetailsResponseProviderInformation.fromJson(
            json['providerInformation'] as Map<String, dynamic>)
    ..destinationCode = json['destinationCode'] as String
    ..contract = json['contract'] == null
        ? null
        : SmallDetailsResponseContract.fromJson(
            json['contract'] as Map<String, dynamic>)
    ..languages = json['languages'] as List
    ..amountsFrom = (json['amountsFrom'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseAmountsFrom.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SmallDetailsResponseModalitiesToJson(
        SmallDetailsResponseModalities instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'duration': instance.duration,
      'questions': instance.questions,
      'amountsFromWithMarkup': instance.amountsFromWithMarkup,
      'rates': instance.rates,
      'amountUnitType': instance.amountUnitType,
      'uniqueIdentifier': instance.uniqueIdentifier,
      'comments': instance.comments,
      'supplierInformation': instance.supplierInformation,
      'providerInformation': instance.providerInformation,
      'destinationCode': instance.destinationCode,
      'contract': instance.contract,
      'languages': instance.languages,
      'amountsFrom': instance.amountsFrom,
    };

SmallDetailsResponseAmountsFrom _$SmallDetailsResponseAmountsFromFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseAmountsFrom(
    paxType: json['paxType'] as String,
    ageFrom: json['ageFrom'] as int,
    ageTo: json['ageTo'] as int,
    amount: (json['amount'] as num)?.toDouble(),
    boxOfficeAmount: (json['boxOfficeAmount'] as num)?.toDouble(),
    mandatoryApplyAmount: json['mandatoryApplyAmount'] as String,
    displayRateInfoWithMarkup: json['displayRateInfoWithMarkup'] == null
        ? null
        : SmallDetailsResponseDisplayRateInfoWithMarkup.fromJson(
            json['displayRateInfoWithMarkup'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SmallDetailsResponseAmountsFromToJson(
        SmallDetailsResponseAmountsFrom instance) =>
    <String, dynamic>{
      'paxType': instance.paxType,
      'ageFrom': instance.ageFrom,
      'ageTo': instance.ageTo,
      'amount': instance.amount,
      'boxOfficeAmount': instance.boxOfficeAmount,
      'mandatoryApplyAmount': instance.mandatoryApplyAmount,
      'displayRateInfoWithMarkup': instance.displayRateInfoWithMarkup,
    };

SmallDetailsResponseSupplierInformation
    _$SmallDetailsResponseSupplierInformationFromJson(
        Map<String, dynamic> json) {
  return SmallDetailsResponseSupplierInformation(
    name: json['name'] as String,
    vatNumber: json['vatNumber'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseSupplierInformationToJson(
        SmallDetailsResponseSupplierInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'vatNumber': instance.vatNumber,
    };

SmallDetailsResponseProviderInformation
    _$SmallDetailsResponseProviderInformationFromJson(
        Map<String, dynamic> json) {
  return SmallDetailsResponseProviderInformation(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseProviderInformationToJson(
        SmallDetailsResponseProviderInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

SmallDetailsResponseContract _$SmallDetailsResponseContractFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseContract(
    incomingOffice: json['incomingOffice'] as int,
    code: json['code'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseContractToJson(
        SmallDetailsResponseContract instance) =>
    <String, dynamic>{
      'incomingOffice': instance.incomingOffice,
      'code': instance.code,
      'name': instance.name,
    };

SmallDetailsResponseComment _$SmallDetailsResponseCommentFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseComment(
    type: json['type'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseCommentToJson(
        SmallDetailsResponseComment instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
    };

SmallDetailsResponseQuestions _$SmallDetailsResponseQuestionsFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseQuestions(
    code: json['code'] as String,
    text: json['text'] as String,
    required: json['required'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseQuestionsToJson(
        SmallDetailsResponseQuestions instance) =>
    <String, dynamic>{
      'code': instance.code,
      'text': instance.text,
      'required': instance.required,
    };

SmallDetailsResponseDuration _$SmallDetailsResponseDurationFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseDuration(
    value: json['value'],
    metric: json['metric'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseDurationToJson(
        SmallDetailsResponseDuration instance) =>
    <String, dynamic>{
      'value': instance.value,
      'metric': instance.metric,
    };

SmallDetailsResponseAmountsFromWithMarkup
    _$SmallDetailsResponseAmountsFromWithMarkupFromJson(
        Map<String, dynamic> json) {
  return SmallDetailsResponseAmountsFromWithMarkup(
    paxType: json['paxType'] as String,
    ageFrom: json['ageFrom'] as int,
    ageTo: json['ageTo'] as int,
    displayRateInfoWithMarkup: json['displayRateInfoWithMarkup'] == null
        ? null
        : SmallDetailsResponseDisplayRateInfoWithMarkup.fromJson(
            json['displayRateInfoWithMarkup'] as Map<String, dynamic>),
    boxOfficeAmount: (json['boxOfficeAmount'] as num)?.toDouble(),
    mandatoryApplyAmount: json['mandatoryApplyAmount'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseAmountsFromWithMarkupToJson(
        SmallDetailsResponseAmountsFromWithMarkup instance) =>
    <String, dynamic>{
      'paxType': instance.paxType,
      'ageFrom': instance.ageFrom,
      'ageTo': instance.ageTo,
      'displayRateInfoWithMarkup': instance.displayRateInfoWithMarkup,
      'boxOfficeAmount': instance.boxOfficeAmount,
      'mandatoryApplyAmount': instance.mandatoryApplyAmount,
    };

SmallDetailsResponseDisplayRateInfoWithMarkup
    _$SmallDetailsResponseDisplayRateInfoWithMarkupFromJson(
        Map<String, dynamic> json) {
  return SmallDetailsResponseDisplayRateInfoWithMarkup(
    totalPriceWithMarkup: (json['totalPriceWithMarkup'] as num)?.toDouble(),
    baseRate: (json['baseRate'] as num)?.toDouble(),
    taxAndOtherCharges: (json['taxAndOtherCharges'] as num)?.toDouble(),
    otaTax: (json['otaTax'] as num)?.toDouble(),
    markup: (json['markup'] as num)?.toDouble(),
    supplierBaseRate: (json['supplierBaseRate'] as num)?.toDouble(),
    supplierTotalCost: (json['supplierTotalCost'] as num)?.toDouble(),
    currency: json['currency'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseDisplayRateInfoWithMarkupToJson(
        SmallDetailsResponseDisplayRateInfoWithMarkup instance) =>
    <String, dynamic>{
      'totalPriceWithMarkup': instance.totalPriceWithMarkup,
      'baseRate': instance.baseRate,
      'taxAndOtherCharges': instance.taxAndOtherCharges,
      'otaTax': instance.otaTax,
      'markup': instance.markup,
      'supplierBaseRate': instance.supplierBaseRate,
      'supplierTotalCost': instance.supplierTotalCost,
      'currency': instance.currency,
    };

SmallDetailsResponseRates _$SmallDetailsResponseRatesFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseRates(
    rateCode: json['rateCode'] as String,
    rateClass: json['rateClass'] as String,
    name: json['name'] as String,
    rateDetails: (json['rateDetails'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseRateDetails.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SmallDetailsResponseRatesToJson(
        SmallDetailsResponseRates instance) =>
    <String, dynamic>{
      'rateCode': instance.rateCode,
      'rateClass': instance.rateClass,
      'name': instance.name,
      'rateDetails': instance.rateDetails,
    };

SmallDetailsResponseRateDetails _$SmallDetailsResponseRateDetailsFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseRateDetails(
    rateKey: json['rateKey'] as String,
    operationDatesWithMarkup: (json['operationDatesWithMarkup'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseOperationDatesWithMarkup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    totalAmountWithMarkup: json['totalAmountWithMarkup'] == null
        ? null
        : SmallDetailsResponseTotalAmountWithMarkup.fromJson(
            json['totalAmountWithMarkup'] as Map<String, dynamic>),
    paxAmountsWithMarkup: (json['paxAmountsWithMarkup'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponsePaxAmountsWithMarkup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    tpa: json['tpa'] as int,
    tpaName: json['tpaName'] as String,
    options: (json['options'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseOptions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SmallDetailsResponseRateDetailsToJson(
        SmallDetailsResponseRateDetails instance) =>
    <String, dynamic>{
      'rateKey': instance.rateKey,
      'operationDatesWithMarkup': instance.operationDatesWithMarkup,
      'totalAmountWithMarkup': instance.totalAmountWithMarkup,
      'paxAmountsWithMarkup': instance.paxAmountsWithMarkup,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
      'options': instance.options,
    };

SmallDetailsResponseOperationDatesWithMarkup
    _$SmallDetailsResponseOperationDatesWithMarkupFromJson(
        Map<String, dynamic> json) {
  return SmallDetailsResponseOperationDatesWithMarkup(
    from: json['from'] as String,
    to: json['to'] as String,
    cancellationPolicies: (json['cancellationPolicies'] as List)
        ?.map((e) => e == null
            ? null
            : SmallDetailsResponseCancellationPolicies.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SmallDetailsResponseOperationDatesWithMarkupToJson(
        SmallDetailsResponseOperationDatesWithMarkup instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'cancellationPolicies': instance.cancellationPolicies,
    };

SmallDetailsResponseCancellationPolicies
    _$SmallDetailsResponseCancellationPoliciesFromJson(
        Map<String, dynamic> json) {
  return SmallDetailsResponseCancellationPolicies(
    dateFrom: json['dateFrom'] as String,
    amount: (json['amount'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SmallDetailsResponseCancellationPoliciesToJson(
        SmallDetailsResponseCancellationPolicies instance) =>
    <String, dynamic>{
      'dateFrom': instance.dateFrom,
      'amount': instance.amount,
    };

SmallDetailsResponseTotalAmountWithMarkup
    _$SmallDetailsResponseTotalAmountWithMarkupFromJson(
        Map<String, dynamic> json) {
  return SmallDetailsResponseTotalAmountWithMarkup(
    displayRateInfoWithMarkup: json['displayRateInfoWithMarkup'] == null
        ? null
        : SmallDetailsResponseDisplayRateInfoWithMarkup.fromJson(
            json['displayRateInfoWithMarkup'] as Map<String, dynamic>),
    boxOfficeAmount: (json['boxOfficeAmount'] as num)?.toDouble(),
    mandatoryApplyAmount: json['mandatoryApplyAmount'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseTotalAmountWithMarkupToJson(
        SmallDetailsResponseTotalAmountWithMarkup instance) =>
    <String, dynamic>{
      'displayRateInfoWithMarkup': instance.displayRateInfoWithMarkup,
      'boxOfficeAmount': instance.boxOfficeAmount,
      'mandatoryApplyAmount': instance.mandatoryApplyAmount,
    };

SmallDetailsResponseOptions _$SmallDetailsResponseOptionsFromJson(
    Map<String, dynamic> json) {
  return SmallDetailsResponseOptions(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponseOptionsToJson(
        SmallDetailsResponseOptions instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

SmallDetailsResponsePaxAmountsWithMarkup
    _$SmallDetailsResponsePaxAmountsWithMarkupFromJson(
        Map<String, dynamic> json) {
  return SmallDetailsResponsePaxAmountsWithMarkup(
    paxType: json['paxType'] as String,
    ageFrom: json['ageFrom'] as int,
    ageTo: json['ageTo'] as int,
    displayRateInfoWithMarkup: json['displayRateInfoWithMarkup'] == null
        ? null
        : SmallDetailsResponseDisplayRateInfoWithMarkup.fromJson(
            json['displayRateInfoWithMarkup'] as Map<String, dynamic>),
    boxOfficeAmount: (json['boxOfficeAmount'] as num)?.toDouble(),
    mandatoryApplyAmount: json['mandatoryApplyAmount'] as String,
  );
}

Map<String, dynamic> _$SmallDetailsResponsePaxAmountsWithMarkupToJson(
        SmallDetailsResponsePaxAmountsWithMarkup instance) =>
    <String, dynamic>{
      'paxType': instance.paxType,
      'ageFrom': instance.ageFrom,
      'ageTo': instance.ageTo,
      'displayRateInfoWithMarkup': instance.displayRateInfoWithMarkup,
      'boxOfficeAmount': instance.boxOfficeAmount,
      'mandatoryApplyAmount': instance.mandatoryApplyAmount,
    };
