import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/models/activity/request/search_activity_data.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/activities_view_models/activity_results_view_model.dart';
import 'package:ota/views/activities/activity_results_card.dart';
import 'package:ota/views/bottom_sheets/ActivityFilter.dart';
import 'package:provider/provider.dart';


class ActivityResults extends StatefulWidget {
  SearchActivityData searchActivityData;


  ActivityResults(this.searchActivityData);



  @override
  _ActivityResultsState createState() => _ActivityResultsState(this.searchActivityData);
}

class _ActivityResultsState extends State<ActivityResults> {

  SearchActivityData searchActivityData;

  _ActivityResultsState(this.searchActivityData);

  ActivityResultsModel activityResultsModel;

  var height;

  var width;


  @override
  Widget build(BuildContext context) {

    height =MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;

    return ChangeNotifierProvider<ActivityResultsModel>(

      create: (context) => ActivityResultsModel(searchActivityData),
      child:
      Consumer<ActivityResultsModel>(

        builder: (context, model, child) {

          return Scaffold(
            appBar: AppBar(title: Text('Activity Results',style: CustomStyles.appbar,),
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: Colors.white,size: 13,),
                onPressed: () => Navigator.of(context).pop(),
              ),

              actions: <Widget>[

                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      IconButton(
                        icon: new Icon(Icons.tune, color: Colors.white,size: 20,),
                          onPressed: () {
                          if(model.activitySearchResponse.result!=null)
                            if (model.activitySearchResponse.result.activities.isNotEmpty)

                                _showBottomSheet(context,model);


                          },
                      ),

                      model.filterCount!=0 ? Positioned(
                      top: 2.0,
                      right: 4.0,
                      child: new Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(color: CustomColors.Orange,shape: BoxShape.circle),
                        child: new Text(
                          model.filterCount.toString(),
                          style: new TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                      ):
                      SizedBox()
                    ],
                  ),
                ),


              ],

            ),

            body:


            model.loading  ?


            ShimmerContainer(MediaQuery.of(context).size.height):

            model.activitySearchResponse.isError?
            Center(
              child:  Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(margin: EdgeInsets.only(top: 40),
                    child: Image.asset('assets/images/event.png', height: 150,),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40),
                    child: Text('SomeThing Went Wrong', textAlign: TextAlign
                        .center, style: CustomStyles.medium20
                        .copyWith(color: CustomColors.Orange)),
                  ),
                ],
              ),
            ):model.activitySearchResponse.result.activities.isEmpty?


            Center(
              child:  Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(margin: EdgeInsets.only(top: 40),
                    child: Image.asset('assets/images/event.png', height: 150,),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40),
                    child: Text('No Activities Found', textAlign: TextAlign
                        .center, style: CustomStyles.medium20
                        .copyWith(color: CustomColors.disabledButton)),
                  ),
                ],
              ),
            )
                :


            SingleChildScrollView(
              child: Stack(
                children: [

                  Container(
                    width: width*10,
                    height: height*10,
                    child: Column(
                      children: [

                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: width*.4, right: width*.4, top: 15),
                          child: Column(


                            children: [

                              Row(
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
                                        Text(model.requestData.startPlaceName,style: CustomStyles.heading,),
                                        SizedBox(height: 7,),

                                        Row(children: [
                                          Text(model.requestData.fromDateMonth+" - ",style : CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)) ,),

                                          Text(model.requestData.returnDateMonth+" | ",style : CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)) ,),


                                          Text(model.requestData.adultCnt.toString() +' Person',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),)


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
                              SizedBox(
                                height: 40,
                              )

//                              Container(
//                                  margin: EdgeInsets.only(top: 20,bottom: 20),
//                                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),

                            ],
                          ),


                        ),

                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomColors.BackGround,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                            ),
                            child:

                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 10),
                                              child: Text('Price :', style: CustomStyles.button_style.copyWith(fontSize: 13), textAlign: TextAlign.center,)),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Expanded(
                                                      child:
                                                      GestureDetector(
                                                        child: Text(
                                                          'Low-High',
                                                          style: !model.priceFilterHighLow ? CustomStyles.button_style.copyWith(fontSize: 13)
                                                              :
                                                          CustomStyles.button_style.copyWith(fontSize: 13, color: CustomColors.White.withOpacity(.5)), textAlign: TextAlign.center,
                                                        ),
                                                        onTap: () {
                                                          model
                                                              .changePriceFilterType();
                                                        },
                                                      )),
                                                  Expanded(
                                                      child:
                                                      GestureDetector(
                                                        child: Text(
                                                          'High-Low',
                                                          style: model
                                                              .priceFilterHighLow
                                                              ? CustomStyles
                                                              .button_style
                                                              .copyWith(
                                                              fontSize:
                                                              13)
                                                              : CustomStyles
                                                              .button_style
                                                              .copyWith(
                                                              fontSize:
                                                              13,
                                                              color:
                                                              CustomColors
                                                                  .White
                                                                  .withOpacity(
                                                                  .5)),
                                                          textAlign:
                                                          TextAlign
                                                              .center,
                                                        ),
                                                        onTap: () {
                                                          model
                                                              .changePriceFilterType();
                                                        },
                                                      )),
                                                ],
                                              ),
                                              AnimatedContainer(
                                                margin: EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 5),
                                                duration: Duration(
                                                    microseconds: 700),
                                                alignment: !model
                                                    .priceFilterHighLow
                                                    ? Alignment
                                                    .bottomLeft
                                                    : Alignment
                                                    .bottomRight,
                                                child: Container(
                                                  height: 2,
                                                  width: 30,
                                                  color: CustomColors
                                                      .White,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2, child: SizedBox())
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height * .7,

                                    margin: EdgeInsets.only(left:width*.4,right: width*.4,top: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[




                                        Expanded(
                                          child:

                                          model
                                              .activitySearchResponse.result.activities.length == 0 ?
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 40),
                                                child: Image.asset('assets/images/event.png', height: 150,),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsets.all(7.0),
                                                child: Text(
                                                    'Activities Not Found',
                                                    textAlign: TextAlign
                                                        .center,
                                                    style: CustomStyles
                                                        .medium20
                                                        .copyWith(
                                                        color: CustomColors
                                                            .White)),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .center,
                                                  children: <Widget>[
                                                    FlatButton(
                                                      color:
                                                      CustomColors
                                                          .Orange,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              15.0),
                                                          side: BorderSide(
                                                              color: CustomColors
                                                                  .Orange,
                                                              width:
                                                              2)),
                                                      // color: Colors.blue,
                                                      onPressed:
                                                          () async {
                                                        Navigator.pop(
                                                            context);
                                                      },
                                                      child: Text('Back to Search', style: CustomStyles
                                                          .normal16
                                                          .copyWith(color: CustomColors
                                                          .White)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ) : model.activityList.length == 0 ?
                                          Column(mainAxisAlignment: MainAxisAlignment
                                              .start,
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                EdgeInsets.only(
                                                    top: 40),
                                                child: Image.asset(
                                                  'assets/images/event.png',
                                                  height: 150,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsets.all(
                                                    7.0),
                                                child: Text(
                                                    'Activities Not Found',
                                                    textAlign:
                                                    TextAlign
                                                        .center,
                                                    style: CustomStyles
                                                        .medium20
                                                        .copyWith(
                                                        color: CustomColors
                                                            .White)),
                                              ),
                                            ],
                                          ) :


                                          ListView.builder(
                                              itemCount: model.activityList.length, // records.length
                                              itemBuilder: (BuildContext context, int index) {



                                                print(index);
                                                return

                                                  GestureDetector(
                                                    child:
                                                    Card(
                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                        elevation: 3,
                                                        margin: EdgeInsets.only(top: 10,),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(15.0),
                                                        ),
                                                        child:
                                                        Container(
                                                          width: MediaQuery.of(context).size.width,
                                                          height: 190,
                                                          // margin: EdgeInsets.only(left: 23,right: 23,top: 20,bottom: 20),
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[

                                                              Container(
                                                                 // flex: 4,
                                                                width: 120,
                                                                  height: 190,

                                                                  child: Image.network( model.activityList[index].content.media.images.first.urls[3].resource,fit: BoxFit.cover,)),
                                                              Expanded(
                                                                  flex: 6,
                                                                  child: Stack(
                                                                    children: <Widget>[
//                                        Container(
//                                          alignment: Alignment.bottomRight,
//                                          margin: EdgeInsets.only(bottom: 20.0),
//                                          child: ClipPath(
//                                            clipper: ArcClipper(),
//                                            child: Container(
//                                                width: 90.0,
//                                                height: 70.0,
//                                                padding: EdgeInsets.all(8.0),
//                                                color: CustomColors.Red,
//                                                child: Center(
//                                                    child: Text(
//                                                      '25%',
//                                                      style: TextStyle(
//                                                          color: Colors.white,
//                                                          fontWeight: FontWeight.bold,
//                                                          fontSize: 20.0),
//                                                    ))),
//                                          ),
//                                        ),



                                                                      Container(
                                                                        alignment: Alignment.topCenter,
                                                                        padding: EdgeInsets.only(left: 15,top: 15,bottom: 15,right: 10),
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisSize: MainAxisSize.min,
                                                                          children: <Widget>[

                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: <Widget>[
                                                                                Flexible(
                                                                                    fit:FlexFit.loose ,
                                                                                    child: Text(model.activityList[index].name,style: CustomStyles.medium14,)),
                                                                                // IconButton(icon: Icon(Icons.favorite,color:CustomColors.Orange,), onPressed: (){})

                                                                              ],
                                                                            ),
                                                                            SizedBox(height: 20,),
                                                                            Row(children: <Widget>[
                                                                              Image.asset('assets/images/location.png',height: 15,) ,
                                                                              SizedBox(width: 10,),
                                                                              Text(model.activityList[index].country.name,style: CustomStyles.normal12,)

                                                                            ],),
                                                                            SizedBox(height: 5,),
                                                                            Text( model.activityList[index].content.scheduling.duration==null?'Duration : '+"Full Day": 'Duration : '+

                                                                                '${model.activityList[index].content.scheduling.duration.value}  ${model.activityList[index].content.scheduling.duration.metric}',style: CustomStyles.normal12,),

                                                                            model.activityList[index].content.scheduling.opened!=null?SizedBox(height: 10,):SizedBox.shrink(),

                                                                            model.activityList[index].content.scheduling.opened!=null  ?Row(
                                                                              children: [
                                                                                Icon(Icons.access_time,color: CustomColors.BackGround,size: 17,),
                                                                                SizedBox(width: 10,),

                                                                                Text(
                                                                                  model.activityList[index].content.scheduling.opened.first.openingTime.toString() +" - "+ model.activityList[index].content.scheduling.opened.first.closeTime.toString(),
                                                                                  style: CustomStyles.normal12,

                                                                                ),
                                                                              ],
                                                                            ):Spacer(),





                                                                            model.activityList[index].content.scheduling.duration!=null?Spacer():  Flexible(child: SizedBox(),fit: FlexFit.tight,) ,


                                                                            //Spacer(),




                                                                            Text( getCurrency(model,index)+" "+ getPrice(model,index)

                                                                              ,style: CustomStyles.medium14.copyWith(color: CustomColors.Orange),),
//                                                                        Row(
//                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                          children: <Widget>[
//                                                                            Text('Exclusive Tax',style: CustomStyles.normal9,),
//
//                                                                            Text('Save Rs 5000',style: CustomStyles.normal9,),
//                                                                          ],
//                                                                        )





                                                                          ],

                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ))







                                                            ],
                                                          ),
                                                        )





                                                    ),
                                                    onTap: (){




                                                      Navigator.pushNamed(context, Routes.activityDetails,arguments: model.getArgumentData(index));

                                                    },
                                                  );
                                              }),




                                        )

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),



                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    width: 45,
                    height: 45,
                    top: 70,
                    right: SizeConstants.SIZE_8,
                    child: Container(


                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            border: Border.all(
                                width: 2,
                                color: Colors.white,
                                style: BorderStyle.solid),
                            color: CustomColors.Orange,
                            shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Text(
                            model.activityList.length.toString(),
                            style: CustomStyles.button_style
                                .copyWith(fontSize: 13))),
                  ),

                ],
              ),
            ),

          );


        },
      ),
    );



  }


  void _showBottomSheet(BuildContext context, ActivityResultsModel model) {

    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),
              topRight: Radius.circular(
                  15.0)),
        ),
        builder: (builder) {
          return Container(
            padding: EdgeInsets.only(
                left: 20,
                right: 27,
                top: 10),
            child:
            Column(
              mainAxisAlignment:
              MainAxisAlignment.start,
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              children: <Widget>[
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: <
                      Widget>[
                    Text(
                      strings
                          .filter,
                      style: CustomStyles
                          .appbar
                          .copyWith(
                          color:
                          CustomColors
                              .heading),
                    ),
                    IconButton(
                        icon: Icon(Icons
                            .clear),
                        onPressed:
                            () {
                          Navigator.of(
                              context)
                              .pop();
                        })
                  ],
                ),


                ActivityFilter(
                    model, context)



              ],
            ),
          );
        });


  }

  String getPrice(ActivityResultsModel model, int index) {


    String value = "";

    model.activityList[index].amountsFromWithMarkup.forEach((element) {
      if(element.paxType == "ADULT")

        value = (element.displayRateInfoWithMarkup.totalPriceWithMarkup.roundToDouble().toString());
    });

    return value;
  }

  getCurrency(ActivityResultsModel model, int index) {

    String value = "";

    model.activityList[index].amountsFromWithMarkup.forEach((element) {
      if(element.paxType == "ADULT")

        value = (element.displayRateInfoWithMarkup.currency);
    });

    return value;


  }
}
