import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/models/flights/check_availability_response_entity.dart';
import 'package:ota/models/flights/flight_search_response.dart';
import 'package:ota/models/flights/flight_search_response_entity.dart';
import 'package:ota/models/flights/data_model/pass_arguments.dart';
import 'package:ota/models/flights/search_flight_request.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/dolDumClipper.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/flight_results_model.dart';
import 'package:ota/viewmodels/flights_view_model/flightbookingModel.dart';
import 'package:ota/views/base/base_view.dart';
import 'package:ota/views/base/base_widget.dart';
import 'package:ota/views/bottom_sheets/FlightsFilter.dart';
import 'package:ota/views/tabs/priceLow_High.dart';
import 'package:provider/provider.dart';

class FlightResults extends StatefulWidget {
  SearchFlightsRequest requestData;

  FlightResults(this.requestData);
  @override
  _FlightResultsState createState() =>
      _FlightResultsState(requestData);
}

class _FlightResultsState
    extends State<FlightResults> {
  final GlobalKey<State> _keyLoader =
      new GlobalKey<State>();

  List<bool> isSelected = [true, false];

  SearchFlightsRequest requestData;

  _FlightResultsState(this.requestData);

  FlightResultsModel flightResultsModel;

  var height;

  var width;

  @override
  Widget build(BuildContext context) {
    height =
        MediaQuery.of(context).size.height / 10;

    width =
        MediaQuery.of(context).size.width / 10;

    return ChangeNotifierProvider<
        FlightResultsModel>(
      create: (context) => flightResultsModel =
          FlightResultsModel(requestData),
      child: Consumer<FlightResultsModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: CustomColors.White,
            appBar: AppBar(
              title: Text(
                'Flight Results',
                style: CustomStyles.appbar,
              ),
              leading: new IconButton(
                icon: new Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 13,
                ),
                onPressed: () =>
                    Navigator.of(context).pop(),
              ),
              actions: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.tune,
                          color:
                              CustomColors.White,
                          size: 20,
                        ),
                        // Icon(Icons.clear, color: Colors.white,size: 20,),
                        onPressed: () {
                          if (model.flightSearchResponse.result != null) if (model
                              .flightSearchResponse
                              .result
                              .flights
                              .isNotEmpty)
                            _showBottomSheet(
                                model, context);
                        },
                      ),
                      model.filterCount != 0
                          ? Positioned(
                              top: 2.0,
                              right: 4.0,
                              child:
                                  new Container(
                                alignment:
                                    Alignment
                                        .center,
                                padding:
                                    EdgeInsets
                                        .all(4),
                                decoration: BoxDecoration(
                                    color:
                                        CustomColors
                                            .Orange,
                                    shape: BoxShape
                                        .circle),
                                child: new Text(
                                  model
                                      .filterCount
                                      .toString(),
                                  style: new TextStyle(
                                      color: Colors
                                          .white,
                                      fontSize:
                                          11.0,
                                      fontWeight:
                                          FontWeight
                                              .w500),
                                ),
                              ))
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
              elevation: 0.0,
              backgroundColor:
                  CustomColors.BackGround,
            ),
            body: Container(
              height: MediaQuery.of(context)
                  .size
                  .height,
              child: model.loading
                  ? ShimmerContainer(
                      MediaQuery.of(context)
                          .size
                          .height)
                  : model.flightSearchResponse
                          .isError
                      ? Center(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets
                                    .only(
                                        top: 40),
                                child:
                                    Image.asset(
                                  'assets/images/flights.png',
                                  height: 150,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets
                                    .only(
                                        top: 40),
                                child: Text(
                                    'Something Went Wrong',
                                    textAlign:
                                        TextAlign
                                            .center,
                                    style: CustomStyles
                                        .medium20
                                        .copyWith(
                                            color:
                                                CustomColors.disabledButton)),
                              ),
                            ],
                          ),
                        )
                      : model
                              .flightSearchResponse
                              .result
                              .flights
                              .isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center,
                                children: <
                                    Widget>[
                                  Container(
                                    margin: EdgeInsets
                                        .only(
                                            top:
                                                40),
                                    child: Image
                                        .asset(
                                      'assets/images/flights.png',
                                      height: 150,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets
                                            .all(
                                                7.0),
                                    child: Text(
                                        'No Flights  Found',
                                        textAlign:
                                            TextAlign
                                                .center,
                                        style: CustomStyles
                                            .medium20
                                            .copyWith(
                                                color: CustomColors.Orange)),
                                  ),
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                mainAxisSize:
                                    MainAxisSize
                                        .min,
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .start,
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,
                                children: <
                                    Widget>[
                                  Container(
                                    //height: MediaQuery.of(context).size.height*.17,
                                    width: double
                                        .infinity,
                                    margin: EdgeInsets
                                        .only(
                                            left:
                                                22,
                                            right:
                                                22,
                                            top:
                                                10),

                                    child: Column(
                                      children: <
                                          Widget>[
                                        Row(
                                          mainAxisSize:
                                              MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <
                                              Widget>[
                                            Expanded(
                                              flex:
                                                  8,
                                              child:
                                                  Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        model.requestData.flyFrom,
                                                        style: CustomStyles.heading,
                                                      ),
                                                      Icon(
                                                        Icons.swap_horiz,
                                                        color: CustomColors.heading,
                                                      ),
                                                      Text(
                                                        model.requestData.flyTo,
                                                        style: CustomStyles.heading,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Wrap(
                                                    spacing: 1.2,
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.center,
                                                    alignment: WrapAlignment.start,
                                                    direction: Axis.horizontal,

                                                    //  crossAxisAlignment: WrapCrossAlignment.start,

                                                    children: <Widget>[
                                                      Text(model.requestData.oneway ? model.requestData.monthFrom + " | " : model.requestData.monthFrom + " - " + model.requestData.monthTo + " | ", style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))),
//                                  Text(" | ",style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))),
                                                      Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          model.requestData.adults != 0 ? Text('Adult ${model.requestData.adults} | ', style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))) : SizedBox.shrink(),
                                                          model.requestData.children != 0 ? Text('Children ${model.requestData.children} | ', style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))) : SizedBox.shrink(),
                                                          model.requestData.infants != 0 ? Text('Infants ${model.requestData.infants} | ', style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))) : SizedBox.shrink(),
                                                        ],
                                                      ),
                                                      Text(
                                                        model.requestData.cabinSelection_name,
                                                        style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex:
                                                  2,
                                              child:
                                                  SizedBox(
                                                height: 24,
                                                child: RaisedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  color: CustomColors.Orange,
                                                  child: Text(
                                                    'EDIT',
                                                    style: CustomStyles.calenderStyle.copyWith(color: CustomColors.White, fontSize: 11),
                                                  ),
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top:
                                                    10,
                                                bottom:
                                                    10),
                                            child:
                                                MySeparator(
                                              color:
                                                  CustomColors.TabDisabled,
                                              height:
                                                  1,
                                              Horizontal:
                                                  true,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            .8,
                                        margin: EdgeInsets
                                            .only(
                                          top: SizeConstants
                                              .SIZE_20,
                                        ),
                                        decoration:
                                            BoxDecoration(
                                          color: CustomColors
                                              .BackGround,
                                          borderRadius: BorderRadius.only(
                                              topRight:
                                                  Radius.circular(25),
                                              topLeft: Radius.circular(25)),
                                        ),
                                        child:
                                            Container(
                                          margin: EdgeInsets.only(
                                              top:
                                                  10),
                                          child:
                                              Column(
                                            children: <
                                                Widget>[
                                              Container(
                                                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Container(
                                                          margin: EdgeInsets.only(bottom: 10),
                                                          child: Text(
                                                            'Price :',
                                                            style: CustomStyles.button_style.copyWith(fontSize: 13),
                                                            textAlign: TextAlign.center,
                                                          )),
                                                      flex: 1,
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Column(
                                                        children: <Widget>[
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: <Widget>[
                                                              Expanded(
                                                                  child: GestureDetector(
                                                                child: Text(
                                                                  'Low-High',
                                                                  style: model.Price_Filter == false ? CustomStyles.button_style.copyWith(fontSize: 13) : CustomStyles.button_style.copyWith(fontSize: 13, color: CustomColors.White.withOpacity(.5)),
                                                                  textAlign: TextAlign.center,
                                                                ),
                                                                onTap: () {
                                                                  model.changePriceFilterType();
                                                                },
                                                              )),
                                                              Expanded(
                                                                  child: GestureDetector(
                                                                child: Text(
                                                                  'High-Low',
                                                                  style: model.Price_Filter ? CustomStyles.button_style.copyWith(fontSize: 13) : CustomStyles.button_style.copyWith(fontSize: 13, color: CustomColors.White.withOpacity(.5)),
                                                                  textAlign: TextAlign.center,
                                                                ),
                                                                onTap: () {
                                                                  model.changePriceFilterType();
                                                                },
                                                              )),
                                                            ],
                                                          ),
                                                          AnimatedContainer(
                                                            margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                                                            duration: Duration(microseconds: 700),
                                                            alignment: !model.Price_Filter ? Alignment.bottomLeft : Alignment.bottomRight,
                                                            child: Container(
                                                              height: 2,
                                                              width: 30,
                                                              color: CustomColors.White,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: SizedBox(),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: MediaQuery.of(context).size.height * .7,
                                                margin: EdgeInsets.only(left: width * .4, right: width * .4, top: 10),
                                                child: model.flightSearchResponse.result.flights.length == 0
                                                    ? Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: <Widget>[
                                                          Container(
                                                            margin: EdgeInsets.only(top: 40),
                                                            child: Image.asset(
                                                              'assets/images/flights.png',
                                                              height: 150,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.all(7.0),
                                                            child: Text('Flights Not Found', textAlign: TextAlign.center, style: CustomStyles.medium20.copyWith(color: CustomColors.White)),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: <Widget>[
                                                                FlatButton(
                                                                  color: CustomColors.Orange,
                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: CustomColors.Orange, width: 2)),
                                                                  // color: Colors.blue,
                                                                  onPressed: () async {
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Text('Back to Search', style: CustomStyles.normal16.copyWith(color: CustomColors.White)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : model.flightList.length == 0
                                                        ? Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: <Widget>[
                                                              Container(
                                                                margin: EdgeInsets.only(top: 40),
                                                                child: Image.asset(
                                                                  'assets/images/flights.png',
                                                                  height: 150,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.all(7.0),
                                                                child: Text('Flights Not Found', textAlign: TextAlign.center, style: CustomStyles.medium20.copyWith(color: CustomColors.White)),
                                                              ),
                                                            ],
                                                          )
                                                        : ListView.builder(
                                                            //physics: NeverScrollableScrollPhysics(),

                                                            primary: false,
                                                            shrinkWrap: true,
                                                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .12),
                                                            itemCount: model.flightList.length, // records.length
                                                            itemBuilder: (BuildContext context, int index) {
                                                              List<FlightSearchResponseRoute> destination = List();
                                                              List<FlightSearchResponseRoute> return_ = List();

                                                              if (model.requestData.oneway) {
                                                                model.sortPrices();
                                                              } else {
                                                                model.sortPrices();

                                                                for (int i = 0; i < model.flightList[index].route.length; i++) {
                                                                  if (model.flightList[index].route[i].return__ == 0) {
                                                                    destination.add(model.flightList[index].route[i]);
                                                                  } else {
                                                                    return_.add(model.flightList[index].route[i]);

                                                                    for (int i = 0; i < return_.length; i++) {
                                                                      print(return_[i].flyTo);
                                                                    }
                                                                  }
                                                                  print("Segregating");
                                                                }
                                                              }

//                                model.FlightResults_Count = model.flightList.length;

                                                              model.updateFlightCount(model.flightList.length);

                                                              return model.requestData.flightType == "oneway"
                                                                  ? GestureDetector(
                                                                      child: Card(
                                                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                          elevation: 3,
                                                                          margin: EdgeInsets.only(
                                                                            top: 10,
                                                                          ),
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                          ),
                                                                          child: Column(
                                                                            children: <Widget>[
                                                                              Container(
                                                                                margin: EdgeInsets.only(left: width * .4, right: width * .4, top: 14, bottom: 14),
                                                                                child: Column(
                                                                                  children: <Widget>[
                                                                                    Container(
                                                                                      child: Column(
                                                                                        children: <Widget>[
                                                                                          Center(
                                                                                            child: Text(
                                                                                              model.getTimeDifferenceByDate(model.flightList[index].route.first.localDeparture, model.flightList[index].route.first.localArrival)

                                                                                              //model.getTimeDifference(model.flightList[index].duration.total)
                                                                                              ,
                                                                                              style: CustomStyles.calenderStyle,
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: <Widget>[
                                                                                              Flexible(
                                                                                                  fit: FlexFit.tight,
                                                                                                  flex: 2,
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: <Widget>[
                                                                                                      Text(
                                                                                                        model.flightList[index].flyFrom,
                                                                                                        style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),
                                                                                                      ),
                                                                                                      Image.asset(
                                                                                                        'assets/images/circular.png',
                                                                                                        height: 10,
                                                                                                      ),
                                                                                                    ],
                                                                                                  )),
                                                                                              Flexible(
                                                                                                  flex: 5,
                                                                                                  fit: FlexFit.tight,
                                                                                                  child: Stack(
                                                                                                    alignment: Alignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                        children: List<Widget>.generate(
                                                                                                            model.flightList[index].onewaystopsCount,
                                                                                                            (i) => Image.asset(
                                                                                                                  'assets/images/circular.png',
                                                                                                                  height: 10,
                                                                                                                )),
                                                                                                      ),
                                                                                                      MySeparator(
                                                                                                        height: 1,
                                                                                                        color: CustomColors.TabDisabled,
                                                                                                        Horizontal: true,
                                                                                                      ),
                                                                                                    ],
                                                                                                  )),
                                                                                              Flexible(
                                                                                                  fit: FlexFit.tight,
                                                                                                  flex: 2,
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: <Widget>[
                                                                                                      Image.asset(
                                                                                                        'assets/images/path1.png',
                                                                                                        height: 15,
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        width: 20,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        model.flightList[index].flyTo,
                                                                                                        style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),
                                                                                                      ),
                                                                                                    ],
                                                                                                  )),
                                                                                            ],
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: 5,
                                                                                          ),
                                                                                          Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: <Widget>[
                                                                                              Flexible(
                                                                                                  fit: FlexFit.loose,
                                                                                                  child: Row(
                                                                                                    children: <Widget>[
                                                                                                      Image.asset(
                                                                                                        'assets/images/morning.png',
                                                                                                        height: 13,
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        width: 5,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        model.getConvertedTime(model.flightList[index].onewayLocalDeparture),
                                                                                                        style: CustomStyles.calenderStyle.copyWith(fontSize: 12, color: CustomColors.heading),
                                                                                                      ),
                                                                                                    ],
                                                                                                  )),
                                                                                              Flexible(
                                                                                                  fit: FlexFit.tight,
                                                                                                  child: Center(
                                                                                                      child: Text(
                                                                                                    model.flightList[index].onewaystopsCount == 0 ? 'Non-Stop' : (model.flightList[index].onewaystopsCount).toString() + " Stops",
                                                                                                    style: CustomStyles.calenderStyle,
                                                                                                    textAlign: TextAlign.center,
                                                                                                  ))),
                                                                                              Flexible(
                                                                                                  fit: FlexFit.loose,
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                    children: <Widget>[
                                                                                                      Image.asset(
                                                                                                        'assets/images/night.png',
                                                                                                        height: 13,
                                                                                                      ),
                                                                                                      SizedBox(
                                                                                                        width: 5,
                                                                                                      ),
                                                                                                      Text(
                                                                                                        model.getConvertedTime(model.flightList[index].onewayLocalArrival),
                                                                                                        style: CustomStyles.calenderStyle.copyWith(fontSize: 12, color: CustomColors.heading),
                                                                                                      ),
                                                                                                    ],
                                                                                                  )),
                                                                                            ],
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: 8,
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: <Widget>[
                                                                                              Flexible(
                                                                                                  flex: 2,
                                                                                                  fit: FlexFit.tight,
                                                                                                  child: Text(
                                                                                                    model.getConvertedDate(model.flightList[index].onewayLocalDeparture),
                                                                                                    style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading),
                                                                                                    textAlign: TextAlign.start,
                                                                                                  )),
                                                                                              Flexible(
                                                                                                flex: 5,
                                                                                                fit: FlexFit.tight,
                                                                                                child:
                                                                                                    //  SizedBox()
                                                                                                    Row(
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: model.getAirLineImages(model.flightList[index]),
                                                                                                ),
                                                                                              ),
                                                                                              Flexible(
                                                                                                  flex: 2,
                                                                                                  fit: FlexFit.tight,
                                                                                                  child: Text(
                                                                                                    model.getConvertedDate(model.flightList[index].onewayLocalArrival),
                                                                                                    style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading),
                                                                                                    textAlign: TextAlign.end,
                                                                                                  )),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                height: 40,
                                                                                alignment: Alignment.center,
                                                                                width: MediaQuery.of(context).size.width,
                                                                                color: CustomColors.Orange,
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text(
                                                                                      model.flightList[index].displayRateInfoWithMarkup.currency + " ",
                                                                                      style: CustomStyles.cardContent.copyWith(color: CustomColors.White),
                                                                                    ),
                                                                                    Text(model.formatNumber(model.flightList[index].displayRateInfoWithMarkup.totalPriceWithMarkup.roundToDouble().toString()) + ".00", style: CustomStyles.cardContent.copyWith(color: CustomColors.White))
                                                                                  ],
                                                                                ),
                                                                              )
                                                                            ],
                                                                          )),
                                                                      onTap: () async {
                                                                        Dialogs.showLoadingDialog(context, _keyLoader);
                                                                        model.checkFlightAvailability(model.flightList[index]).then((value) {
                                                                          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

                                                                          if (value.result.flightsChecked && !value.result.flightsInvalid) {
                                                                            model.selectedList = [];

                                                                            model.currency = value.result.displayRateInfoWithMarkup.currency;

                                                                            model.selectedList.add(model.flightList[index]);
                                                                            print(model.selectedList);

                                                                            model.options = value.result.options;
                                                                            model.tpa = value.result.tpa;

                                                                            model.fXRate = double.parse(value.result.options[6].value);

                                                                            model.taxAndOtherCharges = value.result.displayRateInfoWithMarkup.taxAndOtherCharges * model.fXRate;

                                                                            model.baseRate = value.result.displayRateInfoWithMarkup.baseRate * model.fXRate;

                                                                            model.totalPriceWithMarkup = value.result.displayRateInfoWithMarkup.totalPriceWithMarkup * model.fXRate;

                                                                            Navigator.pushNamed(context, Routes.flightDetails, arguments: model.getArguments());

                                                                            print("Available");
                                                                          } else {
                                                                            print("Not Available");
                                                                            showUnavailableDialog(context);
                                                                          }
                                                                        });
                                                                      },
                                                                    )
                                                                  : GestureDetector(
                                                                      child: ClipPath(
                                                                        clipper: DolDurmaClipper(
                                                                          top: 140,
                                                                          holeRadius: 25,
                                                                        ),
                                                                        child: Card(
                                                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                            elevation: 3,
                                                                            margin: EdgeInsets.only(
                                                                              top: 10,
                                                                            ),
                                                                            shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                            ),
                                                                            child: Column(
                                                                              children: <Widget>[
                                                                                Container(
                                                                                  margin: EdgeInsets.only(left: width * .3, right: width * .3, top: 14, bottom: 14),
                                                                                  child: Column(
                                                                                    children: <Widget>[
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: <Widget>[
                                                                                            Center(
                                                                                              child: Text(
                                                                                                model.getTimeDifferenceByDate(destination[0].localDeparture, destination.last.localArrival),
                                                                                                style: CustomStyles.calenderStyle,
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: <Widget>[
                                                                                                Flexible(
                                                                                                    flex: 2,
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: <Widget>[
                                                                                                        Text(
                                                                                                          destination[0].flyFrom,
                                                                                                          style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),
                                                                                                        ),

                                                                                                        Image.asset(
                                                                                                          'assets/images/circular.png',
                                                                                                          height: 10,
                                                                                                        ),

//                                                                      Flexible(
//
//                                                                          child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                                                      ),
                                                                                                      ],
                                                                                                    )),
                                                                                                Flexible(
                                                                                                    flex: 5,
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Stack(
                                                                                                      alignment: Alignment.center,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                          children: List<Widget>.generate(
                                                                                                              model.flightList[index].onewaystopsCount,
                                                                                                              (i) => Image.asset(
                                                                                                                    'assets/images/circular.png',
                                                                                                                    height: 10,
                                                                                                                  )),
                                                                                                        ),
                                                                                                        MySeparator(
                                                                                                          height: 1,
                                                                                                          color: CustomColors.TabDisabled,
                                                                                                          Horizontal: true,
                                                                                                        ),
                                                                                                      ],
                                                                                                    )),
                                                                                                Flexible(
                                                                                                    flex: 2,
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: <Widget>[
//                                                                      Flexible(
//
//                                                                          child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                                                      ),
                                                                                                        Image.asset(
                                                                                                          'assets/images/path1.png',
                                                                                                          height: 15,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          destination.last.flyTo,
                                                                                                          style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),
                                                                                                        ),
                                                                                                      ],
                                                                                                    )),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 5,
                                                                                            ),
                                                                                            Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: <Widget>[
                                                                                                Flexible(
                                                                                                    fit: FlexFit.loose,
                                                                                                    child: Row(
                                                                                                      children: <Widget>[
                                                                                                        Image.asset(
                                                                                                          'assets/images/morning.png',
                                                                                                          height: 13,
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          width: 5,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          model.getConvertedTime(destination[0].localDeparture),
                                                                                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12, color: CustomColors.heading),
                                                                                                        ),
                                                                                                      ],
                                                                                                    )),
                                                                                                Flexible(
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Center(
                                                                                                        child: Text(
                                                                                                      model.flightList[index].onewaystopsCount == 0 ? 'Non-Stop' : (model.flightList[index].onewaystopsCount).toString() + " Stops",
                                                                                                      style: CustomStyles.calenderStyle,
                                                                                                      textAlign: TextAlign.center,
                                                                                                    ))),
                                                                                                Flexible(
                                                                                                    fit: FlexFit.loose,
                                                                                                    child: Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: <Widget>[
                                                                                                        Image.asset(
                                                                                                          'assets/images/night.png',
                                                                                                          height: 13,
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          width: 5,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          model.getConvertedTime(destination.last.localArrival),
                                                                                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12, color: CustomColors.heading),
                                                                                                        ),
                                                                                                      ],
                                                                                                    )),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 8,
                                                                                            ),
                                                                                            Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: <Widget>[
                                                                                                Flexible(
                                                                                                    flex: 2,
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Text(
                                                                                                      model.getConvertedDate(destination[0].localDeparture),
                                                                                                      style: CustomStyles.calenderStyle,
                                                                                                    )),
                                                                                                Flexible(
                                                                                                  flex: 5,
                                                                                                  fit: FlexFit.tight,
                                                                                                  child:
//                                                                  SizedBox()
                                                                                                      Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: model.getAirLineImagesRound(destination, model.flightList[index], 0),
                                                                                                  ),
                                                                                                ),
                                                                                                Flexible(
                                                                                                    flex: 2,
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Text(
                                                                                                      model.getConvertedDate(destination.last.localArrival),
                                                                                                      style: CustomStyles.calenderStyle,
                                                                                                      textAlign: TextAlign.end,
                                                                                                    )),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.only(top: 15, bottom: 15),
                                                                                        child: MySeparator(
                                                                                          color: CustomColors.TabDisabled,
                                                                                          Horizontal: true,
                                                                                          height: 1,
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: <Widget>[
                                                                                            Center(
                                                                                              child: Text(
                                                                                                model.getTimeDifferenceByDate(return_[0].localDeparture, return_.last.localArrival),
                                                                                                style: CustomStyles.calenderStyle,
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: <Widget>[
                                                                                                Flexible(
                                                                                                    flex: 2,
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: <Widget>[
                                                                                                        Text(
                                                                                                          return_[0].flyFrom,
                                                                                                          style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),
                                                                                                          textAlign: TextAlign.start,
                                                                                                        ),
//                                                                      SizedBox(width: 30,),
                                                                                                        Image.asset(
                                                                                                          'assets/images/circular.png',
                                                                                                          height: 10,
                                                                                                        ),

//                                                                      Flexible(
//                                                                          child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                                                      ),
                                                                                                      ],
                                                                                                    )),
                                                                                                Flexible(
                                                                                                    flex: 5,
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Stack(
                                                                                                      alignment: Alignment.center,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                          children: List<Widget>.generate(
                                                                                                              model.flightList[index].returnwaystopsCount,
                                                                                                              (i) => Image.asset(
                                                                                                                    'assets/images/circular.png',
                                                                                                                    height: 10,
                                                                                                                  )),
                                                                                                        ),
                                                                                                        MySeparator(
                                                                                                          height: 1,
                                                                                                          color: CustomColors.TabDisabled,
                                                                                                          Horizontal: true,
                                                                                                        ),
                                                                                                      ],
                                                                                                    )),
                                                                                                Flexible(
                                                                                                    flex: 2,
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: <Widget>[
//                                                                      Flexible(
//
//                                                                          child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
//                                                                      ),
                                                                                                        Image.asset(
                                                                                                          'assets/images/path2.png',
                                                                                                          height: 15,
                                                                                                        ),
                                                                                                        //SizedBox(width: 20,),
                                                                                                        Text(
                                                                                                          return_.last.flyTo,
                                                                                                          style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),
                                                                                                          textAlign: TextAlign.end,
                                                                                                        ),
                                                                                                      ],
                                                                                                    )),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 5,
                                                                                            ),
                                                                                            Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: <Widget>[
                                                                                                Flexible(
                                                                                                    fit: FlexFit.loose,
                                                                                                    child: Row(
                                                                                                      children: <Widget>[
                                                                                                        Image.asset(
                                                                                                          'assets/images/morning.png',
                                                                                                          height: 13,
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          width: 5,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          model.getConvertedTime(return_[0].localDeparture),
                                                                                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12, color: CustomColors.heading),
                                                                                                        ),
                                                                                                      ],
                                                                                                    )),
                                                                                                Flexible(
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Center(
                                                                                                        child: Text(
                                                                                                      model.flightList[index].returnwaystopsCount == 0 ? 'Non-Stop' : (model.flightList[index].returnwaystopsCount).toString() + " Stops",
                                                                                                      style: CustomStyles.calenderStyle,
                                                                                                      textAlign: TextAlign.center,
                                                                                                    ))),
                                                                                                Flexible(
                                                                                                    fit: FlexFit.loose,
                                                                                                    child: Row(
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: <Widget>[
                                                                                                        Image.asset(
                                                                                                          'assets/images/night.png',
                                                                                                          height: 13,
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          width: 5,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          model.getConvertedTime(return_.last.localArrival),
                                                                                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12, color: CustomColors.heading),
                                                                                                        ),
                                                                                                      ],
                                                                                                    )),
                                                                                              ],
                                                                                            ),
                                                                                            SizedBox(
                                                                                              height: 8,
                                                                                            ),
                                                                                            Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: <Widget>[
                                                                                                Flexible(
                                                                                                    flex: 2,
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Text(
                                                                                                      model.getConvertedDate(return_[0].localDeparture),
                                                                                                      style: CustomStyles.calenderStyle,
                                                                                                    )),
                                                                                                Flexible(
                                                                                                  flex: 5,
                                                                                                  fit: FlexFit.tight,
                                                                                                  child:
//                                                                  SizedBox()
                                                                                                      Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: model.getAirLineImagesRound(return_, model.flightList[index], 1),
                                                                                                  ),
                                                                                                ),
                                                                                                Flexible(
                                                                                                    flex: 2,
                                                                                                    fit: FlexFit.tight,
                                                                                                    child: Text(
                                                                                                      model.getConvertedDate(return_.last.localArrival),
                                                                                                      style: CustomStyles.calenderStyle,
                                                                                                      textAlign: TextAlign.end,
                                                                                                    )),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  height: 40,
                                                                                  alignment: Alignment.center,
                                                                                  width: MediaQuery.of(context).size.width,
                                                                                  color: CustomColors.Orange,
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: <Widget>[
                                                                                      Text(
                                                                                        model.flightList[index].displayRateInfoWithMarkup.currency + " ",
                                                                                        style: CustomStyles.cardContent.copyWith(color: CustomColors.White),
                                                                                      ),
                                                                                      Text(model.formatNumber(model.flightList[index].displayRateInfoWithMarkup.totalPriceWithMarkup.roundToDouble().toString()) + ".00", style: CustomStyles.cardContent.copyWith(color: CustomColors.White))
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            )),
                                                                      ),
                                                                      onTap: () {
                                                                        Dialogs.showLoadingDialog(context, _keyLoader);

                                                                        model.checkFlightAvailability(model.flightList[index]).then((value) {
                                                                          Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

                                                                          if (value.result.flightsChecked && !value.result.flightsInvalid) {
                                                                            model.selectedList = [];

                                                                            model.selectedList.add(model.flightList[index]);

                                                                            model.currency = value.result.displayRateInfoWithMarkup.currency;

                                                                            model.options = value.result.options;
                                                                            model.tpa = value.result.tpa;
                                                                            model.fXRate = double.parse(value.result.options[6].value);
                                                                            model.taxAndOtherCharges = value.result.displayRateInfoWithMarkup.taxAndOtherCharges;
                                                                            model.baseRate = value.result.displayRateInfoWithMarkup.baseRate;
                                                                            model.totalPriceWithMarkup = value.result.displayRateInfoWithMarkup.totalPriceWithMarkup * model.fXRate;

                                                                            Navigator.pushNamed(context, Routes.flightDetails, arguments: model.getArguments());

                                                                            print("Available");
                                                                          } else {
                                                                            print("Not Available");
                                                                            showUnavailableDialog(context);
                                                                          }
                                                                        });
                                                                      },
                                                                    );
                                                            }),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        width: 45,
                                        height:
                                            45,
                                        right: SizeConstants
                                            .SIZE_8,
                                        child: Container(
                                            decoration: BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.25),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ], border: Border.all(width: 2, color: Colors.white, style: BorderStyle.solid), color: CustomColors.Orange, shape: BoxShape.circle),
                                            alignment: Alignment.center,
                                            child: Text(model.flightList.length.toString(), style: CustomStyles.button_style.copyWith(fontSize: 13))),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
            ),
          );
        },
      ),
    );
  }

  void _showBottomSheet(FlightResultsModel model, BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0)),
        ),
        builder: (builder) {
          return Container(
            padding: EdgeInsets.only(
                left: 20, right: 27, top: 22),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.start,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: <Widget>[
                      Text(
                        strings
                            .filter_destination,
                        style: CustomStyles.appbar
                            .copyWith(
                                color:
                                    CustomColors
                                        .heading),
                      ),
                      IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            Navigator.of(context)
                                .pop();
                          })
                    ],
                  ),
                  FlightsFilter(model, context)
                ],
              ),
            ),
          );
        });
  }

  void showUnavailableDialog(
      BuildContext context) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 270.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/flights.png',
                height: 150,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7.0),
              child: Text('Flight Unavailable',
                  textAlign: TextAlign.center,
                  style: CustomStyles.normal20),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    color: CustomColors.Orange,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                15.0),
                        side: BorderSide(
                            color: CustomColors
                                .Orange,
                            width: 2)),
                    // color: Colors.blue,
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: Text('OK',
                        style: CustomStyles
                            .normal16
                            .copyWith(
                                color:
                                    CustomColors
                                        .White)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            simpleDialog);
  }
}
