import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/flights/flight_search_response.dart';
import 'package:ota/models/flights/flight_search_response_entity.dart';
import 'package:ota/models/flights/data_model/pass_arguments.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_results_data.dart';
import 'package:ota/viewmodels/flights_view_model/flight_details_model.dart';
import 'package:ota/viewmodels/flights_view_model/flight_results_model.dart';
import 'package:provider/provider.dart';

class FlightDetails extends StatefulWidget {

  FlightResultsData flightResultsData;

  FlightDetails( this.flightResultsData);

  @override
  _FlightDetailsState createState() => _FlightDetailsState(flightResultsData);
}

class _FlightDetailsState extends State<FlightDetails> {

  FlightResultsData flightResultsData;

  _FlightDetailsState(this.flightResultsData);


  var height;

  var width;



  @override
  Widget build(BuildContext context) {


    height =MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;

    return ChangeNotifierProvider<FlightDetailsModel>(

      create: (context) =>FlightDetailsModel(flightResultsData),

        child:
        Consumer<FlightDetailsModel>(

            builder: (context, model, child) {

              return  Scaffold(appBar:
              AppBar(title: Text('Flight Details',style: CustomStyles.appbar,),
       leading: new IconButton(
        icon: new Icon(Icons.arrow_back_ios, color: Colors.white,size: 13,),
        onPressed: () => Navigator.of(context).pop(),
      ),

      actions: <Widget>[
        IconButton(
          icon: new Icon(Icons.clear, color: Colors.white,size: 20,),
          //  onPressed: () => Navigator.of(context).pop(),
        ),

      ],

    ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left:width*.4,right: width*.4,top: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(flex: 8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(model.flightResultsData.requestData.flyFrom,style: CustomStyles.heading,),
                            Icon(Icons.swap_horiz,color: CustomColors.heading,) ,
                            Text(model.flightResultsData.requestData.flyTo,style: CustomStyles.heading,),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Wrap(spacing: 1.2,

                          alignment: WrapAlignment.start,
                          direction: Axis.horizontal,



                          children: <Widget>[
                            Text(model.flightResultsData.requestData.oneway?model.flightResultsData.requestData.monthFrom+" | ":model.flightResultsData.requestData.monthFrom +" - "+model.flightResultsData.requestData.monthTo+" | ",style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                model.flightResultsData.requestData.adults!=0?Text('Adult ${model.flightResultsData.requestData.adults} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
                                model.flightResultsData.requestData.children!=0?Text('Children ${model.flightResultsData.requestData.children} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
                                model.flightResultsData.requestData.infants!=0?Text('Infants ${model.flightResultsData.requestData.infants} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
                              ],),

                            Text(model.flightResultsData.requestData.cabinSelection_name,
                              style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),),



                          ],)
                      ],

                    ),
                  ),
                  Expanded(flex: 2,
                    child: SizedBox(
                      height: 24,
                      child: RaisedButton(onPressed: (){

                      Navigator.pop(context);
                      Navigator.pop(context);


                      } ,color: CustomColors.Orange,
                        child: Text('EDIT',style:CustomStyles.calenderStyle.copyWith(color: CustomColors.White) ,),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),

                      ),
                    ),)
                ],),

              Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),
              SizedBox(height:5 ,),

              model.flightResultsData.requestData.oneway?Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                Text('Departure',style: CustomStyles.heading.copyWith(color:CustomColors.heading.withOpacity(.5) ),),

                SizedBox(height: 10,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: getDepartureList(model),
                ),

              ],): getRoundTripList(model),

              SizedBox(height: 20,),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Expanded(
                        flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 5,),
                              Text(model.flightResultsData.currency+" "+(model.flightResultsData.baseRate).toStringAsFixed(2),style: CustomStyles.appbar.copyWith(color: CustomColors.BackGround),),
                              SizedBox(height: 9,),
                              Wrap(spacing: 1.2,
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.center,
                                alignment: WrapAlignment.start,
                                direction: Axis.horizontal,

                                //  crossAxisAlignment: WrapCrossAlignment.start,

                                children: <Widget>[

                                  Wrap(
//                                mainAxisSize: MainAxisSize.min,
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      model.flightResultsData.requestData.adults!=0?Text('Adult ${model.flightResultsData.requestData.adults} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
                                      model.flightResultsData.requestData.children!=0?Text('Children ${model.flightResultsData.requestData.children} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
                                      model.flightResultsData.requestData.infants!=0?Text('Infants ${model.flightResultsData.requestData.infants} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
                                    ],),

                                  Text(model.flightResultsData.requestData.cabinSelection_name,
                                    style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),),



                                ],),
                              SizedBox(height: 5,),
                            ],
                          ) ),

                      Expanded(
                        flex: 4,
                          child:RaisedButton(child: Text('BOOK NOW',style:CustomStyles.button_style ,),color: CustomColors.Orange,padding: EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ) ,
                        onPressed: (){


                          Navigator.pushNamed(context, Routes.travelInformation,arguments:model.flightResultsData);




                        },))







                    ],

                  ),
                ),



              ),
              SizedBox(height: 50,),






            ],


          ),
        ),


      ),



    );

            },
        ),
    );

  }

  getDepartureList(FlightDetailsModel model) {

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
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Row(
                          children: <Widget>[

                            model.getSelectedAirLineImage(model.flightResultsData.selectedList[0].route[i].airline,model.flightResultsData.selectedList[0].airlinesMeta)
                            ,
                            SizedBox(width: 5,),

                            Text(model.flightResultsData.selectedList[0].route[i].airline,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),

                            SizedBox(width: 5,),
                            Text(model.flightResultsData.selectedList[0].route[i].flightNo.toString(),style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),



                          ],
                        ),


                        ),
                        Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                            child: SizedBox()),

                        Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child:  Text(model.flightResultsData.requestData.cabinSelection_name,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),)




                      ],),


                      Center(child: Text(model.getTimeDifferenceByDate(model.flightResultsData.selectedList[0].route[i].localDeparture.toString(),
                                                                        model.flightResultsData.selectedList[0].route[i].localArrival.toString()),
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


                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(

                              fit: FlexFit.loose,
                              child: Text('Baggage:',style: CustomStyles.calenderStyle,)
                          ),
                          Flexible(

                              fit: FlexFit.tight,
                              child: Center(child:

                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'Check-In',
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

                              fit: FlexFit.tight,
                              child:   RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: 'Cabin',
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

  getRoundTripList(FlightDetailsModel model) {
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
      print("Segregating");

    }


    return Column(
       mainAxisAlignment:  MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        Text('Departure',style: CustomStyles.heading.copyWith(color:CustomColors.heading.withOpacity(.5) ),),

        SizedBox(height: 10,),

        Column(children:  getDestinationList(destination,model),)

       ,



        SizedBox(height: 10,),
        Text('Return',style: CustomStyles.heading.copyWith(color:CustomColors.heading.withOpacity(.5) ),),

        SizedBox(height: 10,),

        Column(children:  getReturnList(return_,model),)







      ],
    );












  }

  getDestinationList(List<FlightSearchResponseRoute> destination, FlightDetailsModel model) {

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
                         flex: 3,
                         fit: FlexFit.tight,
                         child: Row(
                           children: <Widget>[

                             model.getSelectedAirLineImage(destination[i].airline,model.flightResultsData.selectedList[0].airlinesMeta),


                             SizedBox(width: 5,),

                             Text(model.flightResultsData.selectedList[0].route[i].airline,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),

                             SizedBox(width: 5,),

                             Text(model.flightResultsData.selectedList[0].route[i].flightNo.toString(),style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),

                           ],
                         ),


                       ),
                       Flexible(
                           flex: 4,
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

                     ),),

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




//                     Row(
//
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: <Widget>[
//                         Flexible(
//                           fit: FlexFit.tight,
//                           child:Text("Airport Name",style: CustomStyles.calenderStyle.copyWith(fontSize: 12,)),
//
//                         ),
//                         Flexible(
//                             fit: FlexFit.tight,
//                             child: Center(child: Text(
//                               model.selectedList[0].onewaystopsCount==0?
//                               'Non-Stop' : (model.selectedList[0].onewaystopsCount).toString()+" Stops"
//                               ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
//                         ),
//                         Flexible(
//                           fit: FlexFit.tight,
//                           child: Text("Airport Name",style: CustomStyles.calenderStyle.copyWith(fontSize: 12,),textAlign: TextAlign.end,),
//                         ),
//
//
//                       ],),
//
//                     SizedBox(height: 5,),

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

                     SizedBox(height: 7,),


                     Row(
                       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         Flexible(

                         fit: FlexFit.loose,
                         child: Text('Baggage:',style: CustomStyles.calenderStyle,)
                         ),
                         Flexible(

                         fit: FlexFit.tight,
                         child: Center(child:

                         RichText(
                           textAlign: TextAlign.center,
                           text: TextSpan(
                           text: 'Check-In',
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

                         fit: FlexFit.tight,
                         child:   RichText(
                           textAlign: TextAlign.center,
                           text: TextSpan(
                           text: 'Cabin',
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
           return destinationWidgets;






  }

  getReturnList(List<FlightSearchResponseRoute> return_, FlightDetailsModel model) {


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


              Container(child: Column(
                children: <Widget>[

                  Row(children: <Widget>[
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Row(
                        children: <Widget>[

                          model.getSelectedAirLineImage(return_[i].airline,model.flightResultsData.selectedList[0].airlinesMeta),

                          SizedBox(width: 5,),

                          Text(return_[i].airline,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),

                          SizedBox(width: 5,),

                          Text(return_[i].flightNo.toString(),style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),




                        ],
                      ),


                    ),
                    Flexible(
                        flex: 4,
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


//                  Row(
//
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Flexible(
//                        fit: FlexFit.tight,
//                        child:Text("Airport Name",style: CustomStyles.calenderStyle.copyWith(fontSize: 12,)),
//
//                      ),
//                      Flexible(
//                          fit: FlexFit.tight,
//                          child: Center(child: Text(
//                            model.selectedList[0].returnwaystopsCount==0?
//                            'Non-Stop' : (model.selectedList[0].returnwaystopsCount).toString()+" Stops"
//                            ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
//                      ),
//                      Flexible(
//                        fit: FlexFit.tight,
//                        child: Text("Airport Name",style: CustomStyles.calenderStyle.copyWith(fontSize: 12,),textAlign: TextAlign.end,),
//                      ),
//
//
//                    ],),

                  SizedBox(height: 5,),


                  Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                          fit: FlexFit.tight,
                          child: Row(children: <Widget>[
                            Image.asset('assets/images/morning.png',height: 13,),
                            SizedBox(width: 5,),
                            Text(model.getConvertedTime(return_[i].localDeparture),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),

                          ],)
                      ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Center(child: Text(
                         model.flightResultsData.selectedList[0].returnwaystopsCount==0?
                          'Non-Stop' : (model.flightResultsData.selectedList[0].returnwaystopsCount).toString()+" Stops"
                        ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
                       ),
                      Flexible(
                          fit: FlexFit.tight,
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Image.asset('assets/images/night.png',height: 13,),
                              SizedBox(width: 5,),
                              Text(model.getConvertedTime(return_[i].localArrival),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),

                            ],)
                      ),


                    ],),


                  SizedBox(height: 8,),
                  Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(fit: FlexFit.loose,
                          child: Text(model.getConvertedDate(return_[i].localDeparture),style: CustomStyles.calenderStyle,)
                      ),
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child:
                        SizedBox()
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children:
//                          model.getAirLineImagesRound(return_,model.flightList[index],1)
//
//                          ,),
                      ),


                      Flexible(fit: FlexFit.loose,
                          child: Text(model.getConvertedDate(return_[i].localArrival),style: CustomStyles.calenderStyle,textAlign: TextAlign.end,)
                      ),


                    ],),
                  SizedBox(height: 15,),
                  Container(height: 1,
                    width: double.infinity,
                    color: CustomColors.disabledButton.withOpacity(.3),
                  ),

                  SizedBox(height: 7,),


                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(

                      fit: FlexFit.loose,
                      child: Text('Baggage:',style: CustomStyles.calenderStyle,)
                      ),
                      Flexible(

                      fit: FlexFit.tight,
                      child: Center(child:

                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                        text: 'Check-In',
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

                      fit: FlexFit.tight,
                      child:   RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                        text: 'Cabin',
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
              )
                ,)
            ],
          ),
        )


    ),

      );
    }
    return returnWidgets;

  }



}
