import 'package:ota/models/transfers/transfer_booking_response_entity.dart';

transferBookingResponseEntityFromJson(TransferBookingResponseEntity data, Map<String, dynamic> json) {
	if (json['version'] != null) {
		data.version = json['version'];
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['isError'] != null) {
		data.isError = json['isError'];
	}
	if (json['responseException'] != null) {
		data.responseException = json['responseException'];
	}
	if (json['result'] != null) {
		data.result = new TransferBookingResponseResult().fromJson(json['result']);
	}
	return data;
}

Map<String, dynamic> transferBookingResponseEntityToJson(TransferBookingResponseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['version'] = entity.version;
	data['message'] = entity.message;
	data['isError'] = entity.isError;
	data['responseException'] = entity.responseException;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	return data;
}

transferBookingResponseResultFromJson(TransferBookingResponseResult data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['uid'] != null) {
		data.uid = json['uid']?.toString();
	}
	if (json['bookingId'] != null) {
		data.bookingId = json['bookingId']?.toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId']?.toString();
	}
	if (json['userType'] != null) {
		data.userType = json['userType']?.toString();
	}
	if (json['tenantId'] != null) {
		data.tenantId = json['tenantId']?.toString();
	}
	if (json['correlationId'] != null) {
		data.correlationId = json['correlationId']?.toString();
	}
	if (json['totalAmount'] != null) {
		data.totalAmount = json['totalAmount']?.toDouble();
	}
	if (json['totalAmountMarkup'] != null) {
		data.totalAmountMarkup = json['totalAmountMarkup']?.toDouble();
	}
	if (json['markup'] != null) {
		data.markup = json['markup']?.toDouble();
	}
	if (json['otaTax'] != null) {
		data.otaTax = json['otaTax']?.toDouble();
	}
	if (json['totalRefundAmount'] != null) {
		data.totalRefundAmount = json['totalRefundAmount']?.toDouble();
	}
	if (json['totalRefundAmountmarkup'] != null) {
		data.totalRefundAmountmarkup = json['totalRefundAmountmarkup']?.toDouble();
	}
	if (json['paymentMode'] != null) {
		data.paymentMode = json['paymentMode']?.toString();
	}
	if (json['paymentTransactionId'] != null) {
		data.paymentTransactionId = json['paymentTransactionId']?.toString();
	}
	if (json['ibanNumber'] != null) {
		data.ibanNumber = json['ibanNumber'];
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['visaRequestId'] != null) {
		data.visaRequestId = json['visaRequestId'];
	}
	if (json['visaLink'] != null) {
		data.visaLink = json['visaLink'];
	}
	if (json['preVisaReference'] != null) {
		data.preVisaReference = json['preVisaReference'];
	}
	if (json['isDeleted'] != null) {
		data.isDeleted = json['isDeleted'];
	}
	if (json['bookings'] != null) {
		data.bookings = new List<TransferBookingResponseResultBooking>();
		(json['bookings'] as List).forEach((v) {
			data.bookings.add(new TransferBookingResponseResultBooking().fromJson(v));
		});
	}
	if (json['contact'] != null) {
		data.contact = new TransferBookingResponseResultContact().fromJson(json['contact']);
	}
	if (json['errors'] != null) {
		data.errors = new TransferBookingResponseResultErrors().fromJson(json['errors']);
	}
	if (json['visaStatus'] != null) {
		data.visaStatus = json['visaStatus'];
	}
	return data;
}

Map<String, dynamic> transferBookingResponseResultToJson(TransferBookingResponseResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['uid'] = entity.uid;
	data['bookingId'] = entity.bookingId;
	data['userId'] = entity.userId;
	data['userType'] = entity.userType;
	data['tenantId'] = entity.tenantId;
	data['correlationId'] = entity.correlationId;
	data['totalAmount'] = entity.totalAmount;
	data['totalAmountMarkup'] = entity.totalAmountMarkup;
	data['markup'] = entity.markup;
	data['otaTax'] = entity.otaTax;
	data['totalRefundAmount'] = entity.totalRefundAmount;
	data['totalRefundAmountmarkup'] = entity.totalRefundAmountmarkup;
	data['paymentMode'] = entity.paymentMode;
	data['paymentTransactionId'] = entity.paymentTransactionId;
	data['ibanNumber'] = entity.ibanNumber;
	data['status'] = entity.status;
	data['visaRequestId'] = entity.visaRequestId;
	data['visaLink'] = entity.visaLink;
	data['preVisaReference'] = entity.preVisaReference;
	data['isDeleted'] = entity.isDeleted;
	if (entity.bookings != null) {
		data['bookings'] =  entity.bookings.map((v) => v.toJson()).toList();
	}
	if (entity.contact != null) {
		data['contact'] = entity.contact.toJson();
	}
	if (entity.errors != null) {
		data['errors'] = entity.errors.toJson();
	}
	data['visaStatus'] = entity.visaStatus;
	return data;
}

