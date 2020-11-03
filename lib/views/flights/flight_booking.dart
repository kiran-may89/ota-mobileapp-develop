import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/views/flights/bottom_sheet/flight_search.dart';
import '../../viewmodels/flights_view_model/flightbookingModel.dart';
import '../base/base_view.dart';
import '../base/base_widget.dart';
import 'date_selector.dart';

class FlightBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<FlightSearch_Model>(
        viewModel: FlightSearch_Model(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => _FlightBookingState());
  }
}

class _FlightBookingState extends BaseModelWidget<FlightSearch_Model> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ///source  = 0 | Destination = 1
  int flightType;

  @override
  Widget build(BuildContext context, FlightSearch_Model model) {
    var size = MediaQuery.of(context).size;
    model.context = context;

    return Scaffold(
        key:   _scaffoldKey,
        appBar: AppBar(
          title: Text(
            getLocalText("book_flight", context),
            style: CustomStyles.button_style.copyWith(fontSize: 20),
          ),
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 13,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(
                Icons.clear,
                color: Colors.white,
                size: 20,
              ),

              //  onPressed: () => Navigator.of(context).pop(),
            ),
          ],
          elevation: 0.0,
          backgroundColor: CustomColors.BackGround,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.TabDisabled),
                margin: EdgeInsets.only(
                    left: size.width * .2, right: size.width * .2, top: 20),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(microseconds: 1000),
                      alignment: model.oneWay
                          ? Alignment.bottomLeft
                          : Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        width: size.width * .3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CustomColors.Orange,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                height: double.infinity,
                                width: double.infinity,
                                child: Text(getLocalText("one_way", context),
                                    textAlign: TextAlign.center,
                                    style: model.oneWay
                                        ? CustomStyles.button_style
                                        .copyWith(fontSize: 12)
                                        : CustomStyles.button_style.copyWith(
                                        fontSize: 12,
                                        color: CustomColors.disabledButton)),
                              ),
                              onTap: () {
                                model.changeFlightType();
                              },
                            )),
                        Expanded(
                            child: GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                height: double.infinity,
                                width: double.infinity,
                                child: Text(getLocalText("round_trip", context),
                                    textAlign: TextAlign.center,
                                    style: !model.oneWay
                                        ? CustomStyles.button_style
                                        .copyWith(fontSize: 12)
                                        : CustomStyles.button_style.copyWith(
                                        fontSize: 12,
                                        color: CustomColors.disabledButton)),
                              ),
                              onTap: () {
                                model.changeFlightType();
                              },
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                flightType = 0;

                                showSourceBottomSheet(context,model,flightType);

                              },
                              child:
                              Card(
                                elevation: 3,
                                margin: EdgeInsets.only(top: 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 71,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Image.asset(
                                            'assets/images/plane.png',
                                            height: 21,
                                          ),
                                        ),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child:
                                            model.selectedSource==null?

                                                 Text(getLocalText("from", context),
                                                  style: CustomStyles
                                                    .destinationStyle
                                                    .copyWith(fontSize: 12),)
                                                        :
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [

                                                    Text(getLocalText("from", context),
                                                       style: CustomStyles
                                                          .destinationStyle
                                                          .copyWith(fontSize: 9),),

                                                    SizedBox(height: 7,),

                                                    Text(model.selectedSource,
                                                      style: CustomStyles
                                                          .destinationStyle
                                                          .copyWith(fontSize: 14),)





                                                  ],
                                                ),

