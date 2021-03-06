import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/activity/request/activity_details_data.dart';
import 'package:ota/models/flights/validation_model.dart';
import 'package:ota/net/service/delegate.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/viewmodels/activities_view_models/activity_traveller_info_view_model.dart';
import 'package:provider/provider.dart';


class Activity_TravellerInformation extends StatefulWidget {

  ActivityDetailsData activityDetailsData;


  Activity_TravellerInformation(this.activityDetailsData);

  @override
  _Activity_TravellerInformationState createState() => _Activity_TravellerInformationState(activityDetailsData);
}

class _Activity_TravellerInformationState extends State<Activity_TravellerInformation> implements Delegate {


  final GlobalKey<State> _keyLoader = new GlobalKey<State>();


  Map<String, dynamic>  user;

  final _formKey = new GlobalKey<FormState>();


  ActivityDetailsData activityDetailsData;

  _Activity_TravellerInformationState(this.activityDetailsData);

  var height;

  var width;

  bool phoneNumberValidated = false;

  var lastNameFocus = FocusNode();
  var emailFocus = FocusNode();
  var addressFocus = FocusNode();
  var picodeFocus = FocusNode();
  var mobileFocus = FocusNode();

  var guestLastName = FocusNode();

  List<ValidationModel> contentFilledList = List();
  @override

  void initState() {

    contentFilledList.add(new ValidationModel(0,0,false));

    for(int i=0;i<activityDetailsData.fullDetailsData.age.length;i++)

      contentFilledList.add(new ValidationModel(0,1,false));

  }

