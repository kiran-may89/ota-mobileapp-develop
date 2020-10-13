import 'package:ota/generated/json/base/json_convert_content.dart';
import 'package:ota/generated/json/base/json_filed.dart';

class TransferPlaceOrderRequestEntity with JsonConvert<TransferPlaceOrderRequestEntity> {
	String tenantId;
	String lang;
	String currency;
	List<TransferPlaceOrderRequestTrip> trips;
}

class TransferPlaceOrderRequestTrip with JsonConvert<TransferPlaceOrderRequestTrip> {
	@JSONField(name: "start_location")
	TransferPlaceOrderRequestTripsStartLocation startLocation;
	@JSONField(name: "finish_location")
	TransferPlaceOrderRequestTripsFinishLocation finishLocation;
	@JSONField(name: "additional_location")
	List<TransferPlaceOrderRequestTripsAdditionalLocation> additionalLocation;
	List<TransferPlaceOrderRequestTripsPassenger> passengers;
	@JSONField(name: "passengers_number")
	int passengersNumber;
	@JSONField(name: "text_tablet")
	String textTablet;
	String comment;
	@JSONField(name: "additional_change_itinerary")
	int additionalChangeItinerary;
	@JSONField(name: "additional_wait")
	int additionalWait;
	@JSONField(name: "fare_on_toll_road")
	int fareOnTollRoad;
	@JSONField(name: "send_params")
	TransferPlaceOrderRequestTripsSendParams sendParams;
	@JSONField(name: "is_round_trip")
	bool isRoundTrip;
	int tpa;
	String tpaName;
	List<TransferPlaceOrderRequestTripsOption> options;
}

class TransferPlaceOrderRequestTripsStartLocation with JsonConvert<TransferPlaceOrderRequestTripsStartLocation> {
	@JSONField(name: "flight_number")
	String flightNumber;
	@JSONField(name: "terminal_number")
	String terminalNumber;
	@JSONField(name: "train_number")
	String trainNumber;
	@JSONField(name: "train_carriage_number")
	String trainCarriageNumber;
	String address;
	String location;
	String time;
}

class TransferPlaceOrderRequestTripsFinishLocation with JsonConvert<TransferPlaceOrderRequestTripsFinishLocation> {
	@JSONField(name: "flight_number")
	String flightNumber;
	@JSONField(name: "terminal_number")
	String terminalNumber;
	@JSONField(name: "train_number")
	String trainNumber;
	@JSONField(name: "train_carriage_number")
	String trainCarriageNumber;
	String address;
	String location;
	String time;
}

class TransferPlaceOrderRequestTripsAdditionalLocation with JsonConvert<TransferPlaceOrderRequestTripsAdditionalLocation> {
	@JSONField(name: "flight_number")
	String flightNumber;
	@JSONField(name: "terminal_number")
	String terminalNumber;
	@JSONField(name: "train_number")
	String trainNumber;
	@JSONField(name: "train_carriage_number")
	String trainCarriageNumber;
	String address;
	String location;
	String time;
}

class TransferPlaceOrderRequestTripsPassenger with JsonConvert<TransferPlaceOrderRequestTripsPassenger> {
	String name;
	String email;
	String phone;
}

class TransferPlaceOrderRequestTripsSendParams with JsonConvert<TransferPlaceOrderRequestTripsSendParams> {
	@JSONField(name: "send_client_voucher")
	String sendClientVoucher;
	@JSONField(name: "send_admin_voucher")
	String sendAdminVoucher;
	@JSONField(name: "send_client_doc")
	String sendClientDoc;
	@JSONField(name: "send_admin_doc")
	String sendAdminDoc;
}

class TransferPlaceOrderRequestTripsOption with JsonConvert<TransferPlaceOrderRequestTripsOption> {
	String key;
	String value;
}
