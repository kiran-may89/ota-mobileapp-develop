import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ota/models/transfers/requests/credit_card_transfers_data.dart';
import 'package:ota/models/transfers/transfer_booking_response.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';


class TransferBookingStatus extends StatefulWidget {

  TransfersCCData  transfersCCData;

  TransferBookingStatus(this.transfersCCData);



  @override
  _TransferBookingStatusState createState() => _TransferBookingStatusState( transfersCCData);
}

class _TransferBookingStatusState extends State<TransferBookingStatus> {

  TransfersCCData  transfersCCData;

  GlobalKey _globalKey = new GlobalKey();

  final key = new GlobalKey<ScaffoldState>();

  var height;

  var width;


  _TransferBookingStatusState(this.transfersCCData);

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width/10;

    height = MediaQuery.of(context).size.height/10;

    return SafeArea(
      child: Scaffold(
        key: key,
        backgroundColor: CustomColors.BackGround,

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

        body:Container(

          height: height*10,
          width: width*10,

          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dashboard/dashboard_bg.png"),
                fit: BoxFit.cover,
              )),


          child: Stack(
            children: [



              SingleChildScrollView(
                child: RepaintBoundary(
                  key: _globalKey,

                  child: Container(
                    margin: EdgeInsets.only(bottom: height*1),

                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[




                        Container(

                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
                          ),



                          child:     Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                              SizedBox(height: 15,),

                              Image.asset('assets/images/dashboard/tripshop_logo.png',height: height*.35,),
                              SizedBox(height: 15,),


                              Image.asset('assets/images/transfer.png',height: height*1.5,),
                              SizedBox(height: 15,),

                              Center(child: Text('Reservation Number',style:CustomStyles.medium12.copyWith(color: CustomColors.BackGround) )),

                              SizedBox(height: 3,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(transfersCCData.transferBookingResponse.result.bookings.first.reservationNumber,style:CustomStyles.medium18.copyWith(color: CustomColors.BackGround) ,textAlign: TextAlign.center,),

                                  SizedBox(width: 15,),


                                  GestureDetector(child:
                                  Image.asset('assets/clipboard.png',color: CustomColors.BackGround,height: 15,width: 15,),
                                    onTap: (){

                                      _copytoClipboard(transfersCCData.transferBookingResponse.result.bookings.first.reservationNumber);

                                    },
                                  )


                                ],
                              ),

                              SizedBox(height: 15,),


                              Center(child: Text('Transfer Booking Id',style:CustomStyles.medium12.copyWith(color: CustomColors.BackGround) )),

                              SizedBox(height: 3,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(transfersCCData.transferBookingResponse.result.bookingId,style:CustomStyles.medium18.copyWith(color: CustomColors.BackGround) ,textAlign: TextAlign.center,),

                                  SizedBox(width: 15,),


                                  GestureDetector(child:
                                  Image.asset('assets/clipboard.png',color: CustomColors.BackGround,height: 15,width: 15,),
                                    onTap: (){

                                      _copytoClipboard(transfersCCData.transferBookingResponse.result.bookingId);

                                    },
                                  )


                                ],
                              ),

                              SizedBox(height: 15,),





                            ],
                          ),




                        ),


                        SizedBox(height: height*.4,),


                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            _paymetSummaryConatiner(),

                            SizedBox(height: 20,),
                            _transferSummaryConatiner(),





                          ],
                        )









                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ) ,
      ),
    );
  }

  Widget _paymetSummaryConatiner() {

    return Container(

      margin: EdgeInsets.only(left: width*.4,right:width *.4),

      padding: EdgeInsets.only(left: width*.4,right:width *.4,top: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),



      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                      text:transfersCCData.selectedVehicleData.first.displayRateInfoWithMarkup.currency,
                      style: CustomStyles.medium12.copyWith(color: CustomColors.BackGround),
                      children: <TextSpan>[


                        TextSpan(text: " "+transfersCCData.selectedVehicleData.first.displayRateInfoWithMarkup.baseRate.toString(),
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
                      text:transfersCCData.selectedVehicleData.first.displayRateInfoWithMarkup.currency,
                      style: CustomStyles.medium12.copyWith(color: CustomColors.BackGround),
                      children: <TextSpan>[
                        TextSpan(text: " "+transfersCCData.selectedVehicleData.first.displayRateInfoWithMarkup.taxAndOtherCharges.toString(),
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
                      text:transfersCCData.selectedVehicleData.first.displayRateInfoWithMarkup.currency,
                      style: CustomStyles.medium12.copyWith(color: CustomColors.BackGround),
                      children: <TextSpan>[
                        TextSpan(text: " "+transfersCCData.selectedVehicleData.first.displayRateInfoWithMarkup.totalPriceWithMarkup.toString(),
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

      ),

    );
  }

  Widget _transferSummaryConatiner()
  {

    return Container(

        margin: EdgeInsets.only(left: width*.4,right:width *.4),
        padding: EdgeInsets.only(left: width*.4,right:width *.4,top: 15),

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),


      child:Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Text('Transfer Summary',style: CustomStyles.normal18.copyWith(color: CustomColors.BackGround),),

            SizedBox(height:20 ,),

            Text('Passenger Details',style: CustomStyles.heading.copyWith(color:CustomColors.Orange ),),

            SizedBox(height:20 ,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Name",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text(transfersCCData.transferBookingResponse.result.contact.firstname
                  ,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),),

              ],
            ),

            SizedBox(height:15 ,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Email",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text(transfersCCData.transferBookingResponse.result.contact.email,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

              ],
            ),

            SizedBox(height:15 ,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Phone Number",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text(transfersCCData.transferBookingResponse.result.contact.phoneNumber,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),),

              ],
            ),

            SizedBox(height:20 ,),
            Container(
                margin: EdgeInsets.only(top: 10,bottom: 20),
                child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),


            SizedBox(height:10 ,),

            Text('Cab Details',style: CustomStyles.medium15),

            SizedBox(height:20 ,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Cab Type",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text(transfersCCData.transferBookingResponse.result.bookings.first.summaryInfo.carClass.title,style: CustomStyles.normal15,),

              ],
            ),

            SizedBox(height:15 ,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Seating",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text("${transfersCCData.transferBookingResponse.result.bookings.first.summaryInfo.carClass.capacity} Seat",style: CustomStyles.normal15,),

              ],
            ),

//            SizedBox(height:15 ,),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Text("Baggage",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),
//
//                Text("${responseData.bookingSuccess?responseData.selectedVehicleData.first.carClass.capacity: "dummy"} Seat",style: CustomStyles.normal15,),
//
//              ],
//            ),
//
//            SizedBox(height:15 ,),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Text("Total Distance",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),
//
//                Text("${responseData.selectedVehicleData.first.carClass.capacity} Seat",style: CustomStyles.normal15,),
//
//              ],
//            ),

            SizedBox(height: 10,)
          ],
        ),
      )

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
}











