import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/net/service/delegate.dart';
import 'package:ota/net/service/transfers/transfer_results_data.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/transfer_view_models/transfer_passenger_info_model.dart';
import 'package:ota/views/transfer/transfer_date_selector.dart';
import 'package:provider/provider.dart';

class Passenger_info extends StatefulWidget {
  TransferResultsData transferResultsData;

  Passenger_info(this.transferResultsData);

  @override
  _Passenger_infoState createState() =>
      _Passenger_infoState(transferResultsData);
}

class _Passenger_infoState extends State<Passenger_info>  implements Delegate{



  var height;

  var width;

  var _formKey = new GlobalKey<FormState>();

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  TransferResultsData transferResultsData;

  _Passenger_infoState(this.transferResultsData);

  bool phoneValid = false;

  var lastNameFocus = FocusNode();
  var emailNode   = FocusNode();
  var mobileNode   = FocusNode();



  @override
  Widget build(BuildContext context) {


    height = MediaQuery.of(context).size.height / 10;

    width = MediaQuery.of(context).size.width / 10;

    return ChangeNotifierProvider<TransferPassengerModel>(
      create: (context) => TransferPassengerModel(transferResultsData,this),
      child: Consumer<TransferPassengerModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(

              title: Text( "Passenger Information", style: CustomStyles.button_style.copyWith(fontSize: 20),),

              leading:

              IconButton( icon: new Icon( Icons.arrow_back_ios, color: Colors.white, size: 13,),
                onPressed: () => Navigator.of(context).pop(),
              ),


              actions: <Widget>[

                IconButton( icon: new Icon( Icons.clear, color: Colors.white, size: 20, ),

                  //  onPressed: () => Navigator.of(context).pop(),
                ),
              ],

              elevation: 0.0,

              backgroundColor: CustomColors.BackGround,
            ),

            body: model.loading
                ? SpinKitChasingDots(
                    size: SizeConstants.SIZE_50,
                    color: CustomColors.BackGround,
                  )
                : SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(left: width * .4, right: width * .4, top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(model.requestData.oneWay ? getLocalText("one_way", context):getLocalText("round_trip", context), style: CustomStyles.heading,),
                                      SizedBox( height: 7,),
                                      Wrap(
                                        children: <Widget>[
                                          Text(
                                          getLocalText("source", context),
                                            style: CustomStyles.calenderStyle.copyWith( color: CustomColors.heading, fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            model.requestData.pichUpPlace,
                                            style: CustomStyles.calenderStyle
                                                .copyWith(
                                                    color:
                                                        CustomColors.heading),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Wrap(
                                        children: <Widget>[
                                          Text(
                                          getLocalText("destination", context),
                                            style: CustomStyles.calenderStyle.copyWith( color: CustomColors.heading, fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            model.requestData.dropPlace, style: CustomStyles.calenderStyle.copyWith( color: CustomColors.heading),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
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
                                    getLocalText("edit", context), style: CustomStyles.calenderStyle.copyWith(color: CustomColors.White),
                                    ),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0),),
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
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      model.showDetails();
                                    },
                                    child: Container(
                                      color: model.firstName.text == ""
                                          ? CustomColors.Orange
                                          : CustomColors.BackGround,
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: SizeConstants.SIZE_4),
                                        width: MediaQuery.of(context).size.width,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: CustomColors.White,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              spreadRadius: 0.5,
                                              blurRadius: 0.5,

                                              offset: Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Visibility(
                                                visible: model.firstName.text.length==0,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal:
                                                          SizeConstants.SIZE_12),
                                                  child: Text(getLocalText("passenger", context),
                                                      style:
                                                          CustomStyles.medium16),
                                                )),
                                            Visibility(
                                                visible: model.firstName.text.length!=0,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal:
                                                          SizeConstants.SIZE_12),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          "assets/images/user.svg",
                                                          width: SizeConstants
                                                              .SIZE_20,
                                                          height: SizeConstants
                                                              .SIZE_20,
                                                          color: Colors.black54),
                                                      SizedBox(
                                                        width:
                                                            SizeConstants.SIZE_8,
                                                      ),
                                                      Text(model.firstName.text ?? '',
                                                          style: CustomStyles
                                                              .medium16
                                                              .copyWith(
                                                                  color: CustomColors
                                                                      .BackGround)),
                                                      SizedBox(
                                                        width:
                                                            SizeConstants.SIZE_8,
                                                      ),
                                                      Text(
                                                          model.email.text!= null
                                                              ? ', ${getLocalText("email", context)}: ${model.email.text}'
                                                              : '',
                                                          style: CustomStyles
                                                              .medium16
                                                              .copyWith(
                                                                  color: CustomColors
                                                                      .BackGround)),
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    )),
                                model.expandDetails
                                    ? fillDetails(model)
                                    : SizedBox.shrink(),
                                SizedBox(
                                  height: 50,
                                ),


                              ],
                            ),
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
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        model.selectedVehicleData
                                            .first
                                            .displayRateInfoWithMarkup
                                            .currency +
                                            " " +
                                            model
                                                .selectedVehicleData
                                                .first
                                                .displayRateInfoWithMarkup
                                                .totalPriceWithMarkup
                                                .toString(),
                                        style: CustomStyles.appbar.copyWith(
                                            color: CustomColors.BackGround),
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            model.selectedVehicleData.first
                                                .carClass.title +
                                                " | ",
                                            style:
                                            CustomStyles.calenderStyle,
                                          ),
                                          Text(
                                            model.selectedVehicleData.first
                                                .carClass.capacity
                                                .toString() +
                                                ' ${
                                                getLocalText("seater", context)
                                                }',
                                            style:
                                            CustomStyles.calenderStyle,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                  RaisedButton(
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
                                      if(model.expandDetails) {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          Dialogs.showLoadingDialog(
                                              context, _keyLoader);

                                          model
                                              .placeTransferOrder()
                                              .then((value) {
                                                if(value!=null)
                                                  {
                                            Navigator.of(
                                                _keyLoader.currentContext,
                                                rootNavigator: true)
                                                .pop();

                                            print(value.isError);

                                              Navigator.pushNamed(context,
                                              Routes.travelPaymentOptions,
                                                  arguments:
                                                  model.getArgumentData());
                                            }
                                                else
                                                  return null;
                                          });
                                        }
                                      }else{
                                        model.showDetails();
                                      }
                                    },
                                  )
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

  Widget fillDetails(TransferPassengerModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        SizedBox(height: 10,),
             Text(
        getLocalText("enter_your_name_as_in_id", context),
             style: CustomStyles.normal12
            .copyWith(color: CustomColors.disabledButton)),
        SizedBox(height: 5,),


         DropdownButtonFormField(
           focusColor: Colors.white,
            items: model.passengerCount.map((int passengers) {
            return new DropdownMenuItem(
            value: passengers,
            child: Text(passengers.toString(),style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),),
         );
           }).toList(),
         onChanged: (newValue) {
            model.setPassengerCount(newValue);
          },
           validator:(value) =>value == null ? getLocalText("no_of_passengers", context) : null,
         value: model.passengers,
         decoration: InputDecoration(
         contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
         filled: true,
         fillColor: Colors.white,
         labelText: getLocalText("no_of_passengers", context),
             border: new UnderlineInputBorder(
                 borderSide: new BorderSide(
                     color:CustomColors.disabledButton
                 )
             ),
         labelStyle: CustomStyles.normal16
         .copyWith(color: CustomColors.disabledButton)

        // errorText: model.passengers == null ? "select number of passengers" : null
         ),
       ),


        TextFormField(
        inputFormatters: [
        LengthLimitingTextInputFormatter(30),
        ],
          textInputAction: TextInputAction.next,
          style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround),
          decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: getLocalText("first_name", context),
              labelStyle: CustomStyles.normal16
                  .copyWith(color: CustomColors.disabledButton),
          ),
          initialValue: model.firstName.text,
          onSaved:(value)=>model.dataChanged(value),

          onFieldSubmitted: (v){

          FocusScope.of(context).requestFocus(lastNameFocus);
          },
          validator: (value) {
            final validCharacters = RegExp(
                r'[1234567890!@#$%^&*(),.?":{}|<>]');

            if(validCharacters.hasMatch(value))
              return "Enter Correct Name";

          return value == null || value.isEmpty ? getLocalText("enter_first_name", context) : null;
          },

        ),


        TextFormField(
        inputFormatters: [
        LengthLimitingTextInputFormatter(30),
        ],
        focusNode: lastNameFocus,
          controller: model.lastName,
          textInputAction: TextInputAction.next,
          style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround),
          decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: getLocalText("last_name", context),
            labelStyle: CustomStyles.normal16
                .copyWith(color: CustomColors.disabledButton),
          ),
        validator: (value) {
          final validCharacters = RegExp(
              r'[1234567890!@#$%^&*(),.?":{}|<>]');

          if(validCharacters.hasMatch(value))
            return "Enter Correct Name";
        return value == null || value.isEmpty ? getLocalText("enter_last_name", context) : null;
        },

          onFieldSubmitted: (v){

          FocusScope.of(context).requestFocus(emailNode);
          },

        ),

        TextFormField(
        inputFormatters: [
        LengthLimitingTextInputFormatter(30),
        ],
        focusNode: emailNode,
          controller: model.email,

          style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround),
          decoration: InputDecoration(
          alignLabelWithHint: true,
          labelText: getLocalText("email_id", context),
            labelStyle: CustomStyles.normal16
                .copyWith(color: CustomColors.disabledButton),
          ),
        onFieldSubmitted: (v){

        FocusScope.of(context).requestFocus(mobileNode);
        },

        validator: (input) => input.isEmpty ? getLocalText("enter_email", context) : isValidEmail(input) ? null : getLocalText("enter_valid_email", context) ,

        ),

          SizedBox(height: 10,),
        Container(
       // decoration: BoxDecoration(border: Border(bottom: BorderSide(color: CustomColors.disabledButton, width: 2))),
        child: InternationalPhoneNumberInput(
        focusNode: mobileNode,

          isEnabled: true,

          selectorConfig: SelectorConfig(
           selectorType: PhoneInputSelectorType.DIALOG),
           onInputChanged: (PhoneNumber number) {


           FocusScope.of(context).requestFocus(mobileNode);
            model.changeCountryCodeSelection(number.dialCode);

             },


            onSaved: (value) {
              model.phoneNumberWithCode =
                  "+${model.countryCodes[model.selectedCountry].telephoneCode} " + value.replaceAll(" ", "");
            },

            onInputValidated: (bool value) {

             phoneValid = value;
            },

        validator: (value)=>value.isEmpty?getLocalText("enter_phone_number", context):!phoneValid?getLocalText("enter_valid_phone_number", context):null,

           inputDecoration: InputDecoration(
           alignLabelWithHint: true,
            labelStyle: CustomStyles.normal16
           .copyWith(color: CustomColors.disabledButton),
          // border: InputBorder.none,
             labelText: getLocalText("enter_phone_number", context),

//             focusedBorder: InputBorder.none,
//           enabledBorder: InputBorder.none,
//           errorBorder: InputBorder.none,
//           disabledBorder: InputBorder.none,
           ),
            ignoreBlank: false,
           // initialValue: model.phoneNumber,
           ),
        ),

        Visibility(
          visible:  model.selectedVehicleData.first.finishPlace.terminal.isNotEmpty,
          child: GestureDetector(

            onTap: (){
            mobileNode.unfocus();
            lastNameFocus.unfocus();
            emailNode.unfocus();
              showDateSelectionSheet(context,model,"destination");
            },

            child: AbsorbPointer(
              absorbing: true,
              child: TextFormField(
                readOnly: true,
                controller: TextEditingController(text: model.destinationDate),

                validator: (value) {
                  return value == null || value.isEmpty ? getLocalText("departure_date_required", context) : null;
                },
                 // initialValue: model.destinationDate ?? '',
                style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                decoration: InputDecoration(
                  labelText: getLocalText("departure_time", context),
                alignLabelWithHint: true,
                labelStyle: CustomStyles.normal16,


                ),
              ),
            ),
          ),
        ),


        Visibility(
          visible: model.selectedVehicleData.first.finishPlace.terminal.isNotEmpty,
          child: GestureDetector(

            onTap: (){
            mobileNode.unfocus();
            lastNameFocus.unfocus();
            emailNode.unfocus();
              _selectTime(model,context,"destination");
            },

            child: AbsorbPointer(
              absorbing: true,
              child: TextFormField(
                readOnly: true,
                controller: TextEditingController(text: model.destinationTime),


                validator: (value) {
                  return value == null || value.isEmpty ? getLocalText("departure_time_required", context) : null;
                },
                // initialValue: model.destinationDate ?? '',
                style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                decoration: InputDecoration(
                labelStyle: CustomStyles.normal16
                .copyWith(color: CustomColors.disabledButton),
                  labelText: getLocalText("departure_time", context),
                  alignLabelWithHint: true,

                ),
              ),
            ),
          ),
        ),


        GestureDetector(

          onTap: (){
          mobileNode.unfocus();
          lastNameFocus.unfocus();
          emailNode.unfocus();
            showDateSelectionSheet(context,model,"pickup");
          },

          child: AbsorbPointer(
            absorbing: true,
            child: TextFormField(
              controller: TextEditingController(text: model.pickUpDate),


              validator: (value) {
                return value == null || value.isEmpty ? getLocalText("pickup_date_required", context) : null;
              },
              // initialValue: model.destinationDate ?? '',
              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
              decoration: InputDecoration(
              labelStyle: CustomStyles.normal16
              .copyWith(color: CustomColors.disabledButton),
                labelText:  getLocalText("pick_up_date", context),
                alignLabelWithHint: true,

              ),
            ),
          ),
        ),


        GestureDetector(

          onTap: (){
          mobileNode.unfocus();
          lastNameFocus.unfocus();
          emailNode.unfocus();
            _selectTime(model,context,"pickup");
          },

          child: AbsorbPointer(
            absorbing: true,
            child: TextFormField(
              controller: TextEditingController(text: model.pickUpTime),


              validator: (value) {
                return value == null || value.isEmpty ? getLocalText("pickup_time_required", context) : null;
              },
              // initialValue: model.destinationDate ?? '',
              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
              decoration: InputDecoration(
              labelStyle: CustomStyles.normal16
              .copyWith(color: CustomColors.disabledButton),
                labelText:  getLocalText("pick_up_time", context),
                alignLabelWithHint: true,

              ),
            ),
          ),
        ),



            Visibility(
              visible: model.selectedVehicleData.first.startPlace.terminal.isNotEmpty,
              child: TextFormField(
              onTap: (){
              mobileNode.unfocus();
              lastNameFocus.unfocus();
              emailNode.unfocus();
              },
                   controller: TextEditingController(text:model.startTrainOrFlightNumber),
                  textInputAction: TextInputAction.next,
                  style: CustomStyles.normal16
                      .copyWith(color: CustomColors.BackGround),
                  onChanged: (value){
                     model.changeTrainFlightNumber(value,"start");
                  },
                validator: (value) {
                  return value == null || value.isEmpty ? getLocalText("flight_or_train_number", context) : null;
                },
                  decoration: InputDecoration(
                  alignLabelWithHint: true,
                    labelText: getLocalText("flight_or_train_number", context) ,
                    labelStyle: CustomStyles.normal16
                        .copyWith(color: CustomColors.disabledButton),
                    // suffixIcon: Icon(Icons.event_available,color: CustomColors.disabledButton,)
                  ),
                ),
            ),



             Visibility(
               visible: model.selectedVehicleData.first.startPlace.terminal.isNotEmpty,
               child:

               DropdownButtonFormField(
               onTap: (){
               mobileNode.unfocus();
               lastNameFocus.unfocus();
               emailNode.unfocus();
               },
                 focusColor: Colors.white,
                 items:model.selectedVehicleData.first.startPlace.terminal.map((String terminal) {
                   return new DropdownMenuItem(
                     value: terminal,
                     child: Text(terminal.toString(),style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),),
                   );
                 }).toList(),
                 onChanged: (newValue) {
                   model.setCarriageTerminalNumber(newValue,"start");
                 },
                 validator:(value) =>value == null ?getLocalText("arrival_terminal_required", context) : null,
                 value: model.startTerminalOrCarriageNumber,
                 decoration: InputDecoration(
                     contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                     alignLabelWithHint: true,
                     fillColor: Colors.white,
                     labelText: getLocalText("arrival_terminal", context),
                     labelStyle: CustomStyles.normal16
                     .copyWith(color: CustomColors.disabledButton),
                     border: new UnderlineInputBorder(
                         borderSide: new BorderSide(
                             color:CustomColors.disabledButton
                         )
                     )

                   // errorText: model.passengers == null ? "select number of passengers" : null
                 ),
               ),




             ),




        Visibility(
          visible: model.selectedVehicleData.first.finishPlace.terminal.isNotEmpty,
          child: TextFormField(
          onTap: (){
          mobileNode.unfocus();
          lastNameFocus.unfocus();
          emailNode.unfocus();
          },
            controller: TextEditingController(text:model.finishTrainOrFlightNumber),
            textInputAction: TextInputAction.next,
            style: CustomStyles.normal16
                .copyWith(color: CustomColors.BackGround),
            onChanged: (value){
              model.changeTrainFlightNumber(value,"finish");
            },
            validator: (value) {
              return value == null || value.isEmpty ? getLocalText("flight_or_train_number", context) : null;
            },
            decoration: InputDecoration(
            alignLabelWithHint: true,
              labelText: getLocalText("flight_or_train_number", context),
              labelStyle: CustomStyles.normal16
                  .copyWith(color: CustomColors.disabledButton),
              // suffixIcon: Icon(Icons.event_available,color: CustomColors.disabledButton,)
            ),
          ),
        ),




        Visibility(
          visible: model.selectedVehicleData.first.finishPlace.terminal.isNotEmpty,
          child:

          DropdownButtonFormField(
          onTap: (){
          mobileNode.unfocus();
          lastNameFocus.unfocus();
          emailNode.unfocus();
          },
            focusColor: Colors.white,
            items:model.selectedVehicleData.first.finishPlace.terminal.map((String terminal) {
              return new DropdownMenuItem(
                value: terminal,
                child: Text(terminal.toString(),style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),),
              );
            }).toList(),
            onChanged: (newValue) {
              model.setCarriageTerminalNumber(newValue,"finish");
            },
            validator:(value) =>value == null ? getLocalText("arrival_terminal_required", context) : null,
            value: model.finishTerminalOrCarriageNumber,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                alignLabelWithHint: true,
                fillColor: Colors.white,
                labelText: getLocalText("arrival_terminal", context),
                labelStyle: CustomStyles.normal16
                .copyWith(color: CustomColors.disabledButton),
                border: new UnderlineInputBorder(
                    borderSide: new BorderSide(
                        color:CustomColors.disabledButton
                    )
                )

              // errorText: model.passengers == null ? "select number of passengers" : null
            ),
          ),




        ),




      ],
    );



  }
