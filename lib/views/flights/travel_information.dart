import 'dart:convert';

import 'package:age/age.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/flights/flight_booking_response_entity.dart';
import 'package:ota/models/flights/data_model/pass_arguments.dart';
import 'package:ota/models/flights/requests/flight_save_booking_request.dart';
import 'package:ota/models/flights/traveller_info_model.dart';
import 'package:ota/models/flights/validation_model.dart';
import 'package:ota/models/profile/responses/family_list.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_results_data.dart';
import 'package:ota/viewmodels/flights_view_model/flight_results_model.dart';
import 'package:ota/viewmodels/flights_view_model/passenger_info_model.dart';
import 'package:ota/views/flights/bottom_sheet/select_country.dart';
import 'package:ota/views/flights/date_selector2.dart';
import 'package:provider/provider.dart';

class TravelInformation extends StatefulWidget {
  FlightResultsData flightResultsData;

  TravelInformation(this.flightResultsData);

  @override
  _TravelInformationState createState() =>
      _TravelInformationState(flightResultsData);
}

class _TravelInformationState extends State<TravelInformation> {
  GlobalKey<FormState> _formState = GlobalKey();

  var size;

  BuildContext context;

  FlightBookingResponseEntity flightBookingResponseEntity =
  FlightBookingResponseEntity();

  bool phoneNumberValidated = false;

  FlightResultsData flightResultsData;

  _TravelInformationState(this.flightResultsData);

  var height;

  var width;

  var adultLastNameFocus = FocusNode();
  var adultEmailFocus = FocusNode();
  var adultPassportFocus = FocusNode();
  var adultMobileFocus = FocusNode();

  var childLastNameFocus = FocusNode();
  var childEmailFocus = FocusNode();
  var childPassportFocus = FocusNode();
  var childMobileFocus = FocusNode();

  var infantLastNameFocus = FocusNode();
  var infantEmailFocus = FocusNode();
  var infantPassportFocus = FocusNode();
  var infantMobileFocus = FocusNode();
  bool _reload =false;
  List<ValidationModel> contentFilledList = List();

  @override
  void initState() {
    // TODO: implement initState

    var primaryUser = SessionManager.getInstance();
    for (int i = 0; i < widget.flightResultsData.requestData.adults; i++)
      contentFilledList.add(new ValidationModel(i, 0, false));

    if (widget.flightResultsData.requestData.children != 0)
      for (int i = 0; i < widget.flightResultsData.requestData.children; i++)
        contentFilledList.add(new ValidationModel(i, 1, false));

    if (widget.flightResultsData.requestData.infants != 0)
      for (int i = 0; i < widget.flightResultsData.requestData.infants; i++)
        contentFilledList.add(new ValidationModel(i, 2, false));
  }