  @override
  Widget build(BuildContext context) {


    height =MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;

    return ChangeNotifierProvider<ActivityTravellerModel>(

      create: (context) => ActivityTravellerModel(activityDetailsData,this),
      child: Consumer<ActivityTravellerModel>(
        builder: (context, model, child) {


    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(title: Text(getLocalText("travel_information", context),style: CustomStyles.button_style.copyWith(fontSize: 20),
      ),
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

        elevation: 0.0,backgroundColor: CustomColors.BackGround,),
      body:
      model.loading
          ? SpinKitChasingDots(
        size: SizeConstants.SIZE_50,
        color: CustomColors.BackGround,
      ):

      SingleChildScrollView(
        child: Form(
          key:_formKey,
          child: Container(

            margin: EdgeInsets.only(left: width*.4,right: width*.4,top: 15),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  width: double.infinity,
                  //margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                  child:   Row(
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
                            Text(model.activityDetailsData.travelDetails.FromPlace,style: CustomStyles.heading,),
                            SizedBox(height: 7,),

                            Row(children: [
                              Text(model.activityDetailsData.travelDetails.FromDateMonth+" - ",style : CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)) ,),

                              Text(model.activityDetailsData.travelDetails.ToMonth+" | ",style : CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)) ,),


                              Text(model.activityDetailsData.travelDetails.count.toString()+' ${getLocalText("person", context)}',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),)


                            ],)

                          ],

                        ),
                      ),
                      Expanded(flex: 2,
                        child: SizedBox(
                          height: 24,
                          child: RaisedButton(onPressed: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          } ,color: CustomColors.Orange,
                            child: Text( getLocalText("edit", context),style:CustomStyles.calenderStyle.copyWith(color: CustomColors.White) ,),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),

                          ),
                        ),)
                    ],),


                ),


                Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),

                SizedBox(height:5 ,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  SizedBox(height:5 ,),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      Container(

                        padding: EdgeInsets.only(top: 0,bottom: 7),
//                      margin: EdgeInsets.only(
//                          left: SizeConstants.SIZE_12,
//                          right: SizeConstants.SIZE_12),
                        child:Column(
                          children: [

                            GestureDetector(
                                onTap: () {
                               //   model.expandPassenger();

                                  contentFilledList.forEach((element) {
                                    if(element.passangerType==0 && element.index==0)
                                      element.isFilled =false;

                                  });
                                  model.expandDetails(0, 0);


                                },
                                child: Container(


                                  color: model.firstName.text == "" ? CustomColors.Orange : CustomColors.BackGround,
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
                                            visible: model.firstName.text == "",
                                            child: Container(
                                              margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                              child: Text(getLocalText("traveller", context), style: CustomStyles.medium16),
                                            )),
                                        Visibility(
                                            visible: model.firstName.text != "",
                                            child: Container(
                                              margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset("assets/images/user.svg",
                                                      width: SizeConstants.SIZE_20, height: SizeConstants.SIZE_20, color: Colors.black54),
                                                  SizedBox(
                                                    width: SizeConstants.SIZE_8,
                                                  ),
                                                  Text(model.firstName.text ?? '',
                                                      style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround)),
                                                  SizedBox(
                                                    width: SizeConstants.SIZE_8,
                                                  ),
                                                  Text( model.Email.text != null ? ', ${getLocalText("email", context)} ${ model.Email.text}' : '',
                                                      style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround)),
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                )),

                            SizedBox(height:10 ,),
                            Visibility(
                                visible: model.areDetailsVisible(0, 0),
                                child: fillDetails(model)

                            ),


                          ],
                        ),

                      ),



                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(vertical: SizeConstants.SIZE_8),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(





                              model.activityDetailsData.fullDetailsData.age.length,
                                  (  index) {

                                var lastNameFocusNode = FocusNode();

                               return   Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.only(top: 5,bottom: 5),
                                  child: Column(
                                    children: <Widget>[

                                      GestureDetector(
                                          onTap: () {
                                           // model.expandGuest();
                                            contentFilledList.forEach((element) {
                                              if(element.passangerType==1 && element.index==index)
                                                element.isFilled =false;

                                            });
                                          model.expandDetails(index, 1);
                                          },
                                          child: Container(
                                            color: model.guest_first_name[index] == "" ? CustomColors.Orange : CustomColors.BackGround,
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
                                                      visible: model.guest_first_name[index] == "",
                                                      child: Container(
                                                        margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                        child: Text("${getLocalText("guest", context)} ${index+1}", style: CustomStyles.medium16),
                                                      )),
                                                  Visibility(
                                                      visible: model.guest_first_name[index] != "",
                                                      child: Container(
                                                        margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
                                                        child: Row(
                                                          children: [
                                                            SvgPicture.asset("assets/images/user.svg",
                                                                width: SizeConstants.SIZE_20, height: SizeConstants.SIZE_20, color: Colors.black54),
                                                            SizedBox(
                                                              width: SizeConstants.SIZE_8,
                                                            ),
                                                            Text(model.guest_first_name[index] ?? '',
                                                                style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround)),
                                                            SizedBox(
                                                              width: SizeConstants.SIZE_8,
                                                            ),
                                                            Text( model.activityDetailsData.fullDetailsData.age[index].toString() != null ? ', ${getLocalText("age", context)}: ${ model.activityDetailsData.fullDetailsData.age[index].toString()}' : '',
                                                                style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround)),
                                                          ],
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          )),

                                      Visibility(
                                        visible: model.areDetailsVisible(index, 1),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              enabled: true,
                                              initialValue: model.guest_first_name[index] ?? '',

                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                              decoration: InputDecoration(
                                                alignLabelWithHint: true,
                                                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                                labelText: getLocalText("first_name", context),
                                              ),

                                              validator: (value) {
                                                final validCharacters = RegExp(
                                                    r'[!1234567890@#$%^&*(),.?":{}|<>]');

                                                if(validCharacters.hasMatch(value))
                                                  return "Enter Correct Name";
                                                return value == null || value.isEmpty ? getLocalText("enter_first_name", context) : null;
                                              },

                                              onFieldSubmitted: (v){

                                                FocusScope.of(context).requestFocus(guestLastName);
                                              },


                                              onChanged: (value){

                                                model.changeGuestFirstName(value,index);

                                              },
                                            ),


                                            TextFormField(
                                              focusNode: guestLastName,
                                              enabled: true,
                                              initialValue:model.guest_last_name[index] ?? '',
                                              textInputAction: TextInputAction.done,
                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                              decoration: InputDecoration(
                                                alignLabelWithHint: true,
                                                labelText: getLocalText("last_name", context),
                                                  labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                              ),
                                              onSaved: (v){
                                                FocusManager.instance.primaryFocus.unfocus();
                                              },
//
                                              onChanged: (value){

                                                model.changeGuestLastName(value,index);

                                              },

                                              validator: (value) {
                                                final validCharacters = RegExp(
                                                    r'[1234567890!@#$%^&*(),.?":{}|<>]');

                                                if(validCharacters.hasMatch(value))
                                                  return "Enter Correct Name";
                                                return value == null || value.isEmpty ? getLocalText("enter_last_name", context) : null;
                                              },



                                            ),


                                            TextFormField(
                                              enabled: false,
                                              initialValue: model.activityDetailsData.fullDetailsData.age[index].toString(),
                                              textInputAction: TextInputAction.next,
                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                              decoration: InputDecoration(
                                                alignLabelWithHint: true,
                                                disabledBorder: new UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      color:CustomColors.BackGround
                                                  ),
                                                ),


                                                hintText: "Enter Age",
                                                hintStyle: CustomStyles.normal16
                                                    .copyWith(color: CustomColors.disabledButton),

                                              ),
                                            ),


                                            TextFormField(
                                              enabled: false,
                                              initialValue: model.guest_type[index],
                                              textInputAction: TextInputAction.next,
                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                              decoration: InputDecoration(
                                                alignLabelWithHint: true,
                                                disabledBorder: new UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      color:CustomColors.BackGround
                                                  ),
                                                ),


                                                hintText: "Enter Type",
                                                hintStyle: CustomStyles.normal16
                                                    .copyWith(color: CustomColors.disabledButton),

                                              ),
                                            ),

                                            SizedBox(height: 10,),


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

                                                     if(_formKey.currentState.validate())
                                                       {
                                                         _formKey.currentState.save();
                                                         contentFilledList.forEach((element) {
                                                           if(element.passangerType==1 && element.index==index)
                                                             element.isFilled =true;

                                                         });

                                                         model.hideDetails(1, index);


                                                       }




                                                  }
                                              ),
                                            )
                                          ],
                                        ),
                                      ),






                                    ],
                                  ));
          }
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),













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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 5,),
                              Text(
                                model.activityDetailsData.totalAmountWithMarkup.displayRateInfoWithMarkup.currency+" "+


                                    model.activityDetailsData.totalAmountWithMarkup.displayRateInfoWithMarkup.totalPriceWithMarkup.toString(),style: CustomStyles.appbar.copyWith(color: CustomColors.BackGround),),

                              SizedBox(height: 2,),
                              Text(model.activityDetailsData.duration,style: CustomStyles.calenderStyle,),