//                                        Theme(
//                                          data:
//                                          ThemeData(primaryColor: Colors.red),
//                                          child: TypeAheadFormField(
//                                            hideOnError: true,
//                                            hideOnEmpty: true,
//                                            hideOnLoading: true,
//                                            hideSuggestionsOnKeyboardHide: false,
//                                            textFieldConfiguration:
//                                            TextFieldConfiguration(
//
//                                              controller:
//                                              model.startFromController,
//                                              maxLines: 2,
//                                              autofocus: false,
//                                              style: CustomStyles.cardContentStyle
//                                                  .copyWith(fontSize: 14),
//                                              decoration: InputDecoration(
//                                                isDense: true,
//                                                alignLabelWithHint: true,
//                                                labelText: strings.from,
//                                                labelStyle: CustomStyles
//                                                    .destinationStyle
//                                                    .copyWith(fontSize: 12),
//                                                border: InputBorder.none,
//                                                suffixIcon: IconButton(
//                                                  /*color: Colors.red,*/
//
//                                                  onPressed: () {
//                                                    model.startFromController
//                                                        .clear();
//
//                                                    model.FlyFrom = null;
//
//
//                                                  },
//                                                  icon: Icon(
//                                                    Icons.cancel,
//                                                    size: SizeConstants.SIZE_20,
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                            suggestionsCallback: (pattern) async {
//
//
//                                              if (pattern.isEmpty || pattern.length < 3) {
//                                                return null;
//                                              }
//
//                                              var response = await model.getAirports(pattern);
//
//                                              return response.result;
//                                            },
//                                            itemBuilder: (context,
//                                                AirportCodes suggestion) {
//                                              return
//                                                Container(
//                                                color: CustomColors.White,
//                                                margin: EdgeInsets.only(
//                                                    left: 5, right: 5),
//                                                child: Column(
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.start,
//                                                  crossAxisAlignment:
//                                                  CrossAxisAlignment.start,
//                                                  children: <Widget>[
//                                                    SizedBox(
//                                                      height: 4,
//                                                    ),
//                                                    Text(
//                                                      suggestion.airportCode +
//                                                          " - " +
//                                                          suggestion.city,
//                                                      style:
//                                                      CustomStyles.normal14,
//                                                    ),
//                                                    SizedBox(
//                                                      height: 4,
//                                                    ),
//                                                    Text(
//                                                      suggestion.airportName,
//                                                      style:
//                                                      CustomStyles.normal16,
//                                                    ),
//                                                    SizedBox(
//                                                      height: 4,
//                                                    ),
//                                                    Container(
//                                                      height: 1,
//                                                      width: double.infinity,
//                                                      color: CustomColors
//                                                          .disabledButton,
//                                                    )
//                                                  ],
//                                                ),
//                                              );
//                                            },
//                                            onSuggestionSelected: (suggestion) {
//
//
//                                              model.setFromAirport(suggestion);
//                                            },
//                                          ),
//                                        ),
                                        flex: 8,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ),


                            GestureDetector(
                              onTap: (){
                                flightType = 1;

                                showSourceBottomSheet(context,model,flightType);

                              },
                              child: Card(
                                elevation: 3,
                                margin: EdgeInsets.only(top: 10, bottom: 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Container(
                                  height: 71,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Image.asset(
                                            'assets/images/location.png',
                                            height: 21,
                                          ),
                                        ),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child:

                                        model.selectedDestination==null?

                                        Text(getLocalText("destination", context),
                                          style: CustomStyles
                                              .destinationStyle
                                              .copyWith(fontSize: 12),)
                                            :
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text(getLocalText("destination", context),
                                              style: CustomStyles
                                                  .destinationStyle
                                                  .copyWith(fontSize: 9),),

                                            SizedBox(height: 7,),

                                            Text(model.selectedDestination,
                                              style: CustomStyles
                                                  .destinationStyle
                                                  .copyWith(fontSize: 14),)





                                          ],
                                        ),

//                                      Theme(
//                                        data: ThemeData(
//                                            primaryColor: Colors.red
//                                        ),
//                                        child: TypeAheadFormField(
//                                          hideOnError: true,
//                                          hideOnEmpty: true,
//                                          hideOnLoading: true,
//                                          hideSuggestionsOnKeyboardHide: false,
//                                          textFieldConfiguration:
//                                          TextFieldConfiguration(
//                                            maxLines: 2,
//                                            controller:
//                                            model.destinationController,
//                                            autofocus: false,
//                                            style: CustomStyles.cardContentStyle
//                                                .copyWith(fontSize: 14),
//                                            decoration: InputDecoration(
//                                              isDense: true,
//                                              alignLabelWithHint: true,
//                                              labelText: strings.destination,
//                                              labelStyle: CustomStyles
//                                                  .destinationStyle
//                                                  .copyWith(fontSize: 12),
//                                              border: InputBorder.none,
//                                              suffixIcon: IconButton(
//                                                onPressed: () {
//                                                  model.destinationController
//                                                      .clear();
//                                                  model.FlyTo = null;
//                                                },
//                                                icon: Icon(
//                                                  Icons.cancel,
//                                                  size: SizeConstants.SIZE_20,
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                          suggestionsCallback: (pattern) async {
//                                            if (pattern.isEmpty || pattern.length < 3) {
//                                              return null;
//                                            }
//
//                                            var response = await model.getAirports(pattern);
//
//                                            return response.result;
//                                          },
//                                          itemBuilder:
//                                              (context, AirportCodes suggestion) {
//                                            return Container(
//                                              color: CustomColors.White,
//                                              margin: EdgeInsets.only(
//                                                  left: 5, right: 5),
//                                              child: Column(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.start,
//                                                crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                                children: <Widget>[
//                                                  SizedBox(
//                                                    height: 4,
//                                                  ),
//                                                  Text(
//                                                    suggestion.airportCode +
//                                                        " - " +
//                                                        suggestion.city,
//                                                    style: CustomStyles.normal14,
//                                                  ),
//                                                  SizedBox(
//                                                    height: 4,
//                                                  ),
//                                                  Text(
//                                                    suggestion.airportName,
//                                                    style: CustomStyles.normal16,
//                                                  ),
//                                                  SizedBox(
//                                                    height: 4,
//                                                  ),
//                                                  Container(
//                                                    height: 1,
//                                                    width: double.infinity,
//                                                    color: CustomColors
//                                                        .disabledButton,
//                                                  )
//                                                ],
//                                              ),
//                                            );
//                                          },
//                                          onSuggestionSelected: (suggestion) {
//
//                                            model.setDestinationAirport(
//                                                suggestion);
//                                          },
//                                        ),
//                                      )

                                        flex: 8,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),




                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(top: 78, left: 33.5),
                                height: 55,
                                child: MySeparator(
                                  height: 1,
                                  color: CustomColors.disabledButton,
                                  Horizontal: false,
                                )),
                            Expanded(child: SizedBox()),

                            // Spacer(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: (){
                                  model.swapCities();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 77, right: 10),
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.import_export,
                                    color: CustomColors.White,
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CustomColors.BackGround),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                    //  Text('Travel date',style: CustomStyles.heading.copyWith(color:CustomColors.heading.withOpacity(.5) ),),

                    Flexible(
//                        margin: EdgeInsets.only(
//                            right: SizeConstants.SIZE_16,
//                            left: SizeConstants.SIZE_16,
//                            top: SizeConstants.SIZE_20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                           getLocalText("setDates", context),
                            style: CustomStyles.heading.copyWith(
                                color: CustomColors.heading.withOpacity(.5)),
                          ),
                          Card(
                            elevation: 3,
                            margin: EdgeInsets.only(top: SizeConstants.SIZE_10),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(SizeConstants.SIZE_16),
                            ),
                            child: Container(
                                margin: EdgeInsets.only(
                                    bottom: SizeConstants.SIZE_20,
                                    top: SizeConstants.SIZE_20,
                                    left: SizeConstants.SIZE_20,
                                    right: SizeConstants.SIZE_16),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/calender.png",
                                          height: SizeConstants.SIZE_20,
                                        ),
                                        SizedBox(
                                          width: SizeConstants.SIZE_8,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            model.oneWay
                                                ? Text(
                                              " ${getLocalText("from", context)+model.startDateMOnth}",
                                              style: CustomStyles
                                                  .cardContentStyle.copyWith(fontSize: 14),
                                              textAlign: TextAlign.start,
                                            )
                                                : Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "${getLocalText("from", context)+model.startDateMOnth}",
                                                  style: CustomStyles
                                                      .cardContentStyle.copyWith(fontSize: 14),
                                                  textAlign:
                                                  TextAlign.start,
                                                ),
                                                Text(
                                                  "${getLocalText("return", context)+model.returnDateMonth}",
                                                  style: CustomStyles
                                                      .cardContentStyle.copyWith(fontSize: 14),
                                                  textAlign:
                                                  TextAlign.start,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        RotatedBox(
                                          quarterTurns:
                                          model.toggleDateVisible ? 0 : 2,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_upward,
                                              color: CustomColors.Orange,
                                              size: SizeConstants.SIZE_24,
                                            ),
                                            onPressed: () =>
                                                model.toggleCalender(),
                                          ),
                                        )
                                      ],
                                    ),

                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.easeIn,
                                      height: model.calenderHeight,
                                      child: Visibility(
                                        visible: model.toggleDateVisible,
                                        child: Container(
                                            margin: EdgeInsets.all(5),
                                            padding: EdgeInsets.all(5),
                                            height: 280,
                                            width: 280,
                                            child:
                                            DateSelector(model, context)),
                                      ),
                                    )

