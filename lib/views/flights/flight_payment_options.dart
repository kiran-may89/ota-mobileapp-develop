import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/flights/data_model/pass_arguments.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_travel_info_model.dart';
import 'package:ota/viewmodels/flights_view_model/flight_results_model.dart';
import 'package:provider/provider.dart';


class FlightPaymentOptions extends StatefulWidget {

  FlightTravelInfoData flightTravelInfoData;

  FlightPaymentOptions( this.flightTravelInfoData);

  @override
  _FlightPaymentOptionsState createState() => _FlightPaymentOptionsState(flightTravelInfoData);
}

class _FlightPaymentOptionsState extends State<FlightPaymentOptions> {


  FlightTravelInfoData flightTravelInfoData;

  _FlightPaymentOptionsState(this.flightTravelInfoData);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(getLocalText("payment_options", context),style: CustomStyles.appbar,),
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
      body: Container(
        margin: EdgeInsets.only(left: 32,right: 27,top: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

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
                        Row(
                          children: <Widget>[
                            Text(flightTravelInfoData.flightResultsData.requestData.flyFrom,style: CustomStyles.heading,),
                            Icon(Icons.swap_horiz,color: CustomColors.heading,) ,
                            Text(flightTravelInfoData.flightResultsData.requestData.flyTo,style: CustomStyles.heading,),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Wrap(spacing: 1.2,
                          alignment: WrapAlignment.start,
                          direction: Axis.horizontal,

                          children: <Widget>[
                            Text(flightTravelInfoData.flightResultsData.requestData.oneway?flightTravelInfoData.flightResultsData.requestData.monthFrom+" | ":flightTravelInfoData.flightResultsData.requestData.monthFrom +" - "+flightTravelInfoData.flightResultsData.requestData.monthTo+" | ",style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                flightTravelInfoData.flightResultsData.requestData.adults!=0?Text('${getLocalText("adults", context)} ${flightTravelInfoData.flightResultsData.requestData.adults} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
                                flightTravelInfoData.flightResultsData.requestData.children!=0?Text('${getLocalText("children", context)} ${flightTravelInfoData.flightResultsData.requestData.children} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
                                flightTravelInfoData.flightResultsData.requestData.infants!=0?Text('${getLocalText("infants", context)} ${flightTravelInfoData.flightResultsData.requestData.infants} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
                              ],),

                            Text(flightTravelInfoData.flightResultsData.requestData.cabinSelection_name,
                              style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(flex: 2,
                    child: SizedBox(
                      height: 24,
                      child: RaisedButton(onPressed: (){

                        Navigator.of(context).pop();
                      } ,
                        color: CustomColors.Orange,
                        child: Text(getLocalText("edit", context),style:CustomStyles.calenderStyle.copyWith(color: CustomColors.White) ,),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                    ),)
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),
              SizedBox(height:5 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(getLocalText("flight_price", context),style: CustomStyles.normal12,),

                  Text( flightTravelInfoData.flightResultsData.currency+" "+flightTravelInfoData.flightResultsData.baseRate.toString(),style: CustomStyles.bold16,),

                ],
              ),
              SizedBox(height:15 ,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(getLocalText("tax_and_other_charges", context),style: CustomStyles.normal12,),

                  Text( flightTravelInfoData.flightResultsData.currency+" "+flightTravelInfoData.flightResultsData.taxAndOtherCharges.toString(),style: CustomStyles.bold16,),

                ],
              ),
              SizedBox(height:10 ,),

//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Text("Service Tax",style: CustomStyles.normal12,),
//
//                  Text("SR 2050.99",style: CustomStyles.bold16,),
//
//                ],
//              ),
//              SizedBox(height:5 ,),

              Container(
                  margin: EdgeInsets.only(top: 10,bottom: 20),
                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(getLocalText("total_amount_payable", context),style: CustomStyles.normal12,),

                  Text( flightTravelInfoData.flightResultsData.currency+" "+flightTravelInfoData.flightResultsData.totalPriceWithMarkup.toString(),style: CustomStyles.bold16,),

                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),

              SizedBox(height:5 ,),

              Text(getLocalText("apply_coupon", context),style: CustomStyles.medium14.copyWith(color:CustomColors.heading.withOpacity(.5) ),),


              SizedBox(height:20,),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(height: 45,
              width: double.infinity,),),

              SizedBox(height:25,),

              Text(getLocalText("payment_options", context),style: CustomStyles.medium14.copyWith(color:CustomColors.heading.withOpacity(.5) ),),

              SizedBox(height:30,),

//              Row(children: <Widget>[
//                Image.asset('assets/images/credit_card.png',height: 20,width: 20,),
//                SizedBox(width: 20,),
//                Text('Credit / Debit / ATM Card',style: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),),
//                Flexible(fit: FlexFit.tight,
//                    child: SizedBox()),
//                Icon(Icons.arrow_forward_ios,color: CustomColors.disabledButton,size: 15,)
//
//
//              ],),
//              Container(
//                  margin: EdgeInsets.only(top: 15,bottom: 15),
//                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),
//
//              Row(children: <Widget>[
//                Image.asset('assets/images/apple_pay.png',height: 20,width: 20,),
//                SizedBox(width: 20,),
//                Text('Apple Pay',style: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),),
//                Flexible(fit: FlexFit.tight,
//                    child: SizedBox()),
//                Icon(Icons.arrow_forward_ios,color: CustomColors.disabledButton,size: 15,)
//
//
//              ],),
//              Container(
//                  margin: EdgeInsets.only(top: 15,bottom: 15),
//                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),

              GestureDetector(
                child: Row(children: <Widget>[
                  Image.asset('assets/images/credit_card.png',height: 20,width: 20,),
                  SizedBox(width: 20,),
                  Text(getLocalText("credit_card", context),style: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),),
                  Flexible(fit: FlexFit.tight,
                      child: SizedBox()),
                  Icon(Icons.arrow_forward_ios,color: CustomColors.disabledButton,size: 15,)


                ],),
                onTap: (){

                  Navigator.pushNamed(context, Routes.flight_cc_details,arguments: flightTravelInfoData);



                },
              ),




              Container(
                  margin: EdgeInsets.only(top: 15,bottom: 15),

                  child:
                  MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)

              ),
















            ],
          ),
        ),

      ),

    );

  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
