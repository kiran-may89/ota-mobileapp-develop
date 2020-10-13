import 'package:ota/generated/json/base/json_convert_content.dart';
import 'package:ota/generated/json/base/json_filed.dart';

class CheckAvailabilityResponseEntity with JsonConvert<CheckAvailabilityResponseEntity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	CheckAvailabilityResponseResult result;
}

class CheckAvailabilityResponseResult with JsonConvert<CheckAvailabilityResponseResult> {
	String tpa;
	List<CheckAvailabilityResponseResultOption> options;
	List<CheckAvailabilityResponseResultAirlinesMetum> airlinesMeta;
	@JSONField(name: "server_time")
	double serverTime;
	double pnum;
	List<CheckAvailabilityResponseResultFlight> flights;
	@JSONField(name: "flights_checked")
	bool flightsChecked;
	@JSONField(name: "flights_to_check")
	bool flightsToCheck;
	@JSONField(name: "flights_real_checked")
	bool flightsRealChecked;
	@JSONField(name: "flights_invalid")
	bool flightsInvalid;
	@JSONField(name: "max_passengers")
	double maxPassengers;
	@JSONField(name: "infants_conditions")
	CheckAvailabilityResponseResultInfantsConditions infantsConditions;
	@JSONField(name: "document_options")
	CheckAvailabilityResponseResultDocumentOptions documentOptions;
	@JSONField(name: "visas_agreement_requiered")
	bool visasAgreementRequiered;
	List<dynamic> transfers;
	List<String> route;
	@JSONField(name: "book_fee")
	double bookFee;
	@JSONField(name: "fee_airline")
	double feeAirline;
	@JSONField(name: "extra_fee")
	double extraFee;
	@JSONField(name: "flights_price")
	double flightsPrice;
	double total;
	@JSONField(name: "sp_fee")
	double spFee;
	@JSONField(name: "flight_real_price")
	double flightRealPrice;
	@JSONField(name: "one_passenger")
	double onePassenger;
	@JSONField(name: "credits_price")
	double creditsPrice;
	@JSONField(name: "orig_price_usage")
	bool origPriceUsage;
	@JSONField(name: "price_change")
	bool priceChange;
	@JSONField(name: "tickets_price")
	double ticketsPrice;
	@JSONField(name: "orig_price")
	double origPrice;
	@JSONField(name: "insurance_data")
	CheckAvailabilityResponseResultInsuranceData insuranceData;
	@JSONField(name: "insurance_price")
	CheckAvailabilityResponseResultInsurancePrice insurancePrice;
	@JSONField(name: "adults_price")
	double adultsPrice;
	@JSONField(name: "children_price")
	double childrenPrice;
	@JSONField(name: "infants_price")
	double infantsPrice;
	CheckAvailabilityResponseResultBags bags;
	@JSONField(name: "bags_fee")
	double bagsFee;
	@JSONField(name: "bags_fee_split")
	CheckAvailabilityResponseResultBagsFeeSplit bagsFeeSplit;
	@JSONField(name: "bags_price")
	CheckAvailabilityResponseResultBagsPrice bagsPrice;
	@JSONField(name: "bags_price_split")
	CheckAvailabilityResponseResultBagsPriceSplit bagsPriceSplit;
	@JSONField(name: "hand_bags_price")
	CheckAvailabilityResponseResultHandBagsPrice handBagsPrice;
	@JSONField(name: "bags_restrictions")
	CheckAvailabilityResponseResultBagsRestrictions bagsRestrictions;
	@JSONField(name: "additional_order_baggage_fee")
	double additionalOrderBaggageFee;
	List<String> luggage;
	List<dynamic> segments;
	String currency;
	CheckAvailabilityResponseResultConversion conversion;
	@JSONField(name: "booking_token")
	String bookingToken;
	@JSONField(name: "adult_threshold")
	double adultThreshold;
	@JSONField(name: "age_category_thresholds")
	CheckAvailabilityResponseResultAgeCategoryThresholds ageCategoryThresholds;
	@JSONField(name: "additional_services")
	CheckAvailabilityResponseResultAdditionalServices additionalServices;
	CheckAvailabilityResponseResultBaggage baggage;
	@JSONField(name: "has_us_segment")
	bool hasUsSegment;
	@JSONField(name: "eur_payment_price")
	double eurPaymentPrice;
	@JSONField(name: "book_feeWithMarkup")
	double bookFeewithmarkup;
	@JSONField(name: "fee_airlineWithMarkup")
	double feeAirlinewithmarkup;
	@JSONField(name: "extra_feeWithMarkup")
	double extraFeewithmarkup;
	@JSONField(name: "flights_priceWithMarkup")
	double flightsPricewithmarkup;
	CheckAvailabilityResponseResultDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	@JSONField(name: "sp_feeWithMarkup")
	double spFeewithmarkup;
	@JSONField(name: "flight_real_priceWithMarkup")
	double flightRealPricewithmarkup;
	@JSONField(name: "eur_payment_priceWithMarkup")
	double eurPaymentPricewithmarkup;
}

