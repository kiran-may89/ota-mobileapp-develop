import 'package:flutter/material.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/profile/profile_view_model.dart';
import 'package:provider/provider.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() =>
      _AppSettingsState();
}

class _AppSettingsState
    extends State<AppSettings> {
var screenHeight;
var screenWidth;

  @override
  Widget build(BuildContext context) {

  screenHeight =
  MediaQuery.of(context).size.height / 10;

  screenWidth =
  MediaQuery.of(context).size.width / 10;


  return ChangeNotifierProvider<
  ProfileViewModel>(
  create: (context) => ProfileViewModel.newInstance(),
  child: Consumer<ProfileViewModel>(
  builder: (context, model, child) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              CustomColors.BackGround,
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
            getLocalText("settings", context),
            style: CustomStyles.appbar,
          ),
          elevation: 0.0,
        ),
        body:
        Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth*.3,vertical: screenHeight*.2),
          height: screenHeight*10,
          width: screenWidth*10,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          SizedBox(height: 20,),

          Row(children: [

          Text(getLocalText("language", context),style: CustomStyles.medium14,),


          DropdownButton(
         // isExpanded: true,
          isDense: true,
          hint: Text('Select',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround),),

          value: model.selectedLanguage,
          itemHeight: 50,

          onChanged: (newValue) {


          model.changeSelectedLanguage(newValue);


          },
          items: model.languageList.map((language) {
          return DropdownMenuItem(

          child: Container(


          child: new Text(language,style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround))),
          value: language,
          );
          }).toList(),
          ),





          ],)


          ],
          ),
        )

    );

  },
),
);

  }

getLocalText(String key, BuildContext context) {

  return  AppLocalizations.of(context).translate(key);
}
}
