import 'package:ota/generated/json/base/json_convert_content.dart';

class TransferBookingResponseEntity with JsonConvert<TransferBookingResponseEntity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	TransferBookingResponseResult result;
}

class TransferBookingResponseResult with JsonConvert<TransferBookingResponseResult> {
	int id;
	String uid;
	String bookingId;
	String userId;
	String userType;
	String tenantId;
	String correlationId;
	double totalAmount;
	double totalAmountMarkup;
	double markup;
	double otaTax;
	double totalRefundAmount;
	double totalRefundAmountmarkup;
	String paymentMode;
	String paymentTransactionId;
	dynamic ibanNumber;
	String status;
	dynamic visaRequestId;
	dynamic visaLink;
	dynamic preVisaReference;
	bool isDeleted;
	List<TransferBookingResponseResultBooking> bookings;
	TransferBookingResponseResultContact contact;
	TransferBookingResponseResultErrors errors;
	dynamic visaStatus;
}

class TransferBookingResponseResultBooking with JsonConvert<TransferBookingResponseResultBooking> {
	int id;
	String uid;
	int bookingId;
	String reservationNumber;
	dynamic alternateTpaBookingId;
	dynamic reservationDate;
	String bookingDate;
	dynamic trackToken;
	dynamic logToken;
	dynamic invoicePath;
	dynamic iterinaryPath;
	String markupId;
	String status;
	double totalAmount;
	double totalAmountMarkup;
	double markup;
	double otaTax;
	double tpaAmount;
	int tpaType;
	String tpa;
	int serviceTypeId;
	String serviceType;
	String serviceTypeCode;
	String provider;
	dynamic couponId;
	bool isBookingModified;
	bool isBookingCancelled;
	bool isDeleted;
	List<dynamic> travellers;
	dynamic bookingCancellation;
}

class TransferBookingResponseResultContact with JsonConvert<TransferBookingResponseResultContact> {
	String id;
	String uid;
	int bookingMasterId;
	String firstname;
	String lastname;
	int gender;
	String dob;
	String phoneNumber;
	String phoneNumberCode;
	String email;
	String country;
	String countryCode;
	String address;
	String passport;
	String passportExpirationDate;
	dynamic relation;
	String nationality;
	double visaFee;
	String visaFeeReference;
}

class TransferBookingResponseResultErrors with JsonConvert<TransferBookingResponseResultErrors> {

}