class CheckAvailabilityResponseResultOption with JsonConvert<CheckAvailabilityResponseResultOption> {
	String key;
	String value;
}

class CheckAvailabilityResponseResultAirlinesMetum with JsonConvert<CheckAvailabilityResponseResultAirlinesMetum> {
	String code;
	String type;
	String name;
	int lcc;
	String image32;
	String image64;
	String image128;
	bool isDeleted;
	int id;
	String uid;
	String createdBy;
	String createdDate;
	dynamic updatedBy;
	String updatedDate;
}

class CheckAvailabilityResponseResultFlight with JsonConvert<CheckAvailabilityResponseResultFlight> {
	String id;
	@JSONField(name: "combination_trip_id")
	String combinationTripId;
	@JSONField(name: "original_trip_id")
	String originalTripId;
	String dst;
	String src;
	@JSONField(name: "flight_no")
	String flightNo;
	CheckAvailabilityResponseResultFlightsAirline airline;
	@JSONField(name: "operating_airline")
	CheckAvailabilityResponseResultFlightsOperatingAirline operatingAirline;
	String source;
	@JSONField(name: "scraping_start")
	double scrapingStart;
	String extras;
	@JSONField(name: "passengers_flight_check")
	CheckAvailabilityResponseResultFlightsPassengersFlightCheck passengersFlightCheck;
	double price;
	double eur;
	@JSONField(name: "found_on")
	String foundOn;
	double invalid;
	String timestamp;
	String refreshed;
	@JSONField(name: "refresh_ttl")
	double refreshTtl;
	@JSONField(name: "refresh_period")
	double refreshPeriod;
	@JSONField(name: "fare_basis")
	String fareBasis;
	@JSONField(name: "fare_category")
	String fareCategory;
	@JSONField(name: "fare_restriction")
	dynamic fareRestriction;
	@JSONField(name: "fare_class")
	String fareClass;
	@JSONField(name: "baggage_fare")
	String baggageFare;
	@JSONField(name: "is_cabin_bags_with_priority_boarding")
	dynamic isCabinBagsWithPriorityBoarding;
	@JSONField(name: "source_name")
	String sourceName;
	@JSONField(name: "source_url")
	String sourceUrl;
	String checkin;
	@JSONField(name: "src_country")
	String srcCountry;
	@JSONField(name: "dst_country")
	String dstCountry;
	@JSONField(name: "src_station")
	String srcStation;
	@JSONField(name: "dst_station")
	String dstStation;
	@JSONField(name: "infants_conditions")
	CheckAvailabilityResponseResultFlightsInfantsConditions infantsConditions;
	@JSONField(name: "eur_infants")
	double eurInfants;
	@JSONField(name: "eur_children")
	double eurChildren;
	@JSONField(name: "max_passengers_for_price")
	double maxPassengersForPrice;
	@JSONField(name: "src_name")
	String srcName;
	@JSONField(name: "dst_name")
	String dstName;
	CheckAvailabilityResponseResultFlightsVehicle vehicle;
	@JSONField(name: "return")
	double xReturn;
	bool guarantee;
	@JSONField(name: "guarantee_disclaimer")
	String guaranteeDisclaimer;
	@JSONField(name: "bags_recheck_required")
	bool bagsRecheckRequired;
	@JSONField(name: "bags_recheck_disclaimer")
	String bagsRecheckDisclaimer;
	@JSONField(name: "segment_pricing")
	CheckAvailabilityResponseResultFlightsSegmentPricing segmentPricing;
	@JSONField(name: "local_arrival")
	String localArrival;
	@JSONField(name: "utc_arrival")
	String utcArrival;
	@JSONField(name: "local_departure")
	String localDeparture;
	@JSONField(name: "utc_departure")
	String utcDeparture;
}

