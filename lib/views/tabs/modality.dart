import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/activity/full_details_response_entity.dart';
import 'package:ota/models/activity/request/activity_details_data.dart';
import 'package:ota/models/activity/small_details_response.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/activities_view_models/activity_details_view_model.dart';
import 'package:ota/viewmodels/activities_view_models/activity_search_view_model.dart';
import 'package:provider/provider.dart';

class Modality extends StatefulWidget {
  ActivityDetailsModel activityDetailsModel;

  BuildContext context;

  Modality(this.activityDetailsModel, this.context);

  @override
  _ModalityState createState() => _ModalityState(this.activityDetailsModel,this.context);
}

class _ModalityState extends State<Modality> {

  ActivityDetailsModel model;

  BuildContext context;

  _ModalityState(this.model, this.context);

  var height;

  var width;

  @override
  Widget build(context) {

    height =MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;

    return ChangeNotifierProvider<ActivityDetailsModel>.value(
      value: model,
      child: Consumer<ActivityDetailsModel>(
        builder: (context, model, child) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: width*.4, right: width*.4, top: height*.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[

                  Text(model.fullDetailsResponse.result.activity.name,
                    style: CustomStyles.medium20.copyWith(
                        color: CustomColors.White),),

//          SizedBox(height: 20,),
//          TextField(
//
//            decoration: InputDecoration(enabled: false,
//                prefixIcon: Padding(child: Image.asset('assets/images/calender.png',height: 20,width: 20,),
//                  padding: EdgeInsets.only(left: 5,right: 15,top: 15,bottom: 15),
//
//                ),
//                fillColor: CustomColors.White,filled: true,
//              labelText: "24 August - 2020",
//              labelStyle: CustomStyles.normal16,
//
//                  border: new OutlineInputBorder(
//                    borderRadius: const BorderRadius.all(
//                      const Radius.circular(10.0),
//                    ),
//                  ),
//              //contentPadding: EdgeInsets.only(left: 15),
//              //prefixIconConstraints: BoxConstraints(maxWidth: 25,maxHeight: 25),
//
//            ),
//
//          ),
                  SizedBox(height: 20,),
                  ListView.builder(
                      itemCount: model.fullDetailsResponse.result.activity
                          .modalities.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      //gridDelegate:
                      //SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 10, ),
                            padding: EdgeInsets.all(15),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: CustomColors.White,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                SizedBox(height: 5,),
                                Text(model.fullDetailsResponse.result
                                    .activity.modalities[index].name,
                                  style: CustomStyles.medium12.copyWith(
                                      color: CustomColors.BackGround),),

                                SizedBox(height: 5,),

                                Container(

                                  height: 1,
                                  width: double.infinity,
                                  color: CustomColors.disabledButton,


                                ),
                                Container(
                                  padding: EdgeInsets.all(3),
                                  alignment: Alignment.center,

                                  height: 40,
                                  child:

                                  DropdownButton(
                                    isExpanded: true,
                                    isDense: true,
                                    value: model.modalityFromDate[index].toString(),
                                    hint: Text('Select Date'),
                                    onChanged: (selection){



                                      model.changeModalitySelection(index,selection);


                                    },
                                    items:

                                    List.generate(model.smallDetailsResponse.result.activity.modalities[index].rates.first.rateDetails.first.operationDatesWithMarkup.length, (i) {

                                      SmallDetailsResponseOperationDatesWithMarkup dateItem = model.smallDetailsResponse.result.activity.modalities[index].rates.first.rateDetails.first.operationDatesWithMarkup[i];



                                      return DropdownMenuItem(
                                        child: Container(
                                          child: Text(dateItem.from.toString()),
                                        ),
                                        value: dateItem.from,
                                      );
                                    })





//                                    model.smallDetailsResponse.result.activity.modalities[index].rates.first.rateDetails.first.operationDatesWithMarkup.map((SmallDetailsResponseOperationDatesWithMarkup date) {
//
//                                      return  DropdownMenuItem<String>(
//                                          value: date.from,
//                                          child:
//                                          Container(
//                                              padding: const EdgeInsets.only(bottom: 5.0),
//                                              height: 25.0,
//                                              child: new  Text(date.from,style: CustomStyles.normal16,)
//                                          )
//                                      );
//                                    }).toList(),

                                  ),


//                                  Text("Select Date",
//                                    style: CustomStyles.medium12.copyWith(
//                                        color: CustomColors.BackGround),),


                                ),


                                SizedBox(height: 5,),

                                Container(
                                  alignment: Alignment.center,
                                  color: CustomColors.BackGround.withOpacity(
                                      .1),
                                  height: 50,
                                  child:
                                  ListView.builder(
                                      itemCount: model.smallDetailsResponse
                                          .result.activity.modalities[index]
                                          .rates.first.rateDetails.first
                                          .paxAmountsWithMarkup.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      //gridDelegate:
                                      //SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                      itemBuilder: (context, i) {
                                        return Container(
                                          height: 50,
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          // width: 70,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.person,
                                                    color: CustomColors
                                                        .BackGround,),

                                                  SizedBox(width: 3,),

                                                  Text(model
                                                      .smallDetailsResponse
                                                      .result.activity
                                                      .modalities[index].rates
                                                      .first.rateDetails.first
                                                      .paxAmountsWithMarkup[i]
                                                      .displayRateInfoWithMarkup
                                                      .currency,
                                                    style: CustomStyles
                                                        .medium12,),

                                                  SizedBox(width: 3,),

                                                  Text(model
                                                      .smallDetailsResponse
                                                      .result.activity
                                                      .modalities[index].rates
                                                      .first.rateDetails.first
                                                      .paxAmountsWithMarkup[i]
                                                      .displayRateInfoWithMarkup
                                                      .totalPriceWithMarkup
                                                      .toString(),
                                                    style: CustomStyles
                                                        .medium12,),


                                                ],

                                              ),
                                              SizedBox(height: 4,),
                                              Container(

                                                height: 1,
                                                width: 30,
                                                color: CustomColors
                                                    .disabledButton,


                                              ),
                                              SizedBox(height: 4,),


                                              Row(
                                                children: [
                                                  Text(model
                                                      .smallDetailsResponse
                                                      .result.activity
                                                      .modalities[index].rates
                                                      .first.rateDetails.first
                                                      .paxAmountsWithMarkup[i]
                                                      .paxType,
                                                    style: CustomStyles
                                                        .medium12,),

                                                  SizedBox(width: 3,),

                                                  Text("(" + model
                                                      .smallDetailsResponse
                                                      .result.activity
                                                      .modalities[index].rates
                                                      .first.rateDetails.first
                                                      .paxAmountsWithMarkup[i]
                                                      .ageFrom.toString() +
                                                      "-" +
                                                      model
                                                          .smallDetailsResponse
                                                          .result.activity
                                                          .modalities[index]
                                                          .rates.first
                                                          .rateDetails.first
                                                          .paxAmountsWithMarkup[i]
                                                          .ageTo.toString() +
                                                      ")"

                                                    , style: CustomStyles
                                                        .medium12,),

                                                ],
                                              ),

                                            ],

                                          ),


                                        );
                                      }),
                                ),



                                SizedBox(height: 15,),
                                SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    color: CustomColors.BackGround,

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        Text(
                                          model.smallDetailsResponse.result.activity.modalities[index]
                                              .rates.first.rateDetails.first.totalAmountWithMarkup
                                              .displayRateInfoWithMarkup.currency
                                          ,
                                          style: CustomStyles.medium20.copyWith(
                                              color: CustomColors.White),),
                                        SizedBox(width: 10,),

                                        Text(

                                            model.smallDetailsResponse.result.activity.modalities[index]
                                                .rates.first.rateDetails.first.totalAmountWithMarkup
                                                .displayRateInfoWithMarkup.totalPriceWithMarkup.roundToDouble().toString()

                                          //getPrice(model, index)

                                          // model.smallDetailsResponseEntity.result.activity.modalities[index].rates.first.rateDetails.first.paxAmountsWithMarkup.
                                          ,
                                          style: CustomStyles.medium20.copyWith(
                                              color: CustomColors.White),),
                                      ],
                                    ),

                                  ),


                                ),


                                SizedBox(height: 15,),


                                Text("Cancel Before" + " " +
                                    model.getCancellationDateWithFormat(index)
                                    + " - "
                                    + "CHARGE (" +
                                    model.smallDetailsResponse.result
                                        .activity.modalities[index].amountsFromWithMarkup.first.displayRateInfoWithMarkup.currency
                                    +" "+
                                    model.smallDetailsResponse.result
                                        .activity.modalities[index].rates.first
                                        .rateDetails.first
                                        .operationDatesWithMarkup.first
                                        .cancellationPolicies.first.amount
                                        .toString()
                                    + ")"


                                  , style: CustomStyles.medium12,
                                  textAlign: TextAlign.center,),


                                SizedBox(height: 15,),

                                SizedBox(
                                  width: double.infinity,

                                  height: 40,
                                  child: RaisedButton(onPressed: () {



                                    if(model.smallDetailsResponse.result.activity.modalities[index].questions.isEmpty){


                                      Navigator.pushNamed(
                                          context, Routes.activityTravellerInfo,
                                          arguments: model.getArgumentData(
                                              index));

                                    }else {
                                      Navigator.pushNamed(
                                          context, Routes.activityQuestions,
                                          arguments: model.getArgumentData(
                                              index));
                                    }
                                  },

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0),),

                                    child: Text("SELECT",
                                      style: CustomStyles.medium16.copyWith(
                                          color: CustomColors.White),),
                                    color: CustomColors.Orange,


                                  ),

                                ),