//  showSourceBottomSheet(BuildContext context, TransferPassengerModel model) {
//
//
//    return showModalBottomSheet(
//        isDismissible:true ,
//        clipBehavior: Clip.antiAliasWithSaveLayer,
//        backgroundColor: Colors.white,
//        isScrollControlled: true,
//        context: context,
//        builder: (context) => Container(
//          //margin: EdgeInsets.all(15),
//            child: SelectCountry(model,context)
//
//
//
//        ));
//
//
//
//  }


  bool isValidEmail(email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  void showDateSelectionSheet(BuildContext context, TransferPassengerModel model, String selectionType) {

    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
          padding: EdgeInsets.all(5),

          height: 370.0,
          width: 300.0,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 310.0,
                  width: 300.0,
                  child: TransferDateSelector(model,context,selectionType)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(child: FlatButton(onPressed: (){
                    Navigator.pop(context);

                  }, child: Text(getLocalText("cancel", context)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),side: BorderSide(color: CustomColors.disabledButton,width: 2))


                  )) ,

                  SizedBox(child: FlatButton(

                   child: Text(getLocalText("ok", context)),
                   shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(15.0),
                       side: BorderSide(color: CustomColors.disabledButton,width: 2)
                   ),
                      onPressed: (){

                    if(model.tempDate!=null)

                    model.setSelectedDate(selectionType);

                    Navigator.pop(context);

                  },

                  ),


                  ) ,



                ],)
            ],
          )

      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
  }


  Future<void> _selectTime(TransferPassengerModel model, BuildContext context, String selectionType) async {

    DateFormat dateFormat = DateFormat("HH:mm");

    TimeOfDay time =  await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child,
        );
      },
    );

    //DateTime dateTime = dateFormat.parse(time.toString());

    // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    final now = new DateTime.now();

    String formattedTime = dateFormat.format(DateTime(now.year, now.month, now.day, time.hour, time.minute));

    model.setTime(time.format(context),selectionType,formattedTime);

  }

  void showUnavailableDialog(BuildContext context, responseException) {

    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        height: 270.0,
        width: 300.0,
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Image.asset('assets/images/transfer.png',height: 150,),),
            Padding(
              padding: EdgeInsets.all(7.0),
              child: Text(
                  responseException.toString(),textAlign: TextAlign.center,
                  style: CustomStyles.normal14
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    color: CustomColors.Orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),side: BorderSide(color: CustomColors.Orange,width: 2)),
                    // color: Colors.blue,
                    onPressed: () async {

                      Navigator.pop(context);

                    },
                    child: Text(
                        'OK',
                        style: CustomStyles.normal16.copyWith(color: CustomColors.White)
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);

  }

  @override
  void onError(String message, bool isFromCreditCard, String asset) {
   Dialogs.showGenericErrorPopup(context, message, isFromCreditCard, asset);
  }


getLocalText(String key, BuildContext context) {

return  AppLocalizations.of(context).translate(key);
}


}