class CheckAvailabilityResponseResultFlightsAirline with JsonConvert<CheckAvailabilityResponseResultFlightsAirline> {
	double id;
	String code;
	@JSONField(name: "iata_code")
	String iataCode;
	@JSONField(name: "icao_code")
	String icaoCode;
	@JSONField(name: "code_public")
	String codePublic;
	String airLineName;
	dynamic alliance;
	String url;
	double checkin;
	@JSONField(name: "close_booking_hours")
	double closeBookingHours;
	@JSONField(name: "booking_doc_needed")
	double bookingDocNeeded;
	@JSONField(name: "airport_checkin")
	double airportCheckin;
	@JSONField(name: "passengers_in_search")
	double passengersInSearch;
	@JSONField(name: "doing_online_checkin")
	double doingOnlineCheckin;
	@JSONField(name: "maximum_passengers")
	double maximumPassengers;
	String grade;
	@JSONField(name: "virtual_card_req")
	bool virtualCardReq;
	String country;
	@JSONField(name: "carrier_type")
	String carrierType;
	@JSONField(name: "parent_carrier")
	String parentCarrier;
	@JSONField(name: "checkin_closure")
	double checkinClosure;
	@JSONField(name: "shorter_stopovers_allowed")
	double shorterStopoversAllowed;
	bool deprecated;
	@JSONField(name: "book_fee")
	double bookFee;
	@JSONField(name: "fee_airline")
	double feeAirline;
	@JSONField(name: "search_priority")
	dynamic searchPriority;
	@JSONField(name: "fee_instead")
	double feeInstead;
	@JSONField(name: "fee_percent")
	double feePercent;
	@JSONField(name: "flight_change_fee")
	double flightChangeFee;
	@JSONField(name: "threshold_child")
	String thresholdChild;
	@JSONField(name: "threshold_teen")
	dynamic thresholdTeen;
	@JSONField(name: "threshold_adult")
	String thresholdAdult;
	@JSONField(name: "fees_per_source")
	CheckAvailabilityResponseResultFlightsAirlineFeesPerSource feesPerSource;
	@JSONField(name: "affil_url")
	dynamic affilUrl;
	@JSONField(name: "temporary_disabled")
	dynamic temporaryDisabled;
	@JSONField(name: "non_active_reason")
	dynamic nonActiveReason;
	dynamic lcc;
	double active;
	String iatacode;
	@JSONField(name: "is_passenger_cardholder")
	bool isPassengerCardholder;
	@JSONField(name: "is_private_fares_allowed")
	bool isPrivateFaresAllowed;
	@JSONField(name: "luggage_only_during_checkin_airlines")
	bool luggageOnlyDuringCheckinAirlines;
	@JSONField(name: "luggage_only_on_web")
	bool luggageOnlyOnWeb;
	@JSONField(name: "mmb_link")
	dynamic mmbLink;
	@JSONField(name: "payment_card_copy_eticket_requirement")
	bool paymentCardCopyEticketRequirement;
	@JSONField(name: "skip_subairline_merge")
	bool skipSubairlineMerge;
	@JSONField(name: "Name")
	String name;
	String iata;
	@JSONField(name: "hand_length")
	double handLength;
	@JSONField(name: "hand_width")
	double handWidth;
	@JSONField(name: "hand_height")
	double handHeight;
	@JSONField(name: "hand_weight")
	double handWeight;
	@JSONField(name: "hold_weight")
	double holdWeight;
	@JSONField(name: "hold_length")
	double holdLength;
	@JSONField(name: "hold_width")
	double holdWidth;
	@JSONField(name: "hold_height")
	double holdHeight;
	@JSONField(name: "hand2_length")
	dynamic hand2Length;
	@JSONField(name: "hand2_width")
	dynamic hand2Width;
	@JSONField(name: "hand2_height")
	dynamic hand2Height;
	@JSONField(name: "hand2_weight")
	dynamic hand2Weight;
	@JSONField(name: "hand2_note")
	String hand2Note;
	@JSONField(name: "hand_note")
	String handNote;
	@JSONField(name: "hold_note")
	String holdNote;
}

