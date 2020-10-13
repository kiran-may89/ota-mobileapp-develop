import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ota/models/hotels/responses/hotel_details_response.result.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/utils/utils.dart';
import 'package:ota/viewmodels/hotel_booking_status_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:ota/models/hotels/payments/response/HotelBookingResponse.dart';
import 'package:ota/utils/strings.dart';

class HotelBookingStatus extends StatelessWidget {
  HotelBookingResponse reponse;
  HotelDetailsResponseResult hotel;
  int roomGroup;
  int totalGuest = 0;

  HotelBookingStatus(this.reponse, this.hotel, this.roomGroup) {
    hotel.hotel.roomOption[roomGroup].rooms.forEach((element) {
      totalGuest += element.noOfAdults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HotelBookingStatusViewModel>(
      create: (context) => HotelBookingStatusViewModel(),
      child: Consumer<HotelBookingStatusViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) {
                return reponse.isError
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 40),
                            child: Image.asset(
                              'assets/images/hotels.png',
                              height: 150,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text('Something Went Wrong',
                                textAlign: TextAlign.center, style: CustomStyles.medium20.copyWith(color: CustomColors.disabledButton)),
                          ),
                        ],
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/dashboard/dashboard_bg.png"),
                          fit: BoxFit.cover,
                        )),
                        child: SafeArea(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: SizeConstants.SIZE_10),
                                  decoration: BoxDecoration(
                                      color: Colors.white30,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20), topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20), topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: SizeConstants.SIZE_4),
                                          child: Image.asset(
                                            "assets/images/dashboard/tripshop_logo.png",
                                            fit: BoxFit.contain,
                                            width: SizeConstants.SIZE_100,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 40, bottom: 20),
                                          child: Image.asset(
                                            'assets/images/hotels.png',
                                            height: 150,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Hotel Booking Id",
                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                            ),
                                            SizedBox(
                                              height: SizeConstants.SIZE_4,
                                            ),
                                            Text(
                                              reponse.result.bookingId,
                                              style: CustomStyles.medium20.copyWith(color: CustomColors.BackGround),
                                            ),
                                            SizedBox(
                                              height: SizeConstants.SIZE_12,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: SizeConstants.SIZE_20),
                                  padding: EdgeInsets.all(SizeConstants.SIZE_20),
                                  width: MediaQuery.of(context).size.width - SizeConstants.SIZE_24,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Payment Summary',
                                        style: CustomStyles.medium20.copyWith(color: CustomColors.BackGround),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Base Price",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            (hotel.hotel.roomOption[roomGroup].displayRateInfoWithMarkup.baseRate).toStringAsFixed(2),
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Tax and other charges",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            hotel.hotel.roomOption[roomGroup].displayRateInfoWithMarkup.taxAndOtherCharges.toStringAsFixed(2),
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 10, bottom: 20),
                                          child: MySeparator(
                                            color: CustomColors.BackGround.withOpacity(0.5),
                                            height: 1,
                                            Horizontal: true,
                                          )),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Total Amount Payable",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            hotel.hotel.roomOption[roomGroup].displayRateInfoWithMarkup.totalPriceWithMarkup.toStringAsFixed(2),
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: SizeConstants.SIZE_20),
                                  padding: EdgeInsets.all(SizeConstants.SIZE_20),
                                  width: MediaQuery.of(context).size.width - SizeConstants.SIZE_24,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Stay Information',
                                        style: CustomStyles.medium20.copyWith(color: CustomColors.BackGround),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Hotel Name",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            hotel.hotel.name,
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Selected Rooms",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            '${hotel.hotel.roomOption[roomGroup].rooms.length} Room | $totalGuest Guests',
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Stay ",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            '${convertToDate(hotel.checkIn)} - ${convertToDate(hotel.checkOut)}',
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Phone Number",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            reponse.result.contact.phoneNumber,
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: SizeConstants.SIZE_20),
                                  padding: EdgeInsets.all(SizeConstants.SIZE_20),
                                  width: MediaQuery.of(context).size.width - SizeConstants.SIZE_24,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Guest Details',
                                        style: CustomStyles.medium20.copyWith(color: CustomColors.BackGround),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Main Guest",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            reponse.result.contact.firstname,
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Booked By",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            reponse.result.contact.firstname,
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Email",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            reponse.result.contact.email,
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Phone Number",
                                            style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(0.75)),
                                          ),
                                          Text(
                                            reponse.result.contact.phoneNumber,
                                            style: CustomStyles.bold16.copyWith(color: CustomColors.BackGround),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'Cancellation & Refund Policy',
                                  style: CustomStyles.normal12.copyWith(
                                    color: CustomColors.White,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ));
              },
            ),
          );
        },
      ),
    );
  }
}
