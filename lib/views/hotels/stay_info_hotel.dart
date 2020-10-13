import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/hotels/responses/hotel_details_response.result.dart';

import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/utils/utils.dart';
import 'package:ota/viewmodels/stay_info_view_model.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class StayInfoHotel extends StatelessWidget {
  HotelDetailsResponseResult hotel;

  StayInfoViewModel _model;
  GlobalKey<FormState> _formState;
  int selectGroup;

  StayInfoHotel(this.hotel, this.selectGroup) {
    _formState = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<StayInfoViewModel>(
      create: (context) => _model = StayInfoViewModel(hotel, selectGroup),
      child: Consumer<StayInfoViewModel>(
        builder: (context, model, child) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text(
                  strings.stayInformation,
                  style: CustomStyles.appbar,
                ),
              ),
              body: model.isLoading
                  ? SpinKitChasingDots(
                      size: SizeConstants.SIZE_50,
                      color: CustomColors.BackGround,
                    )
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          children: [
                            SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(maxHeight: constraints.biggest.height - 120),
                                child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_20, vertical: SizeConstants.SIZE_20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context).size.width - SizeConstants.SIZE_100,
                                              child: Text(
                                                model.hotel.hotel.name,
                                                style: CustomStyles.heading,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              '${convertToDate(model.hotel.checkIn)} - ${convertToDate(model.hotel.checkOut)} '
                                              '| Rooms ${model.hotel.hotel.roomOption[selectGroup].rooms.length.toString()} | ${model.totalAdults} Guest',
                                              style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 24,
                                          width: SizeConstants.SIZE_60,
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            color: CustomColors.Orange,
                                            child: Text(
                                              'EDIT',
                                              style: CustomStyles.calenderStyle.copyWith(color: CustomColors.White),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                      fit: FlexFit.tight,
                                      child: Form(
                                        key: _formState,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics: BouncingScrollPhysics(),
                                          itemCount: model.passengers.length,
                                          itemBuilder: (context, index) {
                                            return ExpandContact(model, model.passengers[index], _formState);
                                          },
                                        ),
                                      )),
                                ]),
                              ),
                            ),
                            Spacer(),
                            Card(
                              elevation: 6,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: SizeConstants.SIZE_100,
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "USD ${model.hotel.hotel.roomOption[model.selectGroup].displayRateInfoWithMarkup.totalPriceWithMarkup}",
                                          style:
                                              CustomStyles.whiteTextSytle24Size.copyWith(color: CustomColors.BackGround, fontWeight: FontWeight.w500),
                                        ),
                                        LimitedBox(
                                          maxWidth: MediaQuery.of(context).size.width / 2,
                                          child: Text(
                                            "${model.hotel.hotel.roomOption[model.selectGroup].rooms[0].roomName}",
                                            style: CustomStyles.whiteTextSytle14Size.copyWith(color: CustomColors.disabledButton),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConstants.SIZE_48,
                                      child: RaisedButton(
                                          padding: EdgeInsets.all(SizeConstants.SIZE_16),
                                          color: CustomColors.Orange,
                                          child: Text(
                                            "Proceed",
                                            style: CustomStyles.button_style,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          onPressed: () {
                                            if (!model.vadlidatePassengers()) {
                                              model.openInvalidPassengers();
                                              _formState.currentState.validate();
                                              return;
                                            }
                                            Map<String, dynamic> args = new Map();
                                            args['response'] = model.hotel;

                                            args['selectGroup'] = model.selectGroup;
                                            args['paymentmodel'] = model.hotelPaymentModel;

                                            Navigator.pushNamed(context, Routes.paymentHotel, arguments: args);
                                          }),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ));
        },
      ),
    );
  }
}

class ExpandContact extends StatelessWidget {
  StayInfoViewModel _model;
  PassengerModel pasenger;
  String label = "Primary ";
  GlobalKey<FormState> _key;