class CheckAvailabilityResponseResultFlightsAirlineFeesPerSource with JsonConvert<CheckAvailabilityResponseResultFlightsAirlineFeesPerSource> {

}

class CheckAvailabilityResponseResultFlightsOperatingAirline with JsonConvert<CheckAvailabilityResponseResultFlightsOperatingAirline> {
	String iata;
	String name;
}

class CheckAvailabilityResponseResultFlightsPassengersFlightCheck with JsonConvert<CheckAvailabilityResponseResultFlightsPassengersFlightCheck> {
	@JSONField(name: "1")
	CheckAvailabilityResponseResultFlightsPassengersFlightCheck1 x1;
}

class CheckAvailabilityResponseResultFlightsPassengersFlightCheck1 with JsonConvert<CheckAvailabilityResponseResultFlightsPassengersFlightCheck1> {
	double eur;
	bool invalid;
	@JSONField(name: "last_checked")
	int lastChecked;
}

class CheckAvailabilityResponseResultFlightsInfantsConditions with JsonConvert<CheckAvailabilityResponseResultFlightsInfantsConditions> {
	bool trolley;
	@JSONField(name: "hand_weight")
	double handWeight;
}

class CheckAvailabilityResponseResultFlightsVehicle with JsonConvert<CheckAvailabilityResponseResultFlightsVehicle> {
	String type;
}

class CheckAvailabilityResponseResultFlightsSegmentPricing with JsonConvert<CheckAvailabilityResponseResultFlightsSegmentPricing> {
	CheckAvailabilityResponseResultFlightsSegmentPricingAdult adult;
	CheckAvailabilityResponseResultFlightsSegmentPricingChild child;
	CheckAvailabilityResponseResultFlightsSegmentPricingInfant infant;
}

class CheckAvailabilityResponseResultFlightsSegmentPricingAdult with JsonConvert<CheckAvailabilityResponseResultFlightsSegmentPricingAdult> {
	String currency;
	String amount;
	String base;
	String service;
	@JSONField(name: "service_flat")
	String serviceFlat;
	String merchant;
}

class CheckAvailabilityResponseResultFlightsSegmentPricingChild with JsonConvert<CheckAvailabilityResponseResultFlightsSegmentPricingChild> {
	String currency;
	String amount;
	String base;
	String service;
	@JSONField(name: "service_flat")
	String serviceFlat;
	String merchant;
}

class CheckAvailabilityResponseResultFlightsSegmentPricingInfant with JsonConvert<CheckAvailabilityResponseResultFlightsSegmentPricingInfant> {
	String currency;
	String amount;
	String base;
	String service;
	@JSONField(name: "service_flat")
	String serviceFlat;
	String merchant;
}

class CheckAvailabilityResponseResultInfantsConditions with JsonConvert<CheckAvailabilityResponseResultInfantsConditions> {
	bool trolley;
	@JSONField(name: "hand_weight")
	double handWeight;
}

class CheckAvailabilityResponseResultDocumentOptions with JsonConvert<CheckAvailabilityResponseResultDocumentOptions> {
	@JSONField(name: "document_need")
	double documentNeed;
	@JSONField(name: "checkin_date")
	double checkinDate;
	@JSONField(name: "airport_checkin_price")
	double airportCheckinPrice;
}

