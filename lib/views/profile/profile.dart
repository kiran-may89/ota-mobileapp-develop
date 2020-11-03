import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/profile/profile_view_model.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var height;

  var width;


  var formKey = GlobalKey<FormState>();

  bool validPhoneNumber= false;

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  final GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    height =
        MediaQuery.of(context).size.height / 10;

    width =
        MediaQuery.of(context).size.width / 10;


    return ChangeNotifierProvider<
    ProfileViewModel>(
      create: (context) =>
      ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, model, child) {

    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: CustomColors.BackGround,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 13,
          ),
          onPressed: () =>
              Navigator.of(context).pop(),
        ),
        title: Text(
          getLocalText("profile", context)
          ,
          style: CustomStyles.appbar,
        ),
        elevation: 0.0,
      ),
      body:
      model.loading ?
      ShimmerContainer(MediaQuery.of(context).size.height)
      :
      SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Container(
            width: width * 10,
           // height: height * 10,
            padding: EdgeInsets.symmetric(
                horizontal: width * .3,
                vertical: height * .4),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      "assets/images/profile_img.png"),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  height: 15,
                ),

                Form(
                  key: formKey,
                child: Column(
                  children: [

                    TextFormField(
                      enabled: model.editStatus,
                      validator: (value) {
                        return value.isEmpty
                        ? getLocalText("enter_first_name", context)
                        : null;
                      },
                      controller: model.firstName,
                      style: CustomStyles
                      .medium16
                      .copyWith(
                      color: CustomColors
                      .BackGround),
                      decoration: InputDecoration(
                        labelStyle: CustomStyles
                        .medium16.copyWith(color: CustomColors.disabledButton),
                        labelText:
                        getLocalText("first_name", context),
                        alignLabelWithHint:
                        true,

                      ),
                    ),


                    TextFormField(
                      enabled: model.editStatus,
                      controller: model.lastName,
                      validator: (value) {
                        return value.isEmpty ? getLocalText("enter_last_name", context): null;
                      },
                      style: CustomStyles
                      .medium16
                      .copyWith(
                      color: CustomColors
                      .BackGround),
                      decoration: InputDecoration(
                        labelStyle: CustomStyles
                        .medium16.copyWith(color: CustomColors.disabledButton),
                        labelText:
                        getLocalText("last_name", context),
                        alignLabelWithHint: true,


                      ),
                    ),

                    TextFormField(
                      enabled: false,

                      controller: model.dateOfBirth,

                      validator: (input) =>input.isEmpty?getLocalText("enter_date_of_birth", context):null ,

                      style: CustomStyles
                      .medium16
                      .copyWith(
                      color: CustomColors
                      .BackGround),
                      decoration: InputDecoration(
                        labelStyle: CustomStyles
                        .medium16
                        .copyWith(
                        color: CustomColors.disabledButton),
                        labelText:
                        getLocalText("date_of_birth", context),
                        alignLabelWithHint:
                        true,


                      ),
                    ),


                    TextFormField(
                      enabled: false,

                      controller: model.emailId,

                      validator: (input) =>input.isEmpty?getLocalText("enter_email", context): isValidEmail(input) ? null :getLocalText("enter_valid_email", context),

                      style: CustomStyles
                      .medium16
                      .copyWith(
                      color: CustomColors
                      .BackGround),
                      decoration: InputDecoration(
                        labelStyle: CustomStyles
                        .medium16
                        .copyWith(
                        color: CustomColors.disabledButton),
                        labelText:
                       getLocalText("email_id", context),
                        alignLabelWithHint:
                        true,


                      ),
                    ),


                    TextFormField(
                      enabled: model.editStatus,
                      controller: model.locationName,
                      validator: (value) {
                        return value.isEmpty
                        ? getLocalText("location", context)
                        : null;
                      },
                      style: CustomStyles
                      .medium16
                      .copyWith(
                      color: CustomColors
                      .BackGround),
                      decoration: InputDecoration(
                        labelStyle: CustomStyles
                        .medium16
                        .copyWith(
                        color: CustomColors.disabledButton),
                        labelText:
                        getLocalText("location_name", context),
                        alignLabelWithHint:
                        true,


                      ),
                    ),


                    TextFormField(
                      enabled:  model.editStatus,
                      controller: model.locationName,
                      validator: (value) {
                        return value.isEmpty
                        ? getLocalText("country", context)
                        : null;
                      },
                      style: CustomStyles
                      .medium16
                      .copyWith(
                      color: CustomColors
                      .BackGround),
                      decoration: InputDecoration(
                        labelStyle: CustomStyles
                        .medium16
                        .copyWith(
                        color: CustomColors.disabledButton),
                        labelText:
                        getLocalText("select_country", context),
                        alignLabelWithHint:
                        true,


                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: model.editStatus?CustomColors.disabledButton:Colors.white, width: 2))),
                      child: InternationalPhoneNumberInput(
                        isEnabled: model.editStatus,
                        textFieldController: model.phoneNumber,
                        selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG),
                        onInputChanged: (PhoneNumber number) {

                       if(model.editStatus)
                          model.changeCountryCodeSelection(number.dialCode);

                        },
                        onInputValidated: (bool value) {

                          validPhoneNumber = value;
                        },

                        validator: (value) {
                          if (!validPhoneNumber) {
                            return getLocalText("enter_valid_phone_number", context);
                          }
                          return null;
                        },

                        inputDecoration: InputDecoration(
                          enabled: model.editStatus,
                          labelStyle: CustomStyles
                          .medium16
                          .copyWith(
                          color: CustomColors.disabledButton),
                          labelText: getLocalText("phone_number", context),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                        ignoreBlank: false,
                        initialValue: model.rawPhoneNumber,
                      ),
                    ),

                    SizedBox(height: height*.5,),

                    !model.editStatus?
                    SizedBox(
                      width: double.infinity,

                      height: 50,
                      child: RaisedButton(onPressed: (){


                        model.enableEdit();


                      },

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),),

                        child: Text(getLocalText("edit", context),style: CustomStyles.medium16.copyWith(color: CustomColors.White),),
                        color: CustomColors.Orange,


                      ),

                    )
                    :
                    SizedBox(
                      width: double.infinity,

                      height: 50,
                      child: RaisedButton(onPressed: (){

                        Dialogs
                        .showLoadingDialog(
                        context, _keyLoader);


                        model.updateProfile().then((value){

                          Navigator.of(
                          _keyLoader
                          .currentContext, rootNavigator: true)
                          .pop();

                          if(value.isError){ 

                            SnackBar snackBar = SnackBar(content: Text(getLocalText("profile_update_failed", context), style: CustomStyles
                            .medium16
                            .copyWith(color: CustomColors
                            .White)),
                              backgroundColor: CustomColors
                              .BackGround,
                            );

                            globalKey
                            .currentState
                            .showSnackBar(snackBar);


                          }else{

                            model.enableEdit();
                            model.getProfile();

                          }




                        });


                      },

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),),

                        child: Text(getLocalText("submit", context),style: CustomStyles.medium16.copyWith(color: CustomColors.White),),
                        color: CustomColors.Orange,


                      ),

                    )
                    ,






                  ],
                ))








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


  bool isValidEmail(email) {
    return RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    .hasMatch(email);
  }



  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }

}