//                      Column(
//                        mainAxisSize: MainAxisSize.max,
//                        mainAxisAlignment: MainAxisAlignment.end,
//                        crossAxisAlignment: CrossAxisAlignment.end,
//                        children: <Widget>[
//                          Container(
//                            width: double.infinity,
//                            height: 2,
//                          ),
//                        Text(model.smallDetailsResponseEntity.result.activity.currency,style: CustomStyles.normal16,),
//                        SizedBox(height: 5,),
//                        Text(model.Price[index],style: CustomStyles.medium28,),
//                        SizedBox(height: 5,),
//                        Text('Inclusive Taxes',style: CustomStyles.normal9,)
//                      ],),
                                SizedBox(height: 5,),


                              ],
                            ),
                          ),
                          onTap: () {
//
//                });
                          },
                        );
                      },

                  ),
                  SizedBox(height: 15,),
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


                ],),


            ),
          );
        },
      ),
    );
  }

  String getPrice(ActivityDetailsModel model, int index) {
    String value = "";

//    model.smallDetailsResponseEntity.result.activity.modalities[index].rates.first.rateDetails.first.paxAmountsWithMarkup.forEach((element) {
//      if(element.paxType == "ADULT")
//
//        value = (element.displayRateInfoWithMarkup.totalPriceWithMarkup.toString());
//    });
//
//    return value;
//  }

    return model.smallDetailsResponse.result.activity.modalities[index]
        .rates.first.rateDetails.first.totalAmountWithMarkup
        .displayRateInfoWithMarkup.totalPriceWithMarkup.roundToDouble().toString();
  }
}
