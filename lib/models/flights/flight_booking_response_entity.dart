import 'package:ota/generated/json/base/json_convert_content.dart';
import 'package:ota/generated/json/base/json_filed.dart';

class FlightBookingResponseEntity with JsonConvert<FlightBookingResponseEntity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	FlightBookingResponseResult result;
}

class FlightBookingResponseResult with JsonConvert<FlightBookingResponseResult> {
	String tpa;
	List<FlightBookingResponseResultOption> options;
	List<dynamic> airlinesMeta;
	@JSONField(name: "server_time")
	dynamic serverTime;
	dynamic pnum;
	List<dynamic> flights;
	@JSONField(name: "flights_checked")
	dynamic flightsChecked;
	@JSONField(name: "flights_to_check")
	dynamic flightsToCheck;
	@JSONField(name: "flights_real_checked")
	dynamic flightsRealChecked;
	@JSONField(name: "flights_invalid")
	dynamic flightsInvalid;
	@JSONField(name: "max_passengers")
	dynamic maxPassengers;
	@JSONField(name: "infants_conditions")
	dynamic infantsConditions;
	@JSONField(name: "document_options")
	dynamic documentOptions;
	@JSONField(name: "visas_agreement_requiered")
	dynamic visasAgreementRequiered;
	List<dynamic> transfers;
	List<dynamic> route;
	@JSONField(name: "book_fee")
	dynamic bookFee;
	@JSONField(name: "fee_airline")
	dynamic feeAirline;
	@JSONField(name: "extra_fee")
	dynamic extraFee;
	@JSONField(name: "flights_price")
	dynamic flightsPrice;
	dynamic total;
	@JSONField(name: "sp_fee")
	dynamic spFee;
	@JSONField(name: "flight_real_price")
	dynamic flightRealPrice;
	@JSONField(name: "one_passenger")
	dynamic onePassenger;
	@JSONField(name: "credits_price")
	dynamic creditsPrice;
	@JSONField(name: "orig_price_usage")
	dynamic origPriceUsage;
	@JSONField(name: "price_change")
	dynamic priceChange;
	@JSONField(name: "tickets_price")
	dynamic ticketsPrice;
	@JSONField(name: "orig_price")
	dynamic origPrice;
	@JSONField(name: "insurance_data")
	dynamic insuranceData;
	@JSONField(name: "insurance_price")
	dynamic insurancePrice;
	@JSONField(name: "adults_price")
	dynamic adultsPrice;
	@JSONField(name: "children_price")
	dynamic childrenPrice;
	@JSONField(name: "infants_price")
	dynamic infantsPrice;
	dynamic bags;
	@JSONField(name: "bags_fee")
	dynamic bagsFee;
	@JSONField(name: "bags_fee_split")
	dynamic bagsFeeSplit;
	@JSONField(name: "bags_price")
	FlightBookingResponseResultBagsPrice bagsPrice;
	@JSONField(name: "bags_price_split")
	dynamic bagsPriceSplit;
	@JSONField(name: "hand_bags_price")
	dynamic handBagsPrice;
	@JSONField(name: "bags_restrictions")
	dynamic bagsRestrictions;
	@JSONField(name: "additional_order_baggage_fee")
	dynamic additionalOrderBaggageFee;
	List<dynamic> luggage;
	dynamic sandbox;
	String status;
	dynamic promocode;
	List<dynamic> passengers;
	@JSONField(name: "auth_token")
	dynamic authToken;
	@JSONField(name: "booking_id")
	dynamic bookingId;
	@JSONField(name: "transaction_id")
	dynamic transactionId;
	@JSONField(name: "status_code")
	dynamic statusCode;
	@JSONField(name: "zooz_token")
	dynamic zoozToken;
	@JSONField(name: "eur_payment_price")
	dynamic eurPaymentPrice;
	@JSONField(name: "book_feeWithMarkup")
	dynamic bookFeewithmarkup;
	@JSONField(name: "fee_airlineWithMarkup")
	dynamic feeAirlinewithmarkup;
	@JSONField(name: "extra_feeWithMarkup")
	dynamic extraFeewithmarkup;
	@JSONField(name: "flights_priceWithMarkup")
	dynamic flightsPricewithmarkup;
	dynamic totalWithMarkup;
	@JSONField(name: "sp_feeWithMarkup")
	dynamic spFeewithmarkup;
	@JSONField(name: "flight_real_priceWithMarkup")
	dynamic flightRealPricewithmarkup;
}

class FlightBookingResponseResultOption with JsonConvert<FlightBookingResponseResultOption> {
	String key;
	String value;
}

class FlightBookingResponseResultBagsPrice with JsonConvert<FlightBookingResponseResultBagsPrice> {

}
