import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ota/models/activity/request/booking_data.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'dart:ui' as ui;


import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

import 'package:flutter/services.dart';


class ActivityBookingStatus extends StatefulWidget {

  BookingData bookingData;

  ActivityBookingStatus(this.bookingData);

  @override
  _ActivityBookingStatusState createState() => _ActivityBookingStatusState(bookingData);
}

class _ActivityBookingStatusState extends State<ActivityBookingStatus> {

  BookingData bookingData;

  _ActivityBookingStatusState(this.bookingData);


  GlobalKey _globalKey = new GlobalKey();

  final key = new GlobalKey<ScaffoldState>();

  var screenHeight;

  var screenWidth;


  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width/10;

    screenHeight = MediaQuery.of(context).size.height/10;



    return Scaffold(
      key: key,


      appBar: AppBar(title: Text('Booking Status',style: CustomStyles.appbar,),
        leading: new IconButton(
          icon: new Icon(Icons.home, color: Colors.white,size: 13,),
          onPressed: () {
            Navigator.pop(context);

          },
        ),

        actions: <Widget>[



          GestureDetector(child: Image.asset('assets/screenshot_icon.png',color: Colors.white,height: 30,width: 30,),

            onTap: (){

              _captureScreenShot();
            },

          )
          ,SizedBox(width: 20,)



        ],

      ),
      body:

      Container(

        height: screenHeight*10,
        width: screenWidth*10,



        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/dashboard/dashboard_bg.png"),
              fit: BoxFit.cover,
            )),