  @override
  Widget build(context) {
    height = MediaQuery
        .of(context)
        .size
        .height / 10;

    width = MediaQuery
        .of(context)
        .size
        .width / 10;

    return ChangeNotifierProvider<FlightPassengerInfoModel>(

      create: (context) => FlightPassengerInfoModel(flightResultsData),
      child: Consumer<FlightPassengerInfoModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: CustomColors.White,
            appBar: AppBar(
              title: Text(
                getLocalText("travel_information", context),
                style: CustomStyles.appbar,
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
            ),
            body: model.isLoading
                ? SpinKitChasingDots(
              size: SizeConstants.SIZE_50,
              color: CustomColors.BackGround,
            )
                : Container(
              margin: EdgeInsets.only(
                  left: width * .4, right: width * .4, top: 15),
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
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
                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    model.flightResultsData.requestData
                                        .flyFrom,
                                    style: CustomStyles.heading,
                                  ),
                                  Icon(
                                    Icons.swap_horiz,
                                    color: CustomColors.heading,
                                  ),
                                  Text(
                                    model.flightResultsData.requestData
                                        .flyTo,
                                    style: CustomStyles.heading,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Wrap(
                                spacing: 1.2,
                                alignment: WrapAlignment.start,
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  Text(
                                      model.flightResultsData.requestData.oneway
                                          ? model.flightResultsData
                                          .requestData.monthFrom +
                                          " | "
                                          : model.flightResultsData
                                          .requestData.monthFrom +
                                          " - " +
                                          model.flightResultsData
                                              .requestData.monthTo +
                                          " | ",
                                      style: CustomStyles.calenderStyle
                                          .copyWith(
                                          color: CustomColors.heading
                                              .withOpacity(.5))),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      model.flightResultsData.requestData
                                          .adults !=
                                          0
                                          ? Text(
                                          '${getLocalText("adults", context) +
                                              model.flightResultsData
                                                  .requestData.adults
                                                  .toString()} | ',
                                          style: CustomStyles
                                              .calenderStyle
                                              .copyWith(
                                              color: CustomColors
                                                  .heading
                                                  .withOpacity(
                                                  .5)))
                                          : SizedBox.shrink(),
                                      model.flightResultsData.requestData
                                          .children !=
                                          0
                                          ? Text(
                                          '${getLocalText("children", context) +
                                              model.flightResultsData
                                                  .requestData.children
                                                  .toString()} | ',
                                          style: CustomStyles
                                              .calenderStyle
                                              .copyWith(
                                              color: CustomColors
                                                  .heading
                                                  .withOpacity(
                                                  .5)))
                                          : SizedBox.shrink(),
                                      model.flightResultsData.requestData
                                          .infants !=
                                          0
                                          ? Text(
                                          '${getLocalText("infants", context) +
                                              model.flightResultsData
                                                  .requestData.infants
                                                  .toString()} | ',
                                          style: CustomStyles
                                              .calenderStyle
                                              .copyWith(
                                              color: CustomColors
                                                  .heading
                                                  .withOpacity(
                                                  .5)))
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                  Text(
                                    model.flightResultsData.requestData
                                        .cabinSelection_name,
                                    style: CustomStyles.calenderStyle
                                        .copyWith(
                                        color: CustomColors.heading
                                            .withOpacity(.5)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 24,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              color: CustomColors.Orange,
                              child: Text(
                                getLocalText("edit", context),
                                style: CustomStyles.calenderStyle
                                    .copyWith(color: CustomColors.White),
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
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: MySeparator(
                          color: CustomColors.TabDisabled,
                          height: 1,
                          Horizontal: true,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Form(
                      key: _formState,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: model.flightResultsData.requestData
                                .adults !=
                                0,
                            child: Container(
                                child: Column(
                                  children: List.generate(
                                      model.flightResultsData.requestData
                                          .adults, (int index) {
                                    int passengerType = 0;

                                    bool phoneNumberValidated = false;

                                    bool isDoB;

                                    return index==0? primaryContainer(passengerType, index, model, isDoB,context):
                                    Container(
//                                              margin:
//                                                  EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                contentFilledList
                                                    .forEach((element) {
                                                  if (element.passangerType ==
                                                      passengerType &&
                                                      element.index == index)
                                                    element.isFilled = false;
                                                });

                                                model
                                                    .enabledEditModeOnContinue(
                                                    index, passengerType);
                                              },
                                              child: Container(
                                                color: model.getPassengerName(
                                                    index,
                                                    passengerType) ==
                                                    ""
                                                    ? CustomColors.Orange
                                                    : CustomColors.BackGround,
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                height: 50,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: SizeConstants
                                                          .SIZE_4),
                                                  width:
                                                  MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: CustomColors.White,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 0.5,
                                                        blurRadius: 0.5,

                                                        offset: Offset(0,
                                                            1), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Visibility(
                                                          visible: model
                                                              .getPassengerName(
                                                              index,
                                                              passengerType) ==
                                                              "",
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                SizeConstants
                                                                    .SIZE_12),
                                                            child: Text(
                                                                index == 0
                                                                    ? "${getLocalText(
                                                                    "primary",
                                                                    context)}"
                                                                    : "${getLocalText(
                                                                    "adult",
                                                                    context)}" +
                                                                    "${index +
                                                                        1}",
                                                                style: CustomStyles
                                                                    .medium16),
                                                          )),
                                                      Visibility(
                                                          visible: model
                                                              .getPassengerName(
                                                              index,
                                                              passengerType) !=
                                                              "",
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                SizeConstants
                                                                    .SIZE_12),
                                                            child: Row(
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                    "assets/images/user.svg",
                                                                    width: SizeConstants
                                                                        .SIZE_20,
                                                                    height: SizeConstants
                                                                        .SIZE_20,
                                                                    color: Colors
                                                                        .black54),
                                                                SizedBox(
                                                                  width: SizeConstants
                                                                      .SIZE_8,
                                                                ),
                                                                Text(
                                                                    model
                                                                        .getPassengerName(
                                                                        index,
                                                                        passengerType),
                                                                    style: CustomStyles
                                                                        .medium16
                                                                        .copyWith(
                                                                        color: CustomColors
                                                                            .BackGround)),
                                                                SizedBox(
                                                                  width: SizeConstants
                                                                      .SIZE_8,
                                                                ),
                                                                Flexible(
                                                                  child: Text(
                                                                    model
                                                                        .getPassengerLastName(
                                                                        index,
                                                                        passengerType),
                                                                    style: CustomStyles
                                                                        .medium16
                                                                        .copyWith(
                                                                        color: CustomColors
                                                                            .BackGround),
                                                                    overflow: TextOverflow
                                                                        .fade,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                          Visibility(
                                              maintainSize: false,
                                              visible: model.areDetailsShown(
                                                  index, passengerType),
                                              child: Container(
// margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [

                                                    Container(
                                                        height: 45,
                                                        width: MediaQuery.of(context).size.width,
                                                        margin: EdgeInsets.only(
                                                            left: SizeConstants.SIZE_16, right: SizeConstants.SIZE_16, top: SizeConstants.SIZE_4, bottom: SizeConstants.SIZE_4),
                                                        child: DropdownButton(
                                                          icon: Container(),
                                                          underline:Text("Select From Family Members"),

                                                          items: List.generate(SessionManager.getInstance().getFamilyMemberList.length, (index) {
                                                            return DropdownMenuItem(
                                                              child:SizedBox(
                                                                width: MediaQuery.of(context).size.width / 2,
                                                                child: Text(SessionManager.getInstance().getFamilyMemberList[index].firstName, overflow: TextOverflow.ellipsis),
                                                              ),
                                                              value:SessionManager.getInstance().getFamilyMemberList[index],
                                                            );
                                                          }),

                                                          onChanged: (RelationResult value) {

                                                            contentFilledList
                                                                .forEach((element) {
                                                              if (element.passangerType ==
                                                                  passengerType &&
                                                                  element.index == index){

                                                                element.isFamilyMemberSelected =true;
                                                                element.firstName.text =value.firstName;
                                                                element.lastName.text = value.lastName;
                                                                element.dob.text = value.dob;
                                                                element.nationality.text = value.nationality;
                                                                element.passportNumber.text = value.passportNumber;
                                                                element.passportExpiry.text = value.passportExpiry;


                                                                element.userInfo =value;

                                                              }
                                                            });


                                                            model.reload();
                                                          },

                                                        )),

                                                    Align(
                                                      alignment:
                                                      Alignment.center,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .width /
                                                                10 *
                                                                4,
                                                            height: MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .height /
                                                                10 *
                                                                .5,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    20),
                                                                color: CustomColors
                                                                    .TabDisabled),
                                                            margin: EdgeInsets
                                                                .only(
                                                                left: 0,
                                                                right: 0,
                                                                top: 20),
                                                            child: Stack(
                                                              alignment:
                                                              Alignment
                                                                  .center,
                                                              children: <
                                                                  Widget>[
                                                                AnimatedContainer(
                                                                  duration: Duration(
                                                                      microseconds:
                                                                      1000),
                                                                  alignment: model
                                                                      .getGender(
                                                                      index,
                                                                      passengerType)
                                                                      ? Alignment
                                                                      .bottomLeft
                                                                      : Alignment
                                                                      .bottomRight,
                                                                  child:
                                                                  Container(
                                                                    height: MediaQuery
                                                                        .of(
                                                                        context)
                                                                        .size
                                                                        .height /
                                                                        10 *
                                                                        .7,
                                                                    width: MediaQuery
                                                                        .of(
                                                                        context)
                                                                        .size
                                                                        .width /
                                                                        10 *
                                                                        2,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          20),
                                                                      color: CustomColors
                                                                          .BackGround,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[


                                                                      Expanded(
                                                                          child:
                                                                          GestureDetector(
                                                                            child:
                                                                            Container(
                                                                              alignment:
                                                                              Alignment
                                                                                  .center,
                                                                              height:
                                                                              double
                                                                                  .infinity,
                                                                              width:
                                                                              double
                                                                                  .infinity,
                                                                              child: Text(
                                                                                  getLocalText(
                                                                                      "male",
                                                                                      context),
                                                                                  textAlign: TextAlign
                                                                                      .center,
                                                                                  style: model
                                                                                      .getGender(
                                                                                      index,
                                                                                      passengerType)
                                                                                      ? CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12)
                                                                                      : CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12,
                                                                                      color: CustomColors
                                                                                          .disabledButton)),
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              model
                                                                                  .setGender(
                                                                                  index,
                                                                                  passengerType,
                                                                                  0);
                                                                            },
                                                                          )),
                                                                      Expanded(
                                                                          child:
                                                                          GestureDetector(
                                                                            child:
                                                                            Container(
                                                                              alignment:
                                                                              Alignment
                                                                                  .center,
                                                                              height:
                                                                              double
                                                                                  .infinity,
                                                                              width:
                                                                              double
                                                                                  .infinity,
                                                                              child: Text(
                                                                                  getLocalText(
                                                                                      "female",
                                                                                      context),
                                                                                  textAlign: TextAlign
                                                                                      .center,
                                                                                  style: !model
                                                                                      .getGender(
                                                                                      index,
                                                                                      passengerType)
                                                                                      ? CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12)
                                                                                      : CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12,
                                                                                      color: CustomColors
                                                                                          .disabledButton)),
                                                                            ),
                                                                            onTap: () {
                                                                              model
                                                                                  .setGender(
                                                                                  index,
                                                                                  passengerType,
                                                                                  1);
                                                                            },
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: SizeConstants
                                                          .SIZE_12,
                                                    ),
                                                    Flexible(
                                                      child: TextFormField(
                                                         inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              30),
                                                        ],
                                                        onFieldSubmitted:
                                                            (v) {
                                                          FocusScope.of(
                                                              context)
                                                              .requestFocus(
                                                              adultLastNameFocus);
                                                        },
                                                        onSaved:(vl){
                                    model
                                        .setPassengerName(
                                    index,
                                    passengerType,
                                    contentFilledList[index].firstName.text);
                                                           },
                                                        validator: (value) {
                                                          final validCharacters =
                                                          RegExp(
                                                              r'[0123456789!@#$%^&*(),.?":{}|<>]');

                                                          if (validCharacters
                                                              .hasMatch(
                                                              value))
                                                            return "Enter Correct Name";

                                                          return value ==
                                                              null ||
                                                              value
                                                                  .isEmpty
                                                              ? getLocalText(
                                                              "enter_first_name",
                                                              context)
                                                              : null;
                                                        },

//                                                          onChanged: (value) =>
//                                                              model.setPassengerName(
//                                                                  index,
//                                                                  passengerType,
//                                                                  value),
//
                                                        controller:contentFilledList[index].firstName,

                                                        style: CustomStyles
                                                            .medium16
                                                            .copyWith(
                                                            color: CustomColors
                                                                .BackGround),
                                                        decoration:
                                                        InputDecoration(
                                                          labelStyle: CustomStyles
                                                              .medium16
                                                              .copyWith(
                                                              color: Colors
                                                                  .grey),
                                                          labelText:
                                                          getLocalText(
                                                              "first_name",
                                                              context),
                                                          alignLabelWithHint:
                                                          true,
                                                        ),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                            30),
                                                      ],
                                                      focusNode:
                                                      adultLastNameFocus,
                                                      validator: (value) {
                                                        final validCharacters =
                                                        RegExp(
                                                            r'[01234567890!@#$%^&*(),.?":{}|<>]');

                                                        if (validCharacters
                                                            .hasMatch(value))
                                                          return "Enter Correct Name";

                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return getLocalText(
                                                              "enter_last_name",
                                                              context);
                                                        }
                                                        return null;
                                                      },
                                                      onFieldSubmitted: (v) {
                                                        FocusScope.of(context)
                                                            .requestFocus(model
                                                            .isPrimary(
                                                            index,
                                                            passengerType)
                                                            ? adultEmailFocus
                                                            : adultPassportFocus);
                                                      },
                                                      onSaved: (value) {
                                                        model
                                                            .setPassengerLastName(
                                                            index,
                                                            passengerType,
                                                            contentFilledList[index].lastName.text);
                                                      },
//                                                        onChanged: (value) => model
//                                                            .setPassengerLastName(
//                                                                index,
//                                                                passengerType,
//                                                                value),

                                                      controller: contentFilledList[index].lastName,
                                                      style: CustomStyles
                                                          .medium16
                                                          .copyWith(
                                                          color: CustomColors
                                                              .BackGround),
                                                      decoration:
                                                      InputDecoration(
                                                        labelStyle: CustomStyles
                                                            .medium16
                                                            .copyWith(
                                                            color: Colors
                                                                .grey),
                                                        labelText:
                                                        getLocalText(
                                                            "last_name",
                                                            context),
                                                        alignLabelWithHint:
                                                        true,
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible:
                                                      model.isPrimary(
                                                          index,
                                                          passengerType),
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          TextFormField(

                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  30),
                                                            ],
                                                            focusNode:
                                                            adultEmailFocus,

                                                            onSaved: (value) {
                                                              model
                                                                  .setPassengersEmail(
                                                                  value);
                                                            },
//                                                              onChanged:
//                                                                  (value) => model
//                                                                      .setPassengersEmail(
//                                                                          value),
                                                            validator: (
                                                                input) =>
                                                            input
                                                                .isEmpty
                                                                ? getLocalText(
                                                                "enter_email",
                                                                context)
                                                                : isValidEmail(
                                                                input)
                                                                ? null
                                                                : getLocalText(
                                                                "enter_valid_email",
                                                                context),
                                                            onFieldSubmitted:
                                                                (v) {
                                                              FocusScope.of(
                                                                  context)
                                                                  .requestFocus(
                                                                  adultMobileFocus);
                                                            },

                                                            initialValue:
                                                            index == 0 &&
                                                                !SessionManager
                                                                    .getInstance()
                                                                    .isGuest &&
                                                                !contentFilledList[0]
                                                                    .isPrimaryFilled
                                                                ? SessionManager
                                                                .getInstance()
                                                                .getUser
                                                                .email
                                                                : model
                                                                .emailId ?? "",
                                                            style: CustomStyles
                                                                .medium16
                                                                .copyWith(
                                                                color: CustomColors
                                                                    .BackGround),
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                              labelText:
                                                              getLocalText(
                                                                  "email_id",
                                                                  context),
                                                              alignLabelWithHint:
                                                              true,
                                                            ),

                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Visibility(
                                                            visible: model
                                                                .isPrimary(
                                                                index,
                                                                passengerType),
                                                            child: Container(
//                                                                decoration: BoxDecoration(
//                                                                    border: Border(
//                                                                        bottom: BorderSide(
//                                                                            color:
//                                                                                CustomColors.disabledButton,
//                                                                            width: 2))),
                                                              child:
                                                              InternationalPhoneNumberInput(
                                                                countrySelectorScrollControlled: true,
                                                                focusNode:
                                                                adultMobileFocus,

                                                                selectorConfig:
                                                                SelectorConfig(
                                                                    selectorType:
                                                                    PhoneInputSelectorType
                                                                        .DIALOG),
                                                                onInputChanged:
                                                                    (PhoneNumber
                                                                number) {
                                                                  if (number
                                                                      .toString() ==
                                                                      number
                                                                          .dialCode)
                                                                    FocusScope
                                                                        .of(
                                                                        context)
                                                                        .requestFocus(
                                                                        adultMobileFocus);
                                                                  model
                                                                      .onCountryCodeChanged(
                                                                      number);
                                                                },

                                                                onInputValidated: (
                                                                    value) {
                                                                  phoneNumberValidated =
                                                                      value;
                                                                },
                                                                onSaved: (
                                                                    value) {
                                                                  print(value);
                                                                },
//
                                                                onFieldSubmitted:
                                                                    (v) {
                                                                  FocusScope.of(
                                                                      context)
                                                                      .requestFocus(
                                                                      adultPassportFocus);
                                                                },
                                                                inputDecoration:
                                                                InputDecoration(
                                                                  labelStyle: CustomStyles
                                                                      .medium16
                                                                      .copyWith(
                                                                      color: Colors
                                                                          .grey),
                                                                  labelText: getLocalText(
                                                                      "phone_number",
                                                                      context),
                                                                  //border:
                                                                  // OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                                                                    focusedBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    enabledBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    errorBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    disabledBorder:
//                                                                        InputBorder
//                                                                            .none,
                                                                ),
                                                                ignoreBlank:
                                                                false,
                                                                initialValue:
                                                                index == 0 &&
                                                                    !SessionManager
                                                                        .getInstance()
                                                                        .isGuest &&
                                                                    !contentFilledList[0]
                                                                        .isPrimaryFilled
                                                                    ? model
                                                                    .primaryDefaultPhoneNumber
                                                                    : model
                                                                    .phoneNumber,
                                                                validator: (
                                                                    value) =>
                                                                value.isEmpty
                                                                    ? getLocalText(
                                                                    "enter_phone_number",
                                                                    context)
                                                                    : phoneNumberValidated
                                                                    ? getLocalText(
                                                                    "enter_valid_phone_number",
                                                                    context)
                                                                    : null,

                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible:
                                                      !model.isPrimary(
                                                          index,
                                                          passengerType),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          showSourceBottomSheet(
                                                              context,
                                                              model,
                                                              index,
                                                              passengerType);
                                                        },
                                                        child:


                                                        AbsorbPointer(
                                                          absorbing: true,
                                                          child:
                                                          TextFormField(
//                                                            controller: TextEditingController(
//                                                                text: model
//                                                                    .getNationality(
//                                                                    index,
//                                                                    passengerType)),
//

                                                            controller: contentFilledList[index].nationality,
                                                            showCursor: false,
                                                            readOnly: true,
//onSaved: (value) => pasenger.email = value.trimRight(),
                                                            validator:
                                                                (value) {
                                                              return value ==
                                                                  null ||
                                                                  value
                                                                      .isEmpty
                                                                  ? getLocalText(
                                                                  "select_nationality",
                                                                  context)
                                                                  : null;
                                                            },
//  initialValue: pasenger.email ?? '',
                                                            style: CustomStyles
                                                                .medium16
                                                                .copyWith(
                                                                color: CustomColors
                                                                    .BackGround),
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                              labelText:
                                                              getLocalText(
                                                                  "nationality",
                                                                  context),
                                                              alignLabelWithHint:
                                                              true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 7),
                                                    Flexible(
                                                      child:
                                                      GestureDetector(
                                                        onTap: () {
                                                          isDoB = true;

                                                          showDobDialog(
                                                              context,
                                                              model,
                                                              isDoB,
                                                              index,
                                                              passengerType);
                                                        },
                                                        child:

//                                                Container(
//                                                  width: double.infinity,
//                                                  padding:EdgeInsets.symmetric(vertical: 10),
//                                                  child: model.getPassengerDOB(index, passengerType)!=""?
//                                                  Text(model.getPassengerDOB(index, passengerType),style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),):
//
//                                                  Text('Date of birth',style: CustomStyles.medium16.copyWith(color: Colors.grey),),
//
//
//                                                  decoration: BoxDecoration(
//                                                    border: Border(
//
//                                                      bottom: BorderSide( width: 1,color: CustomColors.disabledButton),
//                                                    ),
//
//                                                  ),
//
//                                                )

                                                        AbsorbPointer(
                                                          child:
                                                          TextFormField(
//                                                            controller: TextEditingController(
//                                                                text: model
//                                                                    .getPassengerDOB(
//                                                                    index,
//                                                                    passengerType) ??
//                                                                    ""),

                                                            controller: contentFilledList[index].dob,
                                                            showCursor: false,
                                                            readOnly: true,
                                                            validator:
                                                                (value) {
                                                              if (value == "")
                                                                return getLocalText(
                                                                    "date_of_birth",
                                                                    context);

                                                              int age = DateTime
                                                                  .now()
                                                                  .year -
                                                                  int.parse(
                                                                      value
                                                                          .split(
                                                                          '-')[0]);
                                                              if (age < 18)
                                                                return "Age should be greater than 18 years for adults";
                                                              return value ==
                                                                  null ||
                                                                  value
                                                                      .isEmpty ||
                                                                  value ==
                                                                      ""
                                                                  ? getLocalText(
                                                                  "date_of_birth",
                                                                  context)
                                                                  : null;
                                                            },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
//initialValue: model.getPassengerDOB(index, passengerType) ?? '',
                                                            style: CustomStyles
                                                                .medium16
                                                                .copyWith(
                                                                color: CustomColors
                                                                    .BackGround),
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                              labelText:
                                                              getLocalText(
                                                                  "date_of_birth",
                                                                  context),
                                                              alignLabelWithHint:
                                                              true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Flexible(
                                                      child: TextFormField(
                                                        focusNode: adultPassportFocus,
                                                        validator: (value) {
                                                          final validCharacters =
                                                          RegExp(
                                                              r'[!@#$%^&*(),.?":{}|<>]');

                                                          if (value
                                                              .isNotEmpty) {
                                                            if (value
                                                                .length <
                                                                6 || value
                                                                .length > 12)
                                                              return "Enter Valid Passport Number";
                                                            else
                                                            if (validCharacters
                                                                .hasMatch(
                                                                value))
                                                              return "Enter Valid Passport Number";
                                                          }
                                                          return value ==
                                                              null ||
                                                              value
                                                                  .isEmpty
                                                              ? getLocalText(
                                                              "passport_number_is_required",
                                                              context)
                                                              : null;
                                                        },
                                                        onSaved: (v) {
                                                          model.setPassengerPassportNumber(index, passengerType, contentFilledList[index].passportNumber.text);
                                                          FocusManager
                                                              .instance
                                                              .primaryFocus
                                                              .unfocus();
                                                        },
//                                                                onFieldSubmitted: (v){
//
//                                                                },
//                                                        onChanged: (value) =>
//                                                            model
//                                                                .setPassengerPassportNumber(
//                                                                index,
//                                                                passengerType,
//                                                                value),
//                                                        initialValue: model
//                                                            .getPassengerPassportNumber(
//                                                            index,
//                                                            passengerType),

                                                      controller: contentFilledList[index].passportNumber,
                                                        style: CustomStyles
                                                            .medium16
                                                            .copyWith(
                                                            color: CustomColors
                                                                .BackGround),
                                                        decoration:
                                                        InputDecoration(
                                                          labelStyle: CustomStyles
                                                              .medium16
                                                              .copyWith(
                                                              color: Colors
                                                                  .grey),
                                                          labelText: getLocalText(
                                                              "passport_number",
                                                              context),
                                                          alignLabelWithHint:
                                                          true,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Flexible(
                                                        child:
                                                        GestureDetector(
                                                          onTap: () {
                                                            isDoB = false;

                                                            showDobDialog(
                                                                context,
                                                                model,
                                                                isDoB,
                                                                index,
                                                                passengerType);

                                                            FocusScope.of(
                                                                context)
                                                                .unfocus();
                                                          },
                                                          child:
                                                          AbsorbPointer(
                                                            absorbing: true,
                                                            child: TextFormField(
//                                                              controller: TextEditingController(
//                                                                  text: model
//                                                                      .getPassengerPassportExpData(
//                                                                      index,
//                                                                      passengerType)),


                                                               controller: contentFilledList[index].passportExpiry,
                                                              validator: (
                                                                  value) {
                                                                if (!value
                                                                    .isEmpty) {
                                                                  var date = DateTime
                                                                      .now();
                                                                  if (!model
                                                                      .tempDate
                                                                      .isAfter(
                                                                      new DateTime(
                                                                          date
                                                                              .year,
                                                                          date
                                                                              .month +
                                                                              6,
                                                                          date
                                                                              .day)))
                                                                    return "Passport expiry should be greater than six months";
                                                                }

                                                                return value ==
                                                                    null ||
                                                                    value
                                                                        .isEmpty
                                                                    ? getLocalText(
                                                                    "enter_passport_expiry_date",
                                                                    context)
                                                                    : null;
                                                              },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
// initialValue: model.getPassengerPassportExpData(index, passengerType),
                                                              style: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: CustomColors
                                                                      .BackGround),
                                                              decoration:
                                                              InputDecoration(
                                                                labelStyle: CustomStyles
                                                                    .medium16
                                                                    .copyWith(
                                                                    color: Colors
                                                                        .grey),
                                                                labelText:
                                                                getLocalText(
                                                                    "passport_expiry",
                                                                    context),
                                                                alignLabelWithHint:
                                                                true,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomRight,
                                                      child: RaisedButton(
                                                          color: CustomColors
                                                              .Orange,
                                                          child: Text(
                                                            getLocalText(
                                                                "save",
                                                                context),
// strings.save.toUpperCase(),
                                                            style: CustomStyles
                                                                .button_style,
                                                          ),
                                                          shape:
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10.0),
                                                          ),
                                                          onPressed: () async {
                                                            _formState
                                                                .currentState
                                                                .save();
                                                            if (_formState
                                                                .currentState
                                                                .validate()) {
                                                              contentFilledList
                                                                  .forEach(
                                                                      (
                                                                      element) {
                                                                    if (element
                                                                        .passangerType ==
                                                                        0 &&
                                                                        element
                                                                            .index ==
                                                                            index) {
                                                                      element
                                                                          .isFilled =
                                                                      true;
                                                                      element
                                                                          .isPrimaryFilled =
                                                                      true;
                                                                    }
                                                                  });
                                                              model
                                                                  .enabledEditMode(
                                                                  passengerType,
                                                                  index);
                                                              _formState
                                                                  .currentState
                                                                  .save();
                                                            }
                                                          }),
                                                    )
                                                  ],
                                                ),
                                              )),
                                          SizedBox(
                                            height: SizeConstants.SIZE_6,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                )),
                          ),

// model.flightResultsData.requestData.children!=0?

                          Visibility(
                            visible: model.flightResultsData.requestData
                                .children !=
                                0,
                            child: Container(
                                child: Column(
                                  children: List.generate(
                                      model.flightResultsData.requestData
                                          .children, (int index) {
                                    int passengerType = 1;

                                    bool phoneNumberValidated = false;

                                    ///For dateSelectionDialog --dob or passport_expiry_date  selection
                                    bool isDoB;

                                    return Container(
//                                              margin:
//                                                  EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                contentFilledList
                                                    .forEach((element) {
                                                  if (element.passangerType ==
                                                      passengerType &&
                                                      element.index == index)
                                                    element.isFilled = false;
                                                });
                                                model
                                                    .enabledEditModeOnContinue(
                                                    index, passengerType);
                                              },
                                              child: Container(
                                                color: model.getPassengerName(
                                                    index,
                                                    passengerType) ==
                                                    ""
                                                    ? CustomColors.Orange
                                                    : CustomColors.BackGround,
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                height: 50,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: SizeConstants
                                                          .SIZE_4),
                                                  width:
                                                  MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: CustomColors.White,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 0.5,
                                                        blurRadius: 0.5,

                                                        offset: Offset(0,
                                                            1), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Visibility(
                                                          visible: model
                                                              .getPassengerName(
                                                              index,
                                                              passengerType) ==
                                                              "",
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                SizeConstants
                                                                    .SIZE_12),
                                                            child: Text(
                                                                model.isPrimary(
                                                                    index,
                                                                    passengerType)
                                                                    ? "${getLocalText(
                                                                    "primary",
                                                                    context)}"
                                                                    : "${getLocalText(
                                                                    "child",
                                                                    context)}" +
                                                                    "${index +
                                                                        1}",
                                                                style: CustomStyles
                                                                    .medium16),
                                                          )),
                                                      Visibility(
                                                          visible: model
                                                              .getPassengerName(
                                                              index,
                                                              passengerType) !=
                                                              "",
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                SizeConstants
                                                                    .SIZE_12),
                                                            child: Row(
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                    "assets/images/user.svg",
                                                                    width: SizeConstants
                                                                        .SIZE_20,
                                                                    height: SizeConstants
                                                                        .SIZE_20,
                                                                    color: Colors
                                                                        .black54),
                                                                SizedBox(
                                                                  width: SizeConstants
                                                                      .SIZE_8,
                                                                ),
                                                                Text(
                                                                    model
                                                                        .getPassengerName(
                                                                        index,
                                                                        passengerType),
                                                                    style: CustomStyles
                                                                        .medium16
                                                                        .copyWith(
                                                                        color: CustomColors
                                                                            .BackGround)),
                                                                SizedBox(
                                                                  width: SizeConstants
                                                                      .SIZE_8,
                                                                ),
                                                                Flexible(
                                                                  child: Text(
                                                                    model
                                                                        .getPassengerLastName(
                                                                        index,
                                                                        passengerType),
                                                                    style: CustomStyles
                                                                        .medium16
                                                                        .copyWith(
                                                                        color: CustomColors
                                                                            .BackGround),
                                                                    overflow: TextOverflow
                                                                        .fade,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                          Visibility(
                                              maintainSize: false,
                                              visible: model.areDetailsShown(
                                                  index, passengerType),
                                              child: Container(
// margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                      Alignment.center,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .width /
                                                                10 *
                                                                4,
                                                            height: MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .height /
                                                                10 *
                                                                .5,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    20),
                                                                color: CustomColors
                                                                    .TabDisabled),
                                                            margin: EdgeInsets
                                                                .only(
                                                                left: 0,
                                                                right: 0,
                                                                top: 20),
                                                            child: Stack(
                                                              alignment:
                                                              Alignment
                                                                  .center,
                                                              children: <
                                                                  Widget>[
                                                                AnimatedContainer(
                                                                  duration: Duration(
                                                                      microseconds:
                                                                      1000),
                                                                  alignment: model
                                                                      .getGender(
                                                                      index,
                                                                      passengerType)
                                                                      ? Alignment
                                                                      .bottomLeft
                                                                      : Alignment
                                                                      .bottomRight,
                                                                  child:
                                                                  Container(
                                                                    height: MediaQuery
                                                                        .of(
                                                                        context)
                                                                        .size
                                                                        .height /
                                                                        10 *
                                                                        .7,
                                                                    width: MediaQuery
                                                                        .of(
                                                                        context)
                                                                        .size
                                                                        .width /
                                                                        10 *
                                                                        2,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          20),
                                                                      color: CustomColors
                                                                          .BackGround,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Expanded(
                                                                          child:
                                                                          GestureDetector(
                                                                            child:
                                                                            Container(
                                                                              alignment:
                                                                              Alignment
                                                                                  .center,
                                                                              height:
                                                                              double
                                                                                  .infinity,
                                                                              width:
                                                                              double
                                                                                  .infinity,
                                                                              child: Text(
                                                                                  getLocalText(
                                                                                      "male",
                                                                                      context),
                                                                                  textAlign: TextAlign
                                                                                      .center,
                                                                                  style: model
                                                                                      .getGender(
                                                                                      index,
                                                                                      passengerType)
                                                                                      ? CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12)
                                                                                      : CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12,
                                                                                      color: CustomColors
                                                                                          .disabledButton)),
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              model
                                                                                  .setGender(
                                                                                  index,
                                                                                  passengerType,
                                                                                  0);
                                                                            },
                                                                          )),
                                                                      Expanded(
                                                                          child:
                                                                          GestureDetector(
                                                                            child:
                                                                            Container(
                                                                              alignment:
                                                                              Alignment
                                                                                  .center,
                                                                              height:
                                                                              double
                                                                                  .infinity,
                                                                              width:
                                                                              double
                                                                                  .infinity,
                                                                              child: Text(
                                                                                  getLocalText(
                                                                                      "female",
                                                                                      context),
                                                                                  textAlign: TextAlign
                                                                                      .center,
                                                                                  style: model
                                                                                      .getGender(
                                                                                      index,
                                                                                      passengerType)
                                                                                      ? CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12)
                                                                                      : CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12,
                                                                                      color: CustomColors
                                                                                          .disabledButton)),
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              model
                                                                                  .setGender(
                                                                                  index,
                                                                                  passengerType,
                                                                                  1);
                                                                            },
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: SizeConstants
                                                          .SIZE_12,
                                                    ),
                                                    Flexible(
                                                      child: TextFormField(
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              30),
                                                        ],
                                                        onFieldSubmitted:
                                                            (v) {
                                                          FocusScope.of(
                                                              context)
                                                              .requestFocus(
                                                              childLastNameFocus);
                                                        },
                                                        validator: (value) {
                                                          final validCharacters =
                                                          RegExp(
                                                              r'[01234567890!@#$%^&*(),.?":{}|<>]');

                                                          if (validCharacters
                                                              .hasMatch(
                                                              value))
                                                            return "Enter Correct Name";

                                                          return value ==
                                                              null ||
                                                              value
                                                                  .isEmpty
                                                              ? getLocalText(
                                                              "enter_first_name",
                                                              context)
                                                              : null;
                                                        },
                                                        onChanged: (value) =>
                                                            model
                                                                .setPassengerName(
                                                                index,
                                                                passengerType,
                                                                value),
                                                        initialValue: model
                                                            .getPassengerName(
                                                            index,
                                                            passengerType),
                                                        style: CustomStyles
                                                            .medium16
                                                            .copyWith(
                                                            color: CustomColors
                                                                .BackGround),
                                                        decoration:
                                                        InputDecoration(
                                                          labelStyle: CustomStyles
                                                              .medium16
                                                              .copyWith(
                                                              color: Colors
                                                                  .grey),
                                                          labelText:
                                                          getLocalText(
                                                              "first_name",
                                                              context),
                                                          alignLabelWithHint:
                                                          true,
                                                        ),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                            30),
                                                      ],
                                                      focusNode:
                                                      childLastNameFocus,
                                                      validator: (value) {
                                                        final validCharacters =
                                                        RegExp(
                                                            r'[01234567890!@#$%^&*(),.?":{}|<>]');

                                                        if (validCharacters
                                                            .hasMatch(value))
                                                          return "Enter Correct Name";

                                                        return value ==
                                                            null ||
                                                            value.isEmpty
                                                            ? getLocalText(
                                                            "enter_last_name",
                                                            context)
                                                            : null;
                                                      },
                                                      onFieldSubmitted: (v) {
                                                        FocusScope.of(context)
                                                            .requestFocus(model
                                                            .isPrimary(
                                                            index,
                                                            passengerType)
                                                            ? childEmailFocus
                                                            : childPassportFocus);
                                                      },
                                                      onChanged: (value) =>
                                                          model
                                                              .setPassengerLastName(
                                                              index,
                                                              passengerType,
                                                              value),
                                                      initialValue: model
                                                          .getPassengerLastName(
                                                          index,
                                                          passengerType),
                                                      style: CustomStyles
                                                          .medium16
                                                          .copyWith(
                                                          color: CustomColors
                                                              .BackGround),
                                                      decoration:
                                                      InputDecoration(
                                                        labelStyle: CustomStyles
                                                            .medium16
                                                            .copyWith(
                                                            color: Colors
                                                                .grey),
                                                        labelText:
                                                        getLocalText(
                                                            "last_name",
                                                            context),
                                                        alignLabelWithHint:
                                                        true,
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible:
                                                      model.isPrimary(
                                                          index,
                                                          passengerType),
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          TextFormField(
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  30),
                                                            ],
                                                            focusNode:
                                                            childEmailFocus,
                                                            onChanged:
                                                                (value) =>
                                                                model
                                                                    .setPassengersEmail(
                                                                    value),
                                                            validator: (
                                                                input) =>
                                                            input
                                                                .isEmpty
                                                                ? getLocalText(
                                                                "enter_email",
                                                                context)
                                                                : isValidEmail(
                                                                input)
                                                                ? null
                                                                : getLocalText(
                                                                "enter_valid_email",
                                                                context),
                                                            onFieldSubmitted:
                                                                (v) {
                                                              FocusScope.of(
                                                                  context)
                                                                  .requestFocus(
                                                                  childMobileFocus);
                                                            },
                                                            initialValue:
                                                            model.emailId ??
                                                                '',
                                                            style: CustomStyles
                                                                .medium16
                                                                .copyWith(
                                                                color: CustomColors
                                                                    .BackGround),
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                              labelText:
                                                              getLocalText(
                                                                  "email_id",
                                                                  context),
                                                              alignLabelWithHint:
                                                              true,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Visibility(
                                                            visible: model
                                                                .isPrimary(
                                                                index,
                                                                passengerType),
                                                            child: Container(
//                                                                decoration: BoxDecoration(
//                                                                    border: Border(
//                                                                        bottom: BorderSide(
//                                                                            color:
//                                                                                CustomColors.disabledButton,
//                                                                            width: 2))),
                                                              child:
                                                              InternationalPhoneNumberInput(
                                                                focusNode:
                                                                childMobileFocus,
                                                                selectorConfig:
                                                                SelectorConfig(
                                                                    selectorType:
                                                                    PhoneInputSelectorType
                                                                        .DIALOG),
                                                                onInputChanged:
                                                                    (PhoneNumber
                                                                number) {
                                                                  FocusScope.of(
                                                                      context)
                                                                      .requestFocus(
                                                                      childMobileFocus);
                                                                  model
                                                                      .onCountryCodeChanged(
                                                                      number);
                                                                },
                                                                onFieldSubmitted:
                                                                    (v) {
                                                                  FocusScope.of(
                                                                      context)
                                                                      .requestFocus(
                                                                      childPassportFocus);
                                                                },
                                                                onInputValidated:
                                                                    (bool
                                                                value) {
                                                                  phoneNumberValidated =
                                                                      value;
                                                                },
                                                                validator:
                                                                    (value) {
                                                                  if (!phoneNumberValidated) {
                                                                    return getLocalText(
                                                                        "enter_valid_phone_number",
                                                                        context);
                                                                  }
                                                                  return null;
                                                                },
                                                                inputDecoration:
                                                                InputDecoration(
                                                                  labelStyle: CustomStyles
                                                                      .medium16
                                                                      .copyWith(
                                                                      color:
                                                                      Colors
                                                                          .grey),
                                                                  labelText: getLocalText(
                                                                      "phone_number",
                                                                      context),
//                                                                    border:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    focusedBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    enabledBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    errorBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    disabledBorder:
//                                                                        InputBorder
//                                                                            .none,
                                                                ),
                                                                ignoreBlank:
                                                                false,
                                                                initialValue:
                                                                model
                                                                    .phoneNumber,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible:
                                                      !model.isPrimary(
                                                          index,
                                                          passengerType),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          showSourceBottomSheet(
                                                              context,
                                                              model,
                                                              index,
                                                              passengerType);
                                                        },
                                                        child:

//                                                Container(
//                                                  width: double.infinity,
//                                                  padding:EdgeInsets.symmetric(vertical: 10),
//                                                  child: model.getNationality(index,passengerType)!=""?
//
//
//                                                  Text(model.getNationality(index,passengerType),style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),):
//
//                                                  Text('Nationality',style: CustomStyles.medium16.copyWith(color: Colors.grey),),
//
//                                                  decoration: BoxDecoration(
//                                                    border: Border(
//
//                                                      bottom: BorderSide(width: 1, color: CustomColors.disabledButton),
//                                                    ),
//
//                                                  ),
//
//                                                )

                                                        AbsorbPointer(
                                                          absorbing: true,
                                                          child:
                                                          TextFormField(
                                                            controller: TextEditingController(
                                                                text: model
                                                                    .getNationality(
                                                                    index,
                                                                    passengerType)),
                                                            showCursor: false,
                                                            readOnly: true,
//onSaved: (value) => pasenger.email = value.trimRight(),
                                                            validator:
                                                                (value) {
                                                              return value ==
                                                                  null ||
                                                                  value
                                                                      .isEmpty
                                                                  ? getLocalText(
                                                                  "select_nationality",
                                                                  context)
                                                                  : null;
                                                            },
//  initialValue: pasenger.email ?? '',
//  initialValue: pasenger.email ?? '',
                                                            style: CustomStyles
                                                                .medium16
                                                                .copyWith(
                                                                color: CustomColors
                                                                    .BackGround),
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                              labelText:
                                                              getLocalText(
                                                                  "nationality",
                                                                  context),
                                                              alignLabelWithHint:
                                                              true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          isDoB = true;
                                                          showDobDialog(
                                                              context,
                                                              model,
                                                              isDoB,
                                                              index,
                                                              passengerType);
                                                        },
                                                        child:

//                                                Container(
//                                                  width: double.infinity,
//                                                  padding:EdgeInsets.symmetric(vertical: 10),
//                                                  child: model.getPassengerDOB(index, passengerType)!=""?
//                                                  Text(model.getPassengerDOB(index, passengerType),style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),):
//
//                                                  Text('Date of birth',style: CustomStyles.medium16.copyWith(color: Colors.grey),),
//
//
//                                                  decoration: BoxDecoration(
//                                                    border: Border(
//
//                                                      bottom: BorderSide( width: 1,color: CustomColors.disabledButton),
//                                                    ),
//
//                                                  ),
//
//                                                )

                                                        AbsorbPointer(
                                                          child:
                                                          TextFormField(
                                                            controller: TextEditingController(
                                                                text: model
                                                                    .getPassengerDOB(
                                                                    index,
                                                                    passengerType) ??
                                                                    ""),
                                                            showCursor: false,
                                                            readOnly: true,
                                                            validator:
                                                                (value) {
                                                              if (value
                                                                  .isEmpty)
                                                                return getLocalText(
                                                                    "date_of_birth",
                                                                    context);

                                                              int age = DateTime
                                                                  .now()
                                                                  .year -
                                                                  int.parse(
                                                                      value
                                                                          .split(
                                                                          '-')[0]);

                                                              if (age >= 18)
                                                                return "Age should be lesser than 18 years for child";
                                                              else if (age <=
                                                                  2)
                                                                return "Age should be greater than 2 years for child";

                                                              return value ==
                                                                  null ||
                                                                  value
                                                                      .isEmpty
                                                                  ? getLocalText(
                                                                  "date_of_birth",
                                                                  context)
                                                                  : null;
                                                            },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
//initialValue: model.getPassengerDOB(index, passengerType) ?? '',
                                                            style: CustomStyles
                                                                .medium16
                                                                .copyWith(
                                                                color: CustomColors
                                                                    .BackGround),
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                              labelText:
                                                              getLocalText(
                                                                  "date_of_birth",
                                                                  context),
                                                              alignLabelWithHint:
                                                              true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Flexible(
                                                      child: TextFormField(
                                                        focusNode:
                                                        childPassportFocus,
                                                        validator: (value) {
                                                          final validCharacters =
                                                          RegExp(
                                                              r'[!@#$%^&*(),.?":{}|<>]');

                                                          if (value
                                                              .isNotEmpty) {
                                                            if (value
                                                                .length <
                                                                6 || value
                                                                .length > 12)
                                                              return "Enter Valid Passport Number";
                                                            else
                                                            if (validCharacters
                                                                .hasMatch(
                                                                value))
                                                              return "Enter Valid Passport Number";
                                                          }
                                                          return value ==
                                                              null ||
                                                              value
                                                                  .isEmpty
                                                              ? getLocalText(
                                                              "passport_number_is_required",
                                                              context)
                                                              : null;
                                                        },
                                                        onSaved: (v) {
                                                          FocusManager
                                                              .instance
                                                              .primaryFocus
                                                              .unfocus();
                                                        },
//                                                                onFieldSubmitted: (v){
//
//                                                                },
                                                        onChanged: (value) =>
                                                            model
                                                                .setPassengerPassportNumber(
                                                                index,
                                                                passengerType,
                                                                value),
                                                        initialValue: model
                                                            .getPassengerPassportNumber(
                                                            index,
                                                            passengerType),
                                                        style: CustomStyles
                                                            .medium16
                                                            .copyWith(
                                                            color: CustomColors
                                                                .BackGround),
                                                        decoration:
                                                        InputDecoration(
                                                          labelStyle: CustomStyles
                                                              .medium16
                                                              .copyWith(
                                                              color: Colors
                                                                  .grey),
                                                          labelText: getLocalText(
                                                              "passport_number",
                                                              context),
                                                          alignLabelWithHint:
                                                          true,
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                        child:
                                                        GestureDetector(
                                                          onTap: () {
                                                            isDoB = false;

                                                            showDobDialog(
                                                                context,
                                                                model,
                                                                isDoB,
                                                                index,
                                                                passengerType);
                                                          },
                                                          child:
//
                                                          AbsorbPointer(
                                                            absorbing: true,
                                                            child: TextFormField(
                                                              controller: TextEditingController(
                                                                  text: model
                                                                      .getPassengerPassportExpData(
                                                                      index,
                                                                      passengerType)),
                                                              validator: (
                                                                  value) {
                                                                if (!value
                                                                    .isEmpty) {
                                                                  var date =
                                                                  DateTime
                                                                      .now();
                                                                  if (!model
                                                                      .tempDate
                                                                      .isAfter(
                                                                      new DateTime(
                                                                          date
                                                                              .year,
                                                                          date
                                                                              .month +
                                                                              6,
                                                                          date
                                                                              .day)))
                                                                    return "Passport expiry should be greater than six months";
                                                                }
                                                                return value
                                                                    .isEmpty
                                                                    ? getLocalText(
                                                                    "enter_passport_expiry_date",
                                                                    context)
                                                                // : isValidExpiryDate(value)?getLocalText("please_select_passport_expiry_after_3_months", context)
                                                                    : null;
                                                              },
                                                              style: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: CustomColors
                                                                      .BackGround),
                                                              decoration:
                                                              InputDecoration(
                                                                labelStyle: CustomStyles
                                                                    .medium16
                                                                    .copyWith(
                                                                    color: Colors
                                                                        .grey),
                                                                labelText:
                                                                getLocalText(
                                                                    "passport_expiry",
                                                                    context),
                                                                alignLabelWithHint:
                                                                true,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomRight,
                                                      child: RaisedButton(
                                                          color: CustomColors
                                                              .Orange,
                                                          child: Text(
                                                            getLocalText(
                                                                "save",
                                                                context),
// strings.save.toUpperCase(),
                                                            style: CustomStyles
                                                                .button_style,
                                                          ),
                                                          shape:
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10.0),
                                                          ),
                                                          onPressed:
                                                              () async {
                                                            if (_formState
                                                                .currentState
                                                                .validate()) {
                                                              contentFilledList
                                                                  .forEach(
                                                                      (
                                                                      element) {
                                                                    if (element
                                                                        .passangerType ==
                                                                        1 &&
                                                                        element
                                                                            .index ==
                                                                            index)
                                                                      element
                                                                          .isFilled =
                                                                      true;
                                                                  });
                                                              model
                                                                  .enabledEditMode(
                                                                  passengerType,
                                                                  index);
                                                              _formState
                                                                  .currentState
                                                                  .save();
//model.enableNext(passengerType,index);
                                                            }
                                                          }),
                                                    )
                                                  ],
                                                ),
                                              )),
                                          SizedBox(
                                            height: SizeConstants.SIZE_6,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                )),
                          ),

//  model.flightResultsData.requestData.infants!=0?

                          Visibility(
                            visible: model.flightResultsData.requestData
                                .infants !=
                                0,
                            child: Container(
                                child: Column(
                                  children: List.generate(
                                      model.flightResultsData.requestData
                                          .infants, (int index) {
                                    int passengerType = 2;

                                    print("Started");

                                    bool phoneNumberValidated = false;

                                    ///For dateSelectionDialog --dob or passport_expiry_date  selection
                                    bool isDoB;

                                    return Container(
//                                              margin:
//                                                  EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                contentFilledList
                                                    .forEach((element) {
                                                  if (element.passangerType ==
                                                      passengerType &&
                                                      element.index == index)
                                                    element.isFilled = false;
                                                });
                                                model
                                                    .enabledEditModeOnContinue(
                                                    index, passengerType);
                                              },
                                              child: Container(
                                                color: model.getPassengerName(
                                                    index,
                                                    passengerType) ==
                                                    ""
                                                    ? CustomColors.Orange
                                                    : CustomColors.BackGround,
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                height: 50,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: SizeConstants
                                                          .SIZE_4),
                                                  width:
                                                  MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: CustomColors.White,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        spreadRadius: 0.5,
                                                        blurRadius: 0.5,

                                                        offset: Offset(0,
                                                            1), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Visibility(
                                                          visible: model
                                                              .getPassengerName(
                                                              index,
                                                              passengerType) ==
                                                              "",
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                SizeConstants
                                                                    .SIZE_12),
                                                            child: Text(
                                                                model.isPrimary(
                                                                    index,
                                                                    passengerType)
                                                                    ? getLocalText(
                                                                    "primary",
                                                                    context)
                                                                    : "${getLocalText(
                                                                    "infant",
                                                                    context)}"
                                                                    "${index +
                                                                    1}",
                                                                style: CustomStyles
                                                                    .medium16),
                                                          )),
                                                      Visibility(
                                                          visible: model
                                                              .getPassengerName(
                                                              index,
                                                              passengerType) !=
                                                              "",
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                SizeConstants
                                                                    .SIZE_12),
                                                            child: Row(
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                    "assets/images/user.svg",
                                                                    width: SizeConstants
                                                                        .SIZE_20,
                                                                    height: SizeConstants
                                                                        .SIZE_20,
                                                                    color: Colors
                                                                        .black54),
                                                                SizedBox(
                                                                  width: SizeConstants
                                                                      .SIZE_8,
                                                                ),
                                                                Text(
                                                                    model
                                                                        .getPassengerName(
                                                                        index,
                                                                        passengerType),
                                                                    style: CustomStyles
                                                                        .medium16
                                                                        .copyWith(
                                                                        color: CustomColors
                                                                            .BackGround)),
                                                                SizedBox(
                                                                  width: SizeConstants
                                                                      .SIZE_8,
                                                                ),
                                                                Flexible(
                                                                  child: Text(
                                                                    model
                                                                        .getPassengerLastName(
                                                                        index,
                                                                        passengerType),
                                                                    style: CustomStyles
                                                                        .medium16
                                                                        .copyWith(
                                                                        color: CustomColors
                                                                            .BackGround),
                                                                    overflow: TextOverflow
                                                                        .fade,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                          Visibility(
                                              maintainSize: false,
                                              visible: model.areDetailsShown(
                                                  index, passengerType),
                                              child: Container(
// margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                      Alignment.center,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .width /
                                                                10 *
                                                                4,
                                                            height: MediaQuery
                                                                .of(
                                                                context)
                                                                .size
                                                                .height /
                                                                10 *
                                                                .5,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    20),
                                                                color: CustomColors
                                                                    .TabDisabled),
                                                            margin: EdgeInsets
                                                                .only(
                                                                left: 0,
                                                                right: 0,
                                                                top: 20),
                                                            child: Stack(
                                                              alignment:
                                                              Alignment
                                                                  .center,
                                                              children: <
                                                                  Widget>[
                                                                AnimatedContainer(
                                                                  duration: Duration(
                                                                      microseconds:
                                                                      1000),
                                                                  alignment: model
                                                                      .getGender(
                                                                      index,
                                                                      passengerType)
                                                                      ? Alignment
                                                                      .bottomLeft
                                                                      : Alignment
                                                                      .bottomRight,
                                                                  child:
                                                                  Container(
                                                                    height: MediaQuery
                                                                        .of(
                                                                        context)
                                                                        .size
                                                                        .height /
                                                                        10 *
                                                                        .7,
                                                                    width: MediaQuery
                                                                        .of(
                                                                        context)
                                                                        .size
                                                                        .width /
                                                                        10 *
                                                                        2,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          20),
                                                                      color: CustomColors
                                                                          .BackGround,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Expanded(
                                                                          child:
                                                                          GestureDetector(
                                                                            child:
                                                                            Container(
                                                                              alignment:
                                                                              Alignment
                                                                                  .center,
                                                                              height:
                                                                              double
                                                                                  .infinity,
                                                                              width:
                                                                              double
                                                                                  .infinity,
                                                                              child: Text(
                                                                                  getLocalText(
                                                                                      "male",
                                                                                      context),
                                                                                  textAlign: TextAlign
                                                                                      .center,
                                                                                  style: model
                                                                                      .getGender(
                                                                                      index,
                                                                                      passengerType)
                                                                                      ? CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12)
                                                                                      : CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12,
                                                                                      color: CustomColors
                                                                                          .disabledButton)),
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              model
                                                                                  .setGender(
                                                                                  index,
                                                                                  passengerType,
                                                                                  0);
                                                                            },
                                                                          )),
                                                                      Expanded(
                                                                          child:
                                                                          GestureDetector(
                                                                            child:
                                                                            Container(
                                                                              alignment:
                                                                              Alignment
                                                                                  .center,
                                                                              height:
                                                                              double
                                                                                  .infinity,
                                                                              width:
                                                                              double
                                                                                  .infinity,
                                                                              child: Text(
                                                                                  getLocalText(
                                                                                      "female",
                                                                                      context),
                                                                                  textAlign: TextAlign
                                                                                      .center,
                                                                                  style: !model
                                                                                      .getGender(
                                                                                      index,
                                                                                      passengerType)
                                                                                      ? CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12)
                                                                                      : CustomStyles
                                                                                      .button_style
                                                                                      .copyWith(
                                                                                      fontSize: 12,
                                                                                      color: CustomColors
                                                                                          .disabledButton)),
                                                                            ),
                                                                            onTap:
                                                                                () {
                                                                              model
                                                                                  .setGender(
                                                                                  index,
                                                                                  passengerType,
                                                                                  1);
                                                                            },
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: SizeConstants
                                                          .SIZE_12,
                                                    ),
                                                    Flexible(
                                                      child: TextFormField(
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                              30),
                                                        ],
                                                        onFieldSubmitted:
                                                            (v) {
                                                          FocusScope.of(
                                                              context)
                                                              .requestFocus(
                                                              infantLastNameFocus);
                                                        },
                                                        validator: (value) {
                                                          return value ==
                                                              null ||
                                                              value
                                                                  .isEmpty
                                                              ? getLocalText(
                                                              "enter_first_name",
                                                              context)
                                                              : null;
                                                        },
                                                        onChanged: (value) =>
                                                            model
                                                                .setPassengerName(
                                                                index,
                                                                passengerType,
                                                                value),
                                                        initialValue: model
                                                            .getPassengerName(
                                                            index,
                                                            passengerType),
                                                        style: CustomStyles
                                                            .medium16
                                                            .copyWith(
                                                            color: CustomColors
                                                                .BackGround),
                                                        decoration:
                                                        InputDecoration(
                                                          labelStyle: CustomStyles
                                                              .medium16
                                                              .copyWith(
                                                              color: Colors
                                                                  .grey),
                                                          labelText:
                                                          getLocalText(
                                                              "first_name",
                                                              context),
                                                          alignLabelWithHint:
                                                          true,
                                                        ),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                            30),
                                                      ],
                                                      focusNode:
                                                      infantLastNameFocus,
                                                      validator: (value) {
                                                        final validCharacters =
                                                        RegExp(
                                                            r'[01234567890!@#$%^&*(),.?":{}|<>]');

                                                        if (validCharacters
                                                            .hasMatch(value))
                                                          return "Enter Correct Name";

                                                        return value ==
                                                            null ||
                                                            value.isEmpty
                                                            ? getLocalText(
                                                            "enter_last_name",
                                                            context)
                                                            : null;
                                                      },
                                                      onFieldSubmitted: (v) {
                                                        FocusScope.of(context)
                                                            .requestFocus(model
                                                            .isPrimary(
                                                            index,
                                                            passengerType)
                                                            ? infantEmailFocus
                                                            : infantPassportFocus);
                                                      },
                                                      onChanged: (value) =>
                                                          model
                                                              .setPassengerLastName(
                                                              index,
                                                              passengerType,
                                                              value),
                                                      initialValue: model
                                                          .getPassengerLastName(
                                                          index,
                                                          passengerType),
                                                      style: CustomStyles
                                                          .medium16
                                                          .copyWith(
                                                          color: CustomColors
                                                              .BackGround),
                                                      decoration:
                                                      InputDecoration(
                                                        labelStyle: CustomStyles
                                                            .medium16
                                                            .copyWith(
                                                            color: Colors
                                                                .grey),
                                                        labelText:
                                                        getLocalText(
                                                            "last_name",
                                                            context),
                                                        alignLabelWithHint:
                                                        true,
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible:
                                                      model.isPrimary(
                                                          index,
                                                          passengerType),
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          TextFormField(
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  30),
                                                            ],
                                                            focusNode:
                                                            infantEmailFocus,
                                                            onChanged:
                                                                (value) =>
                                                                model
                                                                    .setPassengersEmail(
                                                                    value),
                                                            validator: (
                                                                input) =>
                                                            input
                                                                .isEmpty
                                                                ? getLocalText(
                                                                "enter_email",
                                                                context)
                                                                : isValidEmail(
                                                                input)
                                                                ? null
                                                                : getLocalText(
                                                                "enter_valid_email",
                                                                context),
                                                            onFieldSubmitted:
                                                                (v) {
                                                              FocusScope.of(
                                                                  context)
                                                                  .requestFocus(
                                                                  infantMobileFocus);
                                                            },
                                                            initialValue:
                                                            model.emailId ??
                                                                '',
                                                            style: CustomStyles
                                                                .medium16
                                                                .copyWith(
                                                                color: CustomColors
                                                                    .BackGround),
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                              labelText:
                                                              getLocalText(
                                                                  "email_id",
                                                                  context),
                                                              alignLabelWithHint:
                                                              true,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Visibility(
                                                            visible: model
                                                                .isPrimary(
                                                                index,
                                                                passengerType),
                                                            child: Container(
//                                                                decoration: BoxDecoration(
//                                                                    border: Border(
//                                                                        bottom: BorderSide(
//                                                                            color:
//                                                                                Colors.grey,
//                                                                            width: 1))),
                                                              child:
                                                              InternationalPhoneNumberInput(
                                                                focusNode:
                                                                infantMobileFocus,
                                                                selectorConfig:
                                                                SelectorConfig(
                                                                    selectorType:
                                                                    PhoneInputSelectorType
                                                                        .DIALOG),
                                                                onInputChanged:
                                                                    (PhoneNumber
                                                                number) {
                                                                  model
                                                                      .onCountryCodeChanged(
                                                                      number);
                                                                },
                                                                onFieldSubmitted:
                                                                    (v) {
                                                                  FocusScope.of(
                                                                      context)
                                                                      .requestFocus(
                                                                      infantPassportFocus);
                                                                },
                                                                onInputValidated:
                                                                    (bool
                                                                value) {
                                                                  FocusScope.of(
                                                                      context)
                                                                      .requestFocus(
                                                                      infantMobileFocus);
                                                                  phoneNumberValidated =
                                                                      value;
                                                                },
                                                                validator:
                                                                    (value) {
                                                                  if (!phoneNumberValidated) {
                                                                    return getLocalText(
                                                                        "enter_valid_phone_number",
                                                                        context);
                                                                  }
                                                                  return null;
                                                                },
                                                                inputDecoration:
                                                                InputDecoration(
                                                                  labelStyle: CustomStyles
                                                                      .medium16
                                                                      .copyWith(
                                                                      color:
                                                                      Colors
                                                                          .grey),
                                                                  labelText: getLocalText(
                                                                      "enter_phone_number",
                                                                      context),
//                                                                    border:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    focusedBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    enabledBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    errorBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    disabledBorder:
//                                                                        InputBorder
//                                                                            .none,
                                                                ),
                                                                ignoreBlank:
                                                                false,
                                                                initialValue:
                                                                model
                                                                    .phoneNumber,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible:
                                                      !model.isPrimary(
                                                          index,
                                                          passengerType),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          showSourceBottomSheet(
                                                              context,
                                                              model,
                                                              index,
                                                              passengerType);
                                                        },
                                                        child: AbsorbPointer(
                                                          absorbing: true,
                                                          child:
                                                          TextFormField(
                                                            controller: TextEditingController(
                                                                text: model
                                                                    .getNationality(
                                                                    index,
                                                                    passengerType)),
                                                            showCursor: false,
                                                            readOnly: true,
                                                            validator:
                                                                (value) {
                                                              return value ==
                                                                  null ||
                                                                  value
                                                                      .isEmpty
                                                                  ? getLocalText(
                                                                  "select_nationality",
                                                                  context)
                                                                  : null;
                                                            },
                                                            style: CustomStyles
                                                                .medium16
                                                                .copyWith(
                                                                color: CustomColors
                                                                    .BackGround),
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                              labelText:
                                                              getLocalText(
                                                                  "nationality",
                                                                  context),
                                                              alignLabelWithHint:
                                                              true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          isDoB = true;
                                                          showDobDialog(
                                                              context,
                                                              model,
                                                              isDoB,
                                                              index,
                                                              passengerType);
                                                        },
                                                        child:

//                                                Container(
//                                                  width: double.infinity,
//                                                  padding:EdgeInsets.symmetric(vertical: 10),
//                                                  child: model.getPassengerDOB(index, passengerType)!=""?
//                                                  Text(model.getPassengerDOB(index, passengerType),style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),):
//
//                                                  Text('Date of birth',style: CustomStyles.medium16.copyWith(color: Colors.grey),),
//
//
//                                                  decoration: BoxDecoration(
//                                                    border: Border(
//
//                                                      bottom: BorderSide( width: 1,color: CustomColors.disabledButton),
//                                                    ),
//
//                                                  ),
//
//                                                )

                                                        AbsorbPointer(
                                                          child:
                                                          TextFormField(
                                                            controller: TextEditingController(
                                                                text: model
                                                                    .getPassengerDOB(
                                                                    index,
                                                                    passengerType) ??
                                                                    ""),
                                                            showCursor: false,
                                                            readOnly: true,
                                                            validator:
                                                                (value) {
                                                              if (value
                                                                  .isEmpty)
                                                                return getLocalText(
                                                                    "date_of_birth",
                                                                    context);

                                                              int age = DateTime
                                                                  .now()
                                                                  .year -
                                                                  int.parse(
                                                                      value
                                                                          .split(
                                                                          '-')[0]);

                                                              if (age > 2)
                                                                return "Age should be lesser than 2 years for infants";

                                                              return value ==
                                                                  null ||
                                                                  value
                                                                      .isEmpty
                                                                  ? getLocalText(
                                                                  "date_of_birth",
                                                                  context)
                                                                  : null;
                                                            },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
//initialValue: model.getPassengerDOB(index, passengerType) ?? '',
                                                            style: CustomStyles
                                                                .medium16
                                                                .copyWith(
                                                                color: CustomColors
                                                                    .BackGround),
                                                            decoration:
                                                            InputDecoration(
                                                              labelStyle: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                              labelText:
                                                              getLocalText(
                                                                  "date_of_birth",
                                                                  context),
                                                              alignLabelWithHint:
                                                              true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Flexible(
                                                      child: TextFormField(
                                                        focusNode:
                                                        infantPassportFocus,
                                                        validator: (value) {
                                                          final validCharacters =
                                                          RegExp(
                                                              r'[!@#$%^&*(),.?":{}|<>]');

                                                          if (value
                                                              .isNotEmpty) {
                                                            if (value
                                                                .length <
                                                                6 || value
                                                                .length > 12)
                                                              return "Enter Valid Passport Number";
                                                            else
                                                            if (validCharacters
                                                                .hasMatch(
                                                                value))
                                                              return "Enter Valid Passport Number";
                                                          }
                                                          return value ==
                                                              null ||
                                                              value
                                                                  .isEmpty
                                                              ? getLocalText(
                                                              "passport_number_is_required",
                                                              context)
                                                              : null;
                                                        },
                                                        onSaved: (v) {
                                                          FocusManager
                                                              .instance
                                                              .primaryFocus
                                                              .unfocus();
                                                        },
//                                                                onFieldSubmitted: (v){
//
//                                                                },
                                                        onChanged: (value) =>
                                                            model
                                                                .setPassengerPassportNumber(
                                                                index,
                                                                passengerType,
                                                                value),
                                                        initialValue: model
                                                            .getPassengerPassportNumber(
                                                            index,
                                                            passengerType),
                                                        style: CustomStyles
                                                            .medium16
                                                            .copyWith(
                                                            color: CustomColors
                                                                .BackGround),
                                                        decoration:
                                                        InputDecoration(
                                                          labelStyle: CustomStyles
                                                              .medium16
                                                              .copyWith(
                                                              color: Colors
                                                                  .grey),
                                                          labelText: getLocalText(
                                                              "passport_number",
                                                              context),
                                                          alignLabelWithHint:
                                                          true,
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                        child:
                                                        GestureDetector(
                                                          onTap: () {
                                                            isDoB = false;

                                                            showDobDialog(
                                                                context,
                                                                model,
                                                                isDoB,
                                                                index,
                                                                passengerType);
                                                          },
                                                          child:
//
                                                          AbsorbPointer(
                                                            absorbing: true,
                                                            child: TextFormField(
                                                              controller: TextEditingController(
                                                                  text: model
                                                                      .getPassengerPassportExpData(
                                                                      index,
                                                                      passengerType)),

                                                              validator: (
                                                                  value) {
                                                                if (!value
                                                                    .isEmpty) {
                                                                  var date = DateTime
                                                                      .now();
                                                                  if (!model
                                                                      .tempDate
                                                                      .isAfter(
                                                                      new DateTime(
                                                                          date
                                                                              .year,
                                                                          date
                                                                              .month +
                                                                              6,
                                                                          date
                                                                              .day)))
                                                                    return "Passport expiry should be greater than six months";
                                                                }
                                                                return value ==
                                                                    null ||
                                                                    value
                                                                        .isEmpty
                                                                    ? getLocalText(
                                                                    "enter_passport_expiry_date",
                                                                    context)
                                                                    : null;
                                                              },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
// initialValue: model.getPassengerPassportExpData(index, passengerType),
                                                              style: CustomStyles
                                                                  .medium16
                                                                  .copyWith(
                                                                  color: CustomColors
                                                                      .BackGround),
                                                              decoration:
                                                              InputDecoration(
                                                                labelStyle: CustomStyles
                                                                    .medium16
                                                                    .copyWith(
                                                                    color: Colors
                                                                        .grey),
                                                                labelText:
                                                                getLocalText(
                                                                    "passport_expiry",
                                                                    context),
                                                                alignLabelWithHint:
                                                                true,
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                    Align(
                                                      alignment: Alignment
                                                          .bottomRight,
                                                      child: RaisedButton(
                                                          color: CustomColors
                                                              .Orange,
                                                          child: Text(
                                                            getLocalText(
                                                                "save",
                                                                context),
// strings.save.toUpperCase(),
                                                            style: CustomStyles
                                                                .button_style,
                                                          ),
                                                          shape:
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                10.0),
                                                          ),
                                                          onPressed:
                                                              () async {
                                                            if (_formState
                                                                .currentState
                                                                .validate()) {
                                                              contentFilledList
                                                                  .forEach(
                                                                      (
                                                                      element) {
                                                                    if (element
                                                                        .passangerType ==
                                                                        2 &&
                                                                        element
                                                                            .index ==
                                                                            index)
                                                                      element
                                                                          .isFilled =
                                                                      true;
                                                                  });
                                                              model
                                                                  .enabledEditMode(
                                                                  passengerType,
                                                                  index);
                                                              _formState
                                                                  .currentState
                                                                  .save();
//model.enableNext(passengerType,index);
                                                            }
                                                          }),
                                                    )
                                                  ],
                                                ),
                                              )),
                                          SizedBox(
                                            height: SizeConstants.SIZE_6,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                flex: 6,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      model.flightResultsData.currency +
                                          " " +
                                          (model.flightResultsData
                                              .baseRate)
                                              .toStringAsFixed(2),
                                      style: CustomStyles.appbar.copyWith(
                                          color: CustomColors.BackGround),
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Wrap(
                                      spacing: 1.2,
//
                                      alignment: WrapAlignment.start,
                                      direction: Axis.horizontal,

//

                                      children: <Widget>[
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            model
                                                .flightResultsData
                                                .requestData
                                                .adults !=
                                                0
                                                ? Text(
                                                '${getLocalText(
                                                    "adult", context)} ${model
                                                    .flightResultsData
                                                    .requestData.adults} | ',
                                                style: CustomStyles
                                                    .calenderStyle
                                                    .copyWith(
                                                    color: CustomColors
                                                        .heading
                                                        .withOpacity(
                                                        .5)))
                                                : SizedBox.shrink(),
                                            model
                                                .flightResultsData
                                                .requestData
                                                .children !=
                                                0
                                                ? Text(
                                                '${getLocalText("children",
                                                    context)} ${model
                                                    .flightResultsData
                                                    .requestData.children} | ',
                                                style: CustomStyles
                                                    .calenderStyle
                                                    .copyWith(
                                                    color: CustomColors
                                                        .heading
                                                        .withOpacity(
                                                        .5)))
                                                : SizedBox.shrink(),
                                            model
                                                .flightResultsData
                                                .requestData
                                                .infants !=
                                                0
                                                ? Text(
                                                '${getLocalText(
                                                    "infants", context)} ${model
                                                    .flightResultsData
                                                    .requestData.infants} | ',
                                                style: CustomStyles
                                                    .calenderStyle
                                                    .copyWith(
                                                    color: CustomColors
                                                        .heading
                                                        .withOpacity(
                                                        .5)))
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                        Text(
                                          model
                                              .flightResultsData
                                              .requestData
                                              .cabinSelection_name,
                                          style: CustomStyles
                                              .calenderStyle
                                              .copyWith(
                                              color: CustomColors
                                                  .heading
                                                  .withOpacity(.5)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 4,
                                child: RaisedButton(
                                    child: Text(
                                      getLocalText("continue", context),
                                      style: CustomStyles.button_style,
                                    ),
                                    color: CustomColors.Orange,
                                    padding: EdgeInsets.all(12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                    onPressed: () {
                                      bool isAllValid = false;

                                      var list = contentFilledList;

                                      for (int i = 0;
                                      i < contentFilledList.length;
                                      i++) {
                                        if (!contentFilledList[i]
                                            .isFilled) {
                                          model.enabledEditModeOnContinue(
                                              contentFilledList[i].index,
                                              contentFilledList[i]
                                                  .passangerType);

                                          break;
                                        }

                                        if (i ==
                                            contentFilledList.length - 1)
                                          isAllValid = true;
                                      }

                                      _formState.currentState.validate();
                                      if (isAllValid) {
                                        if (_formState.currentState
                                            .validate())
                                          Navigator.pushNamed(context,
                                              Routes.flightPaymentOptions,
                                              arguments:
                                              model.getArguments());
                                      }
//                                            if(model.showAdultDetails[0])
//                                             model.enabledEditMode(0, 0);
//                                            else {
//                                              if (_formState.currentState
//                                                  .validate())
//                                                Navigator.pushNamed(
//                                                    context,
//                                                    Routes.flightPaymentOptions,
//                                                    arguments: model
//                                                        .getArguments());
//                                           }
//                                            // }
//  if(_formState.currentState.validate()&&_child_formState.currentState.validate()&&_infant_formState.currentState.validate()) {
//                                      _formState.currentState.save();
//
//                                      _child_formState.currentState.save();
//
//                                      _infant_formState.currentState.save();
                                    }))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );


  }
  Widget primaryContainer(passengerType,index,model,isDoB,context)
  {
    return  Container(
//                                              margin:
//                                                  EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
              onTap: () {
                contentFilledList
                    .forEach((element) {
                  if (element.passangerType ==
                      passengerType &&
                      element.index == index)
                    element.isFilled = false;
                });

                model
                    .enabledEditModeOnContinue(
                    index, passengerType);
              },
              child: Container(
                color: model.getPassengerName(
                    index,
                    passengerType) ==
                    ""
                    ? CustomColors.Orange
                    : CustomColors.BackGround,
                width: MediaQuery.of(context)
                    .size
                    .width,
                height: 50,
                child: Container(
                  margin: EdgeInsets.only(
                      left: SizeConstants
                          .SIZE_4),
                  width:
                  MediaQuery.of(context)
                      .size
                      .width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: CustomColors.White,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.1),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,

                        offset: Offset(0,
                            1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                    crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                    children: [
                      Visibility(
                          visible: model
                              .getPassengerName(
                              index,
                              passengerType) ==
                              "",
                          child: Container(
                            margin: EdgeInsets
                                .symmetric(
                                horizontal:
                                SizeConstants
                                    .SIZE_12),
                            child: Text(
                                index == 0
                                    ? "${getLocalText("primary", context)}"
                                    : "${getLocalText("adult", context)}" +
                                    "${index + 1}",
                                style: CustomStyles
                                    .medium16),
                          )),
                      Visibility(
                          visible: model
                              .getPassengerName(
                              index,
                              passengerType) !=
                              "",
                          child: Container(
                            margin: EdgeInsets
                                .symmetric(
                                horizontal:
                                SizeConstants
                                    .SIZE_12),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/user.svg",
                                    width: SizeConstants
                                        .SIZE_20,
                                    height: SizeConstants
                                        .SIZE_20,
                                    color: Colors
                                        .black54),
                                SizedBox(
                                  width: SizeConstants
                                      .SIZE_8,
                                ),
                                Text(
                                    model.getPassengerName(
                                        index,
                                        passengerType),
                                    style: CustomStyles
                                        .medium16
                                        .copyWith(
                                        color: CustomColors.BackGround)),
                                SizedBox(
                                  width: SizeConstants.SIZE_8,
                                ),
                                Flexible(
                                  child: Text(
                                    model.getPassengerLastName(
                                        index,
                                        passengerType),
                                    style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                    overflow: TextOverflow.fade,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              )),
          Visibility(
              maintainSize: false,
              visible: model.areDetailsShown(
                  index, passengerType),
              child: Container(
// margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  mainAxisSize:
                  MainAxisSize.min,
                  children: [
                    Align(
                      alignment:
                      Alignment.center,
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .center,
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                        mainAxisSize:
                        MainAxisSize.min,
                        children: [
                          Container(
                            width: MediaQuery.of(
                                context)
                                .size
                                .width /
                                10 *
                                4,
                            height: MediaQuery.of(
                                context)
                                .size
                                .height /
                                10 *
                                .5,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    20),
                                color: CustomColors
                                    .TabDisabled),
                            margin: EdgeInsets
                                .only(
                                left: 0,
                                right: 0,
                                top: 20),
                            child: Stack(
                              alignment:
                              Alignment
                                  .center,
                              children: <
                                  Widget>[
                                AnimatedContainer(
                                  duration: Duration(
                                      microseconds:
                                      1000),
                                  alignment: model.getGender(
                                      index,
                                      passengerType)
                                      ? Alignment
                                      .bottomLeft
                                      : Alignment
                                      .bottomRight,
                                  child:
                                  Container(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height /
                                        10 *
                                        .7,
                                    width: MediaQuery.of(context)
                                        .size
                                        .width /
                                        10 *
                                        2,
                                    decoration:
                                    BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      color: CustomColors
                                          .BackGround,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <
                                        Widget>[




                                      Expanded(
                                          child:
                                          GestureDetector(
                                            child:
                                            Container(
                                              alignment:
                                              Alignment.center,
                                              height:
                                              double.infinity,
                                              width:
                                              double.infinity,
                                              child: Text(getLocalText("male", context),
                                                  textAlign: TextAlign.center,
                                                  style: model.getGender(index, passengerType) ? CustomStyles.button_style.copyWith(fontSize: 12) : CustomStyles.button_style.copyWith(fontSize: 12, color: CustomColors.disabledButton)),
                                            ),
                                            onTap:
                                                () {
                                              model.setGender(
                                                  index,
                                                  passengerType,
                                                  0);
                                            },
                                          )),
                                      Expanded(
                                          child:
                                          GestureDetector(
                                            child:
                                            Container(
                                              alignment:
                                              Alignment.center,
                                              height:
                                              double.infinity,
                                              width:
                                              double.infinity,
                                              child: Text(getLocalText("female", context),
                                                  textAlign: TextAlign.center,
                                                  style: !model.getGender(index, passengerType) ? CustomStyles.button_style.copyWith(fontSize: 12) : CustomStyles.button_style.copyWith(fontSize: 12, color: CustomColors.disabledButton)),
                                            ),
                                            onTap: () {

                                              model.setGender(index, passengerType, 1);

                                            },
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeConstants
                          .SIZE_12,
                    ),
                    Flexible(
                      child: TextFormField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(30),
                        ],
                        onFieldSubmitted:
                            (v) {
                          FocusScope.of(
                              context)
                              .requestFocus(adultLastNameFocus);
                        },
                        validator: (value) {
                          final validCharacters =
                          RegExp(
                              r'[0123456789!@#$%^&*(),.?":{}|<>]');

                          if (validCharacters
                              .hasMatch(
                              value))
                            return "Enter Correct Name";

                          return value ==
                              null ||
                              value
                                  .isEmpty
                              ? getLocalText(
                              "enter_first_name",
                              context)
                              : null;
                        },
                        onSaved: (value){
                          model.setPassengerName(
                              index,
                              passengerType,
                              value);
                        },
//                                                          onChanged: (value) =>
//                                                              model.setPassengerName(
//                                                                  index,
//                                                                  passengerType,
//                                                                  value),
                        initialValue:index==0&&!SessionManager.getInstance().isGuest&&!contentFilledList[0].isPrimaryFilled?SessionManager.getInstance().getUser.firstName: model
                            .getPassengerName(
                            index,
                            passengerType),
                        style: CustomStyles
                            .medium16
                            .copyWith(
                            color: CustomColors
                                .BackGround),
                        decoration:
                        InputDecoration(
                          labelStyle: CustomStyles
                              .medium16
                              .copyWith(
                              color: Colors
                                  .grey),
                          labelText:
                          getLocalText(
                              "first_name",
                              context),
                          alignLabelWithHint:
                          true,
                        ),
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      focusNode:
                      adultLastNameFocus,
                      validator: (value) {
                        final validCharacters =
                        RegExp(
                            r'[01234567890!@#$%^&*(),.?":{}|<>]');

                        if (validCharacters
                            .hasMatch(value))
                          return "Enter Correct Name";

                        if (value == null ||
                            value.isEmpty) {
                          return getLocalText(
                              "enter_last_name",
                              context);
                        }
                        return null;
                      },
                      onFieldSubmitted: (v) {
                        FocusScope.of(context)
                            .requestFocus(model
                            .isPrimary(
                            index,
                            passengerType)
                            ? adultEmailFocus
                            : adultPassportFocus);
                      },
                      onSaved: (value){
                        model.setPassengerLastName(
                            index,
                            passengerType,
                            value);
                      },
//                                                        onChanged: (value) => model
//                                                            .setPassengerLastName(
//                                                                index,
//                                                                passengerType,
//                                                                value),

                      initialValue:index==0&&!SessionManager.getInstance().isGuest&&!contentFilledList[0].isPrimaryFilled?SessionManager.getInstance().getUser.lastName: model
                          .getPassengerLastName(
                          index,
                          passengerType),
                      style: CustomStyles
                          .medium16
                          .copyWith(
                          color: CustomColors
                              .BackGround),
                      decoration:
                      InputDecoration(
                        labelStyle: CustomStyles
                            .medium16
                            .copyWith(
                            color: Colors
                                .grey),
                        labelText:
                        getLocalText(
                            "last_name",
                            context),
                        alignLabelWithHint:
                        true,
                      ),
                    ),
                    Visibility(
                      visible:
                      model.isPrimary(
                          index,
                          passengerType),
                      child: Column(
                        mainAxisSize:
                        MainAxisSize.min,
                        children: [
                          TextFormField(

                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                            ],
                            focusNode:
                            adultEmailFocus,

                            onSaved: (value){
                              model
                                  .setPassengersEmail(
                                  value);
                            },
//                                                              onChanged:
//                                                                  (value) => model
//                                                                      .setPassengersEmail(
//                                                                          value),
                            validator: (input) => input
                                .isEmpty
                                ? getLocalText(
                                "enter_email",
                                context)
                                : isValidEmail(
                                input)
                                ? null
                                : getLocalText(
                                "enter_valid_email",
                                context),
                            onFieldSubmitted:
                                (v) {
                              FocusScope.of(
                                  context)
                                  .requestFocus(
                                  adultMobileFocus);
                            },

                            initialValue:
                            index==0&&!SessionManager.getInstance().isGuest&&!contentFilledList[0].isPrimaryFilled?SessionManager.getInstance().getUser.email:model.emailId??"",
                            style: CustomStyles
                                .medium16
                                .copyWith(
                                color: CustomColors
                                    .BackGround),
                            decoration:
                            InputDecoration(
                              labelStyle: CustomStyles
                                  .medium16
                                  .copyWith(
                                  color: Colors
                                      .grey),
                              labelText:
                              getLocalText(
                                  "email_id",
                                  context),
                              alignLabelWithHint:
                              true,
                            ),

                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            visible: model
                                .isPrimary(
                                index,
                                passengerType),
                            child: Container(
//                                                                decoration: BoxDecoration(
//                                                                    border: Border(
//                                                                        bottom: BorderSide(
//                                                                            color:
//                                                                                CustomColors.disabledButton,
//                                                                            width: 2))),
                              child:
                              InternationalPhoneNumberInput(
                                countrySelectorScrollControlled: true,
                                focusNode:
                                adultMobileFocus,

                                selectorConfig:
                                SelectorConfig(
                                    selectorType:
                                    PhoneInputSelectorType.DIALOG),
                                onInputChanged:
                                    (PhoneNumber
                                number) {
                                  if(number.toString() ==number.dialCode)
                                    FocusScope.of(context).requestFocus(adultMobileFocus);
                                  model.onCountryCodeChanged(
                                      number);
                                },

                                onInputValidated: (value){

                                  phoneNumberValidated = value;
                                },
                                onSaved: (value){

                                  print(value);
                                },
//
                                onFieldSubmitted:
                                    (v) {
                                  FocusScope.of(context).requestFocus(adultPassportFocus);
                                },
                                inputDecoration:
                                InputDecoration(labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                  labelText: getLocalText("phone_number", context),
                                  //border:
                                  // OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
//                                                                    focusedBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    enabledBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    errorBorder:
//                                                                        InputBorder
//                                                                            .none,
//                                                                    disabledBorder:
//                                                                        InputBorder
//                                                                            .none,
                                ),
                                ignoreBlank:
                                false,
                                initialValue:
                                index==0&&!SessionManager.getInstance().isGuest&&!contentFilledList[0].isPrimaryFilled?model.primaryDefaultPhoneNumber:model.phoneNumber,
                                validator: (value)=>value.isEmpty?getLocalText("enter_phone_number", context):phoneNumberValidated?getLocalText("enter_valid_phone_number", context):null,

                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible:
                      !model.isPrimary(
                          index,
                          passengerType),
                      child: GestureDetector(
                        onTap: () {
                          showSourceBottomSheet(
                              context,
                              model,
                              index,
                              passengerType);
                        },
                        child:


                        AbsorbPointer(
                          absorbing: true,
                          child:
                          TextFormField(
                            controller: TextEditingController(
                                text: model
                                    .getNationality(
                                    index,
                                    passengerType)),
                            showCursor: false,
                            readOnly: true,
//onSaved: (value) => pasenger.email = value.trimRight(),
                            validator:
                                (value) {
                              return value ==
                                  null ||
                                  value
                                      .isEmpty
                                  ? getLocalText(
                                  "select_nationality",
                                  context)
                                  : null;
                            },
//  initialValue: pasenger.email ?? '',
                            style: CustomStyles
                                .medium16
                                .copyWith(
                                color: CustomColors
                                    .BackGround),
                            decoration:
                            InputDecoration(
                              labelStyle: CustomStyles
                                  .medium16
                                  .copyWith(
                                  color: Colors
                                      .grey),
                              labelText:
                              getLocalText(
                                  "nationality",
                                  context),
                              alignLabelWithHint:
                              true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    Flexible(
                      child:
                      GestureDetector(
                        onTap: () {
                          isDoB = true;

                          showDobDialog(
                              context,
                              model,
                              isDoB,
                              index,
                              passengerType);
                        },
                        child:

//                                                Container(
//                                                  width: double.infinity,
//                                                  padding:EdgeInsets.symmetric(vertical: 10),
//                                                  child: model.getPassengerDOB(index, passengerType)!=""?
//                                                  Text(model.getPassengerDOB(index, passengerType),style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),):
//
//                                                  Text('Date of birth',style: CustomStyles.medium16.copyWith(color: Colors.grey),),
//
//
//                                                  decoration: BoxDecoration(
//                                                    border: Border(
//
//                                                      bottom: BorderSide( width: 1,color: CustomColors.disabledButton),
//                                                    ),
//
//                                                  ),
//
//                                                )

                        AbsorbPointer(
                          child:
                          TextFormField(
                            controller: TextEditingController(
                                text: model.getPassengerDOB(
                                    index,
                                    passengerType) ??
                                    ""),
                            showCursor: false,
                            readOnly: true,
                            validator:
                                (value) {
                              if (value == "")
                                return getLocalText(
                                    "date_of_birth",
                                    context);

                              int age = DateTime
                                  .now()
                                  .year -
                                  int.parse(value
                                      .split(
                                      '-')[0]);
                              if (age < 18)
                                return "Age should be greater than 18 years for adults";
                              return value ==
                                  null ||
                                  value
                                      .isEmpty ||
                                  value ==
                                      ""
                                  ? getLocalText(
                                  "date_of_birth",
                                  context)
                                  : null;
                            },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
//initialValue: model.getPassengerDOB(index, passengerType) ?? '',
                            style: CustomStyles
                                .medium16
                                .copyWith(
                                color: CustomColors
                                    .BackGround),
                            decoration:
                            InputDecoration(
                              labelStyle: CustomStyles
                                  .medium16
                                  .copyWith(
                                  color: Colors
                                      .grey),
                              labelText:
                              getLocalText(
                                  "date_of_birth",
                                  context),
                              alignLabelWithHint:
                              true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Flexible(
                      child: TextFormField(
                        focusNode: adultPassportFocus,
                        validator: (value) {
                          final validCharacters =
                          RegExp(
                              r'[!@#$%^&*(),.?":{}|<>]');

                          if(value.isNotEmpty) {
                            if (value
                                .length <
                                6 || value
                                .length > 12)
                              return "Enter Valid Passport Number";
                            else
                            if (validCharacters
                                .hasMatch(
                                value))
                              return "Enter Valid Passport Number";
                          }
                          return value ==
                              null ||
                              value
                                  .isEmpty
                              ?getLocalText(
                              "passport_number_is_required",
                              context)
                              : null;
                        },
                        onSaved: (v) {
                          FocusManager
                              .instance
                              .primaryFocus
                              .unfocus();
                        },
//                                                                onFieldSubmitted: (v){
//
//                                                                },
                        onChanged: (value) =>
                            model.setPassengerPassportNumber(
                                index,
                                passengerType,
                                value),
                        initialValue: model
                            .getPassengerPassportNumber(
                            index,
                            passengerType),
                        style: CustomStyles
                            .medium16
                            .copyWith(
                            color: CustomColors
                                .BackGround),
                        decoration:
                        InputDecoration(
                          labelStyle: CustomStyles
                              .medium16
                              .copyWith(
                              color: Colors
                                  .grey),
                          labelText: getLocalText(
                              "passport_number",
                              context),
                          alignLabelWithHint:
                          true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Flexible(
                        child:
                        GestureDetector(
                          onTap: () {
                            isDoB = false;

                            showDobDialog(
                                context,
                                model,
                                isDoB,
                                index,
                                passengerType);

                            FocusScope.of(context)
                                .unfocus();
                          },
                          child:
                          AbsorbPointer(
                            absorbing: true,
                            child: TextFormField(
                              controller: TextEditingController(
                                  text: model
                                      .getPassengerPassportExpData(
                                      index,
                                      passengerType)),

                              validator: (value) {

                                if(!value.isEmpty)
                                {
                                  var date = DateTime.now();
                                  if (!model.tempDate.isAfter(new DateTime(date.year, date.month +6, date.day)))
                                    return "Passport expiry should be greater than six months";
                                }

                                return value ==
                                    null ||
                                    value
                                        .isEmpty
                                    ? getLocalText(
                                    "enter_passport_expiry_date",
                                    context)
                                    : null;
                              },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
// initialValue: model.getPassengerPassportExpData(index, passengerType),
                              style: CustomStyles
                                  .medium16
                                  .copyWith(
                                  color: CustomColors
                                      .BackGround),
                              decoration:
                              InputDecoration(
                                labelStyle: CustomStyles
                                    .medium16
                                    .copyWith(
                                    color: Colors
                                        .grey),
                                labelText:
                                getLocalText(
                                    "passport_expiry",
                                    context),
                                alignLabelWithHint:
                                true,
                              ),
                            ),
                          ),
                        )),
                    Align(
                      alignment: Alignment
                          .bottomRight,
                      child: RaisedButton(
                          color: CustomColors
                              .Orange,
                          child: Text(
                            getLocalText(
                                "save",
                                context),
// strings.save.toUpperCase(),
                            style: CustomStyles
                                .button_style,
                          ),
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .circular(
                                10.0),
                          ),
                          onPressed: () async {
                            _formState
                                .currentState
                                .save();
                            if (_formState
                                .currentState
                                .validate()) {
                              contentFilledList
                                  .forEach(
                                      (element) {
                                    if (element.passangerType ==
                                        0 &&
                                        element.index ==
                                            index) {
                                      element
                                          .isFilled =
                                      true;
                                      element.isPrimaryFilled =true;

                                    }
                                  });
                              model.enabledEditMode(
                                  passengerType,
                                  index);
                              _formState
                                  .currentState
                                  .save();
                            }
                          }),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: SizeConstants.SIZE_6,
          )
        ],
      ),
    );

  }

  showSourceBottomSheet(BuildContext context, FlightPassengerInfoModel model,
      int index, int passengerType) {
    return showModalBottomSheet(
        isDismissible: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
//margin: EdgeInsets.all(15),
            child: SelectCountry(model, context, index, passengerType)));
  }

  void showDobDialog(BuildContext context, FlightPassengerInfoModel model,
      bool isDoB, int index, int passengerType) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
          padding: EdgeInsets.all(5),
          height: 370.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 310.0,
                  width: 300.0,
                  child: DateSelector2(
                      model, context, isDoB, index, passengerType)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(getLocalText("cancel", context)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: BorderSide(
                                  color: CustomColors.disabledButton,
                                  width: 2)))),
                  SizedBox(
                    child: FlatButton(
                        onPressed: () {
                          if (model.tempDate.toString().split(' ')[0] !=
                              DateTime.now().toString().split(' ')[0]) {
                            if (model.tempDate.toString().substring(0, 2) !=
                                "00") {
                              if (isDoB) {
                                model.setPassengerDOB(
                                    index, passengerType, model.tempDate);
                                Navigator.pop(context);
                              } else {
                                model.setPassengerPassportExpDate(
                                    index, passengerType, model.tempDate);
                                Navigator.pop(context);
                              }
                            }
                          }
                        },
                        child: Text(getLocalText("ok", context)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(
                                color: CustomColors.disabledButton, width: 2))),
                  ),
                ],
              )
            ],
          )),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }

  getLocalText(String key, BuildContext context) {
    return AppLocalizations.of(context).translate(key);
  }

  bool isValidEmail(email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

//  isValidExpiryDate(String expDate) {
//
//    AgeDuration timeDifference =
//    Age.dateDifference(fromDate: DateTime.now(), toDate: exdate.toString());
//
//
//    return  timeDifference.months<3;
//
//  }
}
