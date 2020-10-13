import 'package:ota/generated/json/base/json_convert_content.dart';
import 'package:ota/generated/json/base/json_filed.dart';

class FlightSearchResponseEntity with JsonConvert<FlightSearchResponseEntity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	FlightSearchResponseResult result;
}

class FlightSearchResponseResult with JsonConvert<FlightSearchResponseResult> {
	List<FlightSearchResponseResultFlight> flights;
	FlightSearchResponseResultDatePrices datePrices;
	FlightSearchResponseResultDatePricesWithMarkup datePricesWithMarkup;
	List<FlightSearchResponseResultAirlinesFilter> airlinesFilters;
}

class FlightSearchResponseResultFlight with JsonConvert<FlightSearchResponseResultFlight> {
	List<FlightSearchResponseResultFlightsRoute> route;
	int nightsInDest;
	FlightSearchResponseResultFlightsDuration duration;
	String flyFrom;
	String cityFrom;
	String cityCodeFrom;
	FlightSearchResponseResultFlightsCountryFrom countryFrom;
	String flyTo;
	String cityTo;
	String cityCodeTo;
	FlightSearchResponseResultFlightsCountryTo countryTo;
	double distance;
	List<FlightSearchResponseResultFlightsAirlinesMetum> airlinesMeta;
	@JSONField(name: "has_airport_change")
	bool hasAirportChange;
	double price;
	@JSONField(name: "bags_price")
	FlightSearchResponseResultFlightsBagsPrice bagsPrice;
	FlightSearchResponseResultFlightsBaglimit baglimit;
	@JSONField(name: "facilitated_booking_available")
	bool facilitatedBookingAvailable;
	FlightSearchResponseResultFlightsConversion conversion;
	@JSONField(name: "onewaystops_count")
	int onewaystopsCount;
	@JSONField(name: "returnwaystops_count")
	int returnwaystopsCount;
	@JSONField(name: "oneway_local_arrival")
	String onewayLocalArrival;
	@JSONField(name: "oneway_utc_arrival")
	String onewayUtcArrival;
	@JSONField(name: "oneway_local_departure")
	String onewayLocalDeparture;
	@JSONField(name: "oneway_utc_departure")
	String onewayUtcDeparture;
	@JSONField(name: "return_local_arrival")
	String returnLocalArrival;
	@JSONField(name: "return_utc_arrival")
	String returnUtcArrival;
	@JSONField(name: "return_local_departure")
	String returnLocalDeparture;
	@JSONField(name: "return_utc_departure")
	String returnUtcDeparture;
	FlightSearchResponseResultFlightsDisplayRateInfoWithMarkup displayRateInfoWithMarkup;
	String tpa;
	List<FlightSearchResponseResultFlightsOption> options;
}

class FlightSearchResponseResultFlightsRoute with JsonConvert<FlightSearchResponseResultFlightsRoute> {
	@JSONField(name: "fare_category")
	String fareCategory;
	@JSONField(name: "fare_classes")
	String fareClasses;
	@JSONField(name: "fare_family")
	String fareFamily;
	@JSONField(name: "return")
	int xReturn;
	@JSONField(name: "bags_recheck_required")
	bool bagsRecheckRequired;
	String cityTo;
	String cityFrom;
	String cityCodeFrom;
	String cityCodeTo;
	String flyTo;
	String flyFrom;
	String airline;
	@JSONField(name: "operating_carrier")
	String operatingCarrier;
	@JSONField(name: "flight_no")
	int flightNo;
	@JSONField(name: "operating_flight_no")
	String operatingFlightNo;
	@JSONField(name: "local_arrival")
	String localArrival;
	@JSONField(name: "utc_arrival")
	String utcArrival;
	@JSONField(name: "local_departure")
	String localDeparture;
	@JSONField(name: "utc_departure")
	String utcDeparture;
}

class FlightSearchResponseResultFlightsDuration with JsonConvert<FlightSearchResponseResultFlightsDuration> {
	int departure;
	@JSONField(name: "return")
	int xReturn;
	int total;
}

class FlightSearchResponseResultFlightsCountryFrom with JsonConvert<FlightSearchResponseResultFlightsCountryFrom> {
	String code;
	String name;
}

class FlightSearchResponseResultFlightsCountryTo with JsonConvert<FlightSearchResponseResultFlightsCountryTo> {
	String code;
	String name;
}

class FlightSearchResponseResultFlightsAirlinesMetum with JsonConvert<FlightSearchResponseResultFlightsAirlinesMetum> {
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

class FlightSearchResponseResultFlightsBagsPrice with JsonConvert<FlightSearchResponseResultFlightsBagsPrice> {
	@JSONField(name: "__invalid_name__1")
	double dInvalidName1;
	@JSONField(name: "__invalid_name__2")
	dynamic nInvalidName2;
}

class FlightSearchResponseResultFlightsBaglimit with JsonConvert<FlightSearchResponseResultFlightsBaglimit> {
	@JSONField(name: "hand_width")
	int handWidth;
	@JSONField(name: "hand_height")
	int handHeight;
	@JSONField(name: "hand_length")
	int handLength;
	@JSONField(name: "hand_weight")
	int handWeight;
	@JSONField(name: "hold_width")
	int holdWidth;
	@JSONField(name: "hold_height")
	int holdHeight;
	@JSONField(name: "hold_length")
	int holdLength;
	@JSONField(name: "hold_dimensions_sum")
	int holdDimensionsSum;
	@JSONField(name: "hold_weight")
	int holdWeight;
}

class FlightSearchResponseResultFlightsConversion with JsonConvert<FlightSearchResponseResultFlightsConversion> {
	double eur;
}

class FlightSearchResponseResultFlightsDisplayRateInfoWithMarkup with JsonConvert<FlightSearchResponseResultFlightsDisplayRateInfoWithMarkup> {
	double totalPriceWithMarkup;
	double baseRate;
	double taxAndOtherCharges;
	double otaTax;
	double markup;
	double supplierBaseRate;
	double supplierTotalCost;
}

class FlightSearchResponseResultFlightsOption with JsonConvert<FlightSearchResponseResultFlightsOption> {
	String key;
	String value;
}

class FlightSearchResponseResultDatePrices with JsonConvert<FlightSearchResponseResultDatePrices> {
	List<FlightSearchResponseResultDatePricesData> data;
}

class FlightSearchResponseResultDatePricesData with JsonConvert<FlightSearchResponseResultDatePricesData> {
	String date;
	double price;
}

class FlightSearchResponseResultDatePricesWithMarkup with JsonConvert<FlightSearchResponseResultDatePricesWithMarkup> {
	List<FlightSearchResponseResultDatePricesWithMarkupData> data;
}

class FlightSearchResponseResultDatePricesWithMarkupData with JsonConvert<FlightSearchResponseResultDatePricesWithMarkupData> {
	String date;
	double price;
}

class FlightSearchResponseResultAirlinesFilter with JsonConvert<FlightSearchResponseResultAirlinesFilter> {
	String code;
	int count;
	double minprice;
	double minpriceWithMarkup;
	FlightSearchResponseResultAirlinesFiltersMeta meta;
}

class FlightSearchResponseResultAirlinesFiltersMeta with JsonConvert<FlightSearchResponseResultAirlinesFiltersMeta> {
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