  ExpandContact(this._model, this.pasenger, this._key) {
    if (pasenger.type == 2) {
      label = "Guest ";
    } else if (pasenger.type == 3) {
      label = "Child";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StayInfoViewModel>.value(
        value: _model,
        child: Consumer<StayInfoViewModel>(builder: (context, model, child) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                    onTap: () => _model.enabledEditMode(pasenger),
                    child: Container(
                      color: pasenger.firstName == null ? CustomColors.Orange : CustomColors.BackGround,
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
                                visible: pasenger.firstName == null,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                  child: Text(label, style: CustomStyles.medium16),
                                )),
                            Visibility(
                                visible: pasenger.firstName != null,
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/images/user.svg",
                                          width: SizeConstants.SIZE_20, height: SizeConstants.SIZE_20, color: Colors.black54),
                                      SizedBox(
                                        width: SizeConstants.SIZE_8,
                                      ),
                                      Text(pasenger.firstName ?? '', style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround)),
                                      SizedBox(
                                        width: SizeConstants.SIZE_8,
                                      ),
                                      Text(pasenger.age != null ? ', Age: ${pasenger.age}' : '',
                                          style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround)),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),
                Visibility(
                    maintainSize: false,
                    visible: pasenger.isFlipped,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DropdownButton(
                                onChanged: (value) => pasenger.selectedGender = value.trimRight(),
                                items: List.generate(model.genders.length, (index) {
                                  return DropdownMenuItem(
                                    child: Text(model.genders[index]),
                                    value: index,
                                  );
                                }),
                                value: pasenger.selectedGender,
                              ),
                              SizedBox(
                                width: SizeConstants.SIZE_12,
                              ),
                              Flexible(
                                child: TextFormField(
                                  validator: (value) {
                                    return value == null || value.isEmpty ? "Enter First Name" : null;
                                  },
                                  onSaved: (value) => pasenger.firstName = value.trimRight(),
                                  initialValue: pasenger.firstName ?? '',
                                  style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                  decoration: InputDecoration(
                                      labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                      labelText: strings.firstName,
                                      alignLabelWithHint: true,
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(0)),
                                ),
                              )
                            ],
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Last Name";
                              }
                              return null;
                            },
                            onSaved: (value) => pasenger.lastName = value.trimRight(),
                            initialValue: pasenger.lastName ?? '',
                            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                            decoration: InputDecoration(
                              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                              labelText: strings.lastName,
                              alignLabelWithHint: true,
                              isDense: true,
                            ),
                          ),
                          Visibility(
                            visible: pasenger.type == 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  onSaved: (value) => pasenger.email = value.trimRight(),
                                  validator: (value) {
                                    return value == null || value.isEmpty ? "Enter Email" : null;
                                  },
                                  initialValue: pasenger.email ?? '',
                                  style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                  decoration: InputDecoration(
                                    labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                    labelText: strings.email,
                                    alignLabelWithHint: true,
                                    isDense: true,
                                  ),
                                ),
                                Container(
                                  decoration:
                                      BoxDecoration(border: Border(bottom: BorderSide(color: CustomColors.BackGround.withOpacity(0.75), width: 2))),
                                  child: InternationalPhoneNumberInput(
                                      onSaved: (value) => pasenger.phoneNumber = value.replaceAll(" ", ""),
                                      initialValue: pasenger.intlPhoneNumber,
                                      inputDecoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                      textStyle: CustomStyles.HintStyle.copyWith(color: Colors.black),
                                      selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
                                      onInputChanged: (PhoneNumber number) {
                                        for (int i = 0; i < model.codesResponseEntity.length; i++) {
                                          if ("+" + model.codesResponseEntity[i].telephoneCode == number.dialCode) {
                                            pasenger.selectedCountry = i;
                                            pasenger.intlPhoneNumber = number;
                                            break;
                                          }
                                        }
                                      },
                                      onInputValidated: (bool value) {
                                        pasenger.phoneNumberValidated = value;
                                      },
                                      validator: (value) {
                                        if (!pasenger.phoneNumberValidated) {
                                          return "Enter PhoneNumber";
                                        }
                                        return null;
                                      }),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: pasenger.type == 3,
                            child: TextFormField(
                              validator: (value) {
                                return value == null || value.isEmpty ? "Enter Age" : null;
                              },
                              onSaved: (value) => pasenger.age = value.trimRight(),
                              initialValue: pasenger.age ?? '',
                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                              decoration: InputDecoration(
                                labelText: strings.age,
                                alignLabelWithHint: true,
                                isDense: true,
                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: RaisedButton(
                                color: CustomColors.Orange,
                                child: Text(
                                  strings.save.toUpperCase(),
                                  style: CustomStyles.button_style,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () async {
                                  if (_key.currentState.validate()) {
                                    _key.currentState.save();
                                    _model.enableNext(pasenger);
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
        }));
  }
}
