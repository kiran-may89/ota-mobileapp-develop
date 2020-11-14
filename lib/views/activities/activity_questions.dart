
import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/activity/request/activity_details_data.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/activities_view_models/activity_questions_model.dart';
import 'package:ota/models/activity/request/activity_questions_data.dart';
import 'package:provider/provider.dart';



class ActivityQuestions extends StatefulWidget {
  ActivityDetailsData activityDetailsData;

  ActivityQuestions(this.activityDetailsData);

  @override
  _ActivityQuestionsState createState() => _ActivityQuestionsState(activityDetailsData);
}

class _ActivityQuestionsState extends State<ActivityQuestions> {

  ActivityDetailsData activityDetailsData;

  _ActivityQuestionsState(this.activityDetailsData);

  @override
  Widget build(BuildContext context) {

    final _scaffoldKey = GlobalKey<ScaffoldState>();


    return ChangeNotifierProvider<questions_model>(
      create: (context) => questions_model(activityDetailsData),
      child: Consumer<questions_model>(
        builder: (context, model, child) {

    return  Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(title: Text(getLocalText("questions", context),style: CustomStyles.appbar,),
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

          ),
          body:Container(
            padding: EdgeInsets.all(20),

            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 20,),

                  Column(
                    children: model.getQuestions(),
                  ),

                  SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,

                    height: 50,
                    child: RaisedButton(onPressed: (){


                   //if(
                   model.validateData(_scaffoldKey,context);
                   //)

//    Navigator.pushNamed(context, Routes.activityTravellerInfo,
//    arguments:model.getArgumentData()
//    );


                    },

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),),

                      child: Text(getLocalText("submit", context),style: CustomStyles.medium16.copyWith(color: CustomColors.White),),
                      color: CustomColors.Orange,


                    ),

                  ),









                ],






              ),
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
