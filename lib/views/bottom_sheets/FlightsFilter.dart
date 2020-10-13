import 'package:flutter/material.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/flight_results_model.dart';
import 'package:ota/viewmodels/flights_view_model/flightbookingModel.dart';
import 'package:provider/provider.dart';

class FlightsFilter extends StatefulWidget {
  FlightResultsModel model;
  BuildContext context;

  FlightsFilter(this.model, this.context);

  @override
  _FlightsFilterState createState() => _FlightsFilterState(model, context);
}

class _FlightsFilterState extends State<FlightsFilter> {
  List<bool> isSelected = [true, false];
  String stops;

  String stop_selection;

  BuildContext context;
  FlightResultsModel model;

  _FlightsFilterState(this.model, this.context);

  @override
  Widget build(context) {
    return ChangeNotifierProvider<FlightResultsModel>.value(
        value: model,
        child: Consumer<FlightResultsModel>(
            builder: (context, model, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Visibility(
                visible: !model.requestData.oneway,
                    child: Container(
                height: 40,
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                    child: GestureDetector(
                                      child: Container(
                                        height: 30,
                                        child: Text(
                                          'Destination',
                                          style: model.Filter_Destination
                                              ? CustomStyles.button_style
                                              .copyWith(
                                              fontSize: 13,
                                              color: CustomColors
                                                  .BackGround)
                                              : CustomStyles.button_style
                                              .copyWith(
                                              fontSize: 13,
                                              color: CustomColors
                                                  .disabledButton),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      onTap: () {
                                        model.changeFilterType();
                                      },
                                    )),
                                Expanded(
                                    child: GestureDetector(
                                      child: Container(
                                        height: 30,
                                        child: Text(
                                          'Return',
                                          style: !model.Filter_Destination
                                              ? CustomStyles.button_style
                                              .copyWith(
                                              fontSize: 13,
                                              color: CustomColors
                                                  .BackGround)
                                              : CustomStyles.button_style
                                              .copyWith(
                                              fontSize: 13,
                                              color: CustomColors
                                                  .disabledButton),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      onTap: () {
                                        model.changeFilterType();
                                      },
                                    ))
                              ],
                            ),
                            AnimatedContainer(
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, top: 5),
                              duration: Duration(microseconds: 700),
                              alignment: model.Filter_Destination
                                  ? Alignment.bottomLeft
                                  : Alignment.bottomRight,
                              child: Container(
                                height: 2,
                                width: 100,
                                color: CustomColors.BackGround,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                ),
              ),
                  ),

              !model.requestData.oneway
                  ? SizedBox(height: 20)
                  : SizedBox.shrink(),

              model.Filter_Destination
                  ? (Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    strings.departure_time,
                    style: CustomStyles.medium14.copyWith(
                        color: CustomColors.heading.withOpacity(.5)),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/morning.png',
                                height: 20,
                                width: 20,
                                color: model.departure_timing_value ==
                                    strings.time_00_06
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_00_06,
                                style: model.departure_timing_value ==
                                    strings.time_00_06
                                    ? CustomStyles.normal12.copyWith(
                                    color: CustomColors.White,)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.departure_timing_value ==
                                  strings.time_00_06
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: model.departure_timing_value ==
                                      strings.time_00_06
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.changeDepartureTiming(strings.time_00_06);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all( 3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/afternoon.png',
                                height: 20,
                                width: 20,
                                color: model.departure_timing_value ==
                                    strings.time_06_12
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_06_12,
                                style: model.departure_timing_value ==
                                    strings.time_06_12
                                    ?  CustomStyles.normal12.copyWith(
                                    color: CustomColors.White,)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.departure_timing_value ==
                                  strings.time_06_12
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: model.departure_timing_value ==
                                      strings.time_06_12
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.changeDepartureTiming(strings.time_06_12);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all( 3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/evening.png',
                                height: 20,
                                width: 20,
                                color: model.departure_timing_value ==
                                    strings.time_12_18
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_12_18,
                                style: model.departure_timing_value ==
                                    strings.time_12_18
                                    ?  CustomStyles.normal12.copyWith(
                                    color: CustomColors.White)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.departure_timing_value ==
                                  strings.time_12_18
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: model.departure_timing_value ==
                                      strings.time_12_18
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.changeDepartureTiming(strings.time_12_18);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/night.png',
                                height: 20,
                                width: 20,
                                color: model.departure_timing_value ==
                                    strings.time_18_00
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "18-00",
                                style: model.departure_timing_value ==
                                    strings.time_18_00
                                    ?  CustomStyles.normal12.copyWith(
                                    color: CustomColors.White,)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.departure_timing_value ==
                                  strings.time_18_00
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: model.departure_timing_value ==
                                      strings.time_18_00
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.changeDepartureTiming(strings.time_18_00);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    strings.arrival_time,
                    style: CustomStyles.medium14.copyWith(
                        color: CustomColors.heading.withOpacity(.5)),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all( 3),

                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/morning.png',
                                height: 20,
                                width: 20,
                                color: model.arrival_timing_value ==
                                    strings.time_00_06
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_00_06,
                                style: model.arrival_timing_value ==
                                    strings.time_00_06
                                    ?  CustomStyles.normal12.copyWith(
                                    color: CustomColors.White)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.arrival_timing_value ==
                                  strings.time_00_06
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: model.arrival_timing_value ==
                                      strings.time_00_06
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.changeArrivalTiming(strings.time_00_06);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/afternoon.png',
                                height: 20,
                                width: 20,
                                color: model.arrival_timing_value ==
                                    strings.time_06_12
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_06_12,
                                style: model.arrival_timing_value ==
                                    strings.time_06_12
                                    ?  CustomStyles.normal12.copyWith(
                                    color: CustomColors.White,)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.arrival_timing_value ==
                                  strings.time_06_12
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: model.arrival_timing_value ==
                                      strings.time_06_12
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.changeArrivalTiming(strings.time_06_12);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/evening.png',
                                height: 20,
                                width: 20,
                                color: model.arrival_timing_value ==
                                    strings.time_12_18
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_12_18,
                                style: model.arrival_timing_value ==
                                    strings.time_12_18
                                    ?  CustomStyles.normal12.copyWith(
                                    color: CustomColors.White,)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.arrival_timing_value ==
                                  strings.time_12_18
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: model.arrival_timing_value ==
                                      strings.time_12_18
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.changeArrivalTiming(strings.time_12_18);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/night.png',
                                height: 20,
                                width: 20,
                                color: model.arrival_timing_value ==
                                    strings.time_18_00
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_18_00,
                                style: model.arrival_timing_value ==
                                    strings.time_18_00
                                    ?  CustomStyles.normal12.copyWith(
                                    color: CustomColors.White,)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.arrival_timing_value ==
                                  strings.time_18_00
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: model.arrival_timing_value ==
                                      strings.time_18_00
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.changeArrivalTiming(strings.time_18_00);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    strings.stops,
                    style: CustomStyles.medium14.copyWith(
                        color: CustomColors.heading.withOpacity(.5)),
                  ),
                  SizedBox(height: 5),
                  Theme(
                    data: ThemeData(
                      backgroundColor: Colors.grey,
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child:

//                        Row(
//                          children: <Widget>[
//                            Radio(
//                              activeColor: CustomColors.BackGround,
//                              value: 'zero',
//                              groupValue: model.Return_StopFilterValue,
//                              onChanged: model.changeReturnStopSelection,
//                            ),
//                            Text(
//                              "Non-Stop",
//                              style: CustomStyles.calenderStyle,
//                            ),
//                          ],
//                        )

                          checkbox("Non-Stop", model.nonStopFilter, 'zero')
                          ,
                          flex: 1,
                        ),
                        Expanded(
                          child:
//                        Row(
//                          children: <Widget>[
//                            Radio(
//                              activeColor: CustomColors.BackGround,
//                              value: 'one',
//                              groupValue: model.Return_StopFilterValue,
//                              onChanged: model.changeReturnStopSelection,
//                            ),
//                            Text(
//                              "1 Stops",
//                              style: CustomStyles.calenderStyle,
//                            ),
//                          ],
//                        )

                          checkbox("1 Stops", model.oneStopFilter, 'one')

                          ,
                          flex: 1,
                        ),
                        Expanded(
                          child:
//                        Row(
//                          children: <Widget>[
//                            Radio(
//                              activeColor: CustomColors.BackGround,
//                              value: 'onePlus',
//                              groupValue: model.Return_StopFilterValue,
//                              onChanged: model.changeReturnStopSelection,
//                            ),
//                            Text(
//                              "1+ Stops",
//                              style: CustomStyles.calenderStyle,
//                            ),
//
//
//
//                          ],
//                        )

                          checkbox("1+stops", model.onePlusFilter, 'onePlus')


                          ,
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                ],
              ))
                  : (Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    strings.departure_time,
                    style: CustomStyles.medium14.copyWith(
                        color: CustomColors.heading.withOpacity(.5)),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/morning.png',
                                height: 20,
                                width: 20,
                                color:
                                model.Return_departure_timing_value ==
                                    strings.time_00_06
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_00_06,
                                style:
                                model.Return_departure_timing_value ==
                                    strings.time_00_06
                                    ? CustomStyles.normal10.copyWith(
                                    color: CustomColors.White)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color:
                              model.Return_departure_timing_value ==
                                  strings.time_00_06
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color:
                                  model.Return_departure_timing_value ==
                                      strings.time_00_06
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.R_changeDepartureTiming(
                              strings.time_00_06);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/afternoon.png',
                                height: 20,
                                width: 20,
                                color:
                                model.Return_departure_timing_value ==
                                    strings.time_06_12
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_06_12,
                                style:
                                model.Return_departure_timing_value ==
                                    strings.time_06_12
                                    ? CustomStyles.normal10.copyWith(
                                    color: CustomColors.White)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color:
                              model.Return_departure_timing_value ==
                                  strings.time_06_12
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color:
                                  model.Return_departure_timing_value ==
                                      strings.time_06_12
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.R_changeDepartureTiming(
                              strings.time_06_12);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/evening.png',
                                height: 20,
                                width: 20,
                                color:
                                model.Return_departure_timing_value ==
                                    strings.time_12_18
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_12_18,
                                style:
                                model.Return_departure_timing_value ==
                                    strings.time_12_18
                                    ? CustomStyles.normal10.copyWith(
                                    color: CustomColors.White)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color:
                              model.Return_departure_timing_value ==
                                  strings.time_12_18
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color:
                                  model.Return_departure_timing_value ==
                                      strings.time_12_18
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.R_changeDepartureTiming(
                              strings.time_12_18);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/night.png',
                                height: 20,
                                width: 20,
                                color:
                                model.Return_departure_timing_value ==
                                    strings.time_18_00
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "18-00",
                                style:
                                model.Return_departure_timing_value ==
                                    strings.time_18_00
                                    ? CustomStyles.normal10.copyWith(
                                    color: CustomColors.White)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color:
                              model.Return_departure_timing_value ==
                                  strings.time_18_00
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color:
                                  model.Return_departure_timing_value ==
                                      strings.time_18_00
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.R_changeDepartureTiming(
                              strings.time_18_00);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    strings.arrival_time,
                    style: CustomStyles.medium14.copyWith(
                        color: CustomColors.heading.withOpacity(.5)),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/morning.png',
                                height: 20,
                                width: 20,
                                color:
                                model.Return_arrival_timing_value ==
                                    strings.time_00_06
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_00_06,
                                style:
                                model.Return_arrival_timing_value ==
                                    strings.time_00_06
                                    ? CustomStyles.normal10.copyWith(
                                    color: CustomColors.White)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.Return_arrival_timing_value ==
                                  strings.time_00_06
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color:
                                  model.Return_arrival_timing_value ==
                                      strings.time_00_06
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.R_changeArrivalTiming(strings.time_00_06);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/afternoon.png',
                                height: 20,
                                width: 20,
                                color:
                                model.Return_arrival_timing_value ==
                                    strings.time_06_12
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_06_12,
                                style:
                                model.Return_arrival_timing_value ==
                                    strings.time_06_12
                                    ? CustomStyles.normal10.copyWith(
                                    color: CustomColors.White)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.Return_arrival_timing_value ==
                                  strings.time_06_12
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color:
                                  model.Return_arrival_timing_value ==
                                      strings.time_06_12
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.R_changeArrivalTiming(strings.time_06_12);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/evening.png',
                                height: 20,
                                width: 20,
                                color:
                                model.Return_arrival_timing_value ==
                                    strings.time_12_18
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_12_18,
                                style:
                                model.Return_arrival_timing_value ==
                                    strings.time_12_18
                                    ? CustomStyles.normal10.copyWith(
                                    color: CustomColors.White)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.Return_arrival_timing_value ==
                                  strings.time_12_18
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color:
                                  model.Return_arrival_timing_value ==
                                      strings.time_12_18
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.R_changeArrivalTiming(strings.time_12_18);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/night.png',
                                height: 20,
                                width: 20,
                                color:
                                model.Return_arrival_timing_value ==
                                    strings.time_18_00
                                    ? CustomColors.White
                                    : CustomColors.disabledButton,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                strings.time_18_00,
                                style:
                                model.Return_arrival_timing_value ==
                                    strings.time_18_00
                                    ? CustomStyles.normal10.copyWith(
                                    color: CustomColors.White)
                                    : CustomStyles.normal12,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: model.Return_arrival_timing_value ==
                                  strings.time_18_00
                                  ? CustomColors.BackGround
                                  : CustomColors.White,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color:
                                  model.Return_arrival_timing_value ==
                                      strings.time_18_00
                                      ? CustomColors.BackGround
                                      : CustomColors.disabledButton)),
                        ),
                        onTap: () {
                          model.R_changeArrivalTiming(strings.time_18_00);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    strings.stops,
                    style: CustomStyles.medium14.copyWith(
                        color: CustomColors.heading.withOpacity(.5)),
                  ),
                  SizedBox(height: 5),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child:

                        checkbox("Non-Stop", model.returnNonStopFilter, 'return_zero')
                        ,
                        flex: 1,
                      ),
                      Expanded(
                        child:

                        checkbox("1 Stop", model.returnOneStopFilter, 'return_one')
                        ,
                        flex: 1,
                      ),
                      Expanded(
                        child:

                        checkbox("1+Stops", model.returnOnePlusFilter, 'return_onePlus')
                        ,
                        flex: 1,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),



                ],
              )),
            SizedBox(height: 5),
            Text(
            strings.airlines,
            style: CustomStyles.medium14.copyWith(
            color: CustomColors.heading.withOpacity(.5)),
            ),

