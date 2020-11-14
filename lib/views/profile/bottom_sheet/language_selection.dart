

import 'package:flutter/material.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/profile/profile_view_model.dart';
import 'package:provider/provider.dart';




class LanguageSelection extends StatefulWidget {

ProfileViewModel model;
BuildContext context;

  LanguageSelection(this.model, this.context);

  @override
  _LanguageSelectionState createState() => _LanguageSelectionState(model,context);
}

class _LanguageSelectionState extends State<LanguageSelection> {

var screenHeight;
var screenWidth;

ProfileViewModel model;
BuildContext context;

  _LanguageSelectionState(this.model, this.context);
  @override
  Widget build( context) {

  screenHeight =
  MediaQuery.of(context).size.height / 10;

  screenWidth =
  MediaQuery.of(context).size.width / 10;

  return ChangeNotifierProvider<
  ProfileViewModel>.value(
  value: model,


  child: Consumer<ProfileViewModel>(
  builder: (context, model, child) {

    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: screenHeight*1.5),
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
    child: Material(
      child: Column(
      children: [

      Center(
      child: Text("Select Language",style: CustomStyles.medium18,),

      ),
      SizedBox(height: 15,),


      GestureDetector(
      onTap: (){
      print("OOO");
      },
      child: Container(
        padding: EdgeInsets.only(top: 15,bottom: 15),
      width: screenWidth*10,
      child: Text(model.languageList.first,style: CustomStyles.normal18,),

      ),
      ),

        Container(color: CustomColors.disabledButton,
          width: double.infinity,
          height: 1,
        ),
      GestureDetector(
      onTap: (){
      print("OOO");
      },
      child: Container(
        padding: EdgeInsets.only(top: 15,bottom: 15),
      width: screenWidth*10,
      child: Text(model.languageList.last,style: CustomStyles.normal18,),

      ),
      ),


        SizedBox(height: screenHeight*.5,),

      SizedBox(
      height: 48,
      width: double.infinity,
      child: RaisedButton(
      color: CustomColors.Orange,
      child: Text(
//    getLocalText("search_activities", context),
      "Continue",
      style: CustomStyles.button_style,
      ),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      ),
      onPressed: () {

       Navigator.pop(context);


      }),
      ),





      ],
      ),
    ),
    );

  },
  ),
  );


}
}
