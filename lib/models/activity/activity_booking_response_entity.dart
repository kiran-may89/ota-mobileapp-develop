import 'package:ota/generated/json/base/json_convert_content.dart';

class ActivityBookingResponseEntity with JsonConvert<ActivityBookingResponseEntity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	ActivityBookingResponseResult result;
}

class ActivityBookingResponseResult with JsonConvert<ActivityBookingResponseResult> {
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
	List<ActivityBookingResponseResultBooking> bookings;
	ActivityBookingResponseResultContact contact;
	ActivityBookingResponseResultErrors errors;
	dynamic paymentDetails;
	dynamic visaStatus;


}

class ActivityBookingResponseResultBooking with JsonConvert<ActivityBookingResponseResultBooking> {
	int id;
	String uid;
	int bookingId;
	String reservationNumber;
	dynamic alternateTpaBookingId;
	dynamic reservationDate;
	dynamic returnDate;
	String bookingDate;
	dynamic trackToken;
	dynamic logToken;
	String invoicePath;
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
	dynamic bookingInfoPath;
}

class ActivityBookingResponseResultContact with JsonConvert<ActivityBookingResponseResultContact> {
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

class ActivityBookingResponseResultErrors with JsonConvert<ActivityBookingResponseResultErrors> {

}