            SizedBox(height: 20),

              ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: model.airlineFilterList.length, // records.length
              itemBuilder: (BuildContext context, int index) {

                return

                  GestureDetector(
                    onTap: (){

                      model.filtersAddAndRemove(index);

                    },
                    child: Container(
                      //height: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[

                              Image.network(
                                model.airlineFilterList[index].meta.image64,
                                height: 20,
                              ),
                              SizedBox(width: 10),


                              Flexible(
                              fit: FlexFit.tight,
                              child: Text(
                                model.airlineFilterList[index].meta.name,
                                style: CustomStyles.heading.copyWith(
                                color:
                                model.checkAppliedCategories(index)?

                                CustomColors.BackGround:
                                CustomColors.heading
                                .withOpacity(.5)


                                ),
                              )),
                              Icon(
                                Icons.check_circle,
                                color:
                                model.checkAppliedCategories(index)?
                                CustomColors.BackGround:
                                CustomColors.heading .withOpacity(.5) ,
                              )
                            ],
                          ),

                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                  );




              }),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      fit: FlexFit.tight,
                      child: FlatButton(
                        onPressed: () {
                          model.clearFilters();
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'CLEAR ALL',
                          style: CustomStyles.button_style
                              .copyWith(color: CustomColors.disabledButton),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                                color: CustomColors.disabledButton, width: 2)),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      fit: FlexFit.tight,
                      child: FlatButton(
                        color: CustomColors.Orange,
                        onPressed: () {
                          model.applyFilters();
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.all(15),
                        child: Text(
                          'APPLY',
                          style: CustomStyles.button_style,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                                color: CustomColors.Orange, width: 2)),
                      ))
                ],
              ),
              SizedBox(height: SizeConstants.SIZE_20),
            ],
          );
        }));
  }




  Widget checkbox(String title, bool boolValue,stopType) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: CustomColors.disabledButton,

          selectedRowColor: CustomColors.BackGround,

      ),
      child: CheckboxListTile(
        checkColor: CustomColors.White,
        activeColor: CustomColors.BackGround,
        dense: true,
        value: boolValue,
              contentPadding: EdgeInsets.symmetric(horizontal: 1),
              onChanged: (bool value) {

        model.changeStops(value,stopType);

      },
        title: Text(title,style:CustomStyles.calenderStyle ,),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
//      Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Text(title,style: CustomStyles.calenderStyle,),
//        SizedBox(width: 5,),
//        Checkbox(
//          checkColor: CustomColors.BackGround,
//          activeColor: CustomColors.BackGround,
//          value: boolValue,
//          onChanged: (bool value) {
//
//            model.changeStops(value,stopType);
//
//          },
//        )
//      ],
//    );
  }

  
  
}