//                            SizedBox(height: 5,),
                            ],
                          ) ,

                          RaisedButton(child: Text('BOOK NOW',style:CustomStyles.button_style ,),color: CustomColors.Orange,padding: EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ) ,
                            onPressed: (){
                              bool isAllValid =false;

                              var list = contentFilledList;

                              for(int i=0 ; i<contentFilledList.length;i++) {
                                if (!contentFilledList[i]
                                    .isFilled) {
                                  model.expandDetails(
                                      contentFilledList[i]
                                          .index,
                                      contentFilledList[i]
                                          .passangerType);

                                  break;
                                }

                                if(i == contentFilledList.length-1)
                                  isAllValid =true;

                              }

                              _formKey.currentState.validate();

                            if(isAllValid) {

                             if(_formKey.currentState.validate()){

            _formKey.currentState.save();

            Dialogs.showLoadingDialog(
            context, _keyLoader);

            model.placeOrder().then((value) {
            if(value!=null)
              {
            Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();

            Navigator.pushNamed(context, Routes.activityPaymentOptions, arguments: model.getArguemntData());
              }
            else
              return;

            });

            }

                            }else{
                              model.expandAll();
                            }


                            },)



                        ],

                      ),
                    ),



                  ),
                  SizedBox(height: 50,),






                ],),
                SizedBox(height:5 ,),




              ],
            ),
          ),
        ),
      ),

    );

         },
      ),
  );

  }



  Widget fillDetails(ActivityTravellerModel model) {



  //  model.selectedDesignation  =model.designationList.first;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10,),

          Text(getLocalText("enter_your_name_as_in_id", context),
              style: CustomStyles.normal12.copyWith(color: CustomColors.disabledButton)),

          SizedBox(height: 15,),


          DropdownButton(
            isExpanded: true,
            isDense: true,
            hint: Text('${getLocalText("designation", context)}',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround),),

            value: model.selectedDesignation,
            itemHeight: 50,

            onChanged: (newValue) {


              model.changeSelected(newValue);


            },
            items: model.designationList.map((department) {
              return DropdownMenuItem(

                child: Container(


                    child: new Text(department,style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround))),
                value: department,
              );
            }).toList(),
          ),

          TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            controller: model.firstName,
            validator: (value) {
              final validCharacters = RegExp(
                  r'[1234567890!@#$%^&*(),.?":{}|<>]');

              if(validCharacters.hasMatch(value))
                return "Enter Correct Name";
              return value == null || value.isEmpty ? getLocalText("enter_first_name", context) : null;
            },
            onFieldSubmitted: (v){
              picodeFocus.unfocus();
              FocusScope.of(context).requestFocus(lastNameFocus);
            },
            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
            decoration: InputDecoration(
                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
              labelText: getLocalText("first_name", context),
                alignLabelWithHint: true,
            ),
          ),


          TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            focusNode: lastNameFocus,
            controller: model.lastName,
            validator: (value) {
              final validCharacters = RegExp(
                  r'[1234567890!@#$%^&*(),.?":{}|<>]');

              if(validCharacters.hasMatch(value))
                return "Enter Correct Name";
              return value == null || value.isEmpty ? getLocalText("enter_last_name", context) : null;
            },
            onFieldSubmitted: (v){
              picodeFocus.unfocus();
              FocusScope.of(context).requestFocus(emailFocus);
            },

            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
            decoration: InputDecoration(
              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
              labelText: getLocalText("last_name", context),
              alignLabelWithHint: true,
            ),
          ),


          TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(30),
            ],
            focusNode: emailFocus,
            controller: model.Email,
            onFieldSubmitted: (v){
              picodeFocus.unfocus();
              FocusScope.of(context).requestFocus(mobileFocus);
            },
            validator: (input) => input.isEmpty ? getLocalText("enter_email", context) : isValidEmail(input) ? null : getLocalText("enter_valid_email", context) ,

            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
            decoration: InputDecoration(
              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
              labelText: getLocalText("email_id", context),
              alignLabelWithHint: true,
            ),
          ),




          Container(
            padding: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_12),
            child: InternationalPhoneNumberInput(
              focusNode: mobileFocus,

              selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
              onInputChanged: (PhoneNumber number) {
                model.onCountryCodeChanged(number);
              },
              onFieldSubmitted: (v){
                picodeFocus.unfocus();
                FocusScope.of(context).requestFocus(addressFocus);
              },

              onInputValidated: (bool value) {
                FocusScope.of(context).requestFocus(mobileFocus);
                phoneNumberValidated = value;
              },

              validator: (value)=>value.isEmpty?getLocalText("enter_phone_number", context):!phoneNumberValidated?getLocalText("enter_valid_phone_number", context):null,
              inputDecoration: new InputDecoration(
              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
              labelText: getLocalText("enter_phone_number", context),
//                  border: InputBorder.none,
//                  focusedBorder: InputBorder.none,
//                  enabledBorder: InputBorder.none,
//                  errorBorder: InputBorder.none,
//                  disabledBorder: InputBorder.none,
                  hintText: strings.phoneNumber),
              ignoreBlank: false,
              initialValue: model.phoneNumber,
            ),
        //    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
          ),


          TextFormField(
            focusNode: addressFocus,
            onFieldSubmitted: (v){
              picodeFocus.unfocus();
              FocusScope.of(context).requestFocus(picodeFocus);
            },

            controller: model.address,
            validator: (value) {
              final validCharacters = RegExp(
                  r'[!@#$%^&*(),.?":{}|<>]');

              if(validCharacters.hasMatch(value))
                return "Enter Correct Address";
              return value == null || value.isEmpty ? "${getLocalText("enter_address", context)}" : null;
            },
            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
            decoration: InputDecoration(
              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
              labelText: getLocalText("address", context),
              alignLabelWithHint: true,
            ),
          ),

          TextFormField(
            textInputAction: TextInputAction.done,
            focusNode: picodeFocus,

            keyboardType: TextInputType.phone,
            controller: model.pinCode,
            validator: (value) {
              final validCharacters = RegExp(
                  r'[!@#$%^&*(),.?":{}|<>]');

              if(validCharacters.hasMatch(value))
                return "Enter Correct PinCode";
              return value == null || value.isEmpty ? getLocalText("enter_pincode", context) : null;
            },
            onSaved: (v){
              //picodeFocus.unfocus();

            },
//            onFieldSubmitted: (v){
//              picodeFocus.unfocus();
//
//            },

            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
            decoration: InputDecoration(
              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
              labelText: getLocalText("pincode", context),
              alignLabelWithHint: true,

            ),
          ),



         SizedBox(height: 10,),
          Align(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
                color: CustomColors.Orange,
                child: Text(
                  getLocalText("save", context),
// strings.save.toUpperCase(),
                  style: CustomStyles.button_style,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () async {


                  if(_formKey.currentState.validate())
                  {
                    contentFilledList.forEach((element) {
                      if(element.passangerType==0 && element.index==0)
                        element.isFilled =true;

                    });

                    model.hideDetails(0, 0);

                    _formKey.currentState.save();
                  }



                  }
                ),
          )

        ],

      ),
    );


  }

  bool isValidEmail(email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }


  @override
  void onError(String message, bool isFromCreditCard, String asset) {
    Dialogs.showGenericErrorPopup(context, message, isFromCreditCard, asset);
  }

  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }

}
