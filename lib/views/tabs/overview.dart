import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/activity/full_details_response.dart';
import 'package:ota/models/activity/full_details_response_entity.dart';
import 'package:ota/models/activity/small_details_response_entity.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/activities_view_models/activity_details_view_model.dart';
import 'package:ota/viewmodels/activities_view_models/activity_search_view_model.dart';
import 'package:provider/provider.dart';

class Overview extends StatefulWidget {
  ActivityDetailsModel model;

  BuildContext context;


  Overview(this.model, this.context);

  @override
  _OverviewState createState() => _OverviewState(this.model, this.context);
}

class _OverviewState extends State<Overview> {


  ActivityDetailsModel model;

  BuildContext context;

  _OverviewState(this.model, this.context);


  GoogleMapController mapController;

  var height;

  var width;


  @override
  Widget build(BuildContext context) {

    height =MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;

     return ChangeNotifierProvider<ActivityDetailsModel>.value(
       value:   model,
    child: Consumer<ActivityDetailsModel>(
    builder: (context, model, child) {

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: width*.4,right: width*.4,top: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[

          Text(model.fullDetailsResponse.result.activity.name,style: CustomStyles.medium20.copyWith(color: CustomColors.White),),

          SizedBox(height: 10,),
//          Text('Duration: 1 Day',style:CustomStyles.normal16.copyWith(color: CustomColors.White),) ,
//          SizedBox(height: 30,),

             Card(

             child:


          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(height: 5,),
                GestureDetector(
                  child: Row(
                    children: [
                    //  SizedBox(width: 10,),
                      Text('Operation Days',style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),),
                      Spacer(),
                      model.showOperationDays?Icon(Icons.keyboard_arrow_up):Icon(Icons.expand_more)

                    ],
                  ),
                  onTap: (){
                    model.closeOperationDays();
                  },
                ),
                SizedBox(height: 5,),
                Visibility(visible: model.showOperationDays,
                    child:
                Column(children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [

                      Icon(Icons.location_on,color: CustomColors.Orange,),SizedBox(width: 5,)
                      ,
                      Text(model.fullDetailsResponse.result.activity.country.name,style: CustomStyles.medium14.copyWith(color: CustomColors.heading),),
                    ],
                  ),

                  SizedBox(height: 5,),

                  Row(
                    children: [

                      Icon(Icons.calendar_today,color: CustomColors.Orange,),SizedBox(width: 5,),

                      Row(
                        children:  model.getWeekDays(model.fullDetailsResponse.result.activity),
                      ),



                    ],
                  ),

                  SizedBox(height: 5,),


                  Row(
                    children: [

                      Icon(Icons.access_time,color: CustomColors.Orange,),SizedBox(width: 5,)
                      ,
                      Text(
                        (model.fullDetailsResponse.result.activity.content.scheduling==null
                            ||model.fullDetailsResponse.result.activity.content.scheduling.opened==null)?

                            "Full Day":

                        model.fullDetailsResponse.result.activity.content.scheduling.opened.first.openingTime+ " - "+

                          model.fullDetailsResponse.result.activity.content.scheduling.opened.first.closeTime

                        ,style: CustomStyles.medium14.copyWith(color: CustomColors.heading),),
                    ],
                  ),

                  SizedBox(height: 5,),






                ],)
                )




              ],
            ),
          )) ,

             SizedBox(height: 10,),


            model.fullDetailsResponse.result.activity.content.highligths!=null?

             Card(

              child: Container(
                padding: EdgeInsets.all(5),
          width: double.infinity,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              Text("HIGHLIGHTS",style: CustomStyles.medium14.copyWith(color:CustomColors.BackGround),) ,

              SizedBox(height: 5,),

              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                children: model.getHighLights(model.fullDetailsResponse.result.activity.content.highligths)
              )


            ],
          )
            ),


            ):SizedBox.shrink(),

            model.fullDetailsResponse.result.activity.content.featureGroups==null?
                SizedBox.shrink():

      Column(

  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    SizedBox(height: 10,),

    Column(

      mainAxisSize: MainAxisSize.min,

      children: model.getFeatureGroups(model.fullDetailsResponse.result.activity.content),

    ),

  ],
),



            SizedBox(height: 10,),

          model.fullDetailsResponse.result.activity.content.guidingOptions!=null?


          Card(

            child: Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text("GUIDING OPTIONS",style: CustomStyles.medium14.copyWith(color:CustomColors.BackGround),) ,

                  SizedBox(height: 5,),

                  Text(" - " + model.fullDetailsResponse.result.activity.content.guidingOptions.guideType,
                    style: CustomStyles.medium12.copyWith(
                        color: CustomColors.heading),)
                ],
              )
            ),
          ) :SizedBox.shrink(),



            SizedBox(height: 10,),




            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: model.getSegmentationGroups(model.fullDetailsResponse.result.activity.content),

            ),


            Card(child:


            Column(
              children: [
                SizedBox(height: 5,),
                GestureDetector(
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Text('Location Options',style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),),
                      Spacer(),
                      model.showLocationOptions?Icon(Icons.keyboard_arrow_up):Icon(Icons.expand_more)

                    ],
                  ),
                  onTap: (){
                    model.closeLocationOpions();
                  },
                ),
                SizedBox(height: 5,),
                Visibility(
                    visible: model.showLocationOptions,
                    child:
                    Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: model.getLocationOptions( model.fullDetailsResponse.result.activity.content.location.startingPoints)
                      ,)
                )




              ],
            )) ,


            model.fullDetailsResponse.result.activity.content.routes==[]||model.fullDetailsResponse.result.activity.content.routes==null?

            SizedBox.shrink():
                Card(child:
                Column(children:
                getRoutes( model.fullDetailsResponse.result.activity.content.routes),))

                ,
            SizedBox(height: 150,),