transferBookingResponseResultBookingFromJson(TransferBookingResponseResultBooking data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['uid'] != null) {
		data.uid = json['uid']?.toString();
	}
	if (json['bookingId'] != null) {
		data.bookingId = json['bookingId']?.toInt();
	}
	if (json['reservationNumber'] != null) {
		data.reservationNumber = json['reservationNumber']?.toString();
	}
	if (json['alternateTpaBookingId'] != null) {
		data.alternateTpaBookingId = json['alternateTpaBookingId'];
	}
	if (json['reservationDate'] != null) {
		data.reservationDate = json['reservationDate'];
	}
	if (json['bookingDate'] != null) {
		data.bookingDate = json['bookingDate']?.toString();
	}
	if (json['trackToken'] != null) {
		data.trackToken = json['trackToken'];
	}
	if (json['logToken'] != null) {
		data.logToken = json['logToken'];
	}
	if (json['invoicePath'] != null) {
		data.invoicePath = json['invoicePath'];
	}
	if (json['iterinaryPath'] != null) {
		data.iterinaryPath = json['iterinaryPath'];
	}
	if (json['markupId'] != null) {
		data.markupId = json['markupId']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toString();
	}
	if (json['totalAmount'] != null) {
		data.totalAmount = json['totalAmount']?.toDouble();
	}
	if (json['totalAmountMarkup'] != null) {
		data.totalAmountMarkup = json['totalAmountMarkup']?.toDouble();
	}
	if (json['markup'] != null) {
		data.markup = json['markup']?.toDouble();
	}
	if (json['otaTax'] != null) {
		data.otaTax = json['otaTax']?.toDouble();
	}
	if (json['tpaAmount'] != null) {
		data.tpaAmount = json['tpaAmount']?.toDouble();
	}
	if (json['tpaType'] != null) {
		data.tpaType = json['tpaType']?.toInt();
	}
	if (json['tpa'] != null) {
		data.tpa = json['tpa']?.toString();
	}
	if (json['serviceTypeId'] != null) {
		data.serviceTypeId = json['serviceTypeId']?.toInt();
	}
	if (json['serviceType'] != null) {
		data.serviceType = json['serviceType']?.toString();
	}
	if (json['serviceTypeCode'] != null) {
		data.serviceTypeCode = json['serviceTypeCode']?.toString();
	}
	if (json['provider'] != null) {
		data.provider = json['provider']?.toString();
	}
	if (json['couponId'] != null) {
		data.couponId = json['couponId'];
	}
	if (json['isBookingModified'] != null) {
		data.isBookingModified = json['isBookingModified'];
	}
	if (json['isBookingCancelled'] != null) {
		data.isBookingCancelled = json['isBookingCancelled'];
	}
	if (json['isDeleted'] != null) {
		data.isDeleted = json['isDeleted'];
	}
	if (json['travellers'] != null) {
		data.travellers = new List<dynamic>();
		data.travellers.addAll(json['travellers']);
	}
	if (json['bookingCancellation'] != null) {
		data.bookingCancellation = json['bookingCancellation'];
	}
	return data;
}

