import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/flights/flight_search_response.dart';
import 'package:ota/models/flights/flight_search_response_entity.dart';
import 'package:ota/models/flights/data_model/pass_arguments.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/booking_status_model.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_booking_data.dart';
import 'package:ota/viewmodels/flights_view_model/flight_results_model.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';



class FlightBookingStatus extends StatefulWidget {

  FlightBookingData flightBookingData;

  FlightBookingStatus( this.flightBookingData);

  @override
  _FlightBookingStatusState createState() => _FlightBookingStatusState(flightBookingData);
}

class _FlightBookingStatusState extends State<FlightBookingStatus> {

  FlightBookingData flightBookingData;

  _FlightBookingStatusState(this.flightBookingData);

  GlobalKey _globalKey = new GlobalKey();

  final key = new GlobalKey<ScaffoldState>();


  var screenHeight;
   var screenWidth;

  @override
  Widget build(BuildContext context) {
 screenWidth = MediaQuery.of(context).size.width/10;

 screenHeight = MediaQuery.of(context).size.height/10;

    return ChangeNotifierProvider<FlightBookingStatusModel>(
      create: (context) =>FlightBookingStatusModel(flightBookingData.flightTravelInfoData,flightBookingData.flightBookingRes),
        child:
        Consumer<FlightBookingStatusModel>(

            builder: (context, model, child) {


    return Scaffold(

      key: key,
      backgroundColor: CustomColors.BackGround,

      appBar: AppBar(title: Text(getLocalText("booking_status", context),style: CustomStyles.appbar,),
        leading: new IconButton(
          icon: new Icon(Icons.home, color: Colors.white,size: 13,),
          onPressed: ()  {

          Navigator.pop(context);


          }),

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
            child:

              Stack(
                children: [
                  SingleChildScrollView(
                    child:

                  RepaintBoundary(
                  key: _globalKey,

                  child:
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      Stack(
                        children: [
                          Container(

                            height: screenHeight*3.57,
                            margin: EdgeInsets.only(bottom: screenHeight*.31),
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

                                SizedBox(height: screenHeight*.22,),

//                                Padding(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: Row(
//                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                    crossAxisAlignment: CrossAxisAlignment.center,
//                                    children: [
//                                      Image.asset('assets/images/dashboard/logo_plane.png',height: screenHeight*.45,color: CustomColors.Orange,),
//
//                                      Image.asset('assets/images/flights.png',height: screenHeight*1.5,),
//
//                                      Container(
//                                        //margin: EdgeInsets.only(top: 55),
//                                        decoration: new BoxDecoration(
//                                          color: CustomColors.green,
//                                          shape: BoxShape.circle,
//                                          border: Border.all(color: CustomColors.White,width: 3),
//                                          boxShadow: [
//                                            BoxShadow(
//                                              color: Colors.grey,
//                                              offset: Offset(0.0, 1.0), //(x,y)
//                                              blurRadius: 6.0,
//                                            ),
//                                          ],
//                                        ),
//                                        child: Image.asset('assets/images/check.png',height: 40,width: 40,),
//                                      ),
//
//                                    ],
//                                  ),
//                                ),
//                                SizedBox(height: 15,),


                                Image.asset('assets/images/flights.png',height: screenHeight*1.2,),
                                SizedBox(height: screenHeight*.22,),

                                Center(child: Text(getLocalText("reservation_no", context),style:CustomStyles.medium12.copyWith(color: CustomColors.BackGround) )),

                                SizedBox(height: 3,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(model.flightBookingRes.result.bookings.first.reservationNumber,style:CustomStyles.medium18.copyWith(color: CustomColors.BackGround) ,textAlign: TextAlign.center,),

                                    SizedBox(width: 15,),


                                    GestureDetector(child:
                                    Image.asset('assets/clipboard.png',color: CustomColors.BackGround,height: 20,width: 20,),
                                      onTap: (){

                                        _copytoClipboard(model.flightBookingRes.result.bookings.first.reservationNumber);

                                      },
                                    )


                                  ],
                                ),

                                SizedBox(height: screenHeight*.22,),

                                Center(child: Text(getLocalText("flight_booking_id", context),style:CustomStyles.medium12.copyWith(color: CustomColors.BackGround) )),

                                SizedBox(height: 3,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(model.flightBookingRes.result.bookingId,style:CustomStyles.medium18.copyWith(color: CustomColors.BackGround) ,textAlign: TextAlign.center,),

                                    SizedBox(width: 15,),


                                    GestureDetector(
                                      child:
                                    Image.asset('assets/clipboard.png',color: CustomColors.BackGround,height: 20,width: 20,),
                                      onTap: (){

                                      _copytoClipboard(model.flightBookingRes.result.bookingId);

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


                      SizedBox(height: screenHeight*.15,),


                     _paymentSummary(model),

                      SizedBox(height: screenHeight*.4,),


                      _flightSummary(model),
                      SizedBox(height: screenHeight*.4,),

                      _passengerInfo(model),

                      SizedBox(height: screenHeight*.4,),

                    ],
                  ),


            ),






            ),



                ],
              )




    )
    );

            },
        ),
    );


  }




  getDepartureList(FlightBookingStatusModel model) {

    List<Widget>widgetlist = List();

    for(int i=0;i<model.flightResultsData.selectedList[0].route.length;i++){



      widgetlist.add(
        Card(
            elevation: 3,
            margin: EdgeInsets.only(top: 10,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child:
            Container(
              margin: EdgeInsets.only(left: 23,right: 23,top: 14,bottom: 14),
              child: Column(
                children: <Widget>[
                  Container(child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Row(
                            children: <Widget>[

                              model.getSelectedAirLineImage(model.flightResultsData.selectedList[0].route[i].airline,model.flightResultsData.selectedList[0].airlinesMeta)
                              ,
                              SizedBox(width: 5,),

                              Text(model.flightResultsData.selectedList[0].route[i].airline,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,)



                            ],
                          ),


                        ),
                        Flexible(
                            flex: 5,
                            fit: FlexFit.tight,
                            child: SizedBox()),

                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child:  Text(model.flightResultsData.requestData.cabinSelection_name,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),)




                      ],),


                      Center(child: Text(model.getTimeDifferenceByDate(model.flightResultsData.selectedList[0].route[i].localDeparture,
                          model.flightResultsData.selectedList[0].route[i].localArrival),
                        style: CustomStyles.calenderStyle,),),

                      Row(
                        mainAxisSize: MainAxisSize.max,

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Flexible(fit: FlexFit.loose,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(model.flightResultsData.selectedList[0].route[i].flyFrom,style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),
                                  SizedBox(width: 30,),
                                  Image.asset('assets/images/circular.png',height: 10,),

                                  Flexible(

                                      child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
                                  ),

                                ],)
                          ),
                          Expanded(

                              child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
                          ),
                          Flexible(fit: FlexFit.loose,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(

                                      child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
                                  ),
                                  Image.asset('assets/images/path1.png',height: 15,),
                                  SizedBox(width: 20,),
                                  Text(model.flightResultsData.selectedList[0].route[i].flyTo,style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),



                                ],)
                          ),




                        ],),
                      SizedBox(height: 5,),

                    Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Flexible(
                    fit: FlexFit.loose,
                    child: Row(children: <Widget>[
                    Image.asset('assets/images/morning.png',height: 13,),
                    SizedBox(width: 5,),
                    Text(model.getConvertedTime(model.flightResultsData.selectedList[0].route[i].localDeparture),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),

                    ],)
                    ),
                    Flexible(
                    fit: FlexFit.tight,
                    child: Center(child: Text(
                    model.flightResultsData.selectedList[0].onewaystopsCount==0?
                    'Non-Stop' : (model.flightResultsData.selectedList[0].onewaystopsCount).toString()+" Stops"
                    ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
                    ),
                    Flexible(
                    fit: FlexFit.loose,
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                    Image.asset('assets/images/night.png',height: 13,),
                    SizedBox(width: 5,),
                    Text(model.getConvertedTime( model.flightResultsData.selectedList[0].route[i].localArrival),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),

                    ],)
                    ),


                    ],),
                    SizedBox(height: 8,),
                    Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(model.getConvertedDate(model.flightResultsData.selectedList[0].route[i].localDeparture),style: CustomStyles.calenderStyle,textAlign: TextAlign.start,)
                    ),
                    Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child:
                    SizedBox()
                    ,
                    ),


                    Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Text(model.getConvertedDate(model.flightResultsData.selectedList[0].route[i].localArrival),style: CustomStyles.calenderStyle,textAlign: TextAlign.end,)
                    ),


                    ],),
                    SizedBox(height: 7,),
                    Container(height: 1,
                    width: double.infinity,
                    color: CustomColors.disabledButton.withOpacity(.3),
                    ),

                    SizedBox(height: 7,),