//            Card(
//              elevation: 3,
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(15.0),
//              ),
//              child: Container(
//                margin: EdgeInsets.all(15),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        SizedBox(height: 5,),
//                        Text('SAR 56',style: CustomStyles.appbar.copyWith(color: CustomColors.BackGround),),
//                        SizedBox(height: 9,),
//                        Text('RS 56 / Person',style: CustomStyles.calenderStyle,),
//                        SizedBox(height: 2,),
//                        Text('Duration: 1 Hour',style: CustomStyles.calenderStyle,),
//                        SizedBox(height: 5,),
//                      ],
//                    ) ,
//
//                    RaisedButton(child: Text('BOOK NOW',style:CustomStyles.button_style ,),color: CustomColors.Orange,padding: EdgeInsets.all(12),
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(8.0),
//                      ) ,
//                      onPressed: (){
//
//                        Navigator.pushNamed(context, Router.activityTravellerInfo);
//
//                      },)
//
//
//
//                  ],
//
//                ),
//              ),
//
//
//
//            ),



        ],



        ),


      ),
    );

    },
    ),
    );

  }



  getRoutes(List<FullDetailsResponseRoutes> routes) {




//    if(model.markerList==[]||model.markerList.length==0||model.markerList==null) {
//      print("generated");
//      model.markerList =
//      new List<Set>.generate(routes.length, (int index) {  return Set markers;});
//    }

    Set<Marker> markers = Set();



    if(model.showRoutes==[]||model.showRoutes.length==0||model.showRoutes==null) {
      print("generated");
      model.showRoutes =
      new List<bool>.generate(routes.length, (int index) => false);
    }


    List<Widget> routeList = List();



    routes.asMap().forEach((i,element) {

      Set<Marker> markers = Set();

      routeList.add(

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                SizedBox(height: 5,),
//                        Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: [
//                          Text("Description : ",style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),),
//                            Text("Description :"+ element.description,style: CustomStyles.medium16,),
//                          ],
//                        ),

                GestureDetector(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Description :"+ element.description,style: CustomStyles.medium16,),

                          Spacer(),

                          model.showRoutes[i]?Icon(Icons.keyboard_arrow_up):Icon(Icons.expand_more)


                        ],




                      ),
                      SizedBox(height: 3,),

                     // element.==[]?Text("Duration: ",):

                      Text("Duration: "+ element.duration.value.toString()+""+element.duration.metric ),

                      SizedBox(height: 15,)



                    ],
                  ),
                  onTap: (){

                    model.showRoutesExpand(i);

                  }


                  ,
                ),

                SizedBox(height: 15,),


                Visibility(
                  visible: model.showRoutes[i] ,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      height: 350,
                      child: GoogleMap(
                        markers: model.getMarkers(element.points),
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(1.3521, 103.8198),
                          zoom: 10.5,
                        ),
                      )),
                ),




              ],),
          )




      );



    });





    return routeList;


  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;



  }


}
