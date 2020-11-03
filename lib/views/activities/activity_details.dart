import 'package:carousel_pro/carousel_pro.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/activity/request/activity_results_data.dart';
import 'package:ota/models/activity/request/fill_details_request.dart';
import 'package:ota/net/service/delegate.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/activities_view_models/activity_details_view_model.dart';
import 'package:ota/viewmodels/activities_view_models/activity_search_view_model.dart';
import 'package:ota/views/activities/fulldetails_data.dart';
import 'package:ota/views/tabs/inclusions.dart';
import 'package:ota/views/tabs/modality.dart';
import 'package:ota/views/tabs/overview.dart';
import 'package:provider/provider.dart';


class ActivityDetails extends StatefulWidget {

  ActivityResultsData activityResultsData;

  ActivityDetails(this.activityResultsData);

  String correlationId;

  @override
  _ActivityDetailsState createState() => _ActivityDetailsState(this.activityResultsData.fullDetailsData,this.activityResultsData.travelDetails,this.activityResultsData.correlationId);
}

class _ActivityDetailsState extends State<ActivityDetails>  implements Delegate{

   TravelDetails travelDetails;

   ActivityDetailsModel activityDetailsModel;

   FullDetailsData fullDetailsData;

   String correlationId;

  _ActivityDetailsState(this.fullDetailsData, this.travelDetails,this.correlationId);

   var height;

   var width;


  @override
  Widget build(BuildContext context) {

    height =MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;


    var ScreenSize = MediaQuery.of(context).size;


    return ChangeNotifierProvider<ActivityDetailsModel>(
        create: (context) => ActivityDetailsModel(fullDetailsData,travelDetails,correlationId,this),
        child: Consumer<ActivityDetailsModel>(
            builder: (context, model, child) {


     return Scaffold(
      appBar: AppBar(title: Text(getLocalText("activity_details", context),style: CustomStyles.appbar,),
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
      body:

      model.loading ?
      SpinKitChasingDots(size: SizeConstants.SIZE_50, color: CustomColors
          .BackGround,) : SingleChildScrollView(
            child: Column(
                   children: <Widget>[


             Stack(
               children: [
                 Column(children: [

                   Container(
                     height: ScreenSize.height*.35,
                     child:

                     Carousel(
                       boxFit: BoxFit.cover,
                       autoplay: true,
                       animationCurve: Curves.fastOutSlowIn,
                       animationDuration: Duration(milliseconds: 1000),
                       dotSize: 6.0,
                       dotIncreasedColor: CustomColors.Orange,
                       dotBgColor: Colors.transparent,
                       dotPosition: DotPosition.topRight,
                       dotVerticalPadding: 10.0,
                       showIndicator: true,
                       indicatorBgPadding: 7.0,
                       images: model.IMAGES,
                     ),





                   ),
                   Container(
                     height: ScreenSize.height*.65,)

                 ],),


                 Column(children: [
                   Container(
                     height: ScreenSize.height*.3,



                     ),

                   Container(
                     height: ScreenSize.height*.7,

                     decoration: BoxDecoration(
                         color: CustomColors.BackGround,
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
                     ),
                     child:
                     DefaultTabController(
                       length: Tabs.length,
                       child: Column(
                         children: <Widget>[
                           Container(
                             height: 20,
                             decoration: BoxDecoration(
                             ),
                             margin: EdgeInsets.only(top: 14,left: width*.4,right: width*.4),
                             child: TabBar(
                               labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                               indicator: ShapeDecoration(
                                 shape: UnderlineInputBorder(
                                     borderSide: BorderSide(
                                         color: CustomColors.White,
                                         width: 2.0,
                                         style: BorderStyle.solid)),
                               ),
                               indicatorSize: TabBarIndicatorSize.label,
                               labelStyle: CustomStyles.medium14.copyWith(color: CustomColors.White),
                               unselectedLabelColor: CustomColors.disabledButton,
                               tabs: Tabs,
                             ),

                           ),
                           Expanded(

                             child: Container(
                               child: TabBarView(children: [
                                 Modality(model,context),
                                 Overview(model,context),
                                 Inclusions(model,context)

                               ]),
                             ),
                           )
                         ],
                       ),


                     ),




                   )



                 ],)




               ],
             )








        ],

      ),
          ),


    );

            },
        ),
    );



  }




  List<Widget> Tabs = [
    Tab(
      child: Text(
        'Modality',

      ),
    ),
    Tab(
      child: Text(
        'Overview',

      ),
    ),
    Tab(
      child: Text(
        'Inclusions',
      ),
    ),
  ];

  @override
  void onError(String message, bool isFromCreditCard, String asset) {
   Dialogs.showGenericErrorPopup(context, message, isFromCreditCard, asset);
  }

//  List<Widget> bodies = [
//    Modality(activityDetailsModel),
//    Overview(),
//    Inclusions()
//  ];



  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
