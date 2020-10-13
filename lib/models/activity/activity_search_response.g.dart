// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitySearchResponse _$ActivitySearchResponseFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponse(
    message: json['message'] as String,
    isError: json['isError'] as bool,
    responseException: json['responseException'],
    result: json['result'] == null
        ? null
        : ActivitySearchResponseResult.fromJson(
            json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ActivitySearchResponseToJson(
        ActivitySearchResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'isError': instance.isError,
      'responseException': instance.responseException,
      'result': instance.result,
    };

ActivitySearchResponseResult _$ActivitySearchResponseResultFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseResult(
    operationId: json['operationId'] as String,
    pagination: json['pagination'] == null
        ? null
        : ActivitySearchResponsePagination.fromJson(
            json['pagination'] as Map<String, dynamic>),
    auditData: json['auditData'] == null
        ? null
        : ActivitySearchResponseAuditData.fromJson(
            json['auditData'] as Map<String, dynamic>),
    activities: (json['activities'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseActivities.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    summaryLog: json['summaryLog'] as String,
  );
}

Map<String, dynamic> _$ActivitySearchResponseResultToJson(
        ActivitySearchResponseResult instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'pagination': instance.pagination,
      'auditData': instance.auditData,
      'activities': instance.activities,
      'summaryLog': instance.summaryLog,
    };

ActivitySearchResponsePagination _$ActivitySearchResponsePaginationFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponsePagination(
    itemsPerPage: json['itemsPerPage'] as int,
    page: json['page'] as int,
    totalItems: json['totalItems'] as int,
  );
}

Map<String, dynamic> _$ActivitySearchResponsePaginationToJson(
        ActivitySearchResponsePagination instance) =>
    <String, dynamic>{
      'itemsPerPage': instance.itemsPerPage,
      'page': instance.page,
      'totalItems': instance.totalItems,
    };

ActivitySearchResponseAuditData _$ActivitySearchResponseAuditDataFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseAuditData(
    processTime: json['processTime'],
    time: json['time'] as String,
    serverId: json['serverId'] as String,
    environment: json['environment'] as String,
  );
}

Map<String, dynamic> _$ActivitySearchResponseAuditDataToJson(
        ActivitySearchResponseAuditData instance) =>
    <String, dynamic>{
      'processTime': instance.processTime,
      'time': instance.time,
      'serverId': instance.serverId,
      'environment': instance.environment,
    };

