import 'package:ota/generated/json/base/json_convert_content.dart';
import 'package:ota/generated/json/base/json_filed.dart';

class TransferPlaceOrderResponseEntity with JsonConvert<TransferPlaceOrderResponseEntity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	TransferPlaceOrderResponseResult result;
}

class TransferPlaceOrderResponseResult with JsonConvert<TransferPlaceOrderResponseResult> {
	List<TransferPlaceOrderResponseResultResult> result;
}

class TransferPlaceOrderResponseResultResult with JsonConvert<TransferPlaceOrderResponseResultResult> {
	@JSONField(name: "order_id")
	int orderId;
	int transaction;
	@JSONField(name: "booker_number")
	String bookerNumber;
	double price;
	double priceWithMarkup;
	@JSONField(name: "payable_status")
	int payableStatus;
	@JSONField(name: "service_id")
	int serviceId;
	String currency;
	int status;
	List<TransferPlaceOrderResponseResultResultPassenger> passengers;
	@JSONField(name: "additional_change_itinerary")
	double additionalChangeItinerary;
	@JSONField(name: "additional_wait")
	int additionalWait;
	@JSONField(name: "fare_on_toll_road")
	int fareOnTollRoad;
	@JSONField(name: "send_params")
	TransferPlaceOrderResponseResultResultSendParams sendParams;
	int tpa;
	String tpaName;
	List<TransferPlaceOrderResponseResultResultOption> options;
}

class TransferPlaceOrderResponseResultResultPassenger with JsonConvert<TransferPlaceOrderResponseResultResultPassenger> {
	String name;
	String email;
	String phone;
}

class TransferPlaceOrderResponseResultResultSendParams with JsonConvert<TransferPlaceOrderResponseResultResultSendParams> {
	@JSONField(name: "send_client_voucher")
	String sendClientVoucher;
	@JSONField(name: "send_admin_voucher")
	String sendAdminVoucher;
	@JSONField(name: "send_client_doc")
	String sendClientDoc;
	@JSONField(name: "send_admin_doc")
	String sendAdminDoc;
}

class TransferPlaceOrderResponseResultResultOption with JsonConvert<TransferPlaceOrderResponseResultResultOption> {
	String key;
	String value;
}
