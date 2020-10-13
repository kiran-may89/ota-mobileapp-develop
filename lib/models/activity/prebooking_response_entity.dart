import 'package:ota/generated/json/base/json_convert_content.dart';

class PrebookingResponseEntity with JsonConvert<PrebookingResponseEntity> {
	dynamic version;
	String message;
	bool isError;
	dynamic responseException;
	PrebookingResponseResult result;
}

class PrebookingResponseResult with JsonConvert<PrebookingResponseResult> {
	String operationId;
	PrebookingResponseResultAuditData auditData;
	PrebookingResponseResultBooking booking;
}

class PrebookingResponseResultAuditData with JsonConvert<PrebookingResponseResultAuditData> {
	double processTime;
	String time;
	String serverId;
	String environment;
}

class PrebookingResponseResultBooking with JsonConvert<PrebookingResponseResultBooking> {
	String reference;
	String status;
	String currency;
	double pendingAmount;
	double pendingAmountWithMarkup;
	PrebookingResponseResultBookingAgency agency;
	String creationDate;
	PrebookingResponseResultBookingPaymentData paymentData;
	String clientReference;
	PrebookingResponseResultBookingHolder holder;
	double total;
	double totalWithMarkup;
	double totalNet;
	double totalNetWithMarkup;
	List<PrebookingResponseResultBookingActivity> activities;
	int tpa;
	String tpaName;
	List<PrebookingResponseResultBookingOption> options;
}

class PrebookingResponseResultBookingAgency with JsonConvert<PrebookingResponseResultBookingAgency> {
	int code;
	int branch;
	String comments;
	PrebookingResponseResultBookingAgencySucursal sucursal;
}

class PrebookingResponseResultBookingAgencySucursal with JsonConvert<PrebookingResponseResultBookingAgencySucursal> {
	String name;
	String street;
	String zip;
	String city;
	String email;
	String region;
}

class PrebookingResponseResultBookingPaymentData with JsonConvert<PrebookingResponseResultBookingPaymentData> {
	PrebookingResponseResultBookingPaymentDataPaymentType paymentType;
	PrebookingResponseResultBookingPaymentDataInvoicingCompany invoicingCompany;
	String description;
}

class PrebookingResponseResultBookingPaymentDataPaymentType with JsonConvert<PrebookingResponseResultBookingPaymentDataPaymentType> {
	String code;
}

class PrebookingResponseResultBookingPaymentDataInvoicingCompany with JsonConvert<PrebookingResponseResultBookingPaymentDataInvoicingCompany> {
	String code;
	String name;
	String registrationNumber;
}

class PrebookingResponseResultBookingHolder with JsonConvert<PrebookingResponseResultBookingHolder> {
	String name;
	String title;
	String email;
	String mailing;
	String surname;
	List<String> telephones;
}

class PrebookingResponseResultBookingActivity with JsonConvert<PrebookingResponseResultBookingActivity> {
	String code;
	String type;
	dynamic countryCode;
	dynamic source;
	String name;
	dynamic currency;
	dynamic modalities;
	dynamic content;
	int order;
	dynamic amountsFrom;
	List<dynamic> amountsFromWithMarkup;
	dynamic currencyName;
	dynamic country;
	String status;
	PrebookingResponseResultBookingActivitiesSupplier supplier;
	List<PrebookingResponseResultBookingActivitiesCommants> comments;
	dynamic vouchers;
	String activityReference;
	PrebookingResponseResultBookingActivitiesModality modality;
	String dateFrom;
	String dateTo;
	dynamic rateBreakdown;
	dynamic rateBreakdownWithMarkup;
	List<PrebookingResponseResultBookingActivitiesCancellationPolicy> cancellationPolicies;
	List<PrebookingResponseResultBookingActivitiesCancellationPoliciesWithMarkup> cancellationPoliciesWithMarkup;
	List<PrebookingResponseResultBookingActivitiesPaxis> paxes;
	List<PrebookingResponseResultBookingActivitiesQuestion> questions;
	String id;
	PrebookingResponseResultBookingActivitiesAgencyCommission agencyCommission;
	PrebookingResponseResultBookingActivitiesAgencyCommissionWithMarkup agencyCommissionWithMarkup;
	PrebookingResponseResultBookingActivitiesContactInfo contactInfo;
	PrebookingResponseResultBookingActivitiesAmountDetail amountDetail;
	PrebookingResponseResultBookingActivitiesAmountDetailWithMarkup amountDetailWithMarkup;
	List<PrebookingResponseResultBookingActivitiesExtraData> extraData;
	PrebookingResponseResultBookingActivitiesProviderInformation providerInformation;
	double totalAmountFromSearchCalculated;
	double totalAmountFromSearchCalculatedWithMarkup;
	int tpa;
	dynamic tpaName;
	dynamic options;
}

class PrebookingResponseResultBookingActivitiesSupplier with JsonConvert<PrebookingResponseResultBookingActivitiesSupplier> {
	String name;
	String vatNumber;
}

class PrebookingResponseResultBookingActivitiesCommants with JsonConvert<PrebookingResponseResultBookingActivitiesCommants> {
	String type;
	String text;
}

class PrebookingResponseResultBookingActivitiesModality with JsonConvert<PrebookingResponseResultBookingActivitiesModality> {
	String code;
	String name;
	List<PrebookingResponseResultBookingActivitiesModalityRate> rates;
	String amountUnitType;
}

