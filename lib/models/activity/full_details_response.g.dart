// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullDetailsResponse _$FullDetailsResponseFromJson(Map<String, dynamic> json) {
  return FullDetailsResponse(
    version: json['version'],
    message: json['message'] as String,
    isError: json['isError'] as bool,
    responseException: json['responseException'],
    result: json['result'] == null
        ? null
        : FullDetailsResponseResult.fromJson(
            json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FullDetailsResponseToJson(
        FullDetailsResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
      'message': instance.message,
      'isError': instance.isError,
      'responseException': instance.responseException,
      'result': instance.result,
    };

FullDetailsResponseResult _$FullDetailsResponseResultFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseResult(
    operationId: json['operationId'] as String,
    auditData: json['auditData'] == null
        ? null
        : FullDetailsResponseAuditData.fromJson(
            json['auditData'] as Map<String, dynamic>),
    activity: json['activity'] == null
        ? null
        : FullDetailsResponseActivity.fromJson(
            json['activity'] as Map<String, dynamic>),
    errors: json['errors'],
  );
}

Map<String, dynamic> _$FullDetailsResponseResultToJson(
        FullDetailsResponseResult instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'auditData': instance.auditData,
      'activity': instance.activity,
      'errors': instance.errors,
    };

FullDetailsResponseAuditData _$FullDetailsResponseAuditDataFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseAuditData(
    processTime: json['processTime'],
    time: json['time'] as String,
    serverId: json['serverId'] as String,
    environment: json['environment'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseAuditDataToJson(
        FullDetailsResponseAuditData instance) =>
    <String, dynamic>{
      'processTime': instance.processTime,
      'time': instance.time,
      'serverId': instance.serverId,
      'environment': instance.environment,
    };

FullDetailsResponseActivity _$FullDetailsResponseActivityFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseActivity(
    activityCode: json['activityCode'] as String,
    country: json['country'] == null
        ? null
        : FullDetailsResponseCountry.fromJson(
            json['country'] as Map<String, dynamic>),
    operationDays: (json['operationDays'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseOperationDays.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    modalities: (json['modalities'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseModalities.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    currencyName: json['currencyName'] as String,
    amountsFromWithMarkup: (json['amountsFromWithMarkup'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseAmountsFromWithMarkup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    content: json['content'] == null
        ? null
        : FullDetailsResponseContent.fromJson(
            json['content'] as Map<String, dynamic>),
    order: json['order'],
    name: json['name'] as String,
    currency: json['currency'] as String,
    code: json['code'] as String,
    type: json['type'] as String,
    tpa: json['tpa'] as int,
    tpaName: json['tpaName'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseActivityToJson(
        FullDetailsResponseActivity instance) =>
    <String, dynamic>{
      'activityCode': instance.activityCode,
      'country': instance.country,
      'operationDays': instance.operationDays,
      'modalities': instance.modalities,
      'currencyName': instance.currencyName,
      'amountsFromWithMarkup': instance.amountsFromWithMarkup,
      'content': instance.content,
      'order': instance.order,
      'name': instance.name,
      'currency': instance.currency,
      'code': instance.code,
      'type': instance.type,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
    };

FullDetailsResponseCountry _$FullDetailsResponseCountryFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseCountry(
    code: json['code'] as String,
    name: json['name'] as String,
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseDestinations.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FullDetailsResponseCountryToJson(
        FullDetailsResponseCountry instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'destinations': instance.destinations,
    };

FullDetailsResponseDestinations _$FullDetailsResponseDestinationsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseDestinations(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseDestinationsToJson(
        FullDetailsResponseDestinations instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

FullDetailsResponseModalities _$FullDetailsResponseModalitiesFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseModalities(
    code: json['code'] as String,
    name: json['name'] as String,
    duration: json['duration'] == null
        ? null
        : FullDetailsResponseDuration.fromJson(
            json['duration'] as Map<String, dynamic>),
    questions: (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseQuestions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    comments: (json['comments'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseComments.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    supplierInformation: json['supplierInformation'] == null
        ? null
        : FullDetailsResponseSupplierInformation.fromJson(
            json['supplierInformation'] as Map<String, dynamic>),
    providerInformation: json['providerInformation'] == null
        ? null
        : FullDetailsResponseProviderInformation.fromJson(
            json['providerInformation'] as Map<String, dynamic>),
    destinationCode: json['destinationCode'] as String,
    contract: json['contract'] == null
        ? null
        : FullDetailsResponseContract.fromJson(
            json['contract'] as Map<String, dynamic>),
    languages: json['languages'] as List,
    amountsFromWithMarkup: (json['amountsFromWithMarkup'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseAmountsFromWithMarkup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    rates: (json['rates'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseRates.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    amountUnitType: json['amountUnitType'] as String,
    uniqueIdentifier: json['uniqueIdentifier'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseModalitiesToJson(
        FullDetailsResponseModalities instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'duration': instance.duration,
      'questions': instance.questions,
      'comments': instance.comments,
      'supplierInformation': instance.supplierInformation,
      'providerInformation': instance.providerInformation,
      'destinationCode': instance.destinationCode,
      'contract': instance.contract,
      'languages': instance.languages,
      'amountsFromWithMarkup': instance.amountsFromWithMarkup,
      'rates': instance.rates,
      'amountUnitType': instance.amountUnitType,
      'uniqueIdentifier': instance.uniqueIdentifier,
    };

FullDetailsResponseOperationDays _$FullDetailsResponseOperationDaysFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseOperationDays(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseOperationDaysToJson(
        FullDetailsResponseOperationDays instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

FullDetailsResponseDuration _$FullDetailsResponseDurationFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseDuration(
    value: json['value'],
    metric: json['metric'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseDurationToJson(
        FullDetailsResponseDuration instance) =>
    <String, dynamic>{
      'value': instance.value,
      'metric': instance.metric,
    };

FullDetailsResponseQuestions _$FullDetailsResponseQuestionsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseQuestions(
    code: json['code'] as String,
    text: json['text'] as String,
    required: json['required'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseQuestionsToJson(
        FullDetailsResponseQuestions instance) =>
    <String, dynamic>{
      'code': instance.code,
      'text': instance.text,
      'required': instance.required,
    };

FullDetailsResponseComments _$FullDetailsResponseCommentsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseComments(
    type: json['type'] as String,
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseCommentsToJson(
        FullDetailsResponseComments instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
    };

FullDetailsResponseSupplierInformation
    _$FullDetailsResponseSupplierInformationFromJson(
        Map<String, dynamic> json) {
  return FullDetailsResponseSupplierInformation(
    name: json['name'] as String,
    vatNumber: json['vatNumber'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseSupplierInformationToJson(
        FullDetailsResponseSupplierInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'vatNumber': instance.vatNumber,
    };

FullDetailsResponseProviderInformation
    _$FullDetailsResponseProviderInformationFromJson(
        Map<String, dynamic> json) {
  return FullDetailsResponseProviderInformation(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseProviderInformationToJson(
        FullDetailsResponseProviderInformation instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

FullDetailsResponseContract _$FullDetailsResponseContractFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseContract(
    incomingOffice: json['incomingOffice'],
    code: json['code'],
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseContractToJson(
        FullDetailsResponseContract instance) =>
    <String, dynamic>{
      'incomingOffice': instance.incomingOffice,
      'code': instance.code,
      'name': instance.name,
    };

FullDetailsResponseAmountsFromWithMarkup
    _$FullDetailsResponseAmountsFromWithMarkupFromJson(
        Map<String, dynamic> json) {
  return FullDetailsResponseAmountsFromWithMarkup(
    paxType: json['paxType'] as String,
    ageFrom: json['ageFrom'],
    ageTo: json['ageTo'],
    displayRateInfoWithMarkup: json['displayRateInfoWithMarkup'] == null
        ? null
        : FullDetailsResponseDisplayRateInfoWithMarkup.fromJson(
            json['displayRateInfoWithMarkup'] as Map<String, dynamic>),
    boxOfficeAmount: (json['boxOfficeAmount'] as num)?.toDouble(),
    mandatoryApplyAmount: json['mandatoryApplyAmount'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseAmountsFromWithMarkupToJson(
        FullDetailsResponseAmountsFromWithMarkup instance) =>
    <String, dynamic>{
      'paxType': instance.paxType,
      'ageFrom': instance.ageFrom,
      'ageTo': instance.ageTo,
      'displayRateInfoWithMarkup': instance.displayRateInfoWithMarkup,
      'boxOfficeAmount': instance.boxOfficeAmount,
      'mandatoryApplyAmount': instance.mandatoryApplyAmount,
    };

FullDetailsResponseDisplayRateInfoWithMarkup
    _$FullDetailsResponseDisplayRateInfoWithMarkupFromJson(
        Map<String, dynamic> json) {
  return FullDetailsResponseDisplayRateInfoWithMarkup(
    totalPriceWithMarkup: (json['totalPriceWithMarkup'] as num)?.toDouble(),
    baseRate: json['baseRate'],
    taxAndOtherCharges: json['taxAndOtherCharges'],
    otaTax: json['otaTax'],
    markup: json['markup'],
    supplierBaseRate: json['supplierBaseRate'],
    supplierTotalCost: json['supplierTotalCost'],
    currency: json['currency'],
  );
}

Map<String, dynamic> _$FullDetailsResponseDisplayRateInfoWithMarkupToJson(
        FullDetailsResponseDisplayRateInfoWithMarkup instance) =>
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

FullDetailsResponseRates _$FullDetailsResponseRatesFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseRates(
    rateCode: json['rateCode'] as String,
    rateClass: json['rateClass'] as String,
    name: json['name'] as String,
    rateDetails: (json['rateDetails'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseRateDetails.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FullDetailsResponseRatesToJson(
        FullDetailsResponseRates instance) =>
    <String, dynamic>{
      'rateCode': instance.rateCode,
      'rateClass': instance.rateClass,
      'name': instance.name,
      'rateDetails': instance.rateDetails,
    };

FullDetailsResponseRateDetails _$FullDetailsResponseRateDetailsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseRateDetails(
    rateKey: json['rateKey'] as String,
    minimumDuration: json['minimumDuration'] == null
        ? null
        : FullDetailsResponseDuration.fromJson(
            json['minimumDuration'] as Map<String, dynamic>),
    maximumDuration: json['maximumDuration'] == null
        ? null
        : FullDetailsResponseDuration.fromJson(
            json['maximumDuration'] as Map<String, dynamic>),
    tpa: json['tpa'] as int,
    tpaName: json['tpaName'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseRateDetailsToJson(
        FullDetailsResponseRateDetails instance) =>
    <String, dynamic>{
      'rateKey': instance.rateKey,
      'minimumDuration': instance.minimumDuration,
      'maximumDuration': instance.maximumDuration,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
    };

FullDetailsResponseContent _$FullDetailsResponseContentFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseContent(
    name: json['name'] as String,
    featureGroups: (json['featureGroups'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseFeatureGroups.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    guidingOptions: json['guidingOptions'] == null
        ? null
        : FullDetailsResponseGuidingOptions.fromJson(
            json['guidingOptions'] as Map<String, dynamic>),
    media: json['media'] == null
        ? null
        : FullDetailsResponseMedia.fromJson(
            json['media'] as Map<String, dynamic>),
    routes: (json['routes'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseRoutes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    scheduling: json['scheduling'] == null
        ? null
        : FullDetailsResponseScheduling.fromJson(
            json['scheduling'] as Map<String, dynamic>),
    segmentationGroups: (json['segmentationGroups'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseSegmentationGroups.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    activityFactsheetType: json['activityFactsheetType'] as String,
    activityCode: json['activityCode'] as String,
    modalityCode: json['modalityCode'] as String,
    modalityName: json['modalityName'] as String,
    contentId: json['contentId'] as String,
    description: json['description'] as String,
    lastUpdate: json['lastUpdate'] as String,
    summary: json['summary'] as String,
    highligths: (json['highligths'] as List)?.map((e) => e as String)?.toList(),
  )..location = json['location'] == null
      ? null
      : FullDetailsResponseLocation.fromJson(
          json['location'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FullDetailsResponseContentToJson(
        FullDetailsResponseContent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'featureGroups': instance.featureGroups,
      'guidingOptions': instance.guidingOptions,
      'location': instance.location,
      'media': instance.media,
      'routes': instance.routes,
      'scheduling': instance.scheduling,
      'segmentationGroups': instance.segmentationGroups,
      'activityFactsheetType': instance.activityFactsheetType,
      'activityCode': instance.activityCode,
      'modalityCode': instance.modalityCode,
      'modalityName': instance.modalityName,
      'contentId': instance.contentId,
      'description': instance.description,
      'lastUpdate': instance.lastUpdate,
      'summary': instance.summary,
      'highligths': instance.highligths,
    };

FullDetailsResponseLocation _$FullDetailsResponseLocationFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseLocation(
    endPoints: (json['endPoints'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseEndPoints.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    startingPoints: (json['startingPoints'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseStartingPoints.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FullDetailsResponseLocationToJson(
        FullDetailsResponseLocation instance) =>
    <String, dynamic>{
      'endPoints': instance.endPoints,
      'startingPoints': instance.startingPoints,
    };

FullDetailsResponseEndPoints _$FullDetailsResponseEndPointsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseEndPoints(
    type: json['type'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseEndPointsToJson(
        FullDetailsResponseEndPoints instance) =>
    <String, dynamic>{
      'type': instance.type,
      'description': instance.description,
    };

FullDetailsResponseStartingPoints _$FullDetailsResponseStartingPointsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseStartingPoints(
    type: json['type'] as String,
    meetingPoint: json['meetingPoint'] == null
        ? null
        : FullDetailsResponseMeetingPoint.fromJson(
            json['meetingPoint'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FullDetailsResponseStartingPointsToJson(
        FullDetailsResponseStartingPoints instance) =>
    <String, dynamic>{
      'type': instance.type,
      'meetingPoint': instance.meetingPoint,
    };

FullDetailsResponseMeetingPoint _$FullDetailsResponseMeetingPointFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseMeetingPoint(
    type: json['type'] as String,
    geolocation: json['geolocation'] == null
        ? null
        : FullDetailsResponseGeolocation.fromJson(
            json['geolocation'] as Map<String, dynamic>),
    address: json['address'] as String,
    country: json['country'] == null
        ? null
        : FullDetailsResponseCountry.fromJson(
            json['country'] as Map<String, dynamic>),
    zip: json['zip'],
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseMeetingPointToJson(
        FullDetailsResponseMeetingPoint instance) =>
    <String, dynamic>{
      'type': instance.type,
      'geolocation': instance.geolocation,
      'address': instance.address,
      'country': instance.country,
      'zip': instance.zip,
      'description': instance.description,
    };

FullDetailsResponseFeatureGroups _$FullDetailsResponseFeatureGroupsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseFeatureGroups(
    groupCode: json['groupCode'] as String,
    included: (json['included'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseIncluded.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FullDetailsResponseFeatureGroupsToJson(
        FullDetailsResponseFeatureGroups instance) =>
    <String, dynamic>{
      'groupCode': instance.groupCode,
      'included': instance.included,
    };

FullDetailsResponseIncluded _$FullDetailsResponseIncludedFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseIncluded(
    featureType: json['featureType'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseIncludedToJson(
        FullDetailsResponseIncluded instance) =>
    <String, dynamic>{
      'featureType': instance.featureType,
      'description': instance.description,
    };

FullDetailsResponseGuidingOptions _$FullDetailsResponseGuidingOptionsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseGuidingOptions(
    guideType: json['guideType'] as String,
    included: json['included'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseGuidingOptionsToJson(
        FullDetailsResponseGuidingOptions instance) =>
    <String, dynamic>{
      'guideType': instance.guideType,
      'included': instance.included,
    };

FullDetailsResponseMedia _$FullDetailsResponseMediaFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseMedia(
    images: (json['images'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseImages.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FullDetailsResponseMediaToJson(
        FullDetailsResponseMedia instance) =>
    <String, dynamic>{
      'images': instance.images,
    };

FullDetailsResponseImages _$FullDetailsResponseImagesFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseImages(
    visualizationOrder: json['visualizationOrder'] as int,
    mimeType: json['mimeType'] as String,
    language: json['language'] as String,
    urls: (json['urls'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseUrls.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FullDetailsResponseImagesToJson(
        FullDetailsResponseImages instance) =>
    <String, dynamic>{
      'visualizationOrder': instance.visualizationOrder,
      'mimeType': instance.mimeType,
      'language': instance.language,
      'urls': instance.urls,
    };

FullDetailsResponseUrls _$FullDetailsResponseUrlsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseUrls(
    dpi: json['dpi'],
    height: json['height'] as int,
    width: json['width'] as int,
    resource: json['resource'] as String,
    sizeType: json['sizeType'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseUrlsToJson(
        FullDetailsResponseUrls instance) =>
    <String, dynamic>{
      'dpi': instance.dpi,
      'height': instance.height,
      'width': instance.width,
      'resource': instance.resource,
      'sizeType': instance.sizeType,
    };

FullDetailsResponseRoutes _$FullDetailsResponseRoutesFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseRoutes(
    duration: json['duration'] == null
        ? null
        : FullDetailsResponseDuration.fromJson(
            json['duration'] as Map<String, dynamic>),
    description: json['description'] as String,
    timeFrom: json['timeFrom'] as String,
    timeTo: json['timeTo'] as String,
    points: (json['points'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponsePoints.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FullDetailsResponseRoutesToJson(
        FullDetailsResponseRoutes instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'description': instance.description,
      'timeFrom': instance.timeFrom,
      'timeTo': instance.timeTo,
      'points': instance.points,
    };

FullDetailsResponsePoints _$FullDetailsResponsePointsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponsePoints(
    type: json['type'] as String,
    order: json['order'] as int,
    stop: json['stop'] as bool,
    pointOfInterest: json['pointOfInterest'] == null
        ? null
        : FullDetailsResponsePointOfInterest.fromJson(
            json['pointOfInterest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FullDetailsResponsePointsToJson(
        FullDetailsResponsePoints instance) =>
    <String, dynamic>{
      'type': instance.type,
      'order': instance.order,
      'stop': instance.stop,
      'pointOfInterest': instance.pointOfInterest,
    };

FullDetailsResponsePointOfInterest _$FullDetailsResponsePointOfInterestFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponsePointOfInterest(
    type: json['type'] as String,
    geolocation: json['geolocation'] == null
        ? null
        : FullDetailsResponseGeolocation.fromJson(
            json['geolocation'] as Map<String, dynamic>),
    address: json['address'] as String,
    country: json['country'] == null
        ? null
        : FullDetailsResponseCountry.fromJson(
            json['country'] as Map<String, dynamic>),
    city: json['city'] as String,
    zip: json['zip'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponsePointOfInterestToJson(
        FullDetailsResponsePointOfInterest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'geolocation': instance.geolocation,
      'address': instance.address,
      'country': instance.country,
      'city': instance.city,
      'zip': instance.zip,
      'description': instance.description,
    };

FullDetailsResponseGeolocation _$FullDetailsResponseGeolocationFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseGeolocation(
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$FullDetailsResponseGeolocationToJson(
        FullDetailsResponseGeolocation instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

FullDetailsResponseScheduling _$FullDetailsResponseSchedulingFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseScheduling(
    duration: json['duration'] == null
        ? null
        : FullDetailsResponseDuration.fromJson(
            json['duration'] as Map<String, dynamic>),
    opened: (json['opened'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseOpened.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FullDetailsResponseSchedulingToJson(
        FullDetailsResponseScheduling instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'opened': instance.opened,
    };

FullDetailsResponseOpened _$FullDetailsResponseOpenedFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseOpened(
    from: json['from'],
    to: json['to'],
    openingTime: json['openingTime'] as String,
    closeTime: json['closeTime'] as String,
    weekDays: json['weekDays'] as List,
  );
}

Map<String, dynamic> _$FullDetailsResponseOpenedToJson(
        FullDetailsResponseOpened instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'openingTime': instance.openingTime,
      'closeTime': instance.closeTime,
      'weekDays': instance.weekDays,
    };

FullDetailsResponseSegmentationGroups
    _$FullDetailsResponseSegmentationGroupsFromJson(Map<String, dynamic> json) {
  return FullDetailsResponseSegmentationGroups(
    code: json['code'] as int,
    name: json['name'] as String,
    segments: (json['segments'] as List)
        ?.map((e) => e == null
            ? null
            : FullDetailsResponseSegments.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FullDetailsResponseSegmentationGroupsToJson(
        FullDetailsResponseSegmentationGroups instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'segments': instance.segments,
    };

FullDetailsResponseSegments _$FullDetailsResponseSegmentsFromJson(
    Map<String, dynamic> json) {
  return FullDetailsResponseSegments(
    code: json['code'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$FullDetailsResponseSegmentsToJson(
        FullDetailsResponseSegments instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };
