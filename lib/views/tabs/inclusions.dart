import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/activities_view_models/activity_details_view_model.dart';
import 'package:ota/viewmodels/activities_view_models/activity_search_view_model.dart';
import 'package:provider/provider.dart';

class Inclusions extends StatefulWidget {



  Inclusions(ActivityDetailsModel model, BuildContext context);

  @override
  _InclusionsState createState() => _InclusionsState();
}

class _InclusionsState extends State<Inclusions> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Activity_Model>(
      create: (context) => Activity_Model(),
      child: Consumer<Activity_Model>(
        builder: (context, model, child) {

          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 22,right: 22,top: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[

                  SizedBox(height: 10,),
                  Text('Overview',style: CustomStyles.medium14.copyWith(color: CustomColors.White.withOpacity(.5)),) ,
                  SizedBox(height: 10,),

                  Text('No Inclusions Exist(S) For The Selected Activity.',style: CustomStyles.medium12.copyWith(color: CustomColors.White.withOpacity(.5)),) ,
                  SizedBox(height: 30,),

                  Text('Exclusions',style: CustomStyles.medium14.copyWith(color: CustomColors.White.withOpacity(.5)),) ,
                  SizedBox(height: 10,),

                  Text('No Inclusions Exist(S) For The Selected Activity.',style: CustomStyles.medium12.copyWith(color: CustomColors.White.withOpacity(.5)),) ,
                  SizedBox(height: 30,),

                  Text('Payment Policy',style: CustomStyles.medium14.copyWith(color: CustomColors.White.withOpacity(.5)),) ,
                  SizedBox(height: 10,),

                  Text(strings.vat_Text,style: CustomStyles.medium12.copyWith(color: CustomColors.White.withOpacity(.5),height: 1.5),) ,
                  SizedBox(height: 30,),


                  Text('Location',style:CustomStyles.normal14.copyWith(color: CustomColors.White.withOpacity(.5)),) ,

                  SizedBox(height: 10,),





                  SizedBox(height: 15,),
//                  Card(
//                    elevation: 3,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(15.0),
//                    ),
//                    child: Container(
//                      margin: EdgeInsets.all(15),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Column(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              SizedBox(height: 5,),
//                              Text('SAR 56',style: CustomStyles.appbar.copyWith(color: CustomColors.BackGround),),
//                              SizedBox(height: 9,),
//                              Text('RS 56 / Person',style: CustomStyles.calenderStyle,),
//                              SizedBox(height: 2,),
//                              Text('Duration: 1 Hour',style: CustomStyles.calenderStyle,),
//                              SizedBox(height: 5,),
//                            ],
//                          ) ,
//
//                          RaisedButton(child: Text('BOOK NOW',style:CustomStyles.button_style ,),color: CustomColors.Orange,padding: EdgeInsets.all(12),
//                            shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.circular(8.0),
//                            ) ,
//                            onPressed: (){
//
//                              Navigator.pushNamed(context, Router.activityTravellerInfo);
//
//                            },)
//
//
//
//                        ],
//
//                      ),
//                    ),
//
//
//
//                  ),


                ],),


            ),
          );

        },
      ),
    );
  }
}
