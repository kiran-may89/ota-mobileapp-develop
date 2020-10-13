class PackageResultList {
  PackageResultList({
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

  factory PackageResultList.fromMap(
          Map<String, dynamic> json) =>
      PackageResultList(
        version: json["version"],
        message: json["message"],
        isError: json["isError"],
        responseException:
            json["responseException"],
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
  dynamic travelStyleId;
  String description;
  bool isBuyOnline;
  String currencyId;
  bool hasFixedHeaderPrice;
  dynamic adultPrice;
  dynamic childPrice;
  bool hasSizeLimit;
  dynamic maxGroupSize;
  bool hasSpecificDate;
  bool childrenAllowed;
  dynamic statusId;
  bool isDeleted;
  dynamic internalCode;
  dynamic noCustomersBrought;
  List<Destination> destinations;
  List<Highlight> highlights;
  List<dynamic> images;
  List<dynamic> dailyItineraries;
  dynamic discounts;
  List<dynamic> timelines;
  dynamic id;
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

  dynamic pkgeHeaderId;
  dynamic destinationId;
  dynamic duration;
  dynamic noOfNights;
  dynamic startingDay;
  bool isDeleted;
  List<Stay> stays;
  List<Food> foods;
  List<Transport> transports;
  List<Food> otherServices;
  List<SitesVisit> sitesVisits;
  dynamic id;
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
        stays: List<Stay>.from(json["stays"]
            .map((x) => Stay.fromMap(x))),
        foods: List<Food>.from(json["foods"]
            .map((x) => Food.fromMap(x))),
        transports: List<Transport>.from(
            json["transports"].map(
                (x) => Transport.fromMap(x))),
        otherServices: List<Food>.from(
            json["other_Services"]
                .map((x) => Food.fromMap(x))),
        sitesVisits: List<SitesVisit>.from(
            json["sites_Visits"].map(
                (x) => SitesVisit.fromMap(x))),
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
        "stays": List<dynamic>.from(
            stays.map((x) => x.toMap())),
        "foods": List<dynamic>.from(
            foods.map((x) => x.toMap())),
        "transports": List<dynamic>.from(
            transports.map((x) => x.toMap())),
        "other_Services": List<dynamic>.from(
            otherServices.map((x) => x.toMap())),
        "sites_Visits": List<dynamic>.from(
            sitesVisits.map((x) => x.toMap())),
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

class Food {
  Food({
    this.destinationId,
    this.isOptional,
    this.foodTypeId,
    this.title,
    this.description,
    this.isProvidedAllDays,
    this.fromDay,
    this.toDay,
    this.isDeleted,
    this.foodPricing,
    this.id,
    this.uid,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.createdAtUtc,
    this.updatedAtUtc,
    this.otherServiceName,
    this.otherServiceDescription,
    this.otherServicePricing,
  });

  dynamic destinationId;
  bool isOptional;
  dynamic foodTypeId;
  String title;
  String description;
  bool isProvidedAllDays;
  dynamic fromDay;
  dynamic toDay;
  bool isDeleted;
  List<dynamic> foodPricing;
  dynamic id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String createdAtUtc;
  String updatedAtUtc;
  String otherServiceName;
  String otherServiceDescription;
  List<dynamic> otherServicePricing;

  factory Food.fromMap(
          Map<String, dynamic> json) =>
      Food(
        destinationId: json["destination_id"],
        isOptional: json["is_optional"] == null
            ? null
            : json["is_optional"],
        foodTypeId: json["food_type_id"] == null
            ? null
            : json["food_type_id"],
        title: json["title"] == null
            ? null
            : json["title"],
        description: json["description"] == null
            ? null
            : json["description"],
        isProvidedAllDays:
            json["is_provided_all_days"],
        fromDay: json["from_day"],
        toDay: json["to_day"],
        isDeleted: json["is_deleted"],
        foodPricing: json["food_Pricing"] == null
            ? null
            : List<dynamic>.from(
                json["food_Pricing"]
                    .map((x) => x)),
        id: json["id"],
        uid: json["uid"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"],
        updatedBy: json["updatedBy"],
        updatedDate: json["updatedDate"],
        createdAtUtc: json["createdAtUTC"],
        updatedAtUtc: json["updatedAtUTC"],
        otherServiceName:
            json["other_service_name"] == null
                ? null
                : json["other_service_name"],
        otherServiceDescription:
            json["other_service_description"] ==
                    null
                ? null
                : json[
                    "other_service_description"],
        otherServicePricing:
            json["other_Service_Pricing"] == null
                ? null
                : List<dynamic>.from(
                    json["other_Service_Pricing"]
                        .map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "destination_id": destinationId,
        "is_optional": isOptional == null
            ? null
            : isOptional,
        "food_type_id": foodTypeId == null
            ? null
            : foodTypeId,
        "title": title == null ? null : title,
        "description": description == null
            ? null
            : description,
        "is_provided_all_days": isProvidedAllDays,
        "from_day": fromDay,
        "to_day": toDay,
        "is_deleted": isDeleted,
        "food_Pricing": foodPricing == null
            ? null
            : List<dynamic>.from(
                foodPricing.map((x) => x)),
        "id": id,
        "uid": uid,
        "createdBy": createdBy,
        "createdDate": createdDate,
        "updatedBy": updatedBy,
        "updatedDate": updatedDate,
        "createdAtUTC": createdAtUtc,
        "updatedAtUTC": updatedAtUtc,
        "other_service_name":
            otherServiceName == null
                ? null
                : otherServiceName,
        "other_service_description":
            otherServiceDescription == null
                ? null
                : otherServiceDescription,
        "other_Service_Pricing":
            otherServicePricing == null
                ? null
                : List<dynamic>.from(
                    otherServicePricing
                        .map((x) => x)),
      };
}

class SitesVisit {
  SitesVisit({
    this.destinationId,
    this.isOptional,
    this.title,
    this.description,
    this.hasFixedVisitDay,
    this.visitDay,
    this.howToShowOnMap,
    this.isDeleted,
    this.places,
    this.pricings,
    this.id,
    this.uid,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.createdAtUtc,
    this.updatedAtUtc,
  });

  dynamic destinationId;
  bool isOptional;
  String title;
  String description;
  bool hasFixedVisitDay;
  dynamic visitDay;
  dynamic howToShowOnMap;
  bool isDeleted;
  List<Place> places;
  List<Pricing> pricings;
  dynamic id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String createdAtUtc;
  String updatedAtUtc;

  factory SitesVisit.fromMap(
          Map<String, dynamic> json) =>
      SitesVisit(
        destinationId: json["destination_id"],
        isOptional: json["is_optional"],
        title: json["title"],
        description: json["description"],
        hasFixedVisitDay:
            json["has_fixed_visit_day"] == null
                ? null
                : json["has_fixed_visit_day"],
        visitDay: json["visit_day"],
        howToShowOnMap:
            json["how_to_show_on_map"],
        isDeleted: json["is_deleted"],
        places: List<Place>.from(json["places"]
            .map((x) => Place.fromMap(x))),
        pricings: List<Pricing>.from(
            json["pricings"]
                .map((x) => Pricing.fromMap(x))),
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
        "destination_id": destinationId,
        "is_optional": isOptional,
        "title": title,
        "description": description,
        "has_fixed_visit_day":
            hasFixedVisitDay == null
                ? null
                : hasFixedVisitDay,
        "visit_day": visitDay,
        "how_to_show_on_map": howToShowOnMap,
        "is_deleted": isDeleted,
        "places": List<dynamic>.from(
            places.map((x) => x.toMap())),
        "pricings": List<dynamic>.from(
            pricings.map((x) => x.toMap())),
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

class Place {
  Place({
    this.sitesVisitId,
    this.seqNo,
    this.placeId,
    this.hasSpecificTime,
    this.fromTime,
    this.toTime,
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

  dynamic sitesVisitId;
  dynamic seqNo;
  dynamic placeId;
  bool hasSpecificTime;
  String fromTime;
  String toTime;
  bool isDeleted;
  dynamic id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String createdAtUtc;
  String updatedAtUtc;

  factory Place.fromMap(
          Map<String, dynamic> json) =>
      Place(
        sitesVisitId: json["sites_visit_id"],
        seqNo: json["seq_no"],
        placeId: json["place_id"],
        hasSpecificTime:
            json["has_specific_time"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
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
        "sites_visit_id": sitesVisitId,
        "seq_no": seqNo,
        "place_id": placeId,
        "has_specific_time": hasSpecificTime,
        "from_time": fromTime,
        "to_time": toTime,
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

class Pricing {
  Pricing({
    this.sitesVisitId,
    this.isOptional,
    this.isRecomended,
    this.vehicleTypeId,
    this.withPrivateTransport,
    this.visitPrice,
    this.adultPrice,
    this.childPrice,
    this.vehicleCapacity,
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

  dynamic sitesVisitId;
  bool isOptional;
  bool isRecomended;
  dynamic vehicleTypeId;
  bool withPrivateTransport;
  dynamic visitPrice;
  dynamic adultPrice;
  dynamic childPrice;
  dynamic vehicleCapacity;
  bool isDeleted;
  dynamic id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String createdAtUtc;
  String updatedAtUtc;

  factory Pricing.fromMap(
          Map<String, dynamic> json) =>
      Pricing(
        sitesVisitId: json["sites_visit_id"],
        isOptional: json["is_optional"],
        isRecomended: json["is_recomended"],
        vehicleTypeId: json["vehicle_type_id"],
        withPrivateTransport:
            json["with_private_transport"],
        visitPrice: json["visit_price"],
        adultPrice: json["adult_price"],
        childPrice: json["child_price"],
        vehicleCapacity: json["vehicle_capacity"],
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
        "sites_visit_id": sitesVisitId,
        "is_optional": isOptional,
        "is_recomended": isRecomended,
        "vehicle_type_id": vehicleTypeId,
        "with_private_transport":
            withPrivateTransport,
        "visit_price": visitPrice,
        "adult_price": adultPrice,
        "child_price": childPrice,
        "vehicle_capacity": vehicleCapacity,
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

class Stay {
  Stay({
    this.destinationId,
    this.isOptional,
    this.stayId,
    this.checkInDay,
    this.checkInTime,
    this.noOfNights,
    this.checkOutDay,
    this.checkOutTime,
    this.howToShowOnMap,
    this.isDeleted,
    this.title,
    this.description,
    this.stayPricings,
    this.id,
    this.uid,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.createdAtUtc,
    this.updatedAtUtc,
  });

  dynamic destinationId;
  bool isOptional;
  dynamic stayId;
  dynamic checkInDay;
  String checkInTime;
  dynamic noOfNights;
  dynamic checkOutDay;
  String checkOutTime;
  dynamic howToShowOnMap;
  bool isDeleted;
  String title;
  String description;
  List<dynamic> stayPricings;
  dynamic id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String createdAtUtc;
  String updatedAtUtc;

  factory Stay.fromMap(
          Map<String, dynamic> json) =>
      Stay(
        destinationId: json["destination_id"],
        isOptional: json["is_optional"],
        stayId: json["stay_id"],
        checkInDay: json["check_in_day"],
        checkInTime: json["check_in_time"],
        noOfNights: json["no_of_nights"],
        checkOutDay: json["check_out_day"],
        checkOutTime: json["check_out_time"],
        howToShowOnMap:
            json["how_to_show_on_map"],
        isDeleted: json["is_deleted"],
        title: json["title"],
        description: json["description"],
        stayPricings: List<dynamic>.from(
            json["stay_Pricings"].map((x) => x)),
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
        "destination_id": destinationId,
        "is_optional": isOptional,
        "stay_id": stayId,
        "check_in_day": checkInDay,
        "check_in_time": checkInTime,
        "no_of_nights": noOfNights,
        "check_out_day": checkOutDay,
        "check_out_time": checkOutTime,
        "how_to_show_on_map": howToShowOnMap,
        "is_deleted": isDeleted,
        "title": title,
        "description": description,
        "stay_Pricings": List<dynamic>.from(
            stayPricings.map((x) => x)),
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

class Transport {
  Transport({
    this.destinationId,
    this.isOptional,
    this.transportModeId,
    this.title,
    this.description,
    this.startDay,
    this.startTime,
    this.havePhotos,
    this.endDay,
    this.isDeleted,
    this.transportPricing,
    this.id,
    this.uid,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.createdAtUtc,
    this.updatedAtUtc,
  });

  dynamic destinationId;
  bool isOptional;
  dynamic transportModeId;
  String title;
  String description;
  dynamic startDay;
  String startTime;
  bool havePhotos;
  dynamic endDay;
  bool isDeleted;
  List<dynamic> transportPricing;
  dynamic id;
  String uid;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  String createdAtUtc;
  String updatedAtUtc;

  factory Transport.fromMap(
          Map<String, dynamic> json) =>
      Transport(
        destinationId: json["destination_id"],
        isOptional: json["is_optional"],
        transportModeId:
            json["transport_mode_id"],
        title: json["title"],
        description: json["description"],
        startDay: json["start_day"],
        startTime: json["start_time"],
        havePhotos: json["have_photos"],
        endDay: json["end_day"],
        isDeleted: json["is_deleted"],
        transportPricing: List<dynamic>.from(
            json["transport_Pricing"]
                .map((x) => x)),
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
        "destination_id": destinationId,
        "is_optional": isOptional,
        "transport_mode_id": transportModeId,
        "title": title,
        "description": description,
        "start_day": startDay,
        "start_time": startTime,
        "have_photos": havePhotos,
        "end_day": endDay,
        "is_deleted": isDeleted,
        "transport_Pricing": List<dynamic>.from(
            transportPricing.map((x) => x)),
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

  dynamic pkgeHeaderId;
  dynamic sequence;
  String itineraryType;
  String highlightText;
  bool isMainItineraryHighlight;
  bool isDeleted;
  dynamic id;
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