ActivitySearchResponseActivities _$ActivitySearchResponseActivitiesFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseActivities(
    code: json['code'] as String,
    type: json['type'] as String,
    countryCode: json['countryCode'] as String,
    source: json['source'] as String,
    name: json['name'] as String,
    currency: json['currency'] as String,
    content: json['content'] == null
        ? null
        : ActivitySearchResponseContent.fromJson(
            json['content'] as Map<String, dynamic>),
    order: json['order'] as int,
    amountsFromWithMarkup: (json['amountsFromWithMarkup'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseAmountsFromWithMarkup.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    currencyName: json['currencyName'] as String,
    country: json['country'] == null
        ? null
        : ActivitySearchResponseCountries.fromJson(
            json['country'] as Map<String, dynamic>),
    tpa: json['tpa'] as int,
    tpaName: json['tpaName'] as String,
    options: (json['options'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseOptions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ActivitySearchResponseActivitiesToJson(
        ActivitySearchResponseActivities instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': instance.type,
      'countryCode': instance.countryCode,
      'source': instance.source,
      'name': instance.name,
      'currency': instance.currency,
      'content': instance.content,
      'order': instance.order,
      'amountsFromWithMarkup': instance.amountsFromWithMarkup,
      'currencyName': instance.currencyName,
      'country': instance.country,
      'tpa': instance.tpa,
      'tpaName': instance.tpaName,
      'options': instance.options,
    };

ActivitySearchResponseContent _$ActivitySearchResponseContentFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseContent(
    name: json['name'] as String,
    media: json['media'] == null
        ? null
        : ActivitySearchResponseMedia.fromJson(
            json['media'] as Map<String, dynamic>),
    segmentationGroups: (json['segmentationGroups'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseSegmentationGroups.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    activityFactsheetType: json['activityFactsheetType'] as String,
    activityCode: json['activityCode'] as String,
    modalityCode: json['modalityCode'] as String,
    modalityName: json['modalityName'] as String,
    contentId: json['contentId'] as String,
    lastUpdate: json['lastUpdate'] as String,
    summary: json['summary'] as String,
    countries: (json['countries'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseCountries.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  )..scheduling = json['scheduling'] == null
      ? null
      : ActivitySearchResponseScheduling.fromJson(
          json['scheduling'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ActivitySearchResponseContentToJson(
        ActivitySearchResponseContent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'scheduling': instance.scheduling,
      'media': instance.media,
      'segmentationGroups': instance.segmentationGroups,
      'activityFactsheetType': instance.activityFactsheetType,
      'activityCode': instance.activityCode,
      'modalityCode': instance.modalityCode,
      'modalityName': instance.modalityName,
      'contentId': instance.contentId,
      'lastUpdate': instance.lastUpdate,
      'summary': instance.summary,
      'countries': instance.countries,
    };

ActivitySearchResponseMedia _$ActivitySearchResponseMediaFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseMedia(
    images: (json['images'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseImages.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ActivitySearchResponseMediaToJson(
        ActivitySearchResponseMedia instance) =>
    <String, dynamic>{
      'images': instance.images,
    };

ActivitySearchResponseScheduling _$ActivitySearchResponseSchedulingFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseScheduling(
    duration: json['duration'] == null
        ? null
        : ActivitySearchResponseDuration.fromJson(
            json['duration'] as Map<String, dynamic>),
    closed: (json['closed'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseClosed.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    opened: (json['opened'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseOpened.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ActivitySearchResponseSchedulingToJson(
        ActivitySearchResponseScheduling instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'closed': instance.closed,
      'opened': instance.opened,
    };

ActivitySearchResponseOpened _$ActivitySearchResponseOpenedFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseOpened(
    from: json['from'] as String,
    to: json['to'] as String,
    openingTime: json['openingTime'] as String,
    closeTime: json['closeTime'] as String,
    weekDays: (json['weekDays'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ActivitySearchResponseOpenedToJson(
        ActivitySearchResponseOpened instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'openingTime': instance.openingTime,
      'closeTime': instance.closeTime,
      'weekDays': instance.weekDays,
    };

ActivitySearchResponseDuration _$ActivitySearchResponseDurationFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseDuration(
    value: json['value'],
    metric: json['metric'] as String,
  );
}

Map<String, dynamic> _$ActivitySearchResponseDurationToJson(
        ActivitySearchResponseDuration instance) =>
    <String, dynamic>{
      'value': instance.value,
      'metric': instance.metric,
    };

ActivitySearchResponseClosed _$ActivitySearchResponseClosedFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseClosed(
    from: json['from'] as String,
    to: json['to'] as String,
    openingTime: json['openingTime'] as String,
    closeTime: json['closeTime'] as String,
    weekDays: (json['weekDays'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ActivitySearchResponseClosedToJson(
        ActivitySearchResponseClosed instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'openingTime': instance.openingTime,
      'closeTime': instance.closeTime,
      'weekDays': instance.weekDays,
    };

ActivitySearchResponseImages _$ActivitySearchResponseImagesFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseImages(
    visualizationOrder: json['visualizationOrder'] as int,
    mimeType: json['mimeType'] as String,
    language: json['language'] as String,
    urls: (json['urls'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseUrls.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ActivitySearchResponseImagesToJson(
        ActivitySearchResponseImages instance) =>
    <String, dynamic>{
      'visualizationOrder': instance.visualizationOrder,
      'mimeType': instance.mimeType,
      'language': instance.language,
      'urls': instance.urls,
    };

ActivitySearchResponseUrls _$ActivitySearchResponseUrlsFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseUrls(
    dpi: json['dpi'],
    height: json['height'] as int,
    width: json['width'] as int,
    resource: json['resource'] as String,
    sizeType: json['sizeType'] as String,
  );
}

Map<String, dynamic> _$ActivitySearchResponseUrlsToJson(
        ActivitySearchResponseUrls instance) =>
    <String, dynamic>{
      'dpi': instance.dpi,
      'height': instance.height,
      'width': instance.width,
      'resource': instance.resource,
      'sizeType': instance.sizeType,
    };

ActivitySearchResponseSegmentationGroups
    _$ActivitySearchResponseSegmentationGroupsFromJson(
        Map<String, dynamic> json) {
  return ActivitySearchResponseSegmentationGroups(
    code: json['code'],
    name: json['name'] as String,
    segments: (json['segments'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseSegments.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ActivitySearchResponseSegmentationGroupsToJson(
        ActivitySearchResponseSegmentationGroups instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'segments': instance.segments,
    };

ActivitySearchResponseSegments _$ActivitySearchResponseSegmentsFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseSegments(
    code: json['code'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ActivitySearchResponseSegmentsToJson(
        ActivitySearchResponseSegments instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

ActivitySearchResponseCountries _$ActivitySearchResponseCountriesFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseCountries(
    code: json['code'] as String,
    name: json['name'] as String,
    destinations: (json['destinations'] as List)
        ?.map((e) => e == null
            ? null
            : ActivitySearchResponseDestinations.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ActivitySearchResponseCountriesToJson(
        ActivitySearchResponseCountries instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'destinations': instance.destinations,
    };

ActivitySearchResponseDestinations _$ActivitySearchResponseDestinationsFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseDestinations(
    code: json['code'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ActivitySearchResponseDestinationsToJson(
        ActivitySearchResponseDestinations instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };

ActivitySearchResponseAmountsFromWithMarkup
    _$ActivitySearchResponseAmountsFromWithMarkupFromJson(
        Map<String, dynamic> json) {
  return ActivitySearchResponseAmountsFromWithMarkup(
    paxType: json['paxType'] as String,
    ageFrom: json['ageFrom'] as int,
    ageTo: json['ageTo'] as int,
    displayRateInfoWithMarkup: json['displayRateInfoWithMarkup'] == null
        ? null
        : ActivitySearchResponseDisplayRateInfoWithMarkup.fromJson(
            json['displayRateInfoWithMarkup'] as Map<String, dynamic>),
    boxOfficeAmount: (json['boxOfficeAmount'] as num)?.toDouble(),
    mandatoryApplyAmount: json['mandatoryApplyAmount'] as String,
  );
}

Map<String, dynamic> _$ActivitySearchResponseAmountsFromWithMarkupToJson(
        ActivitySearchResponseAmountsFromWithMarkup instance) =>
    <String, dynamic>{
      'paxType': instance.paxType,
      'ageFrom': instance.ageFrom,
      'ageTo': instance.ageTo,
      'displayRateInfoWithMarkup': instance.displayRateInfoWithMarkup,
      'boxOfficeAmount': instance.boxOfficeAmount,
      'mandatoryApplyAmount': instance.mandatoryApplyAmount,
    };

ActivitySearchResponseDisplayRateInfoWithMarkup
    _$ActivitySearchResponseDisplayRateInfoWithMarkupFromJson(
        Map<String, dynamic> json) {
  return ActivitySearchResponseDisplayRateInfoWithMarkup(
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

Map<String, dynamic> _$ActivitySearchResponseDisplayRateInfoWithMarkupToJson(
        ActivitySearchResponseDisplayRateInfoWithMarkup instance) =>
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

ActivitySearchResponseOptions _$ActivitySearchResponseOptionsFromJson(
    Map<String, dynamic> json) {
  return ActivitySearchResponseOptions(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ActivitySearchResponseOptionsToJson(
        ActivitySearchResponseOptions instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
