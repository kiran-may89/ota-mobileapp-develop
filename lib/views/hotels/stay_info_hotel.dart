import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/app/Router.dart';

import 'package:ota/models/flights/validation_model.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/hotels/responses/hotel_details_response.result.dart';

import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/utils/utils.dart';
import 'package:ota/viewmodels/hotels_view_model/stay_info_view_model.dart';

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
//
                appBar: AppBar(
                  title: Text(
                    getLocalText("stay_information", context),
                    style: CustomStyles.appbar,
                  ),

                  leading: new IconButton(
                    icon: new Icon(
                      Icons.arrow_back_ios, color: Colors.white, size: 13,),
                    onPressed: () => Navigator.of(context).pop(),
                  ),

                ),
                body: model.isLoading
                    ? SpinKitChasingDots(
                  size: SizeConstants.SIZE_50,
                  color: CustomColors.BackGround,
                )

                :
            SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(

            height: MediaQuery.of(context).size.height,
            child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
            margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_20, vertical: SizeConstants.SIZE_20),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Column(
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
            '| ${getLocalText("rooms", context)} ${model.hotel.hotel.roomOption[selectGroup].rooms.length.toString()} | ${model.totalAdults}  ${getLocalText("guest", context)}',
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

            Form(
            key: _formState,
            child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: model.passengers.length,
            itemBuilder: (context, index) {
            return ExpandContact(model, model.passengers[index], _formState);
            },
            ),
            ),


            SizedBox(height: 20,),
            Padding(
            padding: const EdgeInsets.only(left:15.0,right:15.0),
            child: Card(
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
            5),
            width: MediaQuery.of(context).size.width,
            height: SizeConstants.SIZE_80,
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
            "SAR ${model.hotel.hotel.roomOption[model.selectGroup].displayRateInfoWithMarkup.totalPriceWithMarkup}",
            style:
            CustomStyles.appbar.copyWith(color: CustomColors.BackGround, fontWeight: FontWeight.w500),
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
            "CONTINUE",
            style: CustomStyles.button_style,
            ),
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            ),
            onPressed: () {
            bool isValid =false;
            for(int i=0 ;i<model.contentFilledList.length;i++) {
            if (model.contentFilledList[i]
                .isFilled == false) {
            var passanger = model.passengers
                .where((element) =>
            element.type ==
            model.contentFilledList[i]
                .passangerType &&
            element.id == model
                .contentFilledList[i]
                .index)
                .single;
            model.enabledEditMode(
            passanger);
            break;
            }
            if(i== model.contentFilledList.length-1)
            isValid =true;
            }


            if(isValid) {
            if (!model.vadlidatePassengers()) {

            _formState.currentState.validate();
            return;
            }
            Map<String,
            dynamic> args = new Map();
            args['response'] = model.hotel;

            args['selectGroup'] =
            model.selectGroup;
            args['paymentmodel'] =
            model.hotelPaymentModel;

            Navigator.pushNamed(
            context, Routes.paymentHotel,
            arguments: args);
            }

            }),
            )
            ],
            ),
            ),
            ),
            )
            ],
            ),
            ),
            ),

            );
          },
        ));
  }

}


getLocalText(String key, BuildContext context) {
  return AppLocalizations.of(context).translate(key);
}

class ExpandContact extends StatelessWidget {
  StayInfoViewModel _model;
  PassengerModel pasenger;
  String label = "primary";
  GlobalKey<FormState> _key;