        child: Stack(
          children: [




            SingleChildScrollView(
              child:
              RepaintBoundary(
                key: _globalKey,


                child: Column(
                  mainAxisSize: MainAxisSize.min,
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[



                    Stack(
                      children: [
                        Container(

                        //  height: screenHeight*4.4,
                         // margin: EdgeInsets.only(bottom: screenHeight*.8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                          ),
                          width: screenWidth*10,

                          child:

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                              SizedBox(height: 15,),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/dashboard/logo_plane.png',height: screenHeight*.45,color: CustomColors.Orange,),

                                    Image.asset('assets/images/event.png',height: screenHeight*1.5,),

                                    Container(
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
                                      child: Image.asset('assets/images/check.png',height: 40,width: 40,),
                                    ),

                                  ],
                                ),
                              ),
//                              Image.asset('assets/images/dashboard/tripshop_logo.png',height: screenHeight*.35,),
//                              SizedBox(height: 15,),
//
//
//                              Image.asset('assets/images/event.png',height: screenHeight*1.5,),
                              SizedBox(height: 15,),

                              Center(child: Text('Reservation Number',style:CustomStyles.medium12.copyWith(color: CustomColors.BackGround) )),

                              SizedBox(height: 3,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(bookingData.activityBookingResponseEntity.result.bookings.first.reservationNumber,style:CustomStyles.medium18.copyWith(color: CustomColors.BackGround) ,textAlign: TextAlign.center,),

                                  SizedBox(width: 15,),


                                  GestureDetector(child:
                                  Image.asset('assets/clipboard.png',color: CustomColors.BackGround,height: 20,width: 20,),
                                    onTap: (){

                                      _copytoClipboard(bookingData.activityBookingResponseEntity.result.bookings.first.reservationNumber);

                                    },
                                  )


                                ],
                              ),

                              SizedBox(height: 15,),




                              Center(child: Text('Activity Booking Id',style:CustomStyles.medium12.copyWith(color: CustomColors.BackGround) )),

                              SizedBox(height: 3,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(bookingData.activityBookingResponseEntity.result.bookingId.toString(),style:CustomStyles.medium18.copyWith(color: CustomColors.BackGround) ,textAlign: TextAlign.center,),

                                  SizedBox(width: 15,),


                                  GestureDetector(child:
                                  Image.asset('assets/clipboard.png',color: CustomColors.BackGround,height: 20,width: 20,),
                                    onTap: (){

                                      _copytoClipboard(bookingData.activityBookingResponseEntity.result.bookingId.toString());

                                    },
                                  )


                                ],
                              ),

                              SizedBox(height: 15,),





                            ],
                          ),
                        ),

//                        Positioned(
//                          left: screenWidth*4.3,
//                          top: screenHeight*3.85,
//                          child: Container(
//                            alignment: Alignment.center,
//                            height: MediaQuery.of(context).size.height*.1,
//                            child: Container(
//                              //margin: EdgeInsets.only(top: 55),
//                              decoration: new BoxDecoration(
//                                color: CustomColors.green,
//                                shape: BoxShape.circle,
//                                border: Border.all(color: CustomColors.White,width: 3),
//                                boxShadow: [
//                                  BoxShadow(
//                                    color: Colors.grey,
//                                    offset: Offset(0.0, 1.0), //(x,y)
//                                    blurRadius: 6.0,
//                                  ),
//                                ],
//                              ),
//                              child: Image.asset('assets/images/check.png',height: 50,width: 50,),
//                            ),
//                          ),
//                        ),


                      ],
                    ),


                    SizedBox(height: screenHeight*.3,),

                    _activitySummary(),

                    SizedBox(height: screenHeight*.4,),

                    _paymentSummary()

















                  ],
                ),
              ),
            ),


          ],
        )
      ) ,
    );
  }

  Future<Uint8List> _captureScreenShot() async {


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



      key.currentState.showSnackBar(
          new SnackBar(content: new Text("Screen Captured",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
              backgroundColor: CustomColors.BackGround));

    } catch (e) {
      print(e);
    }


  }

  void _copytoClipboard(String bookingnumber) {

    Clipboard.setData(new ClipboardData(text:bookingnumber));
    key.currentState.showSnackBar(
        new SnackBar(content: new Text("Copied to Clipboard",style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
            backgroundColor: CustomColors.BackGround));

  }

  _activitySummary( ) {

  return Container(
      margin: EdgeInsets.only(left: screenWidth*.4,right:screenWidth *.4),

      padding: EdgeInsets.only(left: screenWidth*.4,right:screenWidth *.4,top: 15),
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15)
      ),

      child:

      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Text('Payment Summary',style: CustomStyles.normal18.copyWith(color: CustomColors.BackGround),),
          ),


          SizedBox(height:20 ,),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Base Rate",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                RichText(
                  text: TextSpan(
                  text: bookingData.totalAmountWithMarkup.displayRateInfoWithMarkup.currency,
                  style: CustomStyles.medium12.copyWith(color: CustomColors.BackGround),
                  children: <TextSpan>[


                    TextSpan(text: " "+bookingData.totalAmountWithMarkup.displayRateInfoWithMarkup.baseRate.toString(),
                    style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)
                    )
                  ]
                  ),
                ),



              ],
            ),
          ),

          SizedBox(height:15 ,),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Tax and other charges",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                RichText(
                  text: TextSpan(
                  text: bookingData.totalAmountWithMarkup.displayRateInfoWithMarkup.currency,
                  style: CustomStyles.medium12.copyWith(color: CustomColors.BackGround),
                  children: <TextSpan>[
                    TextSpan(text: " "+bookingData.totalAmountWithMarkup.displayRateInfoWithMarkup.taxAndOtherCharges.toString(),
                    style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)
                    )
                  ]
                  ),
                ),


              ],
            ),
          ),

          SizedBox(height:15 ,),

          Container(
          margin: EdgeInsets.only(top: 10,bottom: 20),
          child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Total Amount Payable",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),


                RichText(
                  text: TextSpan(
                  text: bookingData.totalAmountWithMarkup.displayRateInfoWithMarkup.currency,
                  style: CustomStyles.medium12.copyWith(color: CustomColors.BackGround),
                  children: <TextSpan>[
                    TextSpan(text: " "+bookingData.totalAmountWithMarkup.displayRateInfoWithMarkup.totalPriceWithMarkup.toString(),
                    style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)
                    )
                  ]
                  ),
                ),

              ],
            ),
          ),

          Container(
          margin: EdgeInsets.only(top: 20,bottom: 20),
          child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),



        ],
      )


      ,
    );

  }

  _paymentSummary() {
    return  Container(
      margin: EdgeInsets.only(left: screenWidth*.4,right:screenWidth *.4),
      padding: EdgeInsets.only(left: screenWidth*.4,right:screenWidth *.4,top: 15),

      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15)
      ),
      child:
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Text('Activity Summary',style: CustomStyles.normal18.copyWith(color: CustomColors.BackGround),),
          ),


          SizedBox(height:20 ,),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Text('Person Details',style: CustomStyles.heading.copyWith(color:CustomColors.Orange ),),
          ),



          SizedBox(height:15 ,),


          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Name",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text(bookingData.travellerDetails.first.firstname,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

              ],
            ),
          ),

          SizedBox(height:15 ,),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Email",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text(bookingData.travellerDetails.first.email,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

              ],
            ),
          ),

          SizedBox(height:15 ,),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Phone Number",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text(bookingData.travellerDetails.first.phoneNumber,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

              ],
            ),
          ),

          SizedBox(height:30 ,),


          Container(
          margin: EdgeInsets.only(top: 10,bottom: 20),
          child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),


          SizedBox(height:10 ,),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Text('Activity Details',style: CustomStyles.heading.copyWith(color:CustomColors.Orange ),),
          ),



          SizedBox(height:15 ,),


          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Text("Activity Name",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),)),

                Expanded(child: Text(bookingData.activityName,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround), overflow: TextOverflow.ellipsis,)),

              ],
            ),
          ),

          SizedBox(height:15 ,),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Duration",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text(bookingData.duration,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),),

              ],
            ),
          ),

          SizedBox(height:30 ,),



        ],
      ),
    );
  }


}











