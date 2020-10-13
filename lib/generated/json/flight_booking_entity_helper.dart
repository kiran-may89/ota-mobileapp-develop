//import 'package:ota/models/flights/flight_booking_entity.dart';
//
//flightBookingEntityFromJson(FlightBookingEntity data, Map<String, dynamic> json) {
//	if (json['version'] != null) {
//		data.version = json['version'];
//	}
//	if (json['message'] != null) {
//		data.message = json['message']?.toString();
//	}
//	if (json['isError'] != null) {
//		data.isError = json['isError'];
//	}
//	if (json['responseException'] != null) {
//		data.responseException = json['responseException'];
//	}
//	if (json['result'] != null) {
//		data.result = new FlightBookingResult().fromJson(json['result']);
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingEntityToJson(FlightBookingEntity entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['version'] = entity.version;
//	data['message'] = entity.message;
//	data['isError'] = entity.isError;
//	data['responseException'] = entity.responseException;
//	if (entity.result != null) {
//		data['result'] = entity.result.toJson();
//	}
//	return data;
//}
//
//flightBookingResultFromJson(FlightBookingResult data, Map<String, dynamic> json) {
//	if (json['id'] != null) {
//		data.id = json['id']?.toInt();
//	}
//	if (json['uid'] != null) {
//		data.uid = json['uid']?.toString();
//	}
//	if (json['bookingId'] != null) {
//		data.bookingId = json['bookingId']?.toString();
//	}
//	if (json['userId'] != null) {
//		data.userId = json['userId']?.toString();
//	}
//	if (json['userType'] != null) {
//		data.userType = json['userType']?.toString();
//	}
//	if (json['tenantId'] != null) {
//		data.tenantId = json['tenantId']?.toString();
//	}
//	if (json['correlationId'] != null) {
//		data.correlationId = json['correlationId']?.toString();
//	}
//	if (json['totalAmount'] != null) {
//		data.totalAmount = json['totalAmount']?.toDouble();
//	}
//	if (json['totalAmountMarkup'] != null) {
//		data.totalAmountMarkup = json['totalAmountMarkup']?.toDouble();
//	}
//	if (json['markup'] != null) {
//		data.markup = json['markup']?.toDouble();
//	}
//	if (json['otaTax'] != null) {
//		data.otaTax = json['otaTax']?.toDouble();
//	}
//	if (json['totalRefundAmount'] != null) {
//		data.totalRefundAmount = json['totalRefundAmount']?.toInt();
//	}
//	if (json['totalCancellationCharge'] != null) {
//		data.totalCancellationCharge = json['totalCancellationCharge']?.toInt();
//	}
//	if (json['paymentMode'] != null) {
//		data.paymentMode = json['paymentMode']?.toString();
//	}
//	if (json['paymentTransactionId'] != null) {
//		data.paymentTransactionId = json['paymentTransactionId']?.toString();
//	}
//	if (json['ibanNumber'] != null) {
//		data.ibanNumber = json['ibanNumber'];
//	}
//	if (json['status'] != null) {
//		data.status = json['status']?.toString();
//	}
//	if (json['visaRequestId'] != null) {
//		data.visaRequestId = json['visaRequestId'];
//	}
//	if (json['visaLink'] != null) {
//		data.visaLink = json['visaLink'];
//	}
//	if (json['preVisaReference'] != null) {
//		data.preVisaReference = json['preVisaReference'];
//	}
//	if (json['isDeleted'] != null) {
//		data.isDeleted = json['isDeleted'];
//	}
//	if (json['bookings'] != null) {
//		data.bookings = new List<FlightBookingResultBooking>();
//		(json['bookings'] as List).forEach((v) {
//			data.bookings.add(new FlightBookingResultBooking().fromJson(v));
//		});
//	}
//	if (json['contact'] != null) {
//		data.contact = new FlightBookingResultContact().fromJson(json['contact']);
//	}
//	if (json['errors'] != null) {
//		data.errors = new FlightBookingResultErrors().fromJson(json['errors']);
//	}
//	if (json['paymentDetails'] != null) {
//		data.paymentDetails = json['paymentDetails'];
//	}
//	if (json['visaStatus'] != null) {
//		data.visaStatus = json['visaStatus'];
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultToJson(FlightBookingResult entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['id'] = entity.id;
//	data['uid'] = entity.uid;
//	data['bookingId'] = entity.bookingId;
//	data['userId'] = entity.userId;
//	data['userType'] = entity.userType;
//	data['tenantId'] = entity.tenantId;
//	data['correlationId'] = entity.correlationId;
//	data['totalAmount'] = entity.totalAmount;
//	data['totalAmountMarkup'] = entity.totalAmountMarkup;
//	data['markup'] = entity.markup;
//	data['otaTax'] = entity.otaTax;
//	data['totalRefundAmount'] = entity.totalRefundAmount;
//	data['totalCancellationCharge'] = entity.totalCancellationCharge;
//	data['paymentMode'] = entity.paymentMode;
//	data['paymentTransactionId'] = entity.paymentTransactionId;
//	data['ibanNumber'] = entity.ibanNumber;
//	data['status'] = entity.status;
//	data['visaRequestId'] = entity.visaRequestId;
//	data['visaLink'] = entity.visaLink;
//	data['preVisaReference'] = entity.preVisaReference;
//	data['isDeleted'] = entity.isDeleted;
//	if (entity.bookings != null) {
//		data['bookings'] =  entity.bookings.map((v) => v.toJson()).toList();
//	}
//	if (entity.contact != null) {
//		data['contact'] = entity.contact.toJson();
//	}
//	if (entity.errors != null) {
//		data['errors'] = entity.errors.toJson();
//	}
//	data['paymentDetails'] = entity.paymentDetails;
//	data['visaStatus'] = entity.visaStatus;
//	return data;
//}
//
//flightBookingResultBookingFromJson(FlightBookingResultBooking data, Map<String, dynamic> json) {
//	if (json['id'] != null) {
//		data.id = json['id']?.toInt();
//	}
//	if (json['uid'] != null) {
//		data.uid = json['uid']?.toString();
//	}
//	if (json['bookingId'] != null) {
//		data.bookingId = json['bookingId']?.toInt();
//	}
//	if (json['reservationNumber'] != null) {
//		data.reservationNumber = json['reservationNumber']?.toString();
//	}
//	if (json['alternateTpaBookingId'] != null) {
//		data.alternateTpaBookingId = json['alternateTpaBookingId'];
//	}
//	if (json['reservationDate'] != null) {
//		data.reservationDate = json['reservationDate']?.toString();
//	}
//	if (json['returnDate'] != null) {
//		data.returnDate = json['returnDate'];
//	}
//	if (json['bookingDate'] != null) {
//		data.bookingDate = json['bookingDate']?.toString();
//	}
//	if (json['trackToken'] != null) {
//		data.trackToken = json['trackToken'];
//	}
//	if (json['logToken'] != null) {
//		data.logToken = json['logToken'];
//	}
//	if (json['invoicePath'] != null) {
//		data.invoicePath = json['invoicePath'];
//	}
//	if (json['iterinaryPath'] != null) {
//		data.iterinaryPath = json['iterinaryPath'];
//	}
//	if (json['markupId'] != null) {
//		data.markupId = json['markupId']?.toString();
//	}
//	if (json['status'] != null) {
//		data.status = json['status']?.toString();
//	}
//	if (json['totalAmount'] != null) {
//		data.totalAmount = json['totalAmount']?.toDouble();
//	}
//	if (json['totalAmountMarkup'] != null) {
//		data.totalAmountMarkup = json['totalAmountMarkup']?.toDouble();
//	}
//	if (json['markup'] != null) {
//		data.markup = json['markup']?.toDouble();
//	}
//	if (json['otaTax'] != null) {
//		data.otaTax = json['otaTax']?.toDouble();
//	}
//	if (json['tpaAmount'] != null) {
//		data.tpaAmount = json['tpaAmount']?.toInt();
//	}
//	if (json['tpaType'] != null) {
//		data.tpaType = json['tpaType']?.toInt();
//	}
//	if (json['tpa'] != null) {
//		data.tpa = json['tpa']?.toString();
//	}
//	if (json['serviceTypeId'] != null) {
//		data.serviceTypeId = json['serviceTypeId']?.toInt();
//	}
//	if (json['serviceType'] != null) {
//		data.serviceType = json['serviceType']?.toString();
//	}
//	if (json['serviceTypeCode'] != null) {
//		data.serviceTypeCode = json['serviceTypeCode']?.toString();
//	}
//	if (json['provider'] != null) {
//		data.provider = json['provider']?.toString();
//	}
//	if (json['couponId'] != null) {
//		data.couponId = json['couponId'];
//	}
//	if (json['isBookingModified'] != null) {
//		data.isBookingModified = json['isBookingModified'];
//	}
//	if (json['isBookingCancelled'] != null) {
//		data.isBookingCancelled = json['isBookingCancelled'];
//	}
//	if (json['isDeleted'] != null) {
//		data.isDeleted = json['isDeleted'];
//	}
//	if (json['isMakkah'] != null) {
//		data.isMakkah = json['isMakkah'];
//	}
//	if (json['summaryInfo'] != null) {
//		data.summaryInfo = new FlightBookingResultBookingsSummaryInfo().fromJson(json['summaryInfo']);
//	}
//	if (json['travellers'] != null) {
//		data.travellers = new List<dynamic>();
//		data.travellers.addAll(json['travellers']);
//	}
//	if (json['bookingCancellation'] != null) {
//		data.bookingCancellation = json['bookingCancellation'];
//	}
//	if (json['bookingInfoPath'] != null) {
//		data.bookingInfoPath = json['bookingInfoPath'];
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingToJson(FlightBookingResultBooking entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['id'] = entity.id;
//	data['uid'] = entity.uid;
//	data['bookingId'] = entity.bookingId;
//	data['reservationNumber'] = entity.reservationNumber;
//	data['alternateTpaBookingId'] = entity.alternateTpaBookingId;
//	data['reservationDate'] = entity.reservationDate;
//	data['returnDate'] = entity.returnDate;
//	data['bookingDate'] = entity.bookingDate;
//	data['trackToken'] = entity.trackToken;
//	data['logToken'] = entity.logToken;
//	data['invoicePath'] = entity.invoicePath;
//	data['iterinaryPath'] = entity.iterinaryPath;
//	data['markupId'] = entity.markupId;
//	data['status'] = entity.status;
//	data['totalAmount'] = entity.totalAmount;
//	data['totalAmountMarkup'] = entity.totalAmountMarkup;
//	data['markup'] = entity.markup;
//	data['otaTax'] = entity.otaTax;
//	data['tpaAmount'] = entity.tpaAmount;
//	data['tpaType'] = entity.tpaType;
//	data['tpa'] = entity.tpa;
//	data['serviceTypeId'] = entity.serviceTypeId;
//	data['serviceType'] = entity.serviceType;
//	data['serviceTypeCode'] = entity.serviceTypeCode;
//	data['provider'] = entity.provider;
//	data['couponId'] = entity.couponId;
//	data['isBookingModified'] = entity.isBookingModified;
//	data['isBookingCancelled'] = entity.isBookingCancelled;
//	data['isDeleted'] = entity.isDeleted;
//	data['isMakkah'] = entity.isMakkah;
//	if (entity.summaryInfo != null) {
//		data['summaryInfo'] = entity.summaryInfo.toJson();
//	}
//	if (entity.travellers != null) {
//		data['travellers'] =  [];
//	}
//	data['bookingCancellation'] = entity.bookingCancellation;
//	data['bookingInfoPath'] = entity.bookingInfoPath;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFromJson(FlightBookingResultBookingsSummaryInfo data, Map<String, dynamic> json) {
//	if (json['serviceType'] != null) {
//		data.serviceType = json['serviceType']?.toString();
//	}
//	if (json['flight_type'] != null) {
//		data.flightType = json['flight_type']?.toString();
//	}
//	if (json['selected_cabins'] != null) {
//		data.selectedCabins = json['selected_cabins']?.toString();
//	}
//	if (json['reservationDate'] != null) {
//		data.reservationDate = json['reservationDate']?.toString();
//	}
//	if (json['returnDate'] != null) {
//		data.returnDate = json['returnDate'];
//	}
//	if (json['flight'] != null) {
//		data.flight = new List<FlightBookingResultBookingsSummaryInfoFlight>();
//		(json['flight'] as List).forEach((v) {
//			data.flight.add(new FlightBookingResultBookingsSummaryInfoFlight().fromJson(v));
//		});
//	}
//	if (json['provider'] != null) {
//		data.provider = json['provider']?.toString();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoToJson(FlightBookingResultBookingsSummaryInfo entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['serviceType'] = entity.serviceType;
//	data['flight_type'] = entity.flightType;
//	data['selected_cabins'] = entity.selectedCabins;
//	data['reservationDate'] = entity.reservationDate;
//	data['returnDate'] = entity.returnDate;
//	if (entity.flight != null) {
//		data['flight'] =  entity.flight.map((v) => v.toJson()).toList();
//	}
//	data['provider'] = entity.provider;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightFromJson(FlightBookingResultBookingsSummaryInfoFlight data, Map<String, dynamic> json) {
//	if (json['route'] != null) {
//		data.route = new List<FlightBookingResultBookingsSummaryInfoFlightRoute>();
//		(json['route'] as List).forEach((v) {
//			data.route.add(new FlightBookingResultBookingsSummaryInfoFlightRoute().fromJson(v));
//		});
//	}
//	if (json['nightsInDest'] != null) {
//		data.nightsInDest = json['nightsInDest'];
//	}
//	if (json['duration'] != null) {
//		data.duration = new FlightBookingResultBookingsSummaryInfoFlightDuration().fromJson(json['duration']);
//	}
//	if (json['flyFrom'] != null) {
//		data.flyFrom = json['flyFrom']?.toString();
//	}
//	if (json['cityFrom'] != null) {
//		data.cityFrom = json['cityFrom']?.toString();
//	}
//	if (json['cityCodeFrom'] != null) {
//		data.cityCodeFrom = json['cityCodeFrom']?.toString();
//	}
//	if (json['countryFrom'] != null) {
//		data.countryFrom = new FlightBookingResultBookingsSummaryInfoFlightCountryFrom().fromJson(json['countryFrom']);
//	}
//	if (json['flyTo'] != null) {
//		data.flyTo = json['flyTo']?.toString();
//	}
//	if (json['cityTo'] != null) {
//		data.cityTo = json['cityTo']?.toString();
//	}
//	if (json['cityCodeTo'] != null) {
//		data.cityCodeTo = json['cityCodeTo']?.toString();
//	}
//	if (json['countryTo'] != null) {
//		data.countryTo = new FlightBookingResultBookingsSummaryInfoFlightCountryTo().fromJson(json['countryTo']);
//	}
//	if (json['distance'] != null) {
//		data.distance = json['distance']?.toDouble();
//	}
//	if (json['routes'] != null) {
//		data.routes = new List<List>();
//		(json['routes'] as List).forEach((v) {
//			data.routes.add(new List().fromJson(v));
//		});
//	}
//	if (json['airlines'] != null) {
//		data.airlines = json['airlines']?.map((v) => v?.toString())?.toList()?.cast<String>();
//	}
//	if (json['airlinesMeta'] != null) {
//		data.airlinesMeta = new List<FlightBookingResultBookingsSummaryInfoFlightAirlinesMetum>();
//		(json['airlinesMeta'] as List).forEach((v) {
//			data.airlinesMeta.add(new FlightBookingResultBookingsSummaryInfoFlightAirlinesMetum().fromJson(v));
//		});
//	}
//	if (json['pnr_count'] != null) {
//		data.pnrCount = json['pnr_count']?.toInt();
//	}
//	if (json['virtual_interlining'] != null) {
//		data.virtualInterlining = json['virtual_interlining'];
//	}
//	if (json['has_airport_change'] != null) {
//		data.hasAirportChange = json['has_airport_change'];
//	}
//	if (json['technical_stops'] != null) {
//		data.technicalStops = json['technical_stops']?.toInt();
//	}
//	if (json['price'] != null) {
//		data.price = json['price']?.toInt();
//	}
//	if (json['bags_price'] != null) {
//		data.bagsPrice = new FlightBookingResultBookingsSummaryInfoFlightBagsPrice().fromJson(json['bags_price']);
//	}
//	if (json['baglimit'] != null) {
//		data.baglimit = new FlightBookingResultBookingsSummaryInfoFlightBaglimit().fromJson(json['baglimit']);
//	}
//	if (json['availability'] != null) {
//		data.availability = new FlightBookingResultBookingsSummaryInfoFlightAvailability().fromJson(json['availability']);
//	}
//	if (json['facilitated_booking_available'] != null) {
//		data.facilitatedBookingAvailable = json['facilitated_booking_available'];
//	}
//	if (json['transfers'] != null) {
//		data.transfers = new List<dynamic>();
//		data.transfers.addAll(json['transfers']);
//	}
//	if (json['type_flights'] != null) {
//		data.typeFlights = json['type_flights']?.map((v) => v?.toString())?.toList()?.cast<String>();
//	}
//	if (json['conversion'] != null) {
//		data.conversion = new FlightBookingResultBookingsSummaryInfoFlightConversion().fromJson(json['conversion']);
//	}
//	if (json['local_arrival'] != null) {
//		data.localArrival = json['local_arrival']?.toString();
//	}
//	if (json['utc_arrival'] != null) {
//		data.utcArrival = json['utc_arrival']?.toString();
//	}
//	if (json['local_departure'] != null) {
//		data.localDeparture = json['local_departure']?.toString();
//	}
//	if (json['utc_departure'] != null) {
//		data.utcDeparture = json['utc_departure']?.toString();
//	}
//	if (json['deep_link'] != null) {
//		data.deepLink = json['deep_link']?.toString();
//	}
//	if (json['onewaystops_count'] != null) {
//		data.onewaystopsCount = json['onewaystops_count']?.toInt();
//	}
//	if (json['returnwaystops_count'] != null) {
//		data.returnwaystopsCount = json['returnwaystops_count']?.toInt();
//	}
//	if (json['oneway_local_arrival'] != null) {
//		data.onewayLocalArrival = json['oneway_local_arrival']?.toString();
//	}
//	if (json['oneway_utc_arrival'] != null) {
//		data.onewayUtcArrival = json['oneway_utc_arrival']?.toString();
//	}
//	if (json['oneway_local_departure'] != null) {
//		data.onewayLocalDeparture = json['oneway_local_departure']?.toString();
//	}
//	if (json['oneway_utc_departure'] != null) {
//		data.onewayUtcDeparture = json['oneway_utc_departure']?.toString();
//	}
//	if (json['return_local_arrival'] != null) {
//		data.returnLocalArrival = json['return_local_arrival']?.toString();
//	}
//	if (json['return_utc_arrival'] != null) {
//		data.returnUtcArrival = json['return_utc_arrival']?.toString();
//	}
//	if (json['return_local_departure'] != null) {
//		data.returnLocalDeparture = json['return_local_departure']?.toString();
//	}
//	if (json['return_utc_departure'] != null) {
//		data.returnUtcDeparture = json['return_utc_departure']?.toString();
//	}
//	if (json['displayRateInfoWithMarkup'] != null) {
//		data.displayRateInfoWithMarkup = new FlightBookingResultBookingsSummaryInfoFlightDisplayRateInfoWithMarkup().fromJson(json['displayRateInfoWithMarkup']);
//	}
//	if (json['tpa'] != null) {
//		data.tpa = json['tpa']?.toString();
//	}
//	if (json['options'] != null) {
//		data.options = new List<FlightBookingResultBookingsSummaryInfoFlightOption>();
//		(json['options'] as List).forEach((v) {
//			data.options.add(new FlightBookingResultBookingsSummaryInfoFlightOption().fromJson(v));
//		});
//	}
//	if (json['errorMessage'] != null) {
//		data.errorMessage = json['errorMessage'];
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightToJson(FlightBookingResultBookingsSummaryInfoFlight entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	if (entity.route != null) {
//		data['route'] =  entity.route.map((v) => v.toJson()).toList();
//	}
//	data['nightsInDest'] = entity.nightsInDest;
//	if (entity.duration != null) {
//		data['duration'] = entity.duration.toJson();
//	}
//	data['flyFrom'] = entity.flyFrom;
//	data['cityFrom'] = entity.cityFrom;
//	data['cityCodeFrom'] = entity.cityCodeFrom;
//	if (entity.countryFrom != null) {
//		data['countryFrom'] = entity.countryFrom.toJson();
//	}
//	data['flyTo'] = entity.flyTo;
//	data['cityTo'] = entity.cityTo;
//	data['cityCodeTo'] = entity.cityCodeTo;
//	if (entity.countryTo != null) {
//		data['countryTo'] = entity.countryTo.toJson();
//	}
//	data['distance'] = entity.distance;
//	if (entity.routes != null) {
//		data['routes'] =  entity.routes.map((v) => v.toJson()).toList();
//	}
//	data['airlines'] = entity.airlines;
//	if (entity.airlinesMeta != null) {
//		data['airlinesMeta'] =  entity.airlinesMeta.map((v) => v.toJson()).toList();
//	}
//	data['pnr_count'] = entity.pnrCount;
//	data['virtual_interlining'] = entity.virtualInterlining;
//	data['has_airport_change'] = entity.hasAirportChange;
//	data['technical_stops'] = entity.technicalStops;
//	data['price'] = entity.price;
//	if (entity.bagsPrice != null) {
//		data['bags_price'] = entity.bagsPrice.toJson();
//	}
//	if (entity.baglimit != null) {
//		data['baglimit'] = entity.baglimit.toJson();
//	}
//	if (entity.availability != null) {
//		data['availability'] = entity.availability.toJson();
//	}
//	data['facilitated_booking_available'] = entity.facilitatedBookingAvailable;
//	if (entity.transfers != null) {
//		data['transfers'] =  [];
//	}
//	data['type_flights'] = entity.typeFlights;
//	if (entity.conversion != null) {
//		data['conversion'] = entity.conversion.toJson();
//	}
//	data['local_arrival'] = entity.localArrival;
//	data['utc_arrival'] = entity.utcArrival;
//	data['local_departure'] = entity.localDeparture;
//	data['utc_departure'] = entity.utcDeparture;
//	data['deep_link'] = entity.deepLink;
//	data['onewaystops_count'] = entity.onewaystopsCount;
//	data['returnwaystops_count'] = entity.returnwaystopsCount;
//	data['oneway_local_arrival'] = entity.onewayLocalArrival;
//	data['oneway_utc_arrival'] = entity.onewayUtcArrival;
//	data['oneway_local_departure'] = entity.onewayLocalDeparture;
//	data['oneway_utc_departure'] = entity.onewayUtcDeparture;
//	data['return_local_arrival'] = entity.returnLocalArrival;
//	data['return_utc_arrival'] = entity.returnUtcArrival;
//	data['return_local_departure'] = entity.returnLocalDeparture;
//	data['return_utc_departure'] = entity.returnUtcDeparture;
//	if (entity.displayRateInfoWithMarkup != null) {
//		data['displayRateInfoWithMarkup'] = entity.displayRateInfoWithMarkup.toJson();
//	}
//	data['tpa'] = entity.tpa;
//	if (entity.options != null) {
//		data['options'] =  entity.options.map((v) => v.toJson()).toList();
//	}
//	data['errorMessage'] = entity.errorMessage;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightRouteFromJson(FlightBookingResultBookingsSummaryInfoFlightRoute data, Map<String, dynamic> json) {
//	if (json['fare_basis'] != null) {
//		data.fareBasis = json['fare_basis']?.toString();
//	}
//	if (json['fare_category'] != null) {
//		data.fareCategory = json['fare_category']?.toString();
//	}
//	if (json['fare_classes'] != null) {
//		data.fareClasses = json['fare_classes']?.toString();
//	}
//	if (json['fare_family'] != null) {
//		data.fareFamily = json['fare_family']?.toString();
//	}
//	if (json['last_seen'] != null) {
//		data.lastSeen = json['last_seen']?.toString();
//	}
//	if (json['refresh_timestamp'] != null) {
//		data.refreshTimestamp = json['refresh_timestamp']?.toString();
//	}
//	if (json['return'] != null) {
//		data.xReturn = json['return']?.toInt();
//	}
//	if (json['bags_recheck_required'] != null) {
//		data.bagsRecheckRequired = json['bags_recheck_required'];
//	}
//	if (json['guarantee'] != null) {
//		data.guarantee = json['guarantee'];
//	}
//	if (json['cityTo'] != null) {
//		data.cityTo = json['cityTo']?.toString();
//	}
//	if (json['cityFrom'] != null) {
//		data.cityFrom = json['cityFrom']?.toString();
//	}
//	if (json['cityCodeFrom'] != null) {
//		data.cityCodeFrom = json['cityCodeFrom']?.toString();
//	}
//	if (json['cityCodeTo'] != null) {
//		data.cityCodeTo = json['cityCodeTo']?.toString();
//	}
//	if (json['flyTo'] != null) {
//		data.flyTo = json['flyTo']?.toString();
//	}
//	if (json['flyFrom'] != null) {
//		data.flyFrom = json['flyFrom']?.toString();
//	}
//	if (json['airline'] != null) {
//		data.airline = json['airline']?.toString();
//	}
//	if (json['operating_carrier'] != null) {
//		data.operatingCarrier = json['operating_carrier']?.toString();
//	}
//	if (json['equipment'] != null) {
//		data.equipment = json['equipment'];
//	}
//	if (json['flight_no'] != null) {
//		data.flightNo = json['flight_no']?.toInt();
//	}
//	if (json['vehicle_type'] != null) {
//		data.vehicleType = json['vehicle_type']?.toString();
//	}
//	if (json['operating_flight_no'] != null) {
//		data.operatingFlightNo = json['operating_flight_no']?.toString();
//	}
//	if (json['local_arrival'] != null) {
//		data.localArrival = json['local_arrival']?.toString();
//	}
//	if (json['utc_arrival'] != null) {
//		data.utcArrival = json['utc_arrival']?.toString();
//	}
//	if (json['local_departure'] != null) {
//		data.localDeparture = json['local_departure']?.toString();
//	}
//	if (json['utc_departure'] != null) {
//		data.utcDeparture = json['utc_departure']?.toString();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightRouteToJson(FlightBookingResultBookingsSummaryInfoFlightRoute entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['fare_basis'] = entity.fareBasis;
//	data['fare_category'] = entity.fareCategory;
//	data['fare_classes'] = entity.fareClasses;
//	data['fare_family'] = entity.fareFamily;
//	data['last_seen'] = entity.lastSeen;
//	data['refresh_timestamp'] = entity.refreshTimestamp;
//	data['return'] = entity.xReturn;
//	data['bags_recheck_required'] = entity.bagsRecheckRequired;
//	data['guarantee'] = entity.guarantee;
//	data['cityTo'] = entity.cityTo;
//	data['cityFrom'] = entity.cityFrom;
//	data['cityCodeFrom'] = entity.cityCodeFrom;
//	data['cityCodeTo'] = entity.cityCodeTo;
//	data['flyTo'] = entity.flyTo;
//	data['flyFrom'] = entity.flyFrom;
//	data['airline'] = entity.airline;
//	data['operating_carrier'] = entity.operatingCarrier;
//	data['equipment'] = entity.equipment;
//	data['flight_no'] = entity.flightNo;
//	data['vehicle_type'] = entity.vehicleType;
//	data['operating_flight_no'] = entity.operatingFlightNo;
//	data['local_arrival'] = entity.localArrival;
//	data['utc_arrival'] = entity.utcArrival;
//	data['local_departure'] = entity.localDeparture;
//	data['utc_departure'] = entity.utcDeparture;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightDurationFromJson(FlightBookingResultBookingsSummaryInfoFlightDuration data, Map<String, dynamic> json) {
//	if (json['departure'] != null) {
//		data.departure = json['departure']?.toInt();
//	}
//	if (json['return'] != null) {
//		data.xReturn = json['return']?.toInt();
//	}
//	if (json['total'] != null) {
//		data.total = json['total']?.toInt();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightDurationToJson(FlightBookingResultBookingsSummaryInfoFlightDuration entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['departure'] = entity.departure;
//	data['return'] = entity.xReturn;
//	data['total'] = entity.total;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightCountryFromFromJson(FlightBookingResultBookingsSummaryInfoFlightCountryFrom data, Map<String, dynamic> json) {
//	if (json['code'] != null) {
//		data.code = json['code']?.toString();
//	}
//	if (json['name'] != null) {
//		data.name = json['name']?.toString();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightCountryFromToJson(FlightBookingResultBookingsSummaryInfoFlightCountryFrom entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['code'] = entity.code;
//	data['name'] = entity.name;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightCountryToFromJson(FlightBookingResultBookingsSummaryInfoFlightCountryTo data, Map<String, dynamic> json) {
//	if (json['code'] != null) {
//		data.code = json['code']?.toString();
//	}
//	if (json['name'] != null) {
//		data.name = json['name']?.toString();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightCountryToToJson(FlightBookingResultBookingsSummaryInfoFlightCountryTo entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['code'] = entity.code;
//	data['name'] = entity.name;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightAirlinesMetumFromJson(FlightBookingResultBookingsSummaryInfoFlightAirlinesMetum data, Map<String, dynamic> json) {
//	if (json['code'] != null) {
//		data.code = json['code']?.toString();
//	}
//	if (json['type'] != null) {
//		data.type = json['type']?.toString();
//	}
//	if (json['name'] != null) {
//		data.name = json['name']?.toString();
//	}
//	if (json['lcc'] != null) {
//		data.lcc = json['lcc']?.toInt();
//	}
//	if (json['image32'] != null) {
//		data.image32 = json['image32']?.toString();
//	}
//	if (json['image64'] != null) {
//		data.image64 = json['image64']?.toString();
//	}
//	if (json['image128'] != null) {
//		data.image128 = json['image128']?.toString();
//	}
//	if (json['isDeleted'] != null) {
//		data.isDeleted = json['isDeleted'];
//	}
//	if (json['id'] != null) {
//		data.id = json['id']?.toInt();
//	}
//	if (json['uid'] != null) {
//		data.uid = json['uid']?.toString();
//	}
//	if (json['createdBy'] != null) {
//		data.createdBy = json['createdBy']?.toString();
//	}
//	if (json['createdDate'] != null) {
//		data.createdDate = json['createdDate']?.toString();
//	}
//	if (json['updatedBy'] != null) {
//		data.updatedBy = json['updatedBy'];
//	}
//	if (json['updatedDate'] != null) {
//		data.updatedDate = json['updatedDate']?.toString();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightAirlinesMetumToJson(FlightBookingResultBookingsSummaryInfoFlightAirlinesMetum entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['code'] = entity.code;
//	data['type'] = entity.type;
//	data['name'] = entity.name;
//	data['lcc'] = entity.lcc;
//	data['image32'] = entity.image32;
//	data['image64'] = entity.image64;
//	data['image128'] = entity.image128;
//	data['isDeleted'] = entity.isDeleted;
//	data['id'] = entity.id;
//	data['uid'] = entity.uid;
//	data['createdBy'] = entity.createdBy;
//	data['createdDate'] = entity.createdDate;
//	data['updatedBy'] = entity.updatedBy;
//	data['updatedDate'] = entity.updatedDate;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightBagsPriceFromJson(FlightBookingResultBookingsSummaryInfoFlightBagsPrice data, Map<String, dynamic> json) {
//	if (json['__invalid_name__1'] != null) {
//		data.iInvalidName1 = json['__invalid_name__1']?.toInt();
//	}
//	if (json['__invalid_name__2'] != null) {
//		data.nInvalidName2 = json['__invalid_name__2'];
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightBagsPriceToJson(FlightBookingResultBookingsSummaryInfoFlightBagsPrice entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['__invalid_name__1'] = entity.iInvalidName1;
//	data['__invalid_name__2'] = entity.nInvalidName2;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightBaglimitFromJson(FlightBookingResultBookingsSummaryInfoFlightBaglimit data, Map<String, dynamic> json) {
//	if (json['hand_width'] != null) {
//		data.handWidth = json['hand_width']?.toInt();
//	}
//	if (json['hand_height'] != null) {
//		data.handHeight = json['hand_height']?.toInt();
//	}
//	if (json['hand_length'] != null) {
//		data.handLength = json['hand_length']?.toInt();
//	}
//	if (json['hand_weight'] != null) {
//		data.handWeight = json['hand_weight']?.toInt();
//	}
//	if (json['hold_width'] != null) {
//		data.holdWidth = json['hold_width']?.toInt();
//	}
//	if (json['hold_height'] != null) {
//		data.holdHeight = json['hold_height']?.toInt();
//	}
//	if (json['hold_length'] != null) {
//		data.holdLength = json['hold_length']?.toInt();
//	}
//	if (json['hold_dimensions_sum'] != null) {
//		data.holdDimensionsSum = json['hold_dimensions_sum']?.toInt();
//	}
//	if (json['hold_weight'] != null) {
//		data.holdWeight = json['hold_weight']?.toInt();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightBaglimitToJson(FlightBookingResultBookingsSummaryInfoFlightBaglimit entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['hand_width'] = entity.handWidth;
//	data['hand_height'] = entity.handHeight;
//	data['hand_length'] = entity.handLength;
//	data['hand_weight'] = entity.handWeight;
//	data['hold_width'] = entity.holdWidth;
//	data['hold_height'] = entity.holdHeight;
//	data['hold_length'] = entity.holdLength;
//	data['hold_dimensions_sum'] = entity.holdDimensionsSum;
//	data['hold_weight'] = entity.holdWeight;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightAvailabilityFromJson(FlightBookingResultBookingsSummaryInfoFlightAvailability data, Map<String, dynamic> json) {
//	if (json['seats'] != null) {
//		data.seats = json['seats']?.toInt();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightAvailabilityToJson(FlightBookingResultBookingsSummaryInfoFlightAvailability entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['seats'] = entity.seats;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightConversionFromJson(FlightBookingResultBookingsSummaryInfoFlightConversion data, Map<String, dynamic> json) {
//	if (json['eur'] != null) {
//		data.eur = json['eur']?.toInt();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightConversionToJson(FlightBookingResultBookingsSummaryInfoFlightConversion entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['eur'] = entity.eur;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightDisplayRateInfoWithMarkupFromJson(FlightBookingResultBookingsSummaryInfoFlightDisplayRateInfoWithMarkup data, Map<String, dynamic> json) {
//	if (json['totalPriceWithMarkup'] != null) {
//		data.totalPriceWithMarkup = json['totalPriceWithMarkup']?.toDouble();
//	}
//	if (json['baseRate'] != null) {
//		data.baseRate = json['baseRate']?.toDouble();
//	}
//	if (json['taxAndOtherCharges'] != null) {
//		data.taxAndOtherCharges = json['taxAndOtherCharges']?.toDouble();
//	}
//	if (json['otaTax'] != null) {
//		data.otaTax = json['otaTax']?.toDouble();
//	}
//	if (json['markup'] != null) {
//		data.markup = json['markup']?.toDouble();
//	}
//	if (json['supplierBaseRate'] != null) {
//		data.supplierBaseRate = json['supplierBaseRate']?.toDouble();
//	}
//	if (json['supplierTotalCost'] != null) {
//		data.supplierTotalCost = json['supplierTotalCost']?.toDouble();
//	}
//	if (json['currency'] != null) {
//		data.currency = json['currency']?.toString();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightDisplayRateInfoWithMarkupToJson(FlightBookingResultBookingsSummaryInfoFlightDisplayRateInfoWithMarkup entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['totalPriceWithMarkup'] = entity.totalPriceWithMarkup;
//	data['baseRate'] = entity.baseRate;
//	data['taxAndOtherCharges'] = entity.taxAndOtherCharges;
//	data['otaTax'] = entity.otaTax;
//	data['markup'] = entity.markup;
//	data['supplierBaseRate'] = entity.supplierBaseRate;
//	data['supplierTotalCost'] = entity.supplierTotalCost;
//	data['currency'] = entity.currency;
//	return data;
//}
//
//flightBookingResultBookingsSummaryInfoFlightOptionFromJson(FlightBookingResultBookingsSummaryInfoFlightOption data, Map<String, dynamic> json) {
//	if (json['key'] != null) {
//		data.key = json['key']?.toString();
//	}
//	if (json['value'] != null) {
//		data.value = json['value']?.toString();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultBookingsSummaryInfoFlightOptionToJson(FlightBookingResultBookingsSummaryInfoFlightOption entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['key'] = entity.key;
//	data['value'] = entity.value;
//	return data;
//}
//
//flightBookingResultContactFromJson(FlightBookingResultContact data, Map<String, dynamic> json) {
//	if (json['id'] != null) {
//		data.id = json['id']?.toString();
//	}
//	if (json['uid'] != null) {
//		data.uid = json['uid']?.toString();
//	}
//	if (json['bookingMasterId'] != null) {
//		data.bookingMasterId = json['bookingMasterId']?.toInt();
//	}
//	if (json['firstname'] != null) {
//		data.firstname = json['firstname']?.toString();
//	}
//	if (json['lastname'] != null) {
//		data.lastname = json['lastname']?.toString();
//	}
//	if (json['gender'] != null) {
//		data.gender = json['gender']?.toInt();
//	}
//	if (json['dob'] != null) {
//		data.dob = json['dob']?.toString();
//	}
//	if (json['phoneNumber'] != null) {
//		data.phoneNumber = json['phoneNumber']?.toString();
//	}
//	if (json['phoneNumberCode'] != null) {
//		data.phoneNumberCode = json['phoneNumberCode']?.toString();
//	}
//	if (json['email'] != null) {
//		data.email = json['email']?.toString();
//	}
//	if (json['country'] != null) {
//		data.country = json['country']?.toString();
//	}
//	if (json['countryCode'] != null) {
//		data.countryCode = json['countryCode']?.toString();
//	}
//	if (json['address'] != null) {
//		data.address = json['address']?.toString();
//	}
//	if (json['passport'] != null) {
//		data.passport = json['passport']?.toString();
//	}
//	if (json['passportExpirationDate'] != null) {
//		data.passportExpirationDate = json['passportExpirationDate']?.toString();
//	}
//	if (json['relation'] != null) {
//		data.relation = json['relation'];
//	}
//	if (json['nationality'] != null) {
//		data.nationality = json['nationality']?.toString();
//	}
//	if (json['visaFee'] != null) {
//		data.visaFee = json['visaFee'];
//	}
//	if (json['visaFeeReference'] != null) {
//		data.visaFeeReference = json['visaFeeReference'];
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultContactToJson(FlightBookingResultContact entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['id'] = entity.id;
//	data['uid'] = entity.uid;
//	data['bookingMasterId'] = entity.bookingMasterId;
//	data['firstname'] = entity.firstname;
//	data['lastname'] = entity.lastname;
//	data['gender'] = entity.gender;
//	data['dob'] = entity.dob;
//	data['phoneNumber'] = entity.phoneNumber;
//	data['phoneNumberCode'] = entity.phoneNumberCode;
//	data['email'] = entity.email;
//	data['country'] = entity.country;
//	data['countryCode'] = entity.countryCode;
//	data['address'] = entity.address;
//	data['passport'] = entity.passport;
//	data['passportExpirationDate'] = entity.passportExpirationDate;
//	data['relation'] = entity.relation;
//	data['nationality'] = entity.nationality;
//	data['visaFee'] = entity.visaFee;
//	data['visaFeeReference'] = entity.visaFeeReference;
//	return data;
//}
//
//flightBookingResultErrorsFromJson(FlightBookingResultErrors data, Map<String, dynamic> json) {
//	if (json['Invoice'] != null) {
//		data.invoice = json['Invoice']?.toString();
//	}
//	return data;
//}
//
//Map<String, dynamic> flightBookingResultErrorsToJson(FlightBookingResultErrors entity) {
//	final Map<String, dynamic> data = new Map<String, dynamic>();
//	data['Invoice'] = entity.invoice;
//	return data;
//}