import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';

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
import 'dart:ui' as ui;


import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

import 'package:flutter/services.dart';

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


  GlobalKey _globalKey = new GlobalKey();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  var screenHeight;

  var screenWidth;

  @override
  Widget build(BuildContext context) {

  screenWidth = MediaQuery.of(context).size.width/10;

  screenHeight = MediaQuery.of(context).size.height/10;


  return ChangeNotifierProvider<HotelBookingStatusViewModel>(
      create: (context) => HotelBookingStatusViewModel(),
      child: Consumer<HotelBookingStatusViewModel>(
        builder: (context, value, child) {
          return Scaffold(
          key: scaffoldKey,
            appBar: AppBar(title: Text(getLocalText("booking_status", context),style: CustomStyles.appbar,),
              leading: new IconButton(
                icon: new Icon(Icons.home, color: Colors.white,size: 13,),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.dashboard, (route) => false);

                },
              ),

              actions: <Widget>[



                GestureDetector(child: Image.asset('assets/screenshot_icon.png',color: Colors.white,height: 30,width: 30,),

                  onTap: (){

                    _captureScreenShot(context);
                  },

                )
                ,SizedBox(width: 20,)



              ],

            ),
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
                            child: RepaintBoundary(
                            key: _globalKey,
                              child: Column(
                                children: [
                                Stack(
                                children: [
                                Container(

                                  height: screenHeight*3.57,
                                // margin: EdgeInsets.only(bottom: screenHeight*.8),
                                margin: EdgeInsets.only(bottom: screenHeight*.31),
                                decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))
                                ),
                                width: screenWidth*10,

                                child:

                                Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[

                                SizedBox(height: screenHeight*.22,),

                                Image.asset('assets/images/hotels.png',height: screenHeight*1.2,),


//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Row(
//                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  children: [
//                                    Image.asset('assets/images/dashboard/logo_plane.png',height: screenHeight*.45,color: CustomColors.Orange,),
//
//                                    Image.asset('assets/images/event.png',height: screenHeight*1.5,),
//
//                                    Container(
//                                      //margin: EdgeInsets.only(top: 55),
//                                      decoration: new BoxDecoration(
//                                        color: CustomColors.green,
//                                        shape: BoxShape.circle,
//                                        border: Border.all(color: CustomColors.White,width: 3),
//                                        boxShadow: [
//                                          BoxShadow(
//                                            color: Colors.grey,
//                                            offset: Offset(0.0, 1.0), //(x,y)
//                                            blurRadius: 6.0,
//                                          ),
//                                        ],
//                                      ),
//                                      child: Image.asset('assets/images/check.png',height: 40,width: 40,),
//                                    ),
//
//                                  ],
//                                ),
//                              ),
//                              Image.asset('assets/images/dashboard/tripshop_logo.png',height: screenHeight*.35,),
//                              SizedBox(height: 15,),
//
//
//                              Image.asset('assets/images/event.png',height: screenHeight*1.5,),
                                SizedBox(height: screenHeight*.22,),

                                Center(child: Text(getLocalText("reservation_no", context),style:CustomStyles.medium12.copyWith(color: CustomColors.BackGround) )),

                                SizedBox(height: 3,),

                                Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Text(reponse.result.bookings.first.reservationNumber,style:CustomStyles.medium18.copyWith(color: CustomColors.BackGround) ,textAlign: TextAlign.center,),

                                SizedBox(width: 15,),


                                GestureDetector(child:
                                Image.asset('assets/clipboard.png',color: CustomColors.BackGround,height: 20,width: 20,),
                                onTap: (){

                                _copytoClipboard(reponse.result.bookings.first.reservationNumber,context);

                                },
                                )


                                ],
                                ),

                                SizedBox(height: screenHeight*.22,),




                                Center(child: Text(getLocalText("activity_booking_id", context),style:CustomStyles.medium12.copyWith(color: CustomColors.BackGround) )),

                                SizedBox(height: 3,),

                                Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Text(reponse.result.bookingId.toString(),style:CustomStyles.medium18.copyWith(color: CustomColors.BackGround) ,textAlign: TextAlign.center,),

                                SizedBox(width: 15,),


                                GestureDetector(child:
                                Image.asset('assets/clipboard.png',color: CustomColors.BackGround,height: 20,width: 20,),
                                onTap: (){

                                _copytoClipboard(reponse.result.bookingId.toString(),context);

                                },
                                )


                                ],
                                ),

                                SizedBox(height: screenHeight*.4,),





                                ],
                                ),
                                ),

                                Positioned(
                                left: screenWidth*4.3,
                                top: screenHeight*3,
                                child: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height*.1,
                                child: Container(
                                padding: EdgeInsets.all(5),
                                //margin: EdgeInsets.only(top: 55),
                                decoration: new BoxDecoration(
                                color: CustomColors.green,
                                shape: BoxShape.circle,
                                border: Border.all(color: CustomColors.White,width: 3),
                                boxShadow: [
                                BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                                ),
                                ],
                                ),
                                child: Image.asset('assets/images/check.png',height: 25,width: 25,),
                                ),
                                ),
                                ),


                                ],
                                ),

