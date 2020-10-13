import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/activity/request/activity_details_data.dart';
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

class _Activity_TravellerInformationState extends State<Activity_TravellerInformation> {


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

  @override
  Widget build(BuildContext context) {


    height =MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;

    return ChangeNotifierProvider<ActivityTravellerModel>(

      create: (context) => ActivityTravellerModel(activityDetailsData),
      child: Consumer<ActivityTravellerModel>(
        builder: (context, model, child) {


    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(title: Text("Traveller Information",style: CustomStyles.button_style.copyWith(fontSize: 20),
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


                            Text(model.activityDetailsData.travelDetails.count.toString()+' Person',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),)


                          ],)

                        ],

                      ),
                    ),
                    Expanded(flex: 2,
                      child: SizedBox(
                        height: 24,
                        child: RaisedButton(onPressed: (){
                          Navigator.of(context).pop();
                        } ,color: CustomColors.Orange,
                          child: Text('EDIT',style:CustomStyles.calenderStyle.copyWith(color: CustomColors.White) ,),
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


                Form(

                    key: _formKey,

                    child:
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
                                model.expandPassenger();

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
                                            child: Text("Traveller", style: CustomStyles.medium16),
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
                                                Text( model.Email.text != null ? ', Email: ${ model.Email.text}' : '',
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
                              visible: model.passengerExpanded,
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
                                          model.expandGuest();

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
                                                      child: Text("Guest ${index+1}", style: CustomStyles.medium16),
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
                                                          Text( model.activityDetailsData.fullDetailsData.age[index].toString() != null ? ', Age: ${ model.activityDetailsData.fullDetailsData.age[index].toString()}' : '',
                                                              style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround)),
                                                        ],
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        )),

                                    Visibility(
                                      visible: model.guestExpanded,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            enabled: true,
                                            initialValue: "",

                                            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                            decoration: InputDecoration(
                                              alignLabelWithHint: true,
                                              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                                              labelText: "First Name",
                                            ),

                                            validator: (value) {
                                              return value == null || value.isEmpty ? "Enter First Name" : null;
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
                                            initialValue: "",
                                            textInputAction: TextInputAction.done,
                                            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                                            decoration: InputDecoration(
                                              alignLabelWithHint: true,
                                              labelText: "Last Name",
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
                                              return value == null || value.isEmpty ? "Enter Last Name" : null;
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
                                        ],
                                      ),
                                    )








                                  ],
                                ));
        }
                          ),
                        ),
                      ),
                    ),


                  ],
                )


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




                          if(model.guestExpanded&&model.passengerExpanded) {

                           if(_formKey.currentState.validate()){

          _formKey.currentState.save();

          Dialogs.showLoadingDialog(
          context, _keyLoader);

          model.placeOrder().then((value) {

          Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();

          Navigator.pushNamed(context, Routes.activityPaymentOptions, arguments: model.getArguemntData());


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

    );

         },
      ),
  );

  }



  Widget fillDetails(ActivityTravellerModel model) {



    model.selectedDesignation  =model.designationList.first;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10,),

          Text("Enter your name as it is mentioned on valid Govt. ID",
              style: CustomStyles.normal12.copyWith(color: CustomColors.disabledButton)),

          SizedBox(height: 15,),


          DropdownButton(
            isExpanded: true,
            isDense: true,
            hint: Text('Select',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround),),

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
            controller: model.firstName,
            validator: (value) =>value.isEmpty ? "Enter First Name" : null,
            onFieldSubmitted: (v){
              picodeFocus.unfocus();
              FocusScope.of(context).requestFocus(lastNameFocus);
            },
            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
            decoration: InputDecoration(
                labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
                labelText: "First Name",
                alignLabelWithHint: true,
            ),
          ),


          TextFormField(
            focusNode: lastNameFocus,
            controller: model.lastName,
            validator: (value) =>value.isEmpty ?"Enter Last Name":null,
            onFieldSubmitted: (v){
              picodeFocus.unfocus();
              FocusScope.of(context).requestFocus(emailFocus);
            },

            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
            decoration: InputDecoration(
              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
              labelText: "Last Name",
              alignLabelWithHint: true,
            ),
          ),


          TextFormField(
            focusNode: emailFocus,
            controller: model.Email,
            onFieldSubmitted: (v){
              picodeFocus.unfocus();
              FocusScope.of(context).requestFocus(mobileFocus);
            },
            validator: (input) =>input.isEmpty?"Enter Email": isValidEmail(input) ? null : "Enter Valid Email Id",

            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
            decoration: InputDecoration(
              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
              labelText: "Email",
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
                phoneNumberValidated = value;
              },
              validator: (value) {
                if (!phoneNumberValidated) {
                  return "Phone number";
                }
                return null;
              },
              inputDecoration: new InputDecoration(
              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
              labelText: "MobileNumber",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: strings.phoneNumber),
              ignoreBlank: false,
              initialValue: model.phoneNumber,
            ),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),          ),


          TextFormField(
            focusNode: addressFocus,
            onFieldSubmitted: (v){
              picodeFocus.unfocus();
              FocusScope.of(context).requestFocus(picodeFocus);
            },

            controller: model.address,
            validator: (value) {
              return value == null || value.isEmpty ? "Enter Address" : null;
            },
            style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
            decoration: InputDecoration(
              labelStyle: CustomStyles.medium16.copyWith(color: Colors.grey),
              labelText: "Address",
              alignLabelWithHint: true,
            ),
          ),

          TextFormField(
            textInputAction: TextInputAction.done,
            focusNode: picodeFocus,
            keyboardType: TextInputType.number,
            controller: model.pinCode,
            validator: (value) {
              return value == null || value.isEmpty ? "Enter PinCode" : null;
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
              labelText: "PinCode",
              alignLabelWithHint: true,
            ),
          ),






        ],

      ),
    );


  }

  bool isValidEmail(email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }


}
