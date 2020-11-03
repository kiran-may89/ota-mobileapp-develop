import 'package:age/age.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/profile/responses/family_list.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/profile/add_member_view_model.dart';
import 'package:ota/viewmodels/profile/family_list_viewmodel.dart';
import 'package:ota/views/profile/profile_date_selector.dart';
import 'package:ota/views/profile/select_nationality.dart';
import 'package:provider/provider.dart';

class AddFamilyMember extends StatefulWidget {
  RelationResult result;

  AddFamilyMember(this.result);

  @override
  _AddFamilyMemberState createState() =>
      _AddFamilyMemberState(result);
}

class _AddFamilyMemberState
    extends State<AddFamilyMember> {
  var height;

  var width;

  var _formstate = GlobalKey<FormState>();

  bool forward;

  bool validPhoneNumber = false;

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  final GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();

  RelationResult result;



  FocusNode lastNameFocus = FocusNode();
  FocusNode passportNumberFocus = FocusNode();
  FocusNode passportExpFocus = FocusNode();
  FocusNode doBFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode nationalityFocus = FocusNode();
  FocusNode locationNameFocus = FocusNode();
  FocusNode genderFocus = FocusNode();
  FocusNode relationFocus = FocusNode();

  _AddFamilyMemberState(this.result);

  @override
  Widget build(BuildContext context) {

    height =
        MediaQuery.of(context).size.height / 10;

    width =
        MediaQuery.of(context).size.width / 10;
    return ChangeNotifierProvider<
        AddMemberViewModel>(
      create: (context) =>
      AddMemberViewModel(result),
      child: Consumer<AddMemberViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            key: globalKey,
            backgroundColor: CustomColors.White,
            appBar: AppBar(
              title: Text(
                getLocalText("add_family_members", context), 
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

              elevation: 0.0,
              backgroundColor:
                  CustomColors.BackGround,
            ),
            body: Container(
              height: MediaQuery.of(context)
                  .size
                  .height,
              padding: EdgeInsets.symmetric(horizontal: width*.5,vertical: height*.4),

              child: SingleChildScrollView(
                child: Form(
                    key: _formstate,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            return value.isEmpty 
                                ? getLocalText("enter_first_name", context)
                                : null;
                          },
                          onFieldSubmitted: (v){
                            FocusScope.of(context).requestFocus(lastNameFocus);
                          },
                          controller: model.firstName,
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
                                  getLocalText("first_name", context), 
                              alignLabelWithHint:
                                  true,

                          ),
                        ),


                        TextFormField(
                          focusNode: lastNameFocus,
                          controller: model.lastName,
                          validator: (value) {
                            return value.isEmpty
                            ? getLocalText("enter_last_name", context) 
                            : null;
                          },
                          onFieldSubmitted: (v){
                            FocusScope.of(context).requestFocus(passportNumberFocus);
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
                          getLocalText("last_name", context), 
                          alignLabelWithHint:
                          true,


                          ),
                        ),


                        TextFormField(
                          focusNode: passportNumberFocus,
                          controller: model.passportNumber,
                          validator: (value) {
                            return value.isEmpty
                            ? getLocalText("passport_number_is_required", context) 
                            : value.length<=5?getLocalText("please_enter_valid_password", context):isAlphaNumeric(value) && value.length<=12?null:getLocalText("please_enter_valid_password", context);

                          }, 

                          onFieldSubmitted: (v){
                            FocusScope.of(context).requestFocus(emailFocus);
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
                          getLocalText("passport_number", context), 
                          alignLabelWithHint:
                          true,


                          ),
                        ),


                        GestureDetector(

                          onTap: (){

                            forward = true;

                            showDateSelector(context,model,forward);

                          },


                          child: AbsorbPointer(
                            absorbing: true,
                            child: TextFormField(

                              controller: model.passportExpiryDate,

                              validator: (value) {
                                return value.isEmpty
                                ? getLocalText("enter_passport_expiry_date", context)
                                : isValidExpiryDate(model)?getLocalText("please_select_passport_expiry_after_3_months", context):null;

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
                                getLocalText("passport_expiry", context),
                                alignLabelWithHint:
                                true,


                              ),
                            ),
                          ),
                        ),



                        GestureDetector(

                          onTap: (){

                            forward = false;

                            showDateSelector(context,model,forward);

                          },


                          child: AbsorbPointer(
                            absorbing: true,
                            child: TextFormField(

                              controller: model.dateOfBirth,

                              validator: (value) {
                                return value.isEmpty
                                ? getLocalText("enter_date_of_birth", context)
                                :null;

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
                                getLocalText("date_of_birth", context),
                                alignLabelWithHint:
                                true,


                              ),
                            ),
                          ),
                        ),


                        TextFormField(
                          focusNode: emailFocus,

                          controller: model.emailId,

                          validator: (input) =>input.isEmpty?getLocalText("enter_email", context): isValidEmail(input) ? null :getLocalText("enter_valid_email", context),

                          onFieldSubmitted: (v){
                            FocusScope.of(context).requestFocus(locationNameFocus);
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
                            labelText: getLocalText("email_id", context),
                            alignLabelWithHint:
                            true,


                          ),
                        ),



                        GestureDetector(

                          onTap: (){

                            showNationalitySelection(context, model,);
                          },

                          child: AbsorbPointer(
                            absorbing: true,
                            child: TextFormField(
                              controller: model.nationality,
                              validator: (value) {
                                return value.isEmpty
                                ? getLocalText("please_select_nationality", context)
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
                               getLocalText("nationality", context)
                                ,
                                alignLabelWithHint:
                                true,


                              ),
                            ),
                          ),
                        ),




                        TextFormField(
                          focusNode: locationNameFocus,
                          controller: model.locationName,
                          validator: (value) {
                            return value.isEmpty
                            ? getLocalText("location_name", context)
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
                           getLocalText("location", context),
                            alignLabelWithHint:
                            true,


                          ),
                        ),

                        SizedBox(height: 2,),



                        DropdownButtonFormField(

                          focusColor: Colors.white,
                          items: model.gender.map((String gender) {
                            return new DropdownMenuItem(
                              value: gender,
                              child: Text(gender.toString(),style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            model.setGender(newValue);
                          },
                          validator:(value) =>value == null ? getLocalText("please_select_gender", context) : null,
                          value: model.selectedGender,
                          decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: getLocalText("gender", context),
                          labelStyle: CustomStyles
                          .medium16
                          .copyWith(
                          color: CustomColors.disabledButton),
                          border: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                          color:CustomColors.disabledButton
                          )
                          )

                          ),
                        ),

                        SizedBox(height: 2,),
                        DropdownButtonFormField(
                          focusColor: Colors.white,
                          items: model.genderBasedRelationList.map((String gender) {
                            return new DropdownMenuItem(
                              value: gender,
                              child: Text(gender.toString(),style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            model.setGenderRelation(newValue);
                          },
                          validator:(value) =>value == null ? getLocalText("select_relation", context) : null,
                          value: model.selectedRelation,
                          decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: getLocalText("relation", context),
                          labelStyle: CustomStyles
                          .medium16
                          .copyWith(
                          color: CustomColors.disabledButton),
                          border: new UnderlineInputBorder(
                          borderSide: new BorderSide(
                          color:CustomColors.disabledButton
                          )
                          )

                          ),
                        ),


                        Container(
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: CustomColors.disabledButton, width: 2))),
                          child: InternationalPhoneNumberInput(
                            textFieldController: model.phoneNumber,
                            selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG),
                            onInputChanged: (PhoneNumber number) {


                              model.changeCountryCodeSelection(number.dialCode);

                            },

                            onSaved: (value) {
                              model.phoneNumber.text =
                               value.replaceAll(" ", "");
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
                              border: InputBorder.none,
                              labelStyle: CustomStyles
                              .medium16
                              .copyWith(
                              color: CustomColors.disabledButton),
                              labelText: getLocalText("phone_number", context),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            ignoreBlank: false,
                            initialValue: model.rawPhoneNumber,
                          ),
                        ),







                        SizedBox(height: height*.4,),



                      model.editableData!=null? SizedBox(
                          height: 48,

                          width: MediaQuery.of(context).size.width*7,
                          child: RaisedButton(

                          color: CustomColors.Orange,
                          child: Text(getLocalText("update_member", context),
                            style: CustomStyles.button_style
                            ,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),),
                          onPressed: (){


                            if(_formstate.currentState.validate()) {
                              _formstate.currentState.save();
                              Dialogs
                              .showLoadingDialog(
                              context, _keyLoader);

                              model
                              .updateFamilyMember()
                              .then((value) {
                                Navigator.of(
                                _keyLoader
                                .currentContext, rootNavigator: true)
                                .pop();
                                if (value
                                .isError) {
                                  SnackBar snackBar = SnackBar(content: Text(getLocalText("failed_to_update_member", context), style: CustomStyles
                                  .medium16
                                  .copyWith(color: CustomColors
                                  .White)),
                                    backgroundColor: CustomColors
                                    .BackGround,
                                  );

                                  globalKey
                                  .currentState
                                  .showSnackBar(snackBar);
                                } else {
                                  Navigator
                                  .pop(context, getLocalText("done", context));
                                }
                              });
                            }
                          })


                          ,
                        ):


                        SizedBox(
                          height: 48,

                          width: MediaQuery.of(context).size.width*7,
                          child: RaisedButton(

                          color: CustomColors.Orange,
                          child: Text(getLocalText("add_member", context),
                            style: CustomStyles.button_style
                            ,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),),
                          onPressed: (){


                            if(_formstate.currentState.validate()) {
                              _formstate.currentState.save();
                              Dialogs
                              .showLoadingDialog(
                              context, _keyLoader);

                              model
                              .addFamilyMember()
                              .then((value) {
                                Navigator.of(
                                _keyLoader
                                .currentContext, rootNavigator: true)
                                .pop();
                                if (value
                                .isError) {
                                  SnackBar snackBar = SnackBar(content: Text(getLocalText("failed_to_add_member", context), style: CustomStyles
                                  .medium16
                                  .copyWith(color: CustomColors
                                  .White)),
                                    backgroundColor: CustomColors
                                    .BackGround,
                                  );

                                  globalKey
                                  .currentState
                                  .showSnackBar(snackBar);
                                } else {
                                  Navigator
                                  .pop(context, getLocalText("done", context));
                                }
                              });
                            }
                          })


                          ,
                        ),







                      ]
                    )),
              ),
            ),
          );
        },
      ),
    );
  }

  isAlphaNumeric(String value){

      return RegExp(r'[a-zA-Z]').hasMatch(value) && RegExp(r'[0-9]').hasMatch(value);
  }

    isValidExpiryDate(AddMemberViewModel model) {

      AgeDuration timeDifference =
      Age.dateDifference(fromDate: DateTime.now(), toDate: model.passportExpiryDateSelected );


  return  timeDifference.months<3;

  }

  isValidAge(AddMemberViewModel model) {

    AgeDuration timeDifference =
    Age.dateDifference(fromDate: model.dateOfBirthSelected  , toDate: DateTime.now() );


    return  timeDifference.years>=18;

  }


  void showDateSelector(BuildContext context, AddMemberViewModel model, bool forward) {

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
            child: ProfileDateSelection(context,model,forward)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(child: FlatButton(onPressed: (){
                  Navigator.pop(context);

                }, child: Text('Cancel'),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),side: BorderSide(color: CustomColors.disabledButton,width: 2))


                )) ,

                SizedBox(child: FlatButton(

                  child: Text('Ok'),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: CustomColors.disabledButton,width: 2)
                  ),
                  onPressed: (){

                    if(model.tempDate!=null)

                      model.setSelectedDate(forward);

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


  bool isValidEmail(email) {
    return RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    .hasMatch(email);
  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }

   showNationalitySelection(BuildContext context, AddMemberViewModel model) {

      return showModalBottomSheet(
      isDismissible: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
//margin: EdgeInsets.all(15),
      child: ProfileSelectNationality(model, context)));
    }
  }



