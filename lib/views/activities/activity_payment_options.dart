import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/activity/request/activity_traveller_data.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';

class ActivityPaymentOptions extends StatefulWidget {

  ActivityTravellerData activityTravellerData;


  ActivityPaymentOptions(this.activityTravellerData);

  @override
  _ActivityPaymentOptionsState createState() => _ActivityPaymentOptionsState(activityTravellerData);
}

class _ActivityPaymentOptionsState extends State<ActivityPaymentOptions> {


  ActivityTravellerData activityTravellerData;

  _ActivityPaymentOptionsState(this.activityTravellerData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Options',style: CustomStyles.appbar,),
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
                        Text(activityTravellerData.travelDetails.FromPlace,style: CustomStyles.heading,),
                        SizedBox(height: 7,),

                        Row(children: [
                          Text(activityTravellerData.travelDetails.FromDateMonth+" - ",style : CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)) ,),

                          Text(activityTravellerData.travelDetails.ToMonth+" | ",style : CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)) ,),


                          Text(activityTravellerData.travelDetails.count.toString()+' Person',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),)


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
              Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),
              SizedBox(height:5 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Text("Activity Price",style: CustomStyles.normal12,),flex: 4,),

                  Expanded(child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),

                      Text(activityTravellerData.totalAmountWithMarkup.displayRateInfoWithMarkup.currency,style: CustomStyles.bold16,),


                      SizedBox(width: 15,),


                      Text(activityTravellerData.totalAmountWithMarkup.displayRateInfoWithMarkup.baseRate.toString(),style: CustomStyles.bold16,),
                    ],
                  ),flex: 6,),

                ],
              ),

              SizedBox(height:15 ,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Text("Tax and other charges",style: CustomStyles.normal12,),flex: 4,),

                  Expanded(child: Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Spacer(),

                      Text(activityTravellerData.totalAmountWithMarkup.displayRateInfoWithMarkup.currency,style: CustomStyles.normal14,),

                      SizedBox(width: 15,),

                      Text(activityTravellerData.totalAmountWithMarkup.displayRateInfoWithMarkup.taxAndOtherCharges.toString(),style: CustomStyles.bold16,),
                    ],
                  ),flex: 6,),

                ],
              ),

//              SizedBox(height:15 ,),
//
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Text("Service Tax",style: CustomStyles.normal12,),
//
//                  Text("SAR         00.00",style: CustomStyles.normal14,),
//
//                ],
//              ),

              SizedBox(height:15 ,),

              Container(
                  margin: EdgeInsets.only(top: 10,bottom: 20),
                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),





              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(child:  Text("Total Amount Payable",style: CustomStyles.normal12,),flex: 4,),

                  Expanded(child: Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Spacer(),

                      Text(activityTravellerData.totalAmountWithMarkup.displayRateInfoWithMarkup.currency,style: CustomStyles.normal12,),

                      SizedBox(width: 15,),



                      Text(activityTravellerData.totalAmountWithMarkup.displayRateInfoWithMarkup.totalPriceWithMarkup.toString(),style: CustomStyles.bold16,),
                    ],
                  ),flex: 6,),

                ],
              ),



//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Text("Total Amount Payable",style: CustomStyles.normal12,),
//
//                  Text("SAR      56.00",style: CustomStyles.bold16,),
//
//                ],
//              ),

              Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),

              SizedBox(height:5 ,),

              Text('Apply Coupon',style: CustomStyles.medium14.copyWith(color:CustomColors.heading.withOpacity(.5) ),),


              SizedBox(height:20,),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(height: 45,
                  width: double.infinity,),),

              SizedBox(height:25,),

              Text('Payment Options',style: CustomStyles.medium14.copyWith(color:CustomColors.heading.withOpacity(.5) ),),

              SizedBox(height:30,),

              GestureDetector(
                child: Row(children: <Widget>[
                  Image.asset('assets/images/credit_card.png',height: 20,width: 20,),
                  SizedBox(width: 20,),
                  Text('Credit / Debit / ATM Card',style: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),),
                  Flexible(fit: FlexFit.tight,
                      child: SizedBox()),
                  Icon(Icons.arrow_forward_ios,color: CustomColors.disabledButton,size: 15,)


                ],),


                onTap: (){

                  Navigator.pushNamed(context, Routes.activityCCDetails,arguments: activityTravellerData);

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
}
