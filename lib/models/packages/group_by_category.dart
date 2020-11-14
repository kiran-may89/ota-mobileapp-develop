class GroupByCategoryResults {
  GroupByCategoryResults({
    this.version,
    this.message,
    this.isError,
    this.responseException,
    this.result,
  });

  dynamic version;
  String message;
  bool isError;
  dynamic responseException;
  List<Result> result;

  factory GroupByCategoryResults.fromMap(
          Map<String, dynamic> json) =>
      GroupByCategoryResults(
        version: json["version"],
        message: json["message"],
        isError: json["isError"],
        responseException: json["responseException"],
        result: List<Result>.from(json["result"]
            .map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "version": version,
        "message": message,
        "isError": isError,
        "responseException": responseException,
        "result": List<dynamic>.from(
            result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    this.tenantId,
    this.name,
    this.travelStyleId,
    this.description,
    this.isBuyOnline,
    this.currencyId,
    this.hasFixedHeaderPrice,
    this.adultPrice,
    this.childPrice,
    this.hasSizeLimit,
    this.maxGroupSize,
    this.hasSpecificDate,
    this.childrenAllowed,
    this.statusId,
    this.isDeleted,
    this.internalCode,
    this.noCustomersBrought,
    this.destinations,
    this.highlights,
    this.images,
    this.dailyItineraries,
    this.discounts,
    this.timelines,
    this.id,
    this.uid,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.createdAtUtc,
    this.updatedAtUtc,
  });

  String tenantId;
  String name;
  int travelStyleId;
  String description;
  bool isBuyOnline;
  String currencyId;
  bool hasFixedHeaderPrice;
  int adultPrice;
  int childPrice;
  bool hasSizeLimit;
  int maxGroupSize;
  bool hasSpecificDate;
  bool childrenAllowed;
  int statusId;
  bool isDeleted;
  dynamic internalCode;
  int noCustomersBrought;
  List<Destination> destinations;
  List<Highlight> highlights;
  List<dynamic> images;
  List<dynamic> dailyItineraries;
  dynamic discounts;
  List<dynamic> timelines;
  int id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String createdAtUtc;
  String updatedAtUtc;

  factory Result.fromMap(
          Map<String, dynamic> json) =>
      Result(
        tenantId: json["tenant_id"],
        name: json["name"],
        travelStyleId: json["travel_style_id"],
        description: json["description"],
        isBuyOnline: json["is_buy_online"],
        currencyId: json["currency_id"],
        hasFixedHeaderPrice:
            json["has_fixed_header_price"],
        adultPrice: json["adult_price"],
        childPrice: json["child_price"],
        hasSizeLimit: json["has_size_limit"],
        maxGroupSize: json["max_group_size"],
        hasSpecificDate:
            json["has_specific_date"],
        childrenAllowed: json["children_allowed"],
        statusId: json["status_id"],
        isDeleted: json["is_deleted"],
        internalCode: json["internal_code"],
        noCustomersBrought:
            json["no_customers_brought"],
        destinations: List<Destination>.from(
            json["destinations"].map(
                (x) => Destination.fromMap(x))),
        highlights: List<Highlight>.from(
            json["highlights"].map(
                (x) => Highlight.fromMap(x))),
        images: List<dynamic>.from(
            json["images"].map((x) => x)),
        dailyItineraries: List<dynamic>.from(
            json["daily_Itineraries"]
                .map((x) => x)),
        discounts: json["discounts"],
        timelines: List<dynamic>.from(
            json["timelines"].map((x) => x)),
        id: json["id"],
        uid: json["uid"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        updatedBy: json["updatedBy"],
        updatedDate: json["updatedDate"],
        createdAtUtc: json["createdAtUTC"],
        updatedAtUtc: json["updatedAtUTC"],
      );

  Map<String, dynamic> toMap() => {
        "tenant_id": tenantId,
        "name": name,
        "travel_style_id": travelStyleId,
        "description": description,
        "is_buy_online": isBuyOnline,
        "currency_id": currencyId,
        "has_fixed_header_price":
            hasFixedHeaderPrice,
        "adult_price": adultPrice,
        "child_price": childPrice,
        "has_size_limit": hasSizeLimit,
        "max_group_size": maxGroupSize,
        "has_specific_date": hasSpecificDate,
        "children_allowed": childrenAllowed,
        "status_id": statusId,
        "is_deleted": isDeleted,
        "internal_code": internalCode,
        "no_customers_brought":
            noCustomersBrought,
        "destinations": List<dynamic>.from(
            destinations.map((x) => x.toMap())),
        "highlights": List<dynamic>.from(
            highlights.map((x) => x.toMap())),
        "images": List<dynamic>.from(
            images.map((x) => x)),
        "daily_Itineraries": List<dynamic>.from(
            dailyItineraries.map((x) => x)),
        "discounts": discounts,
        "timelines": List<dynamic>.from(
            timelines.map((x) => x)),
        "id": id,
        "uid": uid,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "updatedBy": updatedBy,
        "updatedDate": updatedDate,
        "createdAtUTC": createdAtUtc,
        "updatedAtUTC": updatedAtUtc,
      };
}

class Destination {
  Destination({
    this.pkgeHeaderId,
    this.destinationId,
    this.duration,
    this.noOfNights,
    this.startingDay,
    this.isDeleted,
    this.stays,
    this.foods,
    this.transports,
    this.otherServices,
    this.sitesVisits,
    this.id,
    this.uid,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.createdAtUtc,
    this.updatedAtUtc,
  });

  int pkgeHeaderId;
  int destinationId;
  int duration;
  int noOfNights;
  int startingDay;
  bool isDeleted;
  dynamic stays;
  dynamic foods;
  dynamic transports;
  dynamic otherServices;
  dynamic sitesVisits;
  int id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String createdAtUtc;
  String updatedAtUtc;

  factory Destination.fromMap(
          Map<String, dynamic> json) =>
      Destination(
        pkgeHeaderId: json["pkge_header_id"],
        destinationId: json["destination_id"],
        duration: json["duration"],
        noOfNights: json["no_of_nights"],
        startingDay: json["starting_day"],
        isDeleted: json["is_deleted"],
        stays: json["stays"],
        foods: json["foods"],
        transports: json["transports"],
        otherServices: json["other_Services"],
        sitesVisits: json["sites_Visits"],
        id: json["id"],
        uid: json["uid"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        updatedBy: json["updatedBy"],
        updatedDate: json["updatedDate"],
        createdAtUtc: json["createdAtUTC"],
        updatedAtUtc: json["updatedAtUTC"],
      );

  Map<String, dynamic> toMap() => {
        "pkge_header_id": pkgeHeaderId,
        "destination_id": destinationId,
        "duration": duration,
        "no_of_nights": noOfNights,
        "starting_day": startingDay,
        "is_deleted": isDeleted,
        "stays": stays,
        "foods": foods,
        "transports": transports,
        "other_Services": otherServices,
        "sites_Visits": sitesVisits,
        "id": id,
        "uid": uid,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "updatedBy": updatedBy,
        "updatedDate": updatedDate,
        "createdAtUTC": createdAtUtc,
        "updatedAtUTC": updatedAtUtc,
      };
}

class Highlight {
  Highlight({
    this.pkgeHeaderId,
    this.sequence,
    this.itineraryType,
    this.highlightText,
    this.isMainItineraryHighlight,
    this.isDeleted,
    this.id,
    this.uid,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.createdAtUtc,
    this.updatedAtUtc,
  });

  int pkgeHeaderId;
  int sequence;
  String itineraryType;
  String highlightText;
  bool isMainItineraryHighlight;
  bool isDeleted;
  int id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String createdAtUtc;
  String updatedAtUtc;

  factory Highlight.fromMap(
          Map<String, dynamic> json) =>
      Highlight(
        pkgeHeaderId: json["pkge_header_id"],
        sequence: json["sequence"],
        itineraryType: json["itinerary_type"],
        highlightText: json["highlight_text"],
        isMainItineraryHighlight:
            json["is_main_itinerary_highlight"],
        isDeleted: json["is_deleted"],
        id: json["id"],
        uid: json["uid"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        updatedBy: json["updatedBy"],
        updatedDate: json["updatedDate"],
        createdAtUtc: json["createdAtUTC"],
        updatedAtUtc: json["updatedAtUTC"],
      );

  Map<String, dynamic> toMap() => {
        "pkge_header_id": pkgeHeaderId,
        "sequence": sequence,
        "itinerary_type": itineraryType,
        "highlight_text": highlightText,
        "is_main_itinerary_highlight":
            isMainItineraryHighlight,
        "is_deleted": isDeleted,
        "id": id,
        "uid": uid,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "updatedBy": updatedBy,
        "updatedDate": updatedDate,
        "createdAtUTC": createdAtUtc,
        "updatedAtUTC": updatedAtUtc,
      };
}