////                      Row(
////
////                        crossAxisAlignment: CrossAxisAlignment.center,
////                        children: <Widget>[
////                          Flexible(
////                            fit: FlexFit.tight,
////                            child:Text(getLocalText("airport_name", context),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,)),
////
////                          ),
////                          Flexible(
////                              fit: FlexFit.tight,
////                              child: Center(child: Text(
////                                model.flightResultsData.selectedList[0].onewaystopsCount==0?
////                                'Non-Stop' : (model.flightResultsData.selectedList[0].onewaystopsCount).toString()+" Stops"
////                                ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
////                          ),
////                          Flexible(
////                            fit: FlexFit.tight,
////                            child: Text(getLocalText("airport_name", context),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,),textAlign: TextAlign.end,),
////                          ),
////
////
////                        ],),
////                      SizedBox(height: 5,),
////                      Row(
////
////                        crossAxisAlignment: CrossAxisAlignment.center,
////                        children: <Widget>[
////                          Flexible(
////                              fit: FlexFit.loose,
////                              child: Row(children: <Widget>[
////                                Image.asset('assets/images/morning.png',height: 13,),
////                                SizedBox(width: 5,),
////                                Text(model.getConvertedTime(model.flightResultsData.selectedList[0].route[i].localDeparture),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),
////
////                              ],)
////                          ),
////                          Flexible(
////                              fit: FlexFit.tight,
////                              child: SizedBox()
////                          ),
////                          Flexible(
////                              fit: FlexFit.loose,
////                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
////                                children: <Widget>[
////                                  Image.asset('assets/images/night.png',height: 13,),
////                                  SizedBox(width: 5,),
////                                  Text(model.getConvertedTime( model.flightResultsData.selectedList[0].route[i].localArrival),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),
////
////                                ],)
////                          ),
////
////
////                        ],),
//                      SizedBox(height: 8,),
//                      Row(
//
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Flexible(
//                              flex: 2,
//                              fit: FlexFit.tight,
//                              child: Text(model.getConvertedDate(model.flightResultsData.selectedList[0].route[i].localDeparture),style: CustomStyles.calenderStyle,textAlign: TextAlign.start,)
//                          ),
//                          Flexible(
//                            flex: 5,
//                            fit: FlexFit.tight,
//                            child:
//                            SizedBox()
//                            ,
//                          ),
//
//
//                          Flexible(
//                              flex: 2,
//                              fit: FlexFit.tight,
//                              child: Text(model.getConvertedDate(model.flightResultsData.selectedList[0].route[i].localArrival),style: CustomStyles.calenderStyle,textAlign: TextAlign.end,)
//                          ),
//
//
//                        ],),
                    //  SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                              fit: FlexFit.loose,
                              child: Text(getLocalText("baggage", context),style: CustomStyles.calenderStyle,)
                          ),
                          Flexible(
                              fit: FlexFit.tight,
                              child: Center(child:

                              RichText(
                                text: TextSpan(
                                    text: getLocalText("check_in", context),
                                    style: CustomStyles.calenderStyle,
                                    children: <TextSpan>[
                                      TextSpan(text: " ${model.flightResultsData.selectedList[0].baglimit.holdWeight.toString()}"+' kgs',
                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading)
                                      )
                                    ]
                                ),
                              )

                              )
                          ),
                          Flexible(
                              fit: FlexFit.loose,
                              child:   RichText(
                                text: TextSpan(
                                    text: getLocalText("cabin", context),
                                    style: CustomStyles.calenderStyle,
                                    children: <TextSpan>[
                                      TextSpan(text:" ${model.flightResultsData.selectedList[0].baglimit.handWeight.toString()}"+' kgs',
                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading)
                                      )
                                    ]
                                ),
                              )
                          ),


                        ],),

                    ],
                  ),),
                ],
              ),
            )
        ),
      );






    }





    return widgetlist;

  }

  getRoundTripList(FlightBookingStatusModel model) {
    List<
        FlightSearchResponseRoute> destination = List();
    List<
        FlightSearchResponseRoute> return_ = List();

    for (int i = 0; i <
        model.flightResultsData.selectedList[0].route
            .length; i++) {
      if ( model.flightResultsData.selectedList[0].route[i]
          .return__ == 0) {
        destination.add(
            model.flightResultsData.selectedList[0].route[i]);
      } else {
        return_.add(
            model.flightResultsData.selectedList[0].route[i]);
      }


    }


    return Column(
      mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Text(getLocalText("departure", context),style: CustomStyles.heading.copyWith(color:CustomColors.Orange ),),
        ),

        SizedBox(height: 10,),

        Column(children:  getDestinationList(destination,model),)

        ,



        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Text(getLocalText("return", context),style: CustomStyles.heading.copyWith(color:CustomColors.Orange ),),
        ),

        SizedBox(height: 10,),

        Column(children:  getReturnList(return_,model),)







      ],
    );












  }

  getDestinationList(List<FlightSearchResponseRoute> destination, FlightBookingStatusModel model) {

    List<Widget> destinationWidgets = List();

    for(int i=0;i<destination.length;i++) {
      destinationWidgets.add(

        Card(
            elevation: 3,
            margin: EdgeInsets.only(top: 10,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child:
            Container(
              margin: EdgeInsets.only(left: 23, right: 23, top: 14, bottom: 14),
              child: Column(
                children: <Widget>[
                  Container(child: Column(
                    children: <Widget>[

                      Row(children: <Widget>[
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Row(
                            children: <Widget>[

                              model.getSelectedAirLineImage(destination[i].airline,model.flightResultsData.selectedList[0].airlinesMeta),

                              SizedBox(width: 5,),

                              Text(model.flightResultsData.selectedList[0].route[i].airline,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,)



                            ],
                          ),


                        ),
                        Flexible(
                            flex: 5,
                            fit: FlexFit.tight,
                            child: SizedBox()),

                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child:  Text(model.flightResultsData.requestData.cabinSelection_name,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),)




                      ],),

                      Center(child: Text(
                        model.getTimeDifferenceByDate(destination[i].localDeparture,
                            destination[i].localArrival),
                        style: CustomStyles.calenderStyle,
                      ),
                      ),

                      Row(
                        mainAxisSize: MainAxisSize.max,

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Flexible(fit: FlexFit.loose,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(destination[i].flyFrom,
                                    style: CustomStyles.style3.copyWith(
                                        fontWeight: FontWeight.w500),),
                                  SizedBox(width: 30,),
                                  Image.asset(
                                    'assets/images/circular.png', height: 10,),

                                  Flexible(

                                      child: MySeparator(height: 1,
                                        color: CustomColors.TabDisabled,
                                        Horizontal: true,)
                                  ),

                                ],)
                          ),
                          Expanded(

                              child: MySeparator(height: 1, color: CustomColors
                                  .TabDisabled, Horizontal: true,)
                          ),
                          Flexible(fit: FlexFit.loose,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(

                                      child: MySeparator(height: 1,
                                        color: CustomColors.TabDisabled,
                                        Horizontal: true,)
                                  ),
                                  Image.asset(
                                    'assets/images/path1.png', height: 15,),
                                  SizedBox(width: 20,),
                                  Text(destination[i].flyTo,
                                    style: CustomStyles.style3.copyWith(
                                        fontWeight: FontWeight.w500),),
                                ],)
                          ),

                        ],),
                      SizedBox(height: 5,),

                      Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                          fit: FlexFit.tight,
                          child: Row(children: <Widget>[
                            Image.asset(
                              'assets/images/morning.png', height: 13,),
                            SizedBox(width: 5,),
                            Text(model.getConvertedTime(
                            destination[i].localDeparture),
                              style: CustomStyles.calenderStyle.copyWith(
                              fontSize: 12,
                              color: CustomColors.heading),),

                          ],)
                          ),
                          Flexible(
                          fit: FlexFit.tight,
                          child: Center(child: Text(
                            model.flightResultsData.selectedList[0].onewaystopsCount==0?
                            'Non-Stop' : (model.flightResultsData.selectedList[0].onewaystopsCount).toString()+" Stops"
                            ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
                          ),
                          Flexible(
                          fit: FlexFit.tight,
                          child: Row(mainAxisAlignment: MainAxisAlignment
                          .end,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/night.png', height: 13,),
                              SizedBox(width: 5,),
                              Text(model.getConvertedTime(
                              destination[i].localArrival),
                                style: CustomStyles.calenderStyle.copyWith(
                                fontSize: 12,
                                color: CustomColors.heading),),

                            ],)
                          ),
                        ],),
                      SizedBox(height: 8,),
                      Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(fit: FlexFit.loose,
                          child: Text(model.getConvertedDate(
                          destination[i].localDeparture),
                            style: CustomStyles.calenderStyle,)
                          ),
                          Flexible(
                            flex: 5,
                            fit: FlexFit.tight,
                            child:
                            SizedBox(),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children:
//                             model.getAirLineImagesRound(
//                                 , model.flightList[index], 0)
//                             ,),
                          ),
                          Flexible(fit: FlexFit.loose,
                          child: Text(model.getConvertedDate(
                          destination[i].localArrival),
                            style: CustomStyles.calenderStyle,
                            textAlign: TextAlign.end,)
                          ),


                        ],),
                      SizedBox(height: 15,),

                      Container(height: 1,
                        width: double.infinity,
                        color: CustomColors.disabledButton.withOpacity(.3),
                      ),

                    //  SizedBox(height: 7,),