class PrebookingResponseResultBookingActivitiesModalityRate with JsonConvert<PrebookingResponseResultBookingActivitiesModalityRate> {
	dynamic rateCode;
	dynamic rateClass;
	dynamic name;
	List<PrebookingResponseResultBookingActivitiesModalityRatesRateDetail> rateDetails;
}

class PrebookingResponseResultBookingActivitiesModalityRatesRateDetail with JsonConvert<PrebookingResponseResultBookingActivitiesModalityRatesRateDetail> {
	dynamic rateKey;
	dynamic operationDates;
	dynamic operationDatesWithMarkup;
	List<PrebookingResponseResultBookingActivitiesModalityRatesRateDetailsLanguage> languages;
	dynamic sessions;
	dynamic minimumDuration;
	dynamic maximumDuration;
	dynamic totalAmount;
	dynamic totalAmountWithMarkup;
	dynamic paxAmounts;
	dynamic paxAmountsWithMarkup;
	dynamic agencyCommission;
	dynamic agencyCommissionWithMarkup;
	int tpa;
	dynamic tpaName;
	dynamic options;
}

class PrebookingResponseResultBookingActivitiesModalityRatesRateDetailsLanguage with JsonConvert<PrebookingResponseResultBookingActivitiesModalityRatesRateDetailsLanguage> {
	String code;
}

class PrebookingResponseResultBookingActivitiesCancellationPolicy with JsonConvert<PrebookingResponseResultBookingActivitiesCancellationPolicy> {
	String dateFrom;
	double amount;
}

class PrebookingResponseResultBookingActivitiesCancellationPoliciesWithMarkup with JsonConvert<PrebookingResponseResultBookingActivitiesCancellationPoliciesWithMarkup> {
	String dateFrom;
	double amount;
}

class PrebookingResponseResultBookingActivitiesPaxis with JsonConvert<PrebookingResponseResultBookingActivitiesPaxis> {
	String name;
	String mailing;
	String surname;
	String customerId;
	int age;
	String paxType;
	String passport;
}

class PrebookingResponseResultBookingActivitiesQuestion with JsonConvert<PrebookingResponseResultBookingActivitiesQuestion> {
	dynamic code;
	dynamic text;
	dynamic required;
}

class PrebookingResponseResultBookingActivitiesAgencyCommission with JsonConvert<PrebookingResponseResultBookingActivitiesAgencyCommission> {
	double percentage;
	double amount;
	double vatPercentage;
	double vatAmount;
}

class PrebookingResponseResultBookingActivitiesAgencyCommissionWithMarkup with JsonConvert<PrebookingResponseResultBookingActivitiesAgencyCommissionWithMarkup> {
	double percentage;
	double amount;
	double vatPercentage;
	double vatAmount;
}

class PrebookingResponseResultBookingActivitiesContactInfo with JsonConvert<PrebookingResponseResultBookingActivitiesContactInfo> {
	String address;
	dynamic postalCode;
	PrebookingResponseResultBookingActivitiesContactInfoCountry country;
}

class PrebookingResponseResultBookingActivitiesContactInfoCountry with JsonConvert<PrebookingResponseResultBookingActivitiesContactInfoCountry> {
	dynamic code;
	dynamic name;
	List<PrebookingResponseResultBookingActivitiesContactInfoCountryDestination> destinations;
}

class PrebookingResponseResultBookingActivitiesContactInfoCountryDestination with JsonConvert<PrebookingResponseResultBookingActivitiesContactInfoCountryDestination> {
	String code;
	String name;
}

class PrebookingResponseResultBookingActivitiesAmountDetail with JsonConvert<PrebookingResponseResultBookingActivitiesAmountDetail> {
	List<PrebookingResponseResultBookingActivitiesAmountDetailPaxAmount> paxAmounts;
	PrebookingResponseResultBookingActivitiesAmountDetailTotalAmount totalAmount;
}

class PrebookingResponseResultBookingActivitiesAmountDetailPaxAmount with JsonConvert<PrebookingResponseResultBookingActivitiesAmountDetailPaxAmount> {
	String paxType;
	int ageFrom;
	int ageTo;
	double amount;
	double boxOfficeAmount;
	dynamic mandatoryApplyAmount;
}

class PrebookingResponseResultBookingActivitiesAmountDetailTotalAmount with JsonConvert<PrebookingResponseResultBookingActivitiesAmountDetailTotalAmount> {
	double amount;
	double boxOfficeAmount;
	dynamic mandatoryApplyAmount;
}

class PrebookingResponseResultBookingActivitiesAmountDetailWithMarkup with JsonConvert<PrebookingResponseResultBookingActivitiesAmountDetailWithMarkup> {
	List<PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupPaxAmount> paxAmounts;
	PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupTotalAmount totalAmount;
}

class PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupPaxAmount with JsonConvert<PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupPaxAmount> {
	String paxType;
	int ageFrom;
	int ageTo;
	double amount;
	double boxOfficeAmount;
	dynamic mandatoryApplyAmount;
}

class PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupTotalAmount with JsonConvert<PrebookingResponseResultBookingActivitiesAmountDetailWithMarkupTotalAmount> {
	double amount;
	double boxOfficeAmount;
	dynamic mandatoryApplyAmount;
}

class PrebookingResponseResultBookingActivitiesExtraData with JsonConvert<PrebookingResponseResultBookingActivitiesExtraData> {
	String id;
	String value;
}

class PrebookingResponseResultBookingActivitiesProviderInformation with JsonConvert<PrebookingResponseResultBookingActivitiesProviderInformation> {
	String name;
}

class PrebookingResponseResultBookingOption with JsonConvert<PrebookingResponseResultBookingOption> {
	String key;
	String value;
}