//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:intl/intl.dart';
//import 'package:ota/app/Router.dart';
//import 'package:ota/models/flights/flight_search_response_entity.dart';
//import 'package:ota/utils/Dash_seperator.dart';
//import 'package:ota/utils/colors.dart';
//import 'dart:ui';
//
//import 'package:ota/utils/dolDumClipper.dart';
//import 'package:ota/utils/styles.dart';
//import 'package:ota/viewmodels/flightbookingModel.dart';
//import 'package:ota/views/base/base_view.dart';
//import 'package:ota/views/base/base_widget.dart';
//
//class PriceLow_High extends StatelessWidget {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return BaseWidget<FlightSearch_Model>(
//        viewModel: FlightSearch_Model(),
//        //onModelReady: (model) => model.initialise(),
//        builder: (context) =>_PriceLow_HighState());
//
//  }
//
//}
//
//class _PriceLow_HighState  extends BaseModelWidget<FlightSearch_Model> {
//
//  GlobalKey globalKey = GlobalKey();
//  ScrollController _controller = new ScrollController();
//  var duration;
//  @override
//  Widget build(BuildContext context, FlightSearch_Model model) {
//    var width = MediaQuery.of(context).size.width;
//    return
//      Container(
//        margin: EdgeInsets.only(left:25,right: 25,top: 10),
//        child: Column(
//          children: <Widget>[
//
//            Expanded(
//              child:
//
//
//              ListView.builder(
//                  itemCount: FlightSearch_Model.flightList.length, // records.length
//                  itemBuilder: (BuildContext context, int index) {
//
//                   // print(model.getTimeDifference(flight_Model.flightList[index].onewayLocalDeparture, flight_Model.flightList[index].onewayLocalArrival));
//
//
//
//                    return model.OneWay?
//                    GestureDetector(child:
//
//                    Card(
//                        elevation: 3,
//                        margin: EdgeInsets.only(top: 10,),
//                        shape: RoundedRectangleBorder(
//                          borderRadius: BorderRadius.circular(15.0),
//                        ),
//                        child:
//                        Container(
//                          margin: EdgeInsets.only(left: 23,right: 23,top: 14,bottom: 14),
//                          child: Column(
//                            children: <Widget>[
//                              Container(child: Column(
//                                children: <Widget>[
//                                  Align(child: Text(FlightSearch_Model.flightList[index].options[5].value+" "+FlightSearch_Model.flightList[index].price.toString(),style: CustomStyles.cardContent,),alignment: Alignment.topRight,),
//                                  SizedBox(height: 14,),
//                                  Center(child: Text(model.getTimeDifference(FlightSearch_Model.flightList[index].duration.total),style: CustomStyles.calenderStyle,),),
//
//                                  Row(
//                                    mainAxisSize: MainAxisSize.max,
//
//                                    crossAxisAlignment: CrossAxisAlignment.center,
//                                    children: <Widget>[
//
//                                      Flexible(fit: FlexFit.loose,
//                                          child: Row(
//                                            mainAxisAlignment: MainAxisAlignment.start,
//                                            crossAxisAlignment: CrossAxisAlignment.center,
//                                            children: <Widget>[
//                                              Text(FlightSearch_Model.flightList[index].flyFrom,style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),
//                                              SizedBox(width: 30,),
//                                              Image.asset('assets/images/circular.png',height: 10,),
//
//                                              Flexible(
//
//                                                  child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                              ),
//
//                                            ],)
//                                      ),
//                                      Expanded(
//
//                                          child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                      ),
//                                      Flexible(fit: FlexFit.loose,
//                                          child: Row(
//                                            mainAxisAlignment: MainAxisAlignment.end,
//                                            crossAxisAlignment: CrossAxisAlignment.center,
//                                            children: <Widget>[
//                                              Flexible(
//
//                                                  child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                              ),
//                                              Image.asset('assets/images/path1.png',height: 15,),
//                                              SizedBox(width: 20,),
//                                              Text(FlightSearch_Model.flightList[index].flyTo,style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),
//
//
//
//                                            ],)
//                                      ),
//
//
//
//
//                                    ],),
//                                  SizedBox(height: 5,),
//                                  Row(
//
//                                    crossAxisAlignment: CrossAxisAlignment.center,
//                                    children: <Widget>[
//                                      Flexible(
//                                          fit: FlexFit.loose,
//                                          child: Row(children: <Widget>[
//                                            Image.asset('assets/images/morning.png',height: 13,),
//                                            SizedBox(width: 5,),
//                                            Text(model.getConvertedTime(FlightSearch_Model.flightList[index].onewayLocalDeparture),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),
//
//                                          ],)
//                                      ),
//                                      Flexible(
//                                          fit: FlexFit.tight,
//                                          child: Center(child: Text(
//                                            FlightSearch_Model.flightList[index].onewaystopsCount==0?
//                                            'Non-Stop' : (FlightSearch_Model.flightList[index].onewaystopsCount).toString()+" Stops"
//                                            ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
//                                      ),
//                                      Flexible(
//                                          fit: FlexFit.loose,
//                                          child: Row(mainAxisAlignment: MainAxisAlignment.end,
//                                            children: <Widget>[
//                                              Image.asset('assets/images/night.png',height: 13,),
//                                              SizedBox(width: 5,),
//                                              Text(model.getConvertedTime(FlightSearch_Model.flightList[index].onewayLocalArrival),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),
//
//                                            ],)
//                                      ),
//
//
//                                    ],),
//                                  SizedBox(height: 8,),
//                                  Row(
//
//                                    mainAxisAlignment: MainAxisAlignment.center,
//                                    crossAxisAlignment: CrossAxisAlignment.center,
//                                    children: <Widget>[
//                                      Flexible(
//                                          flex: 2,
//                                          fit: FlexFit.loose,
//                                          child: Text(model.getConvertedDate(FlightSearch_Model.flightList[index].onewayLocalDeparture),style: CustomStyles.calenderStyle,textAlign: TextAlign.center,)
//                                      ),
//                                      Flexible(
//                                        flex: 6,
//                                        fit: FlexFit.tight,
//                                        child:
//                                        //  SizedBox()
//                                        Row(
//                                          mainAxisAlignment: MainAxisAlignment.center,
//                                          crossAxisAlignment: CrossAxisAlignment.center,
//                                          children:
//                                          getAirLineImages(FlightSearch_Model.flightList[index])
//
//
//
//                                          ,),
//                                      ),
//
//
//                                      Flexible(
//                                          flex: 2,
//                                          fit: FlexFit.loose,
//                                          child: Text(model.getConvertedDate(FlightSearch_Model.flightList[index].onewayLocalArrival),style: CustomStyles.calenderStyle,textAlign: TextAlign.center,)
//                                      ),
//
//
//                                    ],),
//
//
//
//
//
//
//                                ],
//                              ),),
//
//
//
//
//
//                            ],
//                          ),
//                        )
//
//
//                    ),
//                      onTap: (){
//
//                      },
//
//
//                      )
//
//
//                        :
//
//                      GestureDetector(
//                        child:
//                        ClipPath(
//                          clipper: DolDurmaClipper(top: 127, holeRadius: 25,),
//                          child:
//                          Card(
//                              elevation: 3,
//                              margin: EdgeInsets.only(top: 10,),
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(15.0),
//                              ),
//                              child:
//                              Container(
//                                margin: EdgeInsets.only(left: 23,right: 23,top: 14,bottom: 14),
//                                child: Column(
//                                  children: <Widget>[
//                                    Container(child: Column(
//                                      children: <Widget>[
//
//                                        Align(child: Text(FlightSearch_Model.flightList[index].options[5].value+" "+FlightSearch_Model.flightList[index].price.toString(),style: CustomStyles.cardContent,),alignment: Alignment.topRight,),
//
//                                        SizedBox(height: 14,),
//
//                                        Center(child: Text(model.getTimeDifference(FlightSearch_Model.flightList[index].duration.departure),style: CustomStyles.calenderStyle,),),
//
//                                        Row(
//                                          mainAxisSize: MainAxisSize.max,
//
//                                          crossAxisAlignment: CrossAxisAlignment.center,
//                                          children: <Widget>[
//
//                                            Flexible(fit: FlexFit.loose,
//                                                child: Row(
//                                                  mainAxisAlignment: MainAxisAlignment.start,
//                                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Text('DOW',style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),
//                                                    SizedBox(width: 30,),
//                                                    Image.asset('assets/images/circular.png',height: 10,),
//
//                                                    Flexible(
//
//                                                        child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                                    ),
//
//                                                  ],)
//                                            ),
//                                            Expanded(
//
//                                                child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                            ),
//                                            Flexible(fit: FlexFit.loose,
//                                                child: Row(
//                                                  mainAxisAlignment: MainAxisAlignment.end,
//                                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Flexible(
//
//                                                        child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                                    ),
//                                                    Image.asset('assets/images/path1.png',height: 15,),
//                                                    SizedBox(width: 20,),
//                                                    Text('HYD',style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),
//
//
//
//                                                  ],)
//                                            ),
//
//
//
//
//                                          ],),
//                                        SizedBox(height: 5,),
//                                        Row(
//
//                                          crossAxisAlignment: CrossAxisAlignment.center,
//                                          children: <Widget>[
//                                            Flexible(
//                                                fit: FlexFit.loose,
//                                                child: Row(children: <Widget>[
//                                                  Image.asset('assets/images/morning.png',height: 13,),
//                                                  SizedBox(width: 5,),
//                                                  Text('06:00',style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),
//
//                                                ],)
//                                            ),
//                                            Flexible(
//                                                fit: FlexFit.tight,
//                                                child: Center(child: Text('Non-Stop',style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
//                                            ),
//                                            Flexible(
//                                                fit: FlexFit.loose,
//                                                child: Row(mainAxisAlignment: MainAxisAlignment.end,
//                                                  children: <Widget>[
//                                                    Image.asset('assets/images/night.png',height: 13,),
//                                                    SizedBox(width: 5,),
//                                                    Text('6:00',style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),
//
//                                                  ],)
//                                            ),
//
//
//                                          ],),
//                                        SizedBox(height: 8,),
//                                        Row(
//
//                                          crossAxisAlignment: CrossAxisAlignment.center,
//                                          children: <Widget>[
//                                            Expanded(flex: 2,
//                                                child: Text('24-AUG',style: CustomStyles.calenderStyle,)
//                                            ),
//
//                                            Expanded(flex: 2,
//                                                child: Text('24-AUG',style: CustomStyles.calenderStyle,textAlign: TextAlign.end,)
//                                            ),
//
//
//                                          ],),
//
//                                      ],
//                                    ),),
//
//                                    Container(margin: EdgeInsets.only(top: 15,bottom: 15),
//                                      child: MySeparator(color: CustomColors.TabDisabled,Horizontal: true,height: 1,),
//                                    ),
//
//                                    Container(child: Column(
//                                      children: <Widget>[
//                                        Row(
//                                          mainAxisAlignment: MainAxisAlignment.start,
//                                          crossAxisAlignment: CrossAxisAlignment.center,
//                                          children: <Widget>[
//                                            Image.asset('assets/images/flight_list_image1.png',height: 25,),
//                                            SizedBox(width: 10,),
//                                            Image.asset('assets/images/flight_list_image2.png',height: 25,),
//                                          ],),
//                                        SizedBox(height: 14,),
//
//                                        Center(child: Text(model.getTimeDifference(FlightSearch_Model.flightList[index].duration.departure),style: CustomStyles.calenderStyle,),),
//
//                                        Row(
//                                          mainAxisSize: MainAxisSize.max,
//
//                                          crossAxisAlignment: CrossAxisAlignment.center,
//                                          children: <Widget>[
//
//                                            Flexible(fit: FlexFit.loose,
//                                                child: Row(
//                                                  mainAxisAlignment: MainAxisAlignment.start,
//                                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Text('HYD',style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),
//                                                    SizedBox(width: 30,),
//                                                    Image.asset('assets/images/circular.png',height: 10,),
//
//                                                    Flexible(
//
//                                                        child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                                    ),
//
//                                                  ],)
//                                            ),
//                                            Expanded(
//
//                                                child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                            ),
//                                            Flexible(fit: FlexFit.loose,
//                                                child: Row(
//                                                  mainAxisAlignment: MainAxisAlignment.end,
//                                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                                  children: <Widget>[
//                                                    Flexible(
//
//                                                        child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                                    ),
//                                                    Image.asset('assets/images/path2.png',height: 15,),
//                                                    SizedBox(width: 20,),
//                                                    Text('DOW',style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),
//
//
//
//                                                  ],)
//                                            ),
//
//
//
//
//                                          ],),
//                                        SizedBox(height: 5,),
//                                        Row(
//
//                                          crossAxisAlignment: CrossAxisAlignment.center,
//                                          children: <Widget>[
//                                            Flexible(
//                                                fit: FlexFit.loose,
//                                                child: Row(children: <Widget>[
//                                                  Image.asset('assets/images/morning.png',height: 13,),
//                                                  SizedBox(width: 5,),
//                                                  Text('19:25',style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),
//
//                                                ],)
//                                            ),
//                                            Flexible(
//                                                fit: FlexFit.tight,
//                                                child: Center(child: Text('1 Stop (DEL)',style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
//                                            ),
//                                            Flexible(
//                                                fit: FlexFit.loose,
//                                                child: Row(mainAxisAlignment: MainAxisAlignment.end,
//                                                  children: <Widget>[
//                                                    Image.asset('assets/images/night.png',height: 13,),
//                                                    SizedBox(width: 5,),
//                                                    Text('6:00',style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),
//
//                                                  ],)
//                                            ),
//
//
//                                          ],),
//                                        SizedBox(height: 8,),
//                                        Row(
//
//                                          crossAxisAlignment: CrossAxisAlignment.center,
//                                          children: <Widget>[
//                                            Flexible(fit: FlexFit.tight,
//                                                child: Text(model.getConvertedDate(FlightSearch_Model.flightList[index].onewayLocalDeparture),style: CustomStyles.calenderStyle,)
//                                            ),
//                                            Flexible(
//                                                fit: FlexFit.tight,
//                                                child:
//                                                SizedBox()
////                                            Row(
////                                              mainAxisAlignment: MainAxisAlignment.center,
////                                              crossAxisAlignment: CrossAxisAlignment.center,
////                                              children: <Widget>[
////                                                Image.asset('assets/images/flight_list_image1.png',height: 25,),
////                                                SizedBox(width: 10,),
////                                                Image.asset('assets/images/flight_list_image2.png',height: 25,),
////                                              ],),
//                                            ),
//
//
//                                            Flexible(fit: FlexFit.tight,
//                                                child: Text(model.getConvertedDate(FlightSearch_Model.flightList[index].onewayLocalArrival),style: CustomStyles.calenderStyle,textAlign: TextAlign.end,)
//                                            ),
//
//
//                                          ],),
//
//                                      ],
//                                    ),)
//
//
//
//
//                                  ],
//                                ),
//                              )
//
//
//                          ),
//                        ),
//                        onTap: (){
//                        //  Navigator.pushNamed(context, Router.flightDetails);
//
//                        },
//                      );
//                  }),
//
//
//
//
//            )
//
//          ],
//        ),
//      )
//
//
//    ;
//  }
//
//  static double getHeight(GlobalKey<State<StatefulWidget>> key) {
//    final keyContext = key.currentContext;
//    final box = keyContext.findRenderObject() as RenderBox;
//    final pos = box.localToGlobal(Offset.zero);
//    return pos.dy/2;
//  }
//
//    getAirLineImages(FlightSearchResponseResultFlight flightList) {
//
//    List<Widget> AirlineImages = List();
//
//    List<String> codes  = [""];
//
//    for(int i = 0; i < flightList.route.length ;i++){
//
//
//
//        for(int j =0 ; j<flightList.airlinesMeta.length; j++ ){
//
//
//            if(flightList.route[i].airline==flightList.airlinesMeta[j].code){
//
//              if(codes.contains(flightList.airlinesMeta[j].code.toString())) {
//
//               print("Airline Already Exists");
//
//              } else {
//                AirlineImages.add(
//                    Container(child: Image.network(flightList.airlinesMeta[j].image128,height: 25,width: 25,),
//                      margin: EdgeInsets.only(left: 2,right: 2),
//                    )
//                );
//
//                codes.add(flightList.airlinesMeta[j].code.toString());
//              }
//
//          }
//            print(codes);
//            print(codes.contains(flightList.airlinesMeta[j].code.toString()));
//
//
//
//        }
//
//    }
//    return AirlineImages;
//
//  }
//
////  void getTimes(String onewayLocalArrival) {
////
////    print(onewayLocalArrival);
////
////    final parsedEntryTime = DateTime.parse(onewayLocalArrival).toUtc();
////
////    String time = parsedEntryTime.toLocal().toString();
////
////    final dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time, true).toLocal();
////
////    print("Converted  $dateTime");
////
////
////    final EntryTime = new DateFormat("dd-MMM").format(dateTime);
////
////    print("EntryTime $EntryTime");
////
////    final EntryTimes = new DateFormat("hh:mm").format(dateTime);
////
////    print("EntryTime $EntryTimes");
////
////
////
//////    2
//////    var different=date2.difference(date1);
//////
//////    print(different.inDays); // => 366
//////
////
////  }
//
//
//
//}