class CheckAvailabilityResponseResultInsuranceData with JsonConvert<CheckAvailabilityResponseResultInsuranceData> {
	@JSONField(name: "travel_basic")
	CheckAvailabilityResponseResultInsuranceDataTravelBasic travelBasic;
	@JSONField(name: "travel_plus")
	CheckAvailabilityResponseResultInsuranceDataTravelPlus travelPlus;
	String tarif;
	@JSONField(name: "valid_from")
	double validFrom;
	@JSONField(name: "valid_to")
	double validTo;
	CheckAvailabilityResponseResultInsuranceDataSkysilver skysilver;
	CheckAvailabilityResponseResultInsuranceDataSkygold skygold;
}

class CheckAvailabilityResponseResultInsuranceDataTravelBasic with JsonConvert<CheckAvailabilityResponseResultInsuranceDataTravelBasic> {
	double price;
	@JSONField(name: "product_num")
	String productNum;
}

class CheckAvailabilityResponseResultInsuranceDataTravelPlus with JsonConvert<CheckAvailabilityResponseResultInsuranceDataTravelPlus> {
	double price;
	@JSONField(name: "product_num")
	String productNum;
}

class CheckAvailabilityResponseResultInsuranceDataSkysilver with JsonConvert<CheckAvailabilityResponseResultInsuranceDataSkysilver> {
	double price;
	@JSONField(name: "product_num")
	String productNum;
}

class CheckAvailabilityResponseResultInsuranceDataSkygold with JsonConvert<CheckAvailabilityResponseResultInsuranceDataSkygold> {
	double price;
	@JSONField(name: "product_num")
	String productNum;
}

class CheckAvailabilityResponseResultInsurancePrice with JsonConvert<CheckAvailabilityResponseResultInsurancePrice> {
	@JSONField(name: "travel_basic")
	double travelBasic;
	@JSONField(name: "travel_plus")
	double travelPlus;
	double skysilver;
	double skygold;
}

class CheckAvailabilityResponseResultBags with JsonConvert<CheckAvailabilityResponseResultBags> {
	@JSONField(name: "_is_deprecated")
	bool bIsDeprecated;
	CheckAvailabilityResponseResultBagsDefinitions definitions;
}

class CheckAvailabilityResponseResultBagsDefinitions with JsonConvert<CheckAvailabilityResponseResultBagsDefinitions> {
	@JSONField(name: "cabin_bag")
	List<CheckAvailabilityResponseResultBagsDefinitionsCabinBag> cabinBag;
}

class CheckAvailabilityResponseResultBagsDefinitionsCabinBag with JsonConvert<CheckAvailabilityResponseResultBagsDefinitionsCabinBag> {
	double price;
	CheckAvailabilityResponseResultBagsDefinitionsCabinBagConditions conditions;
	String category;
	CheckAvailabilityResponseResultBagsDefinitionsCabinBagRestrictions restrictions;
	String currency;
	dynamic note;
	@JSONField(name: "_warning")
	String sWarning;
}

class CheckAvailabilityResponseResultBagsDefinitionsCabinBagConditions with JsonConvert<CheckAvailabilityResponseResultBagsDefinitionsCabinBagConditions> {
	@JSONField(name: "passenger_groups")
	List<String> passengerGroups;
}

class CheckAvailabilityResponseResultBagsDefinitionsCabinBagRestrictions with JsonConvert<CheckAvailabilityResponseResultBagsDefinitionsCabinBagRestrictions> {
	@JSONField(name: "dimensions_sum")
	double dimensionsSum;
	double weight;
	double length;
	double height;
	double width;
}

class CheckAvailabilityResponseResultBagsFeeSplit with JsonConvert<CheckAvailabilityResponseResultBagsFeeSplit> {
	double base;
	double service;
	double amount;
	String currency;
}

class CheckAvailabilityResponseResultBagsPrice with JsonConvert<CheckAvailabilityResponseResultBagsPrice> {
	@JSONField(name: "1")
	double x1;
}