  ExpandContact(this._model, this.pasenger, this._key) {


    if (pasenger.type == 2) {
      label = "guest";
    } else if (pasenger.type == 3) {
      label = "child";
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
                      color: pasenger.firstName == null
                          ? CustomColors.Orange
                          : CustomColors.BackGround,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 50,
                      child: Container(
                        margin: EdgeInsets.only(left: SizeConstants.SIZE_4),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: CustomColors.White,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 0.5,
                              blurRadius: 0.5,

                              offset: Offset(
                                  0, 1), // changes position of shadow
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
                                  margin: EdgeInsets.symmetric(
                                      horizontal: SizeConstants.SIZE_12),
                                  child: Text(getLocalText(label, context),
                                      style: CustomStyles.medium16),
                                )),
                            Visibility(
                                visible: pasenger.firstName != null,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: SizeConstants.SIZE_12),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset("assets/images/user.svg",
                                          width: SizeConstants.SIZE_20,
                                          height: SizeConstants.SIZE_20,
                                          color: Colors.black54),
                                      SizedBox(
                                        width: SizeConstants.SIZE_8,
                                      ),
                                      Text(pasenger.firstName ?? '',
                                          style: CustomStyles.medium16.copyWith(
                                              color: CustomColors.BackGround)),
                                      SizedBox(
                                        width: SizeConstants.SIZE_8,
                                      ),
                                      Text(pasenger.age != null
                                          ? ', ${getLocalText(
                                          "age", context)}: ${pasenger.age}'
                                          : '',
                                          style: CustomStyles.medium16.copyWith(
                                              color: CustomColors.BackGround)),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )),

                 SizedBox(height: 5,),




                Visibility(
                    maintainSize: false,
                    visible: pasenger.isFlipped,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConstants.SIZE_12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5,),
                          DropdownButton(
                            isExpanded: true,
                            isDense: true,
                            onChanged: (value){
                              pasenger.selectedGender =value;
                              model.notifyListeners();
                            },
                            items: List.generate(
                                model.genders.length, (index) {
                              return DropdownMenuItem(
                                child: Text(model.genders[index]),
                                value: index,
                              );
                            }),
                            value: pasenger.selectedGender,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            child: TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(30),
                              ],
                              validator: (value) {
                                final validCharacters = RegExp(
                                    r'[1234567890!@#$%^&*(),.?":{}|<>]');

                                if (value == null || value.isEmpty) {
                                  return getLocalText(
                                  "enter_first_name", context);
                                }
                                else if (validCharacters.hasMatch(value))
                                  return getLocalText("enter_correct_name", context);

                                return value == null || value.isEmpty
                                    ? getLocalText(
                                    "enter_first_name", context)
                                    : null;
                              },


                              onSaved: (value) =>
                              pasenger.firstName = value.trimRight(),
                              initialValue: pasenger.firstName ?? '',
                              style: CustomStyles.medium16.copyWith(
                                  color: CustomColors.BackGround),
                              decoration: InputDecoration(
                                  labelStyle: CustomStyles.medium16
                                      .copyWith(color: Colors.grey),
                                  labelText: getLocalText(
                                      "first_name", context),
                                  alignLabelWithHint: true,
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0)),
                            ),
                          ),
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                            ],
                            validator: (value) {
                              final validCharacters = RegExp(
                                  r'[1234567890!@#$%^&*(),.?":{}|<>]');

                              if (value == null || value.isEmpty) {
                                return getLocalText("enter_last_name", context);
                              }
                              else if (validCharacters.hasMatch(value))
                                return getLocalText("enter_correct_name", context);


                              return value == null || value.isEmpty
                                  ? getLocalText("enter_last_name", context)
                                  : null;
                            },
                            onSaved: (value) =>
                            pasenger.lastName = value.trimRight(),
                            initialValue: pasenger.lastName ?? '',
                            style: CustomStyles.medium16.copyWith(
                                color: CustomColors.BackGround),
                            decoration: InputDecoration(
                              labelStyle: CustomStyles.medium16.copyWith(
                                  color: Colors.grey),
                              labelText: getLocalText("last_name", context),
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
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(30),
                                  ],
                                  onSaved: (value) =>
                                  pasenger.email = value.trimRight(),


                                  validator: (input) =>
                                  input.isEmpty
                                      ? getLocalText("enter_email", context)
                                      : isValidEmail(input)
                                      ? null
                                      : getLocalText(
                                      "enter_valid_email", context),
                                  initialValue: pasenger.email ?? '',
                                  style: CustomStyles.medium16.copyWith(
                                      color: CustomColors.BackGround),
                                  decoration: InputDecoration(
                                    labelStyle: CustomStyles.medium16.copyWith(
                                        color: Colors.grey),
                                    labelText: getLocalText(
                                        "email_id", context),
                                    alignLabelWithHint: true,
                                    isDense: true,
                                  ),
                                ),
                                Container(
                                //  decoration:
//                                  BoxDecoration(border: Border(
//                                      bottom: BorderSide(
//                                          color: CustomColors.BackGround
//                                              .withOpacity(0.75), width: 2))),
                                  child: InternationalPhoneNumberInput(
                                    onSaved: (value) => pasenger.phoneNumber =
                                        value.replaceAll(" ", ""),
                                    initialValue: pasenger.intlPhoneNumber,
                                    inputDecoration: InputDecoration(
//                                      border: InputBorder.none,
                                      labelStyle: CustomStyles.medium16.copyWith(
                                      color: Colors.grey),
                                      labelText: getLocalText(
                                          "enter_phone_number", context),
//                                      focusedBorder: InputBorder.none,
//                                      enabledBorder: InputBorder.none,
//                                      errorBorder: InputBorder.none,
//                                      disabledBorder: InputBorder.none,
                                    ),
                                    textStyle: CustomStyles.HintStyle.copyWith(
                                        color: Colors.black),
                                    selectorConfig: SelectorConfig(
                                        selectorType: PhoneInputSelectorType
                                            .DIALOG),
                                    onInputChanged: (PhoneNumber number) {

                                      for (int i = 0; i <
                                          model.codesResponseEntity
                                              .length; i++) {
                                        if ("+" + model.codesResponseEntity[i]
                                            .telephoneCode == number.dialCode) {
                                          pasenger.selectedCountry = i;
                                          pasenger.intlPhoneNumber = number;
                                          break;
                                        }
                                      }
                                    },
                                    onInputValidated: (bool value) {
                                      pasenger.phoneNumberValidated = value;
                                    },
                                    validator: (value)=>value.isEmpty?getLocalText("enter_phone_number", context):!pasenger.phoneNumberValidated?getLocalText("enter_valid_phone_number", context):null,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: pasenger.type == 3,
                            child: TextFormField(

                              validator: (value) {
                                final validCharacters = RegExp(r'^[0-9]*$');


                                if (!validCharacters.hasMatch(value))
                                  return getLocalText("incorrect_age", context);
                                if(value.isNotEmpty)
                                if (int.parse(value) >= 9)
                                  return getLocalText("age_should_be_less_than_9_years_old", context);


                                return value == null || value.isEmpty
                                    ? getLocalText("age_required", context)
                                    : null;
                              },
                              onSaved: (value) =>
                              pasenger.age = value.trimRight(),
                              initialValue: pasenger.age ?? '',
                              style: CustomStyles.medium16.copyWith(
                                  color: CustomColors.BackGround),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: strings.age,
                                alignLabelWithHint: true,

                                isDense: true,
                                labelStyle: CustomStyles.medium16.copyWith(
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: RaisedButton(
                                color: CustomColors.Orange,
                                child: Text(
                                  getLocalText("save", context),
                                  style: CustomStyles.button_style,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                onPressed: () async {
                                  if (_key.currentState.validate()) {
                                    {
                                      _key.currentState.save();

                                      model.contentFilledList.forEach((
                                          element) {
                                        if (pasenger.id == element.index &&
                                            pasenger.type ==
                                                element.passangerType)
                                          element.isFilled = true;
                                      });

                                      _model.disableEditMode(pasenger);
                                    }
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

  bool isValidEmail(email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  getLocalText(String key, BuildContext context) {
    return AppLocalizations.of(context).translate(key);
  }


}
