import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/transfers/requests/transfers_passenger_data.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';

class TransferPaymentOptions extends StatefulWidget {

  TransferPassengerData transferPassengerData;

  TransferPaymentOptions(this.transferPassengerData);


  @override
  _TransferPaymentOptionsState createState() => _TransferPaymentOptionsState(transferPassengerData);
}

class _TransferPaymentOptionsState extends State<TransferPaymentOptions> {
  TransferPassengerData transferPassengerData;


  _TransferPaymentOptionsState(this.transferPassengerData);


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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(flex: 8,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(transferPassengerData.requestData.oneWay? getLocalText("one_way", context):getLocalText("round_trip", context),style: CustomStyles.heading,),
                          SizedBox(height: 7,),


                          Wrap(children: <Widget>[

                            Text(getLocalText("source", context)
                              ,style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading,fontWeight: FontWeight.w700),),


                            Text(transferPassengerData.requestData.pichUpPlace,style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading),),



                          ],),
                          SizedBox(height: 7,),

                          Wrap(children: <Widget>[

                            Text( getLocalText("destination", context),
                              style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading,fontWeight: FontWeight.w700),),


                            Text(transferPassengerData.requestData.dropPlace,style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading),),





                          ],)

                        ],

                      ),
                    ),
                  ),
                  Expanded(flex: 2,
                    child: SizedBox(
                      height: 24,
                      child: RaisedButton(onPressed: (){

                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();

                      } ,color: CustomColors.Orange,
                        child: Text(
                        getLocalText("edit", context),style:CustomStyles.calenderStyle.copyWith(color: CustomColors.White) ,),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),

                      ),
                    ),)
                ],),



              Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),
              SizedBox(height:5 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(getLocalText("base_rate", context),style: CustomStyles.normal12,),

                  Text(transferPassengerData.selectedVehicleData.first.displayRateInfoWithMarkup.currency +" "+

                      transferPassengerData.selectedVehicleData.first.displayRateInfoWithMarkup.baseRate.toString()

                    ,style: CustomStyles.normal14,),

                ],
              ),

              SizedBox(height:15 ,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(getLocalText("tax_and_other_charges", context),style: CustomStyles.normal12,),

                  Text(transferPassengerData.selectedVehicleData.first.displayRateInfoWithMarkup.currency +" "+

                      transferPassengerData.selectedVehicleData.first.displayRateInfoWithMarkup.taxAndOtherCharges.toString(),style: CustomStyles.normal14,),

                ],
              ),

              SizedBox(height:15 ,),

//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Text("Service Tax",style: CustomStyles.normal12,),
//
//                  Text("SR         00.00",style: CustomStyles.normal14,),
//
//                ],
//              ),
//
//              SizedBox(height:15 ,),

              Container(
                  margin: EdgeInsets.only(top: 10,bottom: 20),
                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(getLocalText("total_amount_payable", context),style: CustomStyles.normal12,),

                  Text(transferPassengerData.selectedVehicleData.first.displayRateInfoWithMarkup.currency+" "+

                      transferPassengerData.selectedVehicleData.first.displayRateInfoWithMarkup.totalPriceWithMarkup.toString(),style: CustomStyles.bold16,),

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

                  Navigator.pushNamed(context, Routes.transferCCDetails,arguments: transferPassengerData);

                },

              ),
              Container(
                  margin: EdgeInsets.only(top: 15,bottom: 15),
                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),

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
//
//              Row(children: <Widget>[
//                Image.asset('assets/images/google_icon.png',height: 20,width: 20,),
//                SizedBox(width: 20,),
//                Text('Google Pay',style: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),),
//                Flexible(fit: FlexFit.tight,
//                    child: SizedBox()),
//                Icon(Icons.arrow_forward_ios,color: CustomColors.disabledButton,size: 15,)
//
//
//              ],),
//              Container(
//                  margin: EdgeInsets.only(top: 15,bottom: 15),
//                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),




            ],
          ),
        ),

      ),

    );;


  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