class CheckAvailabilityResponseResultBagsPriceSplit with JsonConvert<CheckAvailabilityResponseResultBagsPriceSplit> {
	@JSONField(name: "_abp")
	double dAbp;
	@JSONField(name: "1")
	CheckAvailabilityResponseResultBagsPriceSplit1 x1;
}

class CheckAvailabilityResponseResultBagsPriceSplit1 with JsonConvert<CheckAvailabilityResponseResultBagsPriceSplit1> {
	String currency;
	String amount;
	String base;
	String service;
	@JSONField(name: "service_flat")
	String serviceFlat;
	String merchant;
}

class CheckAvailabilityResponseResultHandBagsPrice with JsonConvert<CheckAvailabilityResponseResultHandBagsPrice> {

}

class CheckAvailabilityResponseResultBagsRestrictions with JsonConvert<CheckAvailabilityResponseResultBagsRestrictions> {

}

class CheckAvailabilityResponseResultConversion with JsonConvert<CheckAvailabilityResponseResultConversion> {
	String currency;
	double amount;
	@JSONField(name: "bags_price")
	CheckAvailabilityResponseResultConversionBagsPrice bagsPrice;
	@JSONField(name: "additional_order_baggage_fee")
	double additionalOrderBaggageFee;
	@JSONField(name: "adults_price")
	double adultsPrice;
	@JSONField(name: "children_price")
	double childrenPrice;
	@JSONField(name: "infants_price")
	double infantsPrice;
}

class CheckAvailabilityResponseResultConversionBagsPrice with JsonConvert<CheckAvailabilityResponseResultConversionBagsPrice> {
	@JSONField(name: "1")
	double x1;
}

class CheckAvailabilityResponseResultAgeCategoryThresholds with JsonConvert<CheckAvailabilityResponseResultAgeCategoryThresholds> {
	String adult;
	String child;
}

class CheckAvailabilityResponseResultAdditionalServices with JsonConvert<CheckAvailabilityResponseResultAdditionalServices> {

}

class CheckAvailabilityResponseResultBaggage with JsonConvert<CheckAvailabilityResponseResultBaggage> {
	CheckAvailabilityResponseResultBaggageDefinitions definitions;
	CheckAvailabilityResponseResultBaggageCombinations combinations;
	CheckAvailabilityResponseResultBaggageNotices notices;
}

class CheckAvailabilityResponseResultBaggageDefinitions with JsonConvert<CheckAvailabilityResponseResultBaggageDefinitions> {
	@JSONField(name: "hold_bag")
	List<CheckAvailabilityResponseResultBaggageDefinitionsHoldBag> holdBag;
	@JSONField(name: "hand_bag")
	List<CheckAvailabilityResponseResultBaggageDefinitionsHandBag> handBag;
}

class CheckAvailabilityResponseResultBaggageDefinitionsHoldBag with JsonConvert<CheckAvailabilityResponseResultBaggageDefinitionsHoldBag> {
	CheckAvailabilityResponseResultBaggageDefinitionsHoldBagPrice price;
	CheckAvailabilityResponseResultBaggageDefinitionsHoldBagConditions conditions;
	String category;
	CheckAvailabilityResponseResultBaggageDefinitionsHoldBagRestrictions restrictions;
}

class CheckAvailabilityResponseResultBaggageDefinitionsHoldBagPrice with JsonConvert<CheckAvailabilityResponseResultBaggageDefinitionsHoldBagPrice> {
	String currency;
	String amount;
	String base;
	String service;
	@JSONField(name: "service_flat")
	String serviceFlat;
	String merchant;
}

class CheckAvailabilityResponseResultBaggageDefinitionsHoldBagConditions with JsonConvert<CheckAvailabilityResponseResultBaggageDefinitionsHoldBagConditions> {
	@JSONField(name: "passenger_groups")
	List<String> passengerGroups;
}

class CheckAvailabilityResponseResultBaggageDefinitionsHoldBagRestrictions with JsonConvert<CheckAvailabilityResponseResultBaggageDefinitionsHoldBagRestrictions> {
	@JSONField(name: "dimensions_sum")
	double dimensionsSum;
	double weight;
	double length;
	double height;
	double width;
}