//
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConstants.SIZE_20,
                    ),

                    Text(
                      getLocalText("add_number_of_travellers", context),
                      style: CustomStyles.heading.copyWith(
                          color: CustomColors.heading.withOpacity(.5)),
                    ),

                    Card(
                      elevation: 3,
                      margin: EdgeInsets.only(top: SizeConstants.SIZE_10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 17, right: 18),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Text(getLocalText("adults", context),
                                  style: model.adultCount == 0
                                      ? CustomStyles.normal16.copyWith(
                                      color: CustomColors.disabledButton)
                                      : CustomStyles.normal16),
                            ),
                            Expanded(
                                flex: 5,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 15,
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.do_not_disturb_on,
                                          color: CustomColors.Orange,
                                          size: 22,
                                        ),
                                        onPressed: () {
                                          model.removeAdult();
                                        }),
                                    Text(model.adultCount.toString(),
                                        style: model.adultCount == 0
                                            ? CustomStyles.normal16.copyWith(
                                            color:
                                            CustomColors.disabledButton)
                                            : CustomStyles.normal16),
                                    IconButton(
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: CustomColors.Orange,
                                          size: 22,
                                        ),
                                        onPressed: () {
                                          model.addAdult();
                                        }),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),

                    Card(
                      elevation: 3,
                      margin: EdgeInsets.only(top: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 17, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Text(getLocalText("children", context),
                                  style: model.childCount == 0
                                      ? CustomStyles.normal16.copyWith(
                                      color: CustomColors.disabledButton)
                                      : CustomStyles.normal16),
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        Icons.do_not_disturb_on,
                                        color: CustomColors.Orange,
                                        size: 22,
                                      ),
                                      onPressed: () {
                                        model.removeChild();
                                      }),
                                  Text(model.childCount.toString(),
                                      style: model.childCount == 0
                                          ? CustomStyles.normal16.copyWith(
                                          color:
                                          CustomColors.disabledButton)
                                          : CustomStyles.normal16),
                                  IconButton(
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: CustomColors.Orange,
                                        size: 22,
                                      ),
                                      onPressed: () {
                                        model.addChild();
                                      }),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Card(
                      elevation: 3,
                      margin: EdgeInsets.only(top: 10, bottom: 38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 17, right: 18),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Text(getLocalText("infants", context),
                                  style: model.infantsCount == 0
                                      ? CustomStyles.normal16.copyWith(
                                      color: CustomColors.disabledButton)
                                      : CustomStyles.normal16),
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        Icons.do_not_disturb_on,
                                        color: CustomColors.Orange,
                                        size: 22,
                                      ),
                                      onPressed: () {
                                        model.removeInfant();
                                      }),
                                  Text(model.infantsCount.toString(),
                                      style: model.infantsCount == 0
                                          ? CustomStyles.normal16.copyWith(
                                          color:
                                          CustomColors.disabledButton)
                                          : CustomStyles.normal16),
                                  IconButton(
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: CustomColors.Orange,
                                        size: 22,
                                      ),
                                      onPressed: () {
                                        model.addInfant();
                                      }),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Text(
                      getLocalText("choose_cabin_class", context),
                      style: CustomStyles.heading.copyWith(
                          color: CustomColors.heading.withOpacity(.5)),
                    ),

                    Container(
                        margin: EdgeInsets.only(top: 23, bottom: 46),
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 23, right: 23),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: model.cabinClassImages,
                              ),
                            ),
                            Slider(
                              value: model.cabinClassSelection,
                              min: 0,
                              max: 3,
                              label: model.cabin_class[
                              model.cabinClassSelection.toInt()],
                              divisions: 3,
                              onChanged: (double newValue) {
                                model.changeCabinSelection(newValue);
                              },
                              activeColor: CustomColors.BackGround,
                              inactiveColor: CustomColors.disabledButton,
                            ),
                          ],
                        )),

                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: RaisedButton(
                          color: CustomColors.Orange,
                          child: Text(
                            getLocalText("search_flights", context),
                            style: CustomStyles.button_style,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () async {
                            if(model.validateData(_scaffoldKey))

                              Navigator.pushNamed(context, Routes.searchFlights,
                                  arguments: model.getRequestData());
                          }),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

   showSourceBottomSheet(BuildContext context, FlightSearch_Model model, int flightType) {


   return showModalBottomSheet(
        isDismissible:true ,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
          //margin: EdgeInsets.all(15),
          child: FlightSearch(model,context,flightType)



        ));



  }

  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
