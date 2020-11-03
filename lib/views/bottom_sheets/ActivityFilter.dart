import 'package:flutter/material.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/activities_view_models/activity_results_view_model.dart';
import 'package:ota/viewmodels/transfer_view_models/transfer_results_model.dart';
import 'package:provider/provider.dart';


class ActivityFilter extends StatefulWidget {

  ActivityResultsModel model;
  BuildContext context;

  ActivityFilter(this.model, this.context);

  @override
  _ActivityFilterState createState() => _ActivityFilterState(model,context);
}

class _ActivityFilterState extends State<ActivityFilter> {

  //var gradesRange = RangeValues(500, 5000);

  int cab_type;

  String cab_type_selection;

  ActivityResultsModel model;

  BuildContext context;

  _ActivityFilterState(this.model, this.context);


  @override
  Widget build( context) {
    return ChangeNotifierProvider.value(

        value: model,

        child:

        Consumer<ActivityResultsModel>(builder: (context, model, child) {
          return
            Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,

              children: <Widget>[

                Flexible(
                  flex: 8,
                  fit: FlexFit.tight,
                  child: Container(

                    child: SingleChildScrollView(

                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 10,),
                          Text(
                          getLocalText("price_range_per_person", context),
                            style: CustomStyles.medium14.copyWith(
                                color: CustomColors.heading.withOpacity(.5)),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Text(model.activitySearchResponse.result.activities.first.amountsFromWithMarkup.first.displayRateInfoWithMarkup.currency + model.priceRange.start.floor().toString(),
                                  style: CustomStyles.normal12.copyWith(
                                      color: CustomColors.BackGround),),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: CustomColors.disabledButton)
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Text(model.activitySearchResponse.result.activities.first.amountsFromWithMarkup.first.displayRateInfoWithMarkup.currency + model.priceRange.end.floor().toString(),
                                  style: CustomStyles.normal12.copyWith(
                                      color: CustomColors.BackGround),),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: CustomColors.disabledButton)
                                ),
                              )

                            ],),



                          RangeSlider(

                            min: model.minPriceRange,
                            max: model.maxPriceRange,
                            activeColor: CustomColors.BackGround,
                            inactiveColor: CustomColors.disabledButton,

//          labels: RangeLabels(
//              '${gradesRange.start}', '${gradesRange.end}'),
                            values: model.priceRange,
                            onChanged: (RangeValues value) {


                              model.changePriceRangeSelection(value);

                            },
                          ),

                          SizedBox(height: 10,),


                          model.categoriesFilter.length!=0?

                          Card(
                            elevation: 7,
                            margin: EdgeInsets.all(7),
                            child:
                            Container(
                              padding: EdgeInsets.all(7),
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    child: Row(
                                      children: [
                                        Text('Categories', style: CustomStyles.medium16.copyWith(
                                            color: CustomColors.heading),),
                                        Spacer(),

                                        !model.openCategories?Icon(Icons.expand_more)
                                            :
                                        Icon(Icons.keyboard_arrow_up)


                                      ],
                                    ),
                                    onTap: (){
                                      model.openCloseCategories();
                                    },
                                  ),

                                  Visibility(
                                      visible: model.openCategories,

                                      child:   ListView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          itemCount: model.categoriesFilter.length, // records.length
                                          itemBuilder: (BuildContext context, int index) {

                                            return

                                              GestureDetector(
                                                onTap: (){

                                                  model.categoriesAddAndRemove(index);

                                                },
                                                child: Container(
                                                  //height: 20,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 5,),
                                                      Row(
                                                        children: <Widget>[

                                                          Flexible(
                                                              fit: FlexFit.tight,
                                                              child: Text(
                                                                model.categoriesFilter[index].name,
                                                                style: CustomStyles.heading.copyWith(
                                                                    color:
                                                                    model.checkAppliedCategories(index)?

                                                                    CustomColors.BackGround:
                                                                    CustomColors.heading
                                                                        .withOpacity(.5)


                                                                ),
                                                              )),
                                                          Icon(
                                                            Icons.check_circle,
                                                            color:
                                                            model.checkAppliedCategories(index)?
                                                            CustomColors.BackGround:
                                                            CustomColors.heading .withOpacity(.5) ,
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 5,),
                                                    ],
                                                  ),
                                                ),
                                              );




                                          })





                                  ),




                                ],
                              ),
                            ),
                          ) : SizedBox.shrink(),

                          SizedBox(height: 10),

                          model.recommendedActivityFilter.length!=0?

                          Card(
                            elevation: 7,
                            margin: EdgeInsets.all(7),
                            child:
                            Container(
                              padding: EdgeInsets.all(7),
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    child: Row(
                                      children: [
                                        Text('Recommended Activity For', style: CustomStyles.medium16.copyWith(
                                            color: CustomColors.heading),),
                                        Spacer(),

                                        !model.openRecommendedActivity?Icon(Icons.expand_more)
                                            :
                                        Icon(Icons.keyboard_arrow_up)


                                      ],
                                    ),
                                    onTap: (){
                                      model.openCloseRecommendedActivity();
                                    },
                                  ),

                                  Visibility(
                                      visible: model.openRecommendedActivity,

                                      child:   ListView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          itemCount: model.recommendedActivityFilter.length, // records.length
                                          itemBuilder: (BuildContext context, int index) {

                                            return

                                              GestureDetector(
                                                onTap: (){

                                                  model.recommendedActivityAddAndRemove(index);

                                                },
                                                child: Container(
                                                  //height: 20,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 5,),
                                                      Row(
                                                        children: <Widget>[

                                                          Flexible(
                                                              fit: FlexFit.tight,
                                                              child: Text(
                                                                model.recommendedActivityFilter[index].name,
                                                                style: CustomStyles.heading.copyWith(
                                                                    color:
                                                                    model.checkAppliedRecommendedActivity(index)?

                                                                    CustomColors.BackGround:
                                                                    CustomColors.heading
                                                                        .withOpacity(.5)


                                                                ),
                                                              )),
                                                          Icon(
                                                            Icons.check_circle,
                                                            color:
                                                            model.checkAppliedRecommendedActivity(index)?
                                                            CustomColors.BackGround:
                                                            CustomColors.heading .withOpacity(.5) ,
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 5,),
                                                    ],
                                                  ),
                                                ),
                                              );




                                          })





                                  ),




                                ],
                              ),
                            ),
                          ) : SizedBox.shrink(),

                          SizedBox(height: 10),

                          model.durationFilter.length!=0?

                          Card(
                            elevation: 7,
                            margin: EdgeInsets.all(7),
                            child:
                            Container(
                              padding: EdgeInsets.all(7),
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    child: Row(
                                      children: [
                                        Text('Duration', style: CustomStyles.medium16.copyWith(
                                            color: CustomColors.heading),),
                                        Spacer(),

                                        !model.openDuration?Icon(Icons.expand_more)
                                            :
                                        Icon(Icons.keyboard_arrow_up)


                                      ],
                                    ),
                                    onTap: (){
                                      model.openCloseDuration();
                                    },
                                  ),

                                  Visibility(
                                      visible: model.openDuration,

                                      child:   ListView.builder(
                                          shrinkWrap: true,
                                          primary: false,
                                          itemCount: model.durationFilter.length, // records.length
                                          itemBuilder: (BuildContext context, int index) {

                                            return

                                              GestureDetector(
                                                onTap: (){

                                                  model.durationAddAndRemove(index);

                                                },
                                                child: Container(
                                                  //height: 20,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 5,),
                                                      Row(
                                                        children: <Widget>[

                                                          Flexible(
                                                              fit: FlexFit.tight,
                                                              child: Text(
                                                                model.durationFilter[index].name,
                                                                style: CustomStyles.heading.copyWith(
                                                                    color:
                                                                    model.checkAppliedDuration(index)?

                                                                    CustomColors.BackGround:
                                                                    CustomColors.heading
                                                                        .withOpacity(.5)


                                                                ),
                                                              )),
                                                          Icon(
                                                            Icons.check_circle,
                                                            color:
                                                            model.checkAppliedDuration(index)?
                                                            CustomColors.BackGround:
                                                            CustomColors.heading .withOpacity(.5) ,
                                                          )
                                                        ],
                                                      ),

                                                      SizedBox(height: 5,),
                                                    ],
                                                  ),
                                                ),
                                              );




                                          })





                                  ),




                                ],
                              ),
                            ),
                          ) : SizedBox.shrink(),









                        ],
                      ),
                    ),
                  ),
                ),



                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                          fit: FlexFit.tight,
                          child: FlatButton(
                            onPressed: () {
                              model.clearFilters();

                              Navigator.pop(context);

                            }, padding: EdgeInsets.all(15),
                            child: Text('CLEAR ALL',
                              style: CustomStyles.button_style.copyWith(
                                  color: CustomColors.disabledButton),),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                    color: CustomColors.disabledButton, width: 2)),

                          )
                      ),
                      SizedBox(width: 20,),
                      Flexible(
                          fit: FlexFit.tight,
                          child: FlatButton(color: CustomColors.Orange,
                            onPressed: () {

                              model.applyFilters();

                              Navigator.pop(context);



                            },
                            padding: EdgeInsets.all(15),
                            child: Text('APPLY',
                              style: CustomStyles.button_style,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: BorderSide(
                                    color: CustomColors.Orange, width: 2)),

                          ))

                    ],
                  ),
                ),
                SizedBox(height: 10)



              ],


            ),
          );
        }

        )

    );
  }

  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