Map<String, dynamic> transferBookingResponseResultBookingToJson(TransferBookingResponseResultBooking entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['uid'] = entity.uid;
	data['bookingId'] = entity.bookingId;
	data['reservationNumber'] = entity.reservationNumber;
	data['alternateTpaBookingId'] = entity.alternateTpaBookingId;
	data['reservationDate'] = entity.reservationDate;
	data['bookingDate'] = entity.bookingDate;
	data['trackToken'] = entity.trackToken;
	data['logToken'] = entity.logToken;
	data['invoicePath'] = entity.invoicePath;
	data['iterinaryPath'] = entity.iterinaryPath;
	data['markupId'] = entity.markupId;
	data['status'] = entity.status;
	data['totalAmount'] = entity.totalAmount;
	data['totalAmountMarkup'] = entity.totalAmountMarkup;
	data['markup'] = entity.markup;
	data['otaTax'] = entity.otaTax;
	data['tpaAmount'] = entity.tpaAmount;
	data['tpaType'] = entity.tpaType;
	data['tpa'] = entity.tpa;
	data['serviceTypeId'] = entity.serviceTypeId;
	data['serviceType'] = entity.serviceType;
	data['serviceTypeCode'] = entity.serviceTypeCode;
	data['provider'] = entity.provider;
	data['couponId'] = entity.couponId;
	data['isBookingModified'] = entity.isBookingModified;
	data['isBookingCancelled'] = entity.isBookingCancelled;
	data['isDeleted'] = entity.isDeleted;
	if (entity.travellers != null) {
		data['travellers'] =  [];
	}
	data['bookingCancellation'] = entity.bookingCancellation;
	return data;
}

transferBookingResponseResultContactFromJson(TransferBookingResponseResultContact data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['uid'] != null) {
		data.uid = json['uid']?.toString();
	}
	if (json['bookingMasterId'] != null) {
		data.bookingMasterId = json['bookingMasterId']?.toInt();
	}
	if (json['firstname'] != null) {
		data.firstname = json['firstname']?.toString();
	}
	if (json['lastname'] != null) {
		data.lastname = json['lastname']?.toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toInt();
	}
	if (json['dob'] != null) {
		data.dob = json['dob']?.toString();
	}
	if (json['phoneNumber'] != null) {
		data.phoneNumber = json['phoneNumber']?.toString();
	}
	if (json['phoneNumberCode'] != null) {
		data.phoneNumberCode = json['phoneNumberCode']?.toString();
	}
	if (json['email'] != null) {
		data.email = json['email']?.toString();
	}
	if (json['country'] != null) {
		data.country = json['country']?.toString();
	}
	if (json['countryCode'] != null) {
		data.countryCode = json['countryCode']?.toString();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['passport'] != null) {
		data.passport = json['passport']?.toString();
	}
	if (json['passportExpirationDate'] != null) {
		data.passportExpirationDate = json['passportExpirationDate']?.toString();
	}
	if (json['relation'] != null) {
		data.relation = json['relation'];
	}
	if (json['nationality'] != null) {
		data.nationality = json['nationality']?.toString();
	}
	if (json['visaFee'] != null) {
		data.visaFee = json['visaFee']?.toDouble();
	}
	if (json['visaFeeReference'] != null) {
		data.visaFeeReference = json['visaFeeReference']?.toString();
	}
	return data;
}

Map<String, dynamic> transferBookingResponseResultContactToJson(TransferBookingResponseResultContact entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['uid'] = entity.uid;
	data['bookingMasterId'] = entity.bookingMasterId;
	data['firstname'] = entity.firstname;
	data['lastname'] = entity.lastname;
	data['gender'] = entity.gender;
	data['dob'] = entity.dob;
	data['phoneNumber'] = entity.phoneNumber;
	data['phoneNumberCode'] = entity.phoneNumberCode;
	data['email'] = entity.email;
	data['country'] = entity.country;
	data['countryCode'] = entity.countryCode;
	data['address'] = entity.address;
	data['passport'] = entity.passport;
	data['passportExpirationDate'] = entity.passportExpirationDate;
	data['relation'] = entity.relation;
	data['nationality'] = entity.nationality;
	data['visaFee'] = entity.visaFee;
	data['visaFeeReference'] = entity.visaFeeReference;
	return data;
}

transferBookingResponseResultErrorsFromJson(TransferBookingResponseResultErrors data, Map<String, dynamic> json) {
	return data;
}

Map<String, dynamic> transferBookingResponseResultErrorsToJson(TransferBookingResponseResultErrors entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	return data;
}