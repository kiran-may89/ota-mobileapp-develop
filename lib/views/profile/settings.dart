import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/profile/profile_view_model.dart';
import 'package:ota/views/profile/bottom_sheet/currency_selector.dart';
import 'package:provider/provider.dart';

import 'bottom_sheet/language_selection.dart';

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
        model.loadingProfile ?
        ShimmerContainer(MediaQuery.of(context).size.height):
        Container(
       // padding: EdgeInsets.symmetric(horizontal: screenWidth*.3,vertical: screenHeight*.2),
          height: screenHeight*10,
          width: screenWidth*10,
          child:
//          Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: [
//          SizedBox(height: 20,),
//
//          Row(children: [
//
//          Text(getLocalText("language", context),style: CustomStyles.medium14,),
//
//
//          DropdownButton(
//         // isExpanded: true,
//          isDense: true,
//          hint: Text('Select',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround),),
//
//          value: model.selectedLanguage,
//          itemHeight: 50,
//
//          onChanged: (newValue) {
//
//
//          model.changeSelectedLanguage(newValue);
//
//
//          },
//          items: model.languageList.map((language) {
//          return DropdownMenuItem(
//
//          child: Container(
//
//
//          child: new Text(language,style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround))),
//          value: language,
//          );
//          }).toList(),
//          ),
//
//
//
//
//
//          ],)
//
//
//          ],
//          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[


              InkWell(
                onTap: (){

                  showLanguageBottomSheet(
                    context,
                    model,
                  );

                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
                  child: ListTile(
                    leading: Icon(Icons.language,),

                    title: Text('Language',style: CustomStyles.medium12.copyWith(fontSize: 15),),
                    subtitle: Text(model.selectedLanguage,style: CustomStyles.medium12.copyWith(fontSize: 11),),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: CustomColors.disabledButton,
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
                child:


                ListTile(
                  leading: Icon(Icons.image),

                  title: Text('Theme',style: CustomStyles.medium12.copyWith(fontSize: 15),),
                  subtitle: Text("Dark",style: CustomStyles.medium12.copyWith(fontSize: 11),),
                  trailing: CupertinoSwitch(activeColor: CustomColors.heading,
                    value: model.lightTheme,
                    onChanged: (bool value) {



                    },
                  ),
//                      onTap: () { setState(() { _lights = !_lights; }); },
                ),



              ),

              Container(
                width: double.infinity,
                height: 1,
                color: CustomColors.disabledButton,
              ),

              GestureDetector(
                onTap: (){
                  showSourceBottomSheet(
                    context,
                    model,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
                  child:


                  ListTile(
                    leading: Icon(CupertinoIcons.money_dollar),

                    title: Text('Currency',style: CustomStyles.medium12.copyWith(fontSize: 15),),
                    subtitle: Text(model.supportedCurrencySymbol??"",style: CustomStyles.medium12.copyWith(fontSize: 11),),
                    trailing: Text(model.supportedCurrencyCode??"",style: CustomStyles.medium12.copyWith(fontSize: 15),),
//                      onTap: () { setState(() { _lights = !_lights; }); },
                  ),



                ),
              ),

              Container(
                width: double.infinity,
                height: 1,
                color: CustomColors.disabledButton,
              ),



//                  Padding(
//                    padding:  const EdgeInsets.only(top: 15, bottom: 15,left: 15,right: 15),
//                    child:
//
//                    ListTile(
//                      title: Text('Email',style: text_style.side_nav_content.copyWith(fontSize: 19),),
//                      trailing: CupertinoSwitch(
//                        activeColor: colors.Master_color,
//                        value: Email_enabled,
//                        onChanged: (bool value) {
//
//
//
//
//
//                          setState(() { Email_enabled = value; });
//                        },
//                      ),
////                      onTap: () { setState(() { _lights = !_lights; }); },
//                    ),
//
//
//
//                  ),


            ],),
        )

    );

  },
),
);

  }

getLocalText(String key, BuildContext context) {

  return  AppLocalizations.of(context).translate(key);
}

showSourceBottomSheet(BuildContext context, ProfileViewModel model, ) {
  return showModalBottomSheet(
  isDismissible: true,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  backgroundColor: Colors.white,
  isScrollControlled: true,
  context: context,
  builder: (context) => Container(
//margin: EdgeInsets.all(15),
  child: CurrencySelector(model, context)));
}

showLanguageBottomSheet(BuildContext context, ProfileViewModel model) {


  return showModalBottomSheet(
  isDismissible:true ,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  backgroundColor: Colors.transparent,

  context: context,
  builder: (context) => Container(
    //margin: EdgeInsets.all(15),
  child: LanguageSelection(model,context)



  ));



}


}