//                                  Container(
//                                    width: MediaQuery.of(context).size.width,
//                                    decoration: BoxDecoration(
//                                        color: Colors.white,
//                                        borderRadius: BorderRadius.only(
//                                            bottomLeft: Radius.circular(20))),
//                                    child: Column(
//                                      mainAxisSize: MainAxisSize.min,
//                                      children: [
//                                        Container(
//                                        //  margin: EdgeInsets.only(top: SizeConstants.SIZE_4),
//                                          child: Image.asset(
//                                            "assets/images/dashboard/tripshop_logo.png",
//                                            fit: BoxFit.contain,
//                                            width: SizeConstants.SIZE_100,
//                                          ),
//                                        ),
//                                        Container(
//                                          margin: EdgeInsets.only(top: 40, bottom: 20),
//                                          child: Image.asset(
//                                            'assets/images/hotels.png',
//                                            height: 150,
//                                          ),
//                                        ),
//                                        Column(
//                                          mainAxisSize: MainAxisSize.min,
//                                          children: [
//                                            Text(
//                                              "Hotel Booking Id",
//                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
//                                            ),
//                                            SizedBox(
//                                              height: SizeConstants.SIZE_4,
//                                            ),
//                                            Text(
//                                              reponse.result.bookingId,
//                                              style: CustomStyles.medium20.copyWith(color: CustomColors.BackGround),
//                                            ),
//                                            SizedBox(
//                                              height: SizeConstants.SIZE_12,
//                                            ),
//                                          ],
//                                        )
//                                      ],
//                                    ),
//                                  ),

                                SizedBox(height: screenHeight*.15,),


                                  Container(
                                  margin: EdgeInsets.only(left: screenWidth*.4,right:screenWidth *.4),

                                  padding: EdgeInsets.only(left: screenWidth*.4,right:screenWidth *.4,top: 15),
                                    width: MediaQuery.of(context).size.width - SizeConstants.SIZE_24,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Payment Summary',
                                          style: CustomStyles.normal18.copyWith(color: CustomColors.BackGround),
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
                                              style:  CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
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
                                              style:  CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
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
                                              style:  CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                            ),
                                          ],
                                        ),
                                        Container(
                                        margin: EdgeInsets.only(top: 20,bottom: 15),
                                        child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),
                                      ],
                                    ),
                                  ),

                                SizedBox(height: screenHeight*.4,),

                                  Container(
                                  margin: EdgeInsets.only(left: screenWidth*.4,right:screenWidth *.4),
                                  padding: EdgeInsets.only(left: screenWidth*.4,right:screenWidth *.4,top: 15),
                                    width: MediaQuery.of(context).size.width - SizeConstants.SIZE_24,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Stay Information',
                                          style: CustomStyles.normal18.copyWith(color: CustomColors.BackGround),
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
                                              style:  CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
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
                                              style:  CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
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
                                              style:  CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),

                                      ],
                                    ),
                                  ),
                                SizedBox(height: screenHeight*.4,),
                                  Container(
                                  margin: EdgeInsets.only(left: screenWidth*.4,right:screenWidth *.4),
                                  padding: EdgeInsets.only(left: screenWidth*.4,right:screenWidth *.4,top: 15),
                                    width: MediaQuery.of(context).size.width - SizeConstants.SIZE_24,
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Guest Details',
                                          style: CustomStyles.normal18.copyWith(color: CustomColors.BackGround),
                                        ),


                                        SizedBox(height:20 ,),

                                        ListView.builder(
                                          //physics: NeverScrollableScrollPhysics(),

                                        primary: false,
                                        shrinkWrap: true,
                                        //padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .12),
                                        itemCount:reponse.result.bookings.first.travellers.length, // records.length
                                        itemBuilder: (BuildContext context, int index) {

                                          return Container(
                                           // padding: const EdgeInsets.only(left: 15,right: 15),
                                            child: Column(

                                              children: [

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text("First Name",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                                                    Text(reponse.result.bookings.first.travellers[index].firstname,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

                                                  ],
                                                ),

                                                SizedBox(height:15 ,),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text("Last Name",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                                                    Text( reponse.result.bookings.first.travellers[index].lastname,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

                                                  ],
                                                ),

                                                SizedBox(height:15 ,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text("Email",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                                                    Text( reponse.result.bookings.first.travellers[index].email,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

                                                  ],
                                                ),

                                                SizedBox(height:15 ,),

                                                Container(
                                                margin: EdgeInsets.only(top: 20,bottom: 20),
                                                child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),


                                              ],
                                            ),
                                          );

                                        }),

                                      GestureDetector(
                                      onTap: (){

                                      Navigator.pushNamed(context, Routes.cancelPolicyView,arguments:[reponse.result.bookings.first.reservationNumber]);

                                      },

                                      child: Text(getLocalText("cancellation_and_refund_policy", context),style: CustomStyles.normal12.copyWith(color: CustomColors.BackGround,decoration: TextDecoration.underline,),)),
                                        SizedBox(height:20 ,),



                                      ],
                                    ),
                                  ),
                                SizedBox(height: screenHeight*.4,),
                                ],
                              ),
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
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }

  Future<Uint8List> _captureScreenShot(BuildContext context) async {


    try {


      RenderRepaintBoundary boundary =
      _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 2.0);
      ByteData byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();

      String dir = (await getExternalStorageDirectory()).path;

      File file = File("$dir/"+ DateTime.now().millisecondsSinceEpoch.toString()+".png");

      await file.writeAsBytes(pngBytes);



      scaffoldKey.currentState.showSnackBar(
      new SnackBar(content: new Text(getLocalText("screen_captured", context),style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
      backgroundColor: CustomColors.BackGround));

    } catch (e) {
      print(e);
    }


  }

void _copytoClipboard(String bookingnumber, BuildContext context) {

Clipboard.setData(new ClipboardData(text:bookingnumber));
scaffoldKey.currentState.showSnackBar(
new SnackBar(content: new Text(getLocalText("copied_to_clipboard", context),style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
backgroundColor: CustomColors.BackGround));

}

}