class CheckAvailabilityResponseResultBaggageDefinitionsHandBag with JsonConvert<CheckAvailabilityResponseResultBaggageDefinitionsHandBag> {
	CheckAvailabilityResponseResultBaggageDefinitionsHandBagPrice price;
	CheckAvailabilityResponseResultBaggageDefinitionsHandBagConditions conditions;
	String category;
	CheckAvailabilityResponseResultBaggageDefinitionsHandBagRestrictions restrictions;
}

class CheckAvailabilityResponseResultBaggageDefinitionsHandBagPrice with JsonConvert<CheckAvailabilityResponseResultBaggageDefinitionsHandBagPrice> {
	String currency;
	String amount;
	String base;
	String service;
	@JSONField(name: "service_flat")
	String serviceFlat;
	String merchant;
}

class CheckAvailabilityResponseResultBaggageDefinitionsHandBagConditions with JsonConvert<CheckAvailabilityResponseResultBaggageDefinitionsHandBagConditions> {
	@JSONField(name: "passenger_groups")
	List<String> passengerGroups;
}

class CheckAvailabilityResponseResultBaggageDefinitionsHandBagRestrictions with JsonConvert<CheckAvailabilityResponseResultBaggageDefinitionsHandBagRestrictions> {
	@JSONField(name: "dimensions_sum")
	double dimensionsSum;
	double weight;
	double length;
	double height;
	double width;
}

class CheckAvailabilityResponseResultBaggageCombinations with JsonConvert<CheckAvailabilityResponseResultBaggageCombinations> {
	@JSONField(name: "hold_bag")
	List<CheckAvailabilityResponseResultBaggageCombinationsHoldBag> holdBag;
	@JSONField(name: "hand_bag")
	List<CheckAvailabilityResponseResultBaggageCombinationsHandBag> handBag;
}

class CheckAvailabilityResponseResultBaggageCombinationsHoldBag with JsonConvert<CheckAvailabilityResponseResultBaggageCombinationsHoldBag> {
	CheckAvailabilityResponseResultBaggageCombinationsHoldBagPrice price;
	CheckAvailabilityResponseResultBaggageCombinationsHoldBagConditions conditions;
	String category;
	dynamic restrictions;
}

class CheckAvailabilityResponseResultBaggageCombinationsHoldBagPrice with JsonConvert<CheckAvailabilityResponseResultBaggageCombinationsHoldBagPrice> {
	String currency;
	String amount;
	String base;
	String service;
	@JSONField(name: "service_flat")
	String serviceFlat;
	String merchant;
}

class CheckAvailabilityResponseResultBaggageCombinationsHoldBagConditions with JsonConvert<CheckAvailabilityResponseResultBaggageCombinationsHoldBagConditions> {
	@JSONField(name: "passenger_groups")
	List<String> passengerGroups;
}

class CheckAvailabilityResponseResultBaggageCombinationsHandBag with JsonConvert<CheckAvailabilityResponseResultBaggageCombinationsHandBag> {
	CheckAvailabilityResponseResultBaggageCombinationsHandBagPrice price;
	CheckAvailabilityResponseResultBaggageCombinationsHandBagConditions conditions;
	String category;
	dynamic restrictions;
}

class CheckAvailabilityResponseResultBaggageCombinationsHandBagPrice with JsonConvert<CheckAvailabilityResponseResultBaggageCombinationsHandBagPrice> {
	String currency;
	String amount;
	String base;
	String service;
	@JSONField(name: "service_flat")
	String serviceFlat;
	String merchant;
}

class CheckAvailabilityResponseResultBaggageCombinationsHandBagConditions with JsonConvert<CheckAvailabilityResponseResultBaggageCombinationsHandBagConditions> {
	@JSONField(name: "passenger_groups")
	List<String> passengerGroups;
}

class CheckAvailabilityResponseResultBaggageNotices with JsonConvert<CheckAvailabilityResponseResultBaggageNotices> {

}

class CheckAvailabilityResponseResultDisplayRateInfoWithMarkup with JsonConvert<CheckAvailabilityResponseResultDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
}
