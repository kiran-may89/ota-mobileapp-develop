import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/flights/flight_booking_response_entity.dart';
import 'package:ota/models/flights/data_model/pass_arguments.dart';
import 'package:ota/models/flights/requests/flight_save_booking_request.dart';
import 'package:ota/models/flights/traveller_info_model.dart';
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

class _TravelInformationState
    extends State<TravelInformation> {
  GlobalKey<FormState> _formState = GlobalKey();



  var size;

  BuildContext context;

  FlightBookingResponseEntity
      flightBookingResponseEntity =
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

  @override
  Widget build(context) {

    height =
        MediaQuery.of(context).size.height / 10;

    width =
        MediaQuery.of(context).size.width / 10;

    print("START");

    return ChangeNotifierProvider<
        FlightPassengerInfoModel>(
      create: (context) =>
          FlightPassengerInfoModel(
              flightResultsData),
      child: Consumer<FlightPassengerInfoModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: CustomColors.White,
            appBar: AppBar(
              title: Text(
                'Travellers Information',
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
                    color:
                        CustomColors.BackGround,
                  )
                : Container(
                    margin: EdgeInsets.only(
                        left: width * .4,
                        right: width * .4,
                        top: 15),
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        mainAxisSize:
                            MainAxisSize.min,
                        mainAxisAlignment:
                            MainAxisAlignment
                                .start,
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: <Widget>[
                          Row(
                            mainAxisSize:
                                MainAxisSize.min,
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .start,
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .center,
                            children: <Widget>[
                              Expanded(
                                flex: 8,
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
                                    Row(
                                      children: <
                                          Widget>[
                                        Text(
                                          model
                                              .flightResultsData
                                              .requestData
                                              .flyFrom,
                                          style: CustomStyles
                                              .heading,
                                        ),
                                        Icon(
                                          Icons
                                              .swap_horiz,
                                          color: CustomColors
                                              .heading,
                                        ),
                                        Text(
                                          model
                                              .flightResultsData
                                              .requestData
                                              .flyTo,
                                          style: CustomStyles
                                              .heading,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Wrap(
                                      spacing:
                                          1.2,
                                      alignment:
                                          WrapAlignment
                                              .start,
                                      direction: Axis
                                          .horizontal,
                                      children: <
                                          Widget>[
                                        Text(
                                            model.flightResultsData.requestData.oneway
                                                ? model.flightResultsData.requestData.monthFrom + " | "
                                                : model.flightResultsData.requestData.monthFrom + " - " + model.flightResultsData.requestData.monthTo + " | ",
                                            style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))),
                                        Row(
                                          mainAxisSize:
                                              MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <
                                              Widget>[
                                            model.flightResultsData.requestData.adults != 0
                                                ? Text('Adult ${model.flightResultsData.requestData.adults} | ', style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)))
                                                : SizedBox.shrink(),
                                            model.flightResultsData.requestData.children != 0
                                                ? Text('Children ${model.flightResultsData.requestData.children} | ', style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)))
                                                : SizedBox.shrink(),
                                            model.flightResultsData.requestData.infants != 0
                                                ? Text('Infants ${model.flightResultsData.requestData.infants} | ', style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)))
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
                                              .copyWith(color: CustomColors.heading.withOpacity(.5)),
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
                                  child:
                                      RaisedButton(
                                    onPressed:
                                        () {
                                      Navigator.of(
                                              context)
                                          .pop();
                                      Navigator.of(
                                              context)
                                          .pop();
                                      Navigator.of(
                                              context)
                                          .pop();
                                    },
                                    color:
                                        CustomColors
                                            .Orange,
                                    child: Text(
                                      'EDIT',
                                      style: CustomStyles
                                          .calenderStyle
                                          .copyWith(
                                              color:
                                                  CustomColors.White),
                                    ),
                                    elevation: 3,
                                    shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(
                                              5.0),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                              margin:
                                  EdgeInsets.only(
                                      top: 10,
                                      bottom: 10),
                              child: MySeparator(
                                color: CustomColors
                                    .TabDisabled,
                                height: 1,
                                Horizontal: true,
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Form(
                            key:
                            _formState,
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .start,
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                Visibility(
                                  visible: model
                                          .flightResultsData
                                          .requestData
                                          .adults !=
                                      0,
                                  child: Container(
                                      child: Column(
                                            children: List.generate(
                                        model.flightResultsData.requestData.adults,
                                        (int
                                            index) {
                                      int passengerType =
                                          0;

                                      print(
                                          "Started");

                                      bool
                                          phoneNumberValidated =
                                          false;

                                      ///For dateSelectionDialog --dob or passport_expiry_date  selection
                                      bool
                                          isDoB;

                                      return Container(
//                                              margin:
//                                                  EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                        child:
                                            Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                                onTap: () => model.enabledEditMode(passengerType, index),
                                                child: Container(
                                                  color: model.getPassengerName(index, passengerType) == "" ? CustomColors.Orange : CustomColors.BackGround,
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 50,
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: SizeConstants.SIZE_4),
                                                    width: MediaQuery.of(context).size.width,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: CustomColors.White,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black.withOpacity(0.1),
                                                          spreadRadius: 0.5,
                                                          blurRadius: 0.5,

                                                          offset: Offset(0, 1), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Visibility(
                                                            visible: model.getPassengerName(index, passengerType) == "",
                                                            child: Container(
                                                              margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                              child: Text(index == 0 ? "Primary" : "Adult " + "${index + 1}", style: CustomStyles.medium16),
                                                            )),
                                                        Visibility(
                                                            visible: model.getPassengerName(index, passengerType) != "",
                                                            child: Container(
                                                              margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset("assets/images/user.svg", width: SizeConstants.SIZE_20, height: SizeConstants.SIZE_20, color: Colors.black54),
                                                                  SizedBox(
                                                                    width: SizeConstants.SIZE_8,
                                                                  ),
                                                                  Text(model.getPassengerName(index, passengerType), style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround)),
                                                                  SizedBox(
                                                                    width: SizeConstants.SIZE_8,
                                                                  ),
                                                                  Flexible(
                                                                    child: Text(
                                                                      model.emailId == null ? "" : ', Email: ${model.emailId}',
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
                                                visible: model.areDetailsShown(index, passengerType),
                                                child: Container(
// margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width / 10 * 4,
                                                              height: MediaQuery.of(context).size.height / 10 * .5,
                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: CustomColors.TabDisabled),
                                                              margin: EdgeInsets.only(left: 0, right: 0, top: 20),
                                                              child: Stack(
                                                                alignment: Alignment.center,
                                                                children: <Widget>[
                                                                  AnimatedContainer(
                                                                    duration: Duration(microseconds: 1000),
                                                                    alignment: model.getGender(index, passengerType) ? Alignment.bottomLeft : Alignment.bottomRight,
                                                                    child: Container(
                                                                      height: MediaQuery.of(context).size.height / 10 * .7,
                                                                      width: MediaQuery.of(context).size.width / 10 * 2,
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(20),
                                                                        color: CustomColors.BackGround,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Expanded(
                                                                            child: GestureDetector(
                                                                          child: Container(
                                                                            alignment: Alignment.center,
                                                                            height: double.infinity,
                                                                            width: double.infinity,
                                                                            child: Text('Male', textAlign: TextAlign.center, style: model.getGender(index, passengerType) ? CustomStyles.button_style.copyWith(fontSize: 12) : CustomStyles.button_style.copyWith(fontSize: 12, color: CustomColors.disabledButton)),
                                                                          ),
                                                                          onTap: () {
                                                                            model.setGender(index, passengerType, 0);
                                                                          },
                                                                        )),
                                                                        Expanded(
                                                                            child: GestureDetector(
                                                                          child: Container(
                                                                            alignment: Alignment.center,
                                                                            height: double.infinity,
                                                                            width: double.infinity,
                                                                            child: Text('Female', textAlign: TextAlign.center, style: !model.getGender(index, passengerType) ? CustomStyles.button_style.copyWith(fontSize: 12) : CustomStyles.button_style.copyWith(fontSize: 12, color: CustomColors.disabledButton)),
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
                                                        width: SizeConstants.SIZE_12,
                                                      ),
                                                      Flexible(
                                                        child: TextFormField(
                                                          onFieldSubmitted: (v) {
                                                            FocusScope.of(context).requestFocus(adultLastNameFocus);
                                                          },
                                                          validator: (value) {
                                                            return value == null || value.isEmpty ? "Enter First Name" : null;
                                                          },
                                                          onChanged: (value) => model.setPassengerName(index, passengerType, value),
                                                          initialValue: model.getPassengerName(index, passengerType),
                                                          style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                          decoration: InputDecoration(
                                                            labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                            labelText: "First Name",
                                                            alignLabelWithHint: true,
                                                          ),
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        focusNode: adultLastNameFocus,
                                                        validator: (value) {
                                                          if (value == null || value.isEmpty) {
                                                            return "Enter Last Name";
                                                          }
                                                          return null;
                                                        },
                                                        onFieldSubmitted: (v) {
                                                          FocusScope.of(context).requestFocus(model.isPrimary(index, passengerType) ? adultEmailFocus : adultPassportFocus);
                                                        },
                                                        onChanged: (value) => model.setPassengerLastName(index, passengerType, value),
                                                        initialValue: model.getPassengerLastName(index, passengerType),
                                                        style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                        decoration: InputDecoration(
                                                          labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                          labelText: "Last Name",
                                                          alignLabelWithHint: true,
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: model.isPrimary(index, passengerType),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            TextFormField(
                                                              focusNode: adultEmailFocus,
                                                              onChanged: (value) => model.setPassengersEmail(value),
                                                              validator: (input) => input.isEmpty
                                                                  ? "Enter Email"
                                                                  : isValidEmail(input)
                                                                      ? null
                                                                      : "Enter Valid Email Id",
                                                              onFieldSubmitted: (v) {
                                                                FocusScope.of(context).requestFocus(adultMobileFocus);
                                                              },
                                                              initialValue: model.emailId ?? '',
                                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                              decoration: InputDecoration(
                                                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                labelText: "Email",
                                                                alignLabelWithHint: true,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Visibility(
                                                              visible: model.isPrimary(index, passengerType),
                                                              child: Container(
                                                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: CustomColors.disabledButton, width: 2))),
                                                                child: InternationalPhoneNumberInput(
                                                                  focusNode: adultMobileFocus,
                                                                  selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
                                                                  onInputChanged: (PhoneNumber number) {
                                                                    model.onCountryCodeChanged(number);
                                                                  },
                                                                  onInputValidated: (bool value) {
                                                                    phoneNumberValidated = value;
                                                                  },
                                                                  validator: (value) {
                                                                    if (!phoneNumberValidated) {
                                                                      return "Invalid Phone number";
                                                                    }
                                                                    return null;
                                                                  },
                                                                  onFieldSubmitted: (v) {
                                                                    FocusScope.of(context).requestFocus(adultPassportFocus);
                                                                  },
                                                                  inputDecoration: InputDecoration(
                                                                    labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                    labelText: "Mobile Number",
                                                                    border: InputBorder.none,
                                                                    focusedBorder: InputBorder.none,
                                                                    enabledBorder: InputBorder.none,
                                                                    errorBorder: InputBorder.none,
                                                                    disabledBorder: InputBorder.none,
                                                                  ),
                                                                  ignoreBlank: false,
                                                                  initialValue: model.phoneNumber,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: !model.isPrimary(index, passengerType),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            showSourceBottomSheet(context, model, index, passengerType);
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
                                                            child: TextFormField(
                                                              controller: TextEditingController(text: model.getNationality(index, passengerType)),
                                                              showCursor: false,
                                                              readOnly: true,
//onSaved: (value) => pasenger.email = value.trimRight(),
                                                              validator: (value) {
                                                                return value == null || value.isEmpty ? "Select Nationality" : null;
                                                              },
//  initialValue: pasenger.email ?? '',
                                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                              decoration: InputDecoration(
                                                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                labelText: "Nationality",
                                                                alignLabelWithHint: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            isDoB = true;
                                                            showDobDialog(context, model, isDoB, index, passengerType);
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
                                                            child: TextFormField(
                                                              controller: TextEditingController(text: model.getPassengerDOB(index, passengerType) ?? ""),
                                                              showCursor: false,
                                                              readOnly: true,
                                                              validator: (value) {
                                                                return value == null || value.isEmpty ? "Date of Birth" : null;
                                                              },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
//initialValue: model.getPassengerDOB(index, passengerType) ?? '',
                                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                              decoration: InputDecoration(
                                                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                labelText: "Date of birth",
                                                                alignLabelWithHint: true,
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
                                                            return value == null || value.isEmpty ? "Passport Number" : null;
                                                          },
                                                          onSaved: (v) {
                                                            FocusManager.instance.primaryFocus.unfocus();
                                                          },
//                                                                onFieldSubmitted: (v){
//
//                                                                },
                                                          onChanged: (value) => model.setPassengerPassportNumber(index, passengerType, value),
                                                          initialValue: model.getPassengerPassportNumber(index, passengerType),
                                                          style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                          decoration: InputDecoration(
                                                            labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                            labelText: "Passport Number",
                                                            alignLabelWithHint: true,
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                          child: GestureDetector(
                                                        onTap: () {
                                                          isDoB = false;

                                                          showDobDialog(context, model, isDoB, index, passengerType);
                                                        },
                                                        child:
//                                                Container(
//                                                  width: double.infinity,
//                                                  padding:   EdgeInsets.symmetric(vertical: 14),
//                                                  child: model.getPassengerPassportExpData(index, passengerType)!=""?
//
//                                                  Text(model.getPassengerPassportExpData(index, passengerType),style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),):
//
//                                                  Text('Passport Expiry Date',style: CustomStyles.medium16.copyWith(color: Colors.grey),),
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
//                                                ),

                                                            AbsorbPointer(
                                                          absorbing: true,
                                                          child: TextFormField(
                                                            controller: TextEditingController(text: model.getPassengerPassportExpData(index, passengerType)),

                                                            validator: (value) {
                                                              return value == null || value.isEmpty ? "Passport Expiry Date" : null;
                                                            },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
// initialValue: model.getPassengerPassportExpData(index, passengerType),
                                                            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                            decoration: InputDecoration(
                                                              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                              labelText: "Enter Passport Expiry Date",
                                                              alignLabelWithHint: true,
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                      Align(
                                                        alignment: Alignment.bottomRight,
                                                        child: RaisedButton(
                                                            color: CustomColors.Orange,
                                                            child: Text(
                                                              "SAVE",
// strings.save.toUpperCase(),
                                                              style: CustomStyles.button_style,
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10.0),
                                                            ),
                                                            onPressed: () async {
                                                              if (_formState.currentState.validate()) {
                                                                _formState.currentState.save();
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

// model.flightResultsData.requestData.children!=0?

                                Visibility(
                                  visible: model
                                          .flightResultsData
                                          .requestData
                                          .children !=
                                      0,
                                  child: Container(
                                      child: Column(
                                            children: List.generate(
                                        model.flightResultsData.requestData.children,
                                        (int
                                            index) {
                                      int passengerType =
                                          1;



                                      bool
                                          phoneNumberValidated =
                                          false;

                                      ///For dateSelectionDialog --dob or passport_expiry_date  selection
                                      bool
                                          isDoB;

                                      return Container(
//                                              margin:
//                                                  EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                        child:
                                            Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                                onTap: () => model.enabledEditMode(passengerType, index),
                                                child: Container(
                                                  color: model.getPassengerName(index, passengerType) == "" ? CustomColors.Orange : CustomColors.BackGround,
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 50,
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: SizeConstants.SIZE_4),
                                                    width: MediaQuery.of(context).size.width,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: CustomColors.White,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black.withOpacity(0.1),
                                                          spreadRadius: 0.5,
                                                          blurRadius: 0.5,

                                                          offset: Offset(0, 1), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Visibility(
                                                            visible: model.getPassengerName(index, passengerType) == "",
                                                            child: Container(
                                                              margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                              child: Text(model.isPrimary(index, passengerType) ? "Primary" : "Child " + "${index + 1}", style: CustomStyles.medium16),
                                                            )),
                                                        Visibility(
                                                            visible: model.getPassengerName(index, passengerType) != "",
                                                            child: Container(
                                                              margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset("assets/images/user.svg", width: SizeConstants.SIZE_20, height: SizeConstants.SIZE_20, color: Colors.black54),
                                                                  SizedBox(
                                                                    width: SizeConstants.SIZE_8,
                                                                  ),
                                                                  Text(model.getPassengerName(index, passengerType), style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround)),
                                                                  SizedBox(
                                                                    width: SizeConstants.SIZE_8,
                                                                  ),
                                                                  Flexible(
                                                                    child: Text(
                                                                      model.emailId == null ? "" : ', Email: ${model.emailId}',
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
                                                visible: model.areDetailsShown(index, passengerType),
                                                child: Container(
// margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width / 10 * 4,
                                                              height: MediaQuery.of(context).size.height / 10 * .5,
                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: CustomColors.TabDisabled),
                                                              margin: EdgeInsets.only(left: 0, right: 0, top: 20),
                                                              child: Stack(
                                                                alignment: Alignment.center,
                                                                children: <Widget>[
                                                                  AnimatedContainer(
                                                                    duration: Duration(microseconds: 1000),
                                                                    alignment: model.getGender(index, passengerType) ? Alignment.bottomLeft : Alignment.bottomRight,
                                                                    child: Container(
                                                                      height: MediaQuery.of(context).size.height / 10 * .7,
                                                                      width: MediaQuery.of(context).size.width / 10 * 2,
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(20),
                                                                        color: CustomColors.BackGround,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Expanded(
                                                                            child: GestureDetector(
                                                                          child: Container(
                                                                            alignment: Alignment.center,
                                                                            height: double.infinity,
                                                                            width: double.infinity,
                                                                            child: Text('Male', textAlign: TextAlign.center, style: model.getGender(index, passengerType) ? CustomStyles.button_style.copyWith(fontSize: 12) : CustomStyles.button_style.copyWith(fontSize: 12, color: CustomColors.disabledButton)),
                                                                          ),
                                                                          onTap: () {
                                                                            model.setGender(index, passengerType, 0);
                                                                          },
                                                                        )),
                                                                        Expanded(
                                                                            child: GestureDetector(
                                                                          child: Container(
                                                                            alignment: Alignment.center,
                                                                            height: double.infinity,
                                                                            width: double.infinity,
                                                                            child: Text('Female', textAlign: TextAlign.center, style: !model.getGender(index, passengerType) ? CustomStyles.button_style.copyWith(fontSize: 12) : CustomStyles.button_style.copyWith(fontSize: 12, color: CustomColors.disabledButton)),
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
                                                        width: SizeConstants.SIZE_12,
                                                      ),
                                                      Flexible(
                                                        child: TextFormField(
                                                          onFieldSubmitted: (v) {
                                                            FocusScope.of(context).requestFocus(childLastNameFocus);
                                                          },
                                                          validator: (value) {
                                                            return value == null || value.isEmpty ? "Enter First Name" : null;
                                                          },
                                                          onChanged: (value) => model.setPassengerName(index, passengerType, value),
                                                          initialValue: model.getPassengerName(index, passengerType),
                                                          style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                          decoration: InputDecoration(
                                                            labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                            labelText: "First Name",
                                                            alignLabelWithHint: true,
                                                          ),
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        focusNode: childLastNameFocus,
                                                        validator: (value) {
                                                          if (value == null || value.isEmpty) {
                                                            return "Enter Last Name";
                                                          }
                                                          return null;
                                                        },
                                                        onFieldSubmitted: (v) {
                                                          FocusScope.of(context).requestFocus(model.isPrimary(index, passengerType) ? childEmailFocus : childPassportFocus);
                                                        },
                                                        onChanged: (value) => model.setPassengerLastName(index, passengerType, value),
                                                        initialValue: model.getPassengerLastName(index, passengerType),
                                                        style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                        decoration: InputDecoration(
                                                          labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                          labelText: "Last Name",
                                                          alignLabelWithHint: true,
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: model.isPrimary(index, passengerType),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            TextFormField(
                                                              focusNode: childEmailFocus,
                                                              onChanged: (value) => model.setPassengersEmail(value),
                                                              validator: (input) => input.isEmpty
                                                                  ? "Enter Email"
                                                                  : isValidEmail(input)
                                                                      ? null
                                                                      : "Enter Valid Email Id",
                                                              onFieldSubmitted: (v) {
                                                                FocusScope.of(context).requestFocus(childMobileFocus);
                                                              },
                                                              initialValue: model.emailId ?? '',
                                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                              decoration: InputDecoration(
                                                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                labelText: "Email",
                                                                alignLabelWithHint: true,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Visibility(
                                                              visible: model.isPrimary(index, passengerType),
                                                              child: Container(
                                                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: CustomColors.disabledButton, width: 2))),
                                                                child: InternationalPhoneNumberInput(
                                                                  focusNode: childMobileFocus,
                                                                  selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
                                                                  onInputChanged: (PhoneNumber number) {
                                                                    model.onCountryCodeChanged(number);
                                                                  },
                                                                  onFieldSubmitted: (v) {
                                                                    FocusScope.of(context).requestFocus(childPassportFocus);
                                                                  },
                                                                  onInputValidated: (bool value) {
                                                                    phoneNumberValidated = value;
                                                                  },
                                                                  validator: (value) {
                                                                    if (!phoneNumberValidated) {
                                                                      return "Invalid Phone number";
                                                                    }
                                                                    return null;
                                                                  },
                                                                  inputDecoration: InputDecoration(
                                                                    labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                    labelText: "Mobile Number",
                                                                    border: InputBorder.none,
                                                                    focusedBorder: InputBorder.none,
                                                                    enabledBorder: InputBorder.none,
                                                                    errorBorder: InputBorder.none,
                                                                    disabledBorder: InputBorder.none,
                                                                  ),
                                                                  ignoreBlank: false,
                                                                  initialValue: model.phoneNumber,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: !model.isPrimary(index, passengerType),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            showSourceBottomSheet(context, model, index, passengerType);
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
                                                            child: TextFormField(
                                                              controller: TextEditingController(text: model.getNationality(index, passengerType)),
                                                              showCursor: false,
                                                              readOnly: true,
//onSaved: (value) => pasenger.email = value.trimRight(),
                                                              validator: (value) {
                                                                return value == null || value.isEmpty ? "Select Nationality" : null;
                                                              },
//  initialValue: pasenger.email ?? '',
                                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                              decoration: InputDecoration(
                                                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                labelText: "Nationality",
                                                                alignLabelWithHint: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            isDoB = true;
                                                            showDobDialog(context, model, isDoB, index, passengerType);
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
                                                            child: TextFormField(
                                                              controller: TextEditingController(text: model.getPassengerDOB(index, passengerType) ?? ""),
                                                              showCursor: false,
                                                              readOnly: true,
                                                              validator: (value) {
                                                                return value == null || value.isEmpty ? "Date of Birth" : null;
                                                              },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
//initialValue: model.getPassengerDOB(index, passengerType) ?? '',
                                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                              decoration: InputDecoration(
                                                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                labelText: "Date of birth",
                                                                alignLabelWithHint: true,
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
                                                          focusNode: childPassportFocus,
                                                          validator: (value) {
                                                            return value == null || value.isEmpty ? "Passport Number" : null;
                                                          },
                                                          onSaved: (v) {
                                                            FocusManager.instance.primaryFocus.unfocus();
                                                          },
//                                                                onFieldSubmitted: (v){
//
//                                                                },
                                                          onChanged: (value) => model.setPassengerPassportNumber(index, passengerType, value),
                                                          initialValue: model.getPassengerPassportNumber(index, passengerType),
                                                          style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                          decoration: InputDecoration(
                                                            labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                            labelText: "Passport Number",
                                                            alignLabelWithHint: true,
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                          child: GestureDetector(
                                                        onTap: () {
                                                          isDoB = false;

                                                          showDobDialog(context, model, isDoB, index, passengerType);
                                                        },
                                                        child:
//                                                Container(
//                                                  width: double.infinity,
//                                                  padding:   EdgeInsets.symmetric(vertical: 14),
//                                                  child: model.getPassengerPassportExpData(index, passengerType)!=""?
//
//                                                  Text(model.getPassengerPassportExpData(index, passengerType),style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),):
//
//                                                  Text('Passport Expiry Date',style: CustomStyles.medium16.copyWith(color: Colors.grey),),
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
//                                                ),

                                                            AbsorbPointer(
                                                          absorbing: true,
                                                          child: TextFormField(
                                                            controller: TextEditingController(text: model.getPassengerPassportExpData(index, passengerType)),

                                                            validator: (value) {
                                                              return value == null || value.isEmpty ? "Passport Expiry Date" : null;
                                                            },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
// initialValue: model.getPassengerPassportExpData(index, passengerType),
                                                            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                            decoration: InputDecoration(
                                                              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                              labelText: "Enter Passport Expiry Date",
                                                              alignLabelWithHint: true,
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                      Align(
                                                        alignment: Alignment.bottomRight,
                                                        child: RaisedButton(
                                                            color: CustomColors.Orange,
                                                            child: Text(
                                                              "SAVE",
// strings.save.toUpperCase(),
                                                              style: CustomStyles.button_style,
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10.0),
                                                            ),
                                                            onPressed: () async {
                                                              if (_formState.currentState.validate()) {
                                                                _formState.currentState.save();
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
                                  visible: model
                                          .flightResultsData
                                          .requestData
                                          .infants !=
                                      0,
                                  child: Container(
                                      child: Column(
                                            children: List.generate(
                                        model.flightResultsData.requestData.infants,
                                        (int
                                            index) {
                                      int passengerType =
                                          2;

                                      print(
                                          "Started");

                                      bool
                                          phoneNumberValidated =
                                          false;

                                      ///For dateSelectionDialog --dob or passport_expiry_date  selection
                                      bool
                                          isDoB;

                                      return Container(
//                                              margin:
//                                                  EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                        child:
                                            Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            GestureDetector(
                                                onTap: () => model.enabledEditMode(passengerType, index),
                                                child: Container(
                                                  color: model.getPassengerName(index, passengerType) == "" ? CustomColors.Orange : CustomColors.BackGround,
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 50,
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: SizeConstants.SIZE_4),
                                                    width: MediaQuery.of(context).size.width,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: CustomColors.White,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black.withOpacity(0.1),
                                                          spreadRadius: 0.5,
                                                          blurRadius: 0.5,

                                                          offset: Offset(0, 1), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Visibility(
                                                            visible: model.getPassengerName(index, passengerType) == "",
                                                            child: Container(
                                                              margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                              child: Text(model.isPrimary(index, passengerType) ? "Primary" : "Infant " + "${index + 1}", style: CustomStyles.medium16),
                                                            )),
                                                        Visibility(
                                                            visible: model.getPassengerName(index, passengerType) != "",
                                                            child: Container(
                                                              margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset("assets/images/user.svg", width: SizeConstants.SIZE_20, height: SizeConstants.SIZE_20, color: Colors.black54),
                                                                  SizedBox(
                                                                    width: SizeConstants.SIZE_8,
                                                                  ),
                                                                  Text(model.getPassengerName(index, passengerType), style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround)),
                                                                  SizedBox(
                                                                    width: SizeConstants.SIZE_8,
                                                                  ),
                                                                  Flexible(
                                                                    child: Text(
                                                                      model.emailId == null ? "" : ', Email: ${model.emailId}',
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
                                                visible: model.areDetailsShown(index, passengerType),
                                                child: Container(
// margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Align(
                                                        alignment: Alignment.center,
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width / 10 * 4,
                                                              height: MediaQuery.of(context).size.height / 10 * .5,
                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: CustomColors.TabDisabled),
                                                              margin: EdgeInsets.only(left: 0, right: 0, top: 20),
                                                              child: Stack(
                                                                alignment: Alignment.center,
                                                                children: <Widget>[
                                                                  AnimatedContainer(
                                                                    duration: Duration(microseconds: 1000),
                                                                    alignment: model.getGender(index, passengerType) ? Alignment.bottomLeft : Alignment.bottomRight,
                                                                    child: Container(
                                                                      height: MediaQuery.of(context).size.height / 10 * .7,
                                                                      width: MediaQuery.of(context).size.width / 10 * 2,
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(20),
                                                                        color: CustomColors.BackGround,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    child: Row(
                                                                      children: <Widget>[
                                                                        Expanded(
                                                                            child: GestureDetector(
                                                                          child: Container(
                                                                            alignment: Alignment.center,
                                                                            height: double.infinity,
                                                                            width: double.infinity,
                                                                            child: Text('Male', textAlign: TextAlign.center, style: model.getGender(index, passengerType) ? CustomStyles.button_style.copyWith(fontSize: 12) : CustomStyles.button_style.copyWith(fontSize: 12, color: CustomColors.disabledButton)),
                                                                          ),
                                                                          onTap: () {
                                                                            model.setGender(index, passengerType, 0);
                                                                          },
                                                                        )),
                                                                        Expanded(
                                                                            child: GestureDetector(
                                                                          child: Container(
                                                                            alignment: Alignment.center,
                                                                            height: double.infinity,
                                                                            width: double.infinity,
                                                                            child: Text('Female', textAlign: TextAlign.center, style: !model.getGender(index, passengerType) ? CustomStyles.button_style.copyWith(fontSize: 12) : CustomStyles.button_style.copyWith(fontSize: 12, color: CustomColors.disabledButton)),
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
                                                        width: SizeConstants.SIZE_12,
                                                      ),
                                                      Flexible(
                                                        child: TextFormField(
                                                          onFieldSubmitted: (v) {
                                                            FocusScope.of(context).requestFocus(infantLastNameFocus);
                                                          },
                                                          validator: (value) {
                                                            return value == null || value.isEmpty ? "Enter First Name" : null;
                                                          },
                                                          onChanged: (value) => model.setPassengerName(index, passengerType, value),
                                                          initialValue: model.getPassengerName(index, passengerType),
                                                          style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                          decoration: InputDecoration(
                                                            labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                            labelText: "First Name",
                                                            alignLabelWithHint: true,
                                                          ),
                                                        ),
                                                      ),
                                                      TextFormField(
                                                        focusNode: infantLastNameFocus,
                                                        validator: (value) {
                                                          if (value == null || value.isEmpty) {
                                                            return "Enter Last Name";
                                                          }
                                                          return null;
                                                        },
                                                        onFieldSubmitted: (v) {
                                                          FocusScope.of(context).requestFocus(model.isPrimary(index, passengerType) ? infantEmailFocus : infantPassportFocus);
                                                        },
                                                        onChanged: (value) => model.setPassengerLastName(index, passengerType, value),
                                                        initialValue: model.getPassengerLastName(index, passengerType),
                                                        style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                        decoration: InputDecoration(
                                                          labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                          labelText: "Last Name",
                                                          alignLabelWithHint: true,
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: model.isPrimary(index, passengerType),
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            TextFormField(
                                                              focusNode: infantEmailFocus,
                                                              onChanged: (value) => model.setPassengersEmail(value),
                                                              validator: (input) => input.isEmpty
                                                                  ? "Enter Email"
                                                                  : isValidEmail(input)
                                                                      ? null
                                                                      : "Enter Valid Email Id",
                                                              onFieldSubmitted: (v) {
                                                                FocusScope.of(context).requestFocus(infantMobileFocus);
                                                              },
                                                              initialValue: model.emailId ?? '',
                                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                              decoration: InputDecoration(
                                                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                labelText: "Email",
                                                                alignLabelWithHint: true,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Visibility(
                                                              visible: model.isPrimary(index, passengerType),
                                                              child: Container(
                                                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                                                                child: InternationalPhoneNumberInput(
                                                                  focusNode: infantMobileFocus,
                                                                  selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
                                                                  onInputChanged: (PhoneNumber number) {
                                                                    model.onCountryCodeChanged(number);
                                                                  },
                                                                  onFieldSubmitted: (v) {
                                                                    FocusScope.of(context).requestFocus(infantPassportFocus);
                                                                  },
                                                                  onInputValidated: (bool value) {
                                                                    phoneNumberValidated = value;
                                                                  },
                                                                  validator: (value) {
                                                                    if (!phoneNumberValidated) {
                                                                      return "Invalid Phone number";
                                                                    }
                                                                    return null;
                                                                  },
                                                                  inputDecoration: InputDecoration(
                                                                    labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                    labelText: "Mobile Number",
                                                                    border: InputBorder.none,
                                                                    focusedBorder: InputBorder.none,
                                                                    enabledBorder: InputBorder.none,
                                                                    errorBorder: InputBorder.none,
                                                                    disabledBorder: InputBorder.none,
                                                                  ),
                                                                  ignoreBlank: false,
                                                                  initialValue: model.phoneNumber,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible: !model.isPrimary(index, passengerType),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            showSourceBottomSheet(context, model, index, passengerType);
                                                          },
                                                          child:

                                                              AbsorbPointer(
                                                            absorbing: true,
                                                            child: TextFormField(
                                                              controller: TextEditingController(text: model.getNationality(index, passengerType)),
                                                              showCursor: false,
                                                              readOnly: true,
//onSaved: (value) => pasenger.email = value.trimRight(),
                                                              validator: (value) {
                                                                return  value.isEmpty ? "Select Nationality" : null;
                                                              },
//  initialValue: pasenger.email ?? '',
                                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                              decoration: InputDecoration(
                                                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                labelText: "Nationality",
                                                                alignLabelWithHint: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            isDoB = true;
                                                            showDobDialog(context, model, isDoB, index, passengerType);
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
                                                            child: TextFormField(
                                                              controller: TextEditingController(text: model.getPassengerDOB(index, passengerType) ?? ""),
                                                              showCursor: false,
                                                              readOnly: true,
                                                              validator: (value) {
                                                                return value == null || value.isEmpty ? "Date of Birth" : null;
                                                              },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
//initialValue: model.getPassengerDOB(index, passengerType) ?? '',
                                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                              decoration: InputDecoration(
                                                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                                labelText: "Date of birth",
                                                                alignLabelWithHint: true,
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
                                                          focusNode: infantPassportFocus,
                                                          validator: (value) {
                                                            return value == null || value.isEmpty ? "Passport Number" : null;
                                                          },
                                                          onSaved: (v) {
                                                            FocusManager.instance.primaryFocus.unfocus();
                                                          },
//                                                                onFieldSubmitted: (v){
//
//                                                                },
                                                          onChanged: (value) => model.setPassengerPassportNumber(index, passengerType, value),
                                                          initialValue: model.getPassengerPassportNumber(index, passengerType),
                                                          style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                          decoration: InputDecoration(
                                                            labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                            labelText: "Passport Number",
                                                            alignLabelWithHint: true,
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                          child: GestureDetector(
                                                        onTap: () {
                                                          isDoB = false;

                                                          showDobDialog(context, model, isDoB, index, passengerType);
                                                        },
                                                        child:
//
                                                            AbsorbPointer(
                                                          absorbing: true,
                                                          child: TextFormField(
                                                            controller: TextEditingController(text: model.getPassengerPassportExpData(index, passengerType)),

                                                            validator: (value) {
                                                              return value.isEmpty ? "Passport Expiry Date" : null;
                                                            },
// onSaved: (value) => pasenger.firstName = value.trimRight(),
// initialValue: model.getPassengerPassportExpData(index, passengerType),
                                                            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                                            decoration: InputDecoration(
                                                              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                              labelText: "Enter Passport Expiry Date",
                                                              alignLabelWithHint: true,
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                      Align(
                                                        alignment: Alignment.bottomRight,
                                                        child: RaisedButton(
                                                            color: CustomColors.Orange,
                                                            child: Text(
                                                              "SAVE",
// strings.save.toUpperCase(),
                                                              style: CustomStyles.button_style,
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(10.0),
                                                            ),
                                                            onPressed: () async {
                                                              if (_formState.currentState.validate()) {
                                                                _formState.currentState.save();
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
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          15.0),
                            ),
                            child: Container(
                              margin:
                                  EdgeInsets.all(
                                      15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                children: <
                                    Widget>[
                                  Expanded(
                                      flex: 6,
                                      child:
                                          Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                        children: <
                                            Widget>[
                                          SizedBox(
                                            height:
                                                5,
                                          ),
                                          Text(
                                            model.flightResultsData.currency +
                                                " " +
                                                (model.flightResultsData.baseRate).toStringAsFixed(2),
                                            style: CustomStyles
                                                .appbar
                                                .copyWith(color: CustomColors.BackGround),
                                          ),
                                          SizedBox(
                                            height:
                                                9,
                                          ),
                                          Wrap(
                                            spacing:
                                                1.2,
//
                                            alignment:
                                                WrapAlignment.start,
                                            direction:
                                                Axis.horizontal,

//

                                            children: <
                                                Widget>[
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  model.flightResultsData.requestData.adults != 0 ? Text('Adult ${model.flightResultsData.requestData.adults} | ', style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))) : SizedBox.shrink(),
                                                  model.flightResultsData.requestData.children != 0 ? Text('Children ${model.flightResultsData.requestData.children} | ', style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))) : SizedBox.shrink(),
                                                  model.flightResultsData.requestData.infants != 0 ? Text('Infants ${model.flightResultsData.requestData.infants} | ', style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))) : SizedBox.shrink(),
                                                ],
                                              ),
                                              Text(
                                                model.flightResultsData.requestData.cabinSelection_name,
                                                style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                                5,
                                          ),
                                        ],
                                      )),
                                  Expanded(
                                      flex: 4,
                                      child: RaisedButton(
                                          child: Text(
                                            'CONTINUE',
                                            style:
                                                CustomStyles.button_style,
                                          ),
                                          color: CustomColors.Orange,
                                          padding: EdgeInsets.all(12),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          onPressed: () {
                                          if(_formState.currentState.validate())

//  if(_formState.currentState.validate()&&_child_formState.currentState.validate()&&_infant_formState.currentState.validate()) {
//                                      _formState.currentState.save();
//
//                                      _child_formState.currentState.save();
//
//                                      _infant_formState.currentState.save();

                                            Navigator.pushNamed(
                                                context,
                                                Routes.flightPaymentOptions,
                                                arguments: model.getArguments());
// }
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

  showSourceBottomSheet(
      BuildContext context,
      FlightPassengerInfoModel model,
      int index,
      int passengerType) {
    return showModalBottomSheet(
        isDismissible: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
//margin: EdgeInsets.all(15),
            child: SelectCountry(model, context,
                index, passengerType)));
  }

  void showDobDialog(
      BuildContext context,
      FlightPassengerInfoModel model,
      bool isDoB,
      int index,
      int passengerType) {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
          padding: EdgeInsets.all(5),
          height: 370.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              Container(
                  height: 310.0,
                  width: 300.0,
                  child: DateSelector2(
                      model,
                      context,
                      isDoB,
                      index,
                      passengerType)),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(
                                context);
                          },
                          child: Text('Cancel'),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          15.0),
                              side: BorderSide(
                                  color: CustomColors
                                      .disabledButton,
                                  width: 2)))),
                  SizedBox(
                    child: FlatButton(
                        onPressed: () {
                          if (isDoB) {
                            model.setPassengerDOB(
                                index,
                                passengerType,
                                model.tempDate);
                          } else {
                            model.setPassengerPassportExpDate(
                                index,
                                passengerType,
                                model.tempDate);
                          }

                          Navigator.pop(context);
                        },
                        child: Text('Ok'),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                                        15.0),
                            side: BorderSide(
                                color: CustomColors
                                    .disabledButton,
                                width: 2))),
                  ),
                ],
              )
            ],
          )),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            simpleDialog);
  }

  bool isValidEmail(email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