//                      Row(
//
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Flexible(
//                            fit: FlexFit.tight,
//                            child:Text(getLocalText("airport_name", context),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,)),
//
//                          ),
//                          Flexible(
//                              fit: FlexFit.tight,
//                              child: Center(child: Text(
//                                model.flightResultsData.selectedList[0].onewaystopsCount==0?
//                                'Non-Stop' : (model.flightResultsData.selectedList[0].onewaystopsCount).toString()+" Stops"
//                                ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
//                          ),
//                          Flexible(
//                            fit: FlexFit.tight,
//                            child: Text(getLocalText("airport_name", context),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,),textAlign: TextAlign.end,),
//                          ),
//
//
//                        ],),
//
//                      SizedBox(height: 5,),
//
//                      Row(
//
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Flexible(
//                              fit: FlexFit.tight,
//                              child: Row(children: <Widget>[
//                                Image.asset(
//                                  'assets/images/morning.png', height: 13,),
//                                SizedBox(width: 5,),
//                                Text(model.getConvertedTime(
//                                    destination[i].localDeparture),
//                                  style: CustomStyles.calenderStyle.copyWith(
//                                      fontSize: 12,
//                                      color: CustomColors.heading),),
//
//                              ],)
//                          ),
//                          Flexible(
//                              fit: FlexFit.tight,
//                              child: SizedBox()
//                          ),
//                          Flexible(
//                              fit: FlexFit.tight,
//                              child: Row(mainAxisAlignment: MainAxisAlignment
//                                  .end,
//                                children: <Widget>[
//                                  Image.asset(
//                                    'assets/images/night.png', height: 13,),
//                                  SizedBox(width: 5,),
//                                  Text(model.getConvertedTime(
//                                      destination[i].localArrival),
//                                    style: CustomStyles.calenderStyle.copyWith(
//                                        fontSize: 12,
//                                        color: CustomColors.heading),),
//
//                                ],)
//                          ),
//                        ],),
//                      SizedBox(height: 8,),
//                      Row(
//
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Flexible(fit: FlexFit.loose,
//                              child: Text(model.getConvertedDate(
//                                  destination[i].localDeparture),
//                                style: CustomStyles.calenderStyle,)
//                          ),
//                          Flexible(
//                            flex: 5,
//                            fit: FlexFit.tight,
//                            child:
//                            SizedBox(),
////                           Row(
////                             mainAxisAlignment: MainAxisAlignment.center,
////                             crossAxisAlignment: CrossAxisAlignment.center,
////                             children:
////                             model.getAirLineImagesRound(
////                                 , model.flightList[index], 0)
////                             ,),
//                          ),
//                          Flexible(fit: FlexFit.loose,
//                              child: Text(model.getConvertedDate(
//                                  destination[i].localArrival),
//                                style: CustomStyles.calenderStyle,
//                                textAlign: TextAlign.end,)
//                          ),
//
//
//                        ],),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                              fit: FlexFit.loose,
                              child: Text(getLocalText("baggage", context),style: CustomStyles.calenderStyle,)
                          ),
                          Flexible(
                              fit: FlexFit.tight,
                              child: Center(child:

                              RichText(
                                text: TextSpan(
                                    text: getLocalText("check_in", context),
                                    style: CustomStyles.calenderStyle,
                                    children: <TextSpan>[
                                      TextSpan(text: " ${model.flightResultsData.selectedList[0].baglimit.holdWeight.toString()}"+' kgs',
                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading)
                                      )
                                    ]
                                ),
                              )

                              )
                          ),
                          Flexible(
                              fit: FlexFit.loose,
                              child:   RichText(
                                text: TextSpan(
                                    text: getLocalText("cabin", context),
                                    style: CustomStyles.calenderStyle,
                                    children: <TextSpan>[
                                      TextSpan(text: " ${model.flightResultsData.selectedList[0].baglimit.handWeight.toString()}"+' kgs',
                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading)
                                      )
                                    ]
                                ),
                              )
                          ),


                        ],),



                    ],
                  ),),

                ],
              ),
            )


        ),
      );
    }
    return destinationWidgets;






  }

  getReturnList(List<FlightSearchResponseRoute> return_, FlightBookingStatusModel model) {


    List<Widget> returnWidgets = List();

    for(int i=0;i<return_.length;i++) {
      returnWidgets.add(

        Card(
            elevation: 3,
            margin: EdgeInsets.only(top: 10,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child:
            Container(
              margin: EdgeInsets.only(left: 23,right: 23,top: 14,bottom: 14),
              child: Column(
                children: <Widget>[


                  Row(children: <Widget>[
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Row(
                        children: <Widget>[

                          model.getSelectedAirLineImage(return_[i].airline,model.flightResultsData.selectedList[0].airlinesMeta),

                          SizedBox(width: 5,),

                          Text(model.flightResultsData.selectedList[0].route[i].airline,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,)



                        ],
                      ),


                    ),
                    Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: SizedBox()),

                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child:  Text(model.flightResultsData.requestData.cabinSelection_name,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),)




                  ],),

                  Center(child: Text(
                    model.getTimeDifferenceByDate(return_[i].localDeparture,
                        return_[i].localArrival),
                    style: CustomStyles.calenderStyle,
                  ),
                  ),


                      Row(
                        mainAxisSize: MainAxisSize.max,

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Flexible(fit: FlexFit.loose,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(return_[i].flyFrom,style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),
                                  SizedBox(width: 30,),
                                  Image.asset('assets/images/circular.png',height: 10,),

                                  Flexible(

                                      child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
                                  ),

                                ],)
                          ),
                          Expanded(

                              child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
                          ),
                          Flexible(fit: FlexFit.loose,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(

                                      child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
                                  ),
                                  Image.asset('assets/images/path2.png',height: 15,),
                                  SizedBox(width: 20,),
                                  Text(return_[i].flyTo,style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),

                                ],)
                          ),

                        ],),
                  SizedBox(height: 5,),

                  Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                      fit: FlexFit.tight,
                      child: Row(children: <Widget>[
                        Image.asset(
                          'assets/images/morning.png', height: 13,),
                        SizedBox(width: 5,),
                        Text(model.getConvertedTime(
                        return_[i].localDeparture),
                          style: CustomStyles.calenderStyle.copyWith(
                          fontSize: 12,
                          color: CustomColors.heading),),

                      ],)
                      ),
                      Flexible(
                      fit: FlexFit.tight,
                      child: Center(child: Text(
                        model.flightResultsData.selectedList[0].onewaystopsCount==0?
                        'Non-Stop' : (model.flightResultsData.selectedList[0].onewaystopsCount).toString()+" Stops"
                        ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
                      ),
                      Flexible(
                      fit: FlexFit.tight,
                      child: Row(mainAxisAlignment: MainAxisAlignment
                      .end,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/night.png', height: 13,),
                          SizedBox(width: 5,),
                          Text(model.getConvertedTime(
                          return_[i].localArrival),
                            style: CustomStyles.calenderStyle.copyWith(
                            fontSize: 12,
                            color: CustomColors.heading),),

                        ],)
                      ),
                    ],),
                  SizedBox(height: 8,),
                  Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(fit: FlexFit.loose,
                      child: Text(model.getConvertedDate(
                      return_[i].localDeparture),
                        style: CustomStyles.calenderStyle,)
                      ),
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child:
                        SizedBox(),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children:
//                             model.getAirLineImagesRound(
//                                 , model.flightList[index], 0)
//                             ,),
                      ),
                      Flexible(fit: FlexFit.loose,
                      child: Text(model.getConvertedDate(
                      return_[i].localArrival),
                        style: CustomStyles.calenderStyle,
                        textAlign: TextAlign.end,)
                      ),


                    ],),
                  SizedBox(height: 15,),

                  Container(height: 1,
                    width: double.infinity,
                    color: CustomColors.disabledButton.withOpacity(.3),
                  ),

                  //  SizedBox(height: 7,),

//                      Row(
//
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Flexible(
//                            fit: FlexFit.tight,
//                            child:Text(getLocalText("airport_name", context),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,)),
//
//                          ),
//                          Flexible(
//                              fit: FlexFit.tight,
//                              child: Center(child: Text(
//                                model.flightResultsData.selectedList[0].onewaystopsCount==0?
//                                'Non-Stop' : (model.flightResultsData.selectedList[0].onewaystopsCount).toString()+" Stops"
//                                ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
//                          ),
//                          Flexible(
//                            fit: FlexFit.tight,
//                            child: Text(getLocalText("airport_name", context),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,),textAlign: TextAlign.end,),
//                          ),
//
//
//                        ],),
//
//                      SizedBox(height: 5,),
//
//                      Row(
//
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Flexible(
//                              fit: FlexFit.tight,
//                              child: Row(children: <Widget>[
//                                Image.asset(
//                                  'assets/images/morning.png', height: 13,),
//                                SizedBox(width: 5,),
//                                Text(model.getConvertedTime(
//                                    destination[i].localDeparture),
//                                  style: CustomStyles.calenderStyle.copyWith(
//                                      fontSize: 12,
//                                      color: CustomColors.heading),),
//
//                              ],)
//                          ),
//                          Flexible(
//                              fit: FlexFit.tight,
//                              child: SizedBox()
//                          ),
//                          Flexible(
//                              fit: FlexFit.tight,
//                              child: Row(mainAxisAlignment: MainAxisAlignment
//                                  .end,
//                                children: <Widget>[
//                                  Image.asset(
//                                    'assets/images/night.png', height: 13,),
//                                  SizedBox(width: 5,),
//                                  Text(model.getConvertedTime(
//                                      destination[i].localArrival),
//                                    style: CustomStyles.calenderStyle.copyWith(
//                                        fontSize: 12,
//                                        color: CustomColors.heading),),
//
//                                ],)
//                          ),
//                        ],),
//                      SizedBox(height: 8,),
//                      Row(
//
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Flexible(fit: FlexFit.loose,
//                              child: Text(model.getConvertedDate(
//                                  destination[i].localDeparture),
//                                style: CustomStyles.calenderStyle,)
//                          ),
//                          Flexible(
//                            flex: 5,
//                            fit: FlexFit.tight,
//                            child:
//                            SizedBox(),
////                           Row(
////                             mainAxisAlignment: MainAxisAlignment.center,
////                             crossAxisAlignment: CrossAxisAlignment.center,
////                             children:
////                             model.getAirLineImagesRound(
////                                 , model.flightList[index], 0)
////                             ,),
//                          ),
//                          Flexible(fit: FlexFit.loose,
//                              child: Text(model.getConvertedDate(
//                                  destination[i].localArrival),
//                                style: CustomStyles.calenderStyle,
//                                textAlign: TextAlign.end,)
//                          ),
//
//
//                        ],),
                  SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                              fit: FlexFit.loose,
                              child: Text(getLocalText("baggage", context),style: CustomStyles.calenderStyle,)
                          ),
                          Flexible(
                              fit: FlexFit.tight,
                              child: Center(child:

                              RichText(
                                text: TextSpan(
                                    text: getLocalText("check_in", context),
                                    style: CustomStyles.calenderStyle,
                                    children: <TextSpan>[
                                      TextSpan(text: " ${model.flightResultsData.selectedList[0].baglimit.holdWeight.toString()}"+' kgs',
                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading)
                                      )
                                    ]
                                ),
                              )

                              )
                          ),
                          Flexible(
                              fit: FlexFit.loose,
                              child:   RichText(
                                text: TextSpan(
                                    text: getLocalText("cabin", context),
                                    style: CustomStyles.calenderStyle,
                                    children: <TextSpan>[
                                      TextSpan(text: " ${model.flightResultsData.selectedList[0].baglimit.handWeight.toString()}"+' kgs',
                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading)
                                      )
                                    ]
                                ),
                              )
                          ),


                        ],),



                ],
              ),
            )


        ),

      );
    }
    return returnWidgets;

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
          new SnackBar(content: new Text(getLocalText("screen_captured", context),style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
              backgroundColor: CustomColors.BackGround));

    } catch (e) {
      print(e);
    }


  }

  void _copytoClipboard(String reservationNumber) {

    Clipboard.setData(new ClipboardData(text:reservationNumber ));
    key.currentState.showSnackBar(
        new SnackBar(content: new Text(getLocalText("copied_to_clipboard", context),style: CustomStyles.medium16.copyWith(color: CustomColors.White)),
    backgroundColor: CustomColors.BackGround));

  }








  _paymentSummary(FlightBookingStatusModel model) {


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
            child: Text(getLocalText("payment_summary", context),style: CustomStyles.normal18.copyWith(color: CustomColors.BackGround),),
          ),


          SizedBox(height:20 ,),

          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(getLocalText("flight_price", context),style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                RichText(
                  text: TextSpan(
                  text: model.flightResultsData.currency,
                  style: CustomStyles.medium12.copyWith(color: CustomColors.BackGround),
                  children: <TextSpan>[


                    TextSpan(text: " "+model.flightResultsData.baseRate.toString(),
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
                Text(getLocalText("tax_and_other_charges", context),style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                RichText(
                  text: TextSpan(
                  text: model.flightResultsData.currency.toString(),
                  style: CustomStyles.medium12.copyWith(color: CustomColors.BackGround),
                  children: <TextSpan>[
                    TextSpan(text: " "+model.flightResultsData.taxAndOtherCharges.toString(),
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
                Text(getLocalText("total_amount_payable", context),style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),


                RichText(
                  text: TextSpan(
                  text: model.flightResultsData.currency,
                  style: CustomStyles.medium12.copyWith(color: CustomColors.BackGround),
                  children: <TextSpan>[
                    TextSpan(text: " "+model.flightResultsData.totalPriceWithMarkup.toString(),
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

  _flightSummary(FlightBookingStatusModel model) {

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
            child: Text(getLocalText("flight_summary", context),style: CustomStyles.normal18.copyWith(color: CustomColors.BackGround),),
          ),

          SizedBox(height:20 ,),

          model.flightResultsData.requestData.oneway?Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text(getLocalText("departure", context),style: CustomStyles.heading.copyWith(color:CustomColors.Orange ),),
              ),

              SizedBox(height: 10,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getDepartureList(model),
              ),

            ],): getRoundTripList(model),



          SizedBox(height:30 ,),



        ],
      ),
    );

  }

  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }

  _passengerInfo(FlightBookingStatusModel model) {

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
            child: Text("Passsenger Summary",style: CustomStyles.normal18.copyWith(color: CustomColors.BackGround),),
          ),

          SizedBox(height:20 ,),

          ListView.builder(
    //physics: NeverScrollableScrollPhysics(),

    primary: false,
    shrinkWrap: true,
    //padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .12),
    itemCount: model.flightTravelInfoData.traveldetails.length, // records.length
    itemBuilder: (BuildContext context, int index) {

      return Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(

          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("First Name",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text(model.flightTravelInfoData.traveldetails[index].firstname,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

              ],
            ),

            SizedBox(height:15 ,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Last Name",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text( model.flightTravelInfoData.traveldetails[index].lastname,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

              ],
            ),

            SizedBox(height:15 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Nationality",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text( model.flightTravelInfoData.traveldetails[index].nationality,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

              ],
            ),

            SizedBox(height:15 ,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Address",style: CustomStyles.normal14.copyWith(color: CustomColors.BackGround.withOpacity(.7)),),

                Text( model.flightTravelInfoData.traveldetails[index].address,style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround)),

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

            Navigator.pushNamed(context, Routes.cancelPolicyView,arguments:[model.flightBookingRes.result.bookings.first.reservationNumber]);

          },

          child: Text(getLocalText("cancellation_and_refund_policy", context),style: CustomStyles.normal12.copyWith(color: CustomColors.BackGround,decoration: TextDecoration.underline,),)),


          SizedBox(height:30 ,),



        ],
      ),
    );

  }

}





//test





