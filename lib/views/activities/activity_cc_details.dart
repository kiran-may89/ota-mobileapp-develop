

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/activity/request/activity_traveller_data.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/activities_view_models/activity_cc_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_credit_card/credit_card_widget.dart' as CCard;





class ActivityCCDetails extends StatefulWidget {

  ActivityTravellerData activityTravellerData;

  ActivityCCDetails(this.activityTravellerData);

  @override
  _ActivityCCDetailsState createState() => _ActivityCCDetailsState(activityTravellerData);
}

class _ActivityCCDetailsState extends State<ActivityCCDetails> {

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  ActivityTravellerData activityTravellerData;

  _ActivityCCDetailsState(this.activityTravellerData);

  var _formKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider<ActivityCCModel>(

      create: (context) =>ActivityCCModel(activityTravellerData),
      child:
      Consumer<ActivityCCModel>(

        builder: (context, model, child) {


          return Scaffold(
            backgroundColor: CustomColors.White,
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  CCard.CreditCardWidget(
                    cardNumber: model.cardNumber.text,
                    expiryDate: model.expiryDate.text,
                    cardHolderName: model.cardHolderName.text,
                    cvvCode: model.cvvCode.text,
                    showBackView: model.isCvvFocused,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,

                        child: Column(
                          children: <Widget>[



                            Container(
                              margin: EdgeInsets.only(left: 20,right: 20),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),


//                                Container(
//                                  child:

                                    TextFormField(
                                      validator: (value){

                                        return value.isEmpty?"Enter Credit Card Number":
 //                                       value[0]!= '4' || value[0]!= '5' ? " Only Visa and Master cards are accepted":
                                        null;


                                      },
                                      inputFormatters: [LengthLimitingTextInputFormatter(16),],
                                      controller: model.cardNumber,
                                      keyboardType: TextInputType.number,
                                      decoration: new InputDecoration(

                                        hintText: 'Card Number',
                                      ),

                                      onChanged: (text){
                                        model.cardDetailsChanged();
                                      },

                                    ),

//                                  decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(5.0),
//                                    color: Colors.white,
//                                    boxShadow: [
//                                      BoxShadow(
//                                        color: Colors.grey,
//                                        offset: Offset(0.0, 1.0), //(x,y)
//                                        blurRadius: 6.0,
//                                      ),
//                                    ],
//                                  ),
//
//
//
//                                ),

                                  SizedBox(height: 10,),



//                                Container(
//                                  child:
                                    TextFormField(
                                      inputFormatters: [LengthLimitingTextInputFormatter(5),],
                                      controller: model.expiryDate,
                                      keyboardType: TextInputType.number,
                                      decoration: new InputDecoration(

                                        hintText: 'Expiry Date',
                                      ),

                                      validator: (String value) {


                                        return value.isEmpty?"Enter Expiry Date": value.length==0? "Expiry Date": null;

                                      },

                                      onChanged: (text){


                                        model.cardDetailsChanged();

                                      },
                                    ),
//                                  decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(5.0),
//                                    color: Colors.white,
//                                    boxShadow: [
//                                      BoxShadow(
//                                        color: Colors.grey,
//                                        offset: Offset(0.0, 1.0), //(x,y)
//                                        blurRadius: 6.0,
//                                      ),
//                                    ],
//                                  ),
//
//
//
//
//                                ),


                                  SizedBox(height: 10,),


//                                Container(
//                                  child:
                                    TextFormField(
                                      controller: model.cardHolderName,
                                      keyboardType: TextInputType.name,
                                      decoration: new InputDecoration(

                                        hintText: 'CardHolder Name',
                                      ),

                                      validator: (String value) {


                                        return value.isEmpty?"Enter Name": value.length==0? "Enter Name": null;

                                      },
                                      onChanged: (text){

                                        model.cardDetailsChanged();

                                      },
                                    ),
//                                  decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(5.0),
//                                    color: Colors.white,
//                                    boxShadow: [
//                                      BoxShadow(
//                                        color: Colors.grey,
//                                        offset: Offset(0.0, 1.0), //(x,y)
//                                        blurRadius: 6.0,
//                                      ),
//                                    ],
//                                  ),
//                                ),




                                  SizedBox(height: 10,),

//                                Container(
//                                  child:
                                    TextFormField(
                                      obscureText: true,
                                      inputFormatters: [LengthLimitingTextInputFormatter(3),],
                                      controller: model.cvvCode,
                                      keyboardType: TextInputType.number,
                                      decoration: new InputDecoration(
                                        hintText: 'CVV',
                                      ),
                                      validator: (String value) {


                                        return value.isEmpty?"Enter CVV": value.length==0||value.length<3? "Enter CVV": null;

                                      },

                                      onChanged: (text){


                                        model.cardDetailsChanged();

                                      },
                                    ),

//                                  decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(5.0),
//                                    color: Colors.white,
//                                    boxShadow: [
//                                      BoxShadow(
//                                        color: Colors.grey,
//                                        offset: Offset(0.0, 1.0), //(x,y)
//                                        blurRadius: 6.0,
//                                      ),
//                                    ],
//                                  ),
//
//                                ),






                                  SizedBox(height: 10,),










                                ],
                              ),
                            ),

                            SizedBox(height: 20,),

                            SizedBox(
                              height: 48,

                              width: MediaQuery.of(context).size.width- SizeConstants.SIZE_30*2,
                              child: RaisedButton(

                                  color: CustomColors.Orange,
                                  child: Text("BOOK ACTIVITY",
                                    style: CustomStyles.button_style
                                    ,),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),),
                                  onPressed: (){

                                    if(_formKey.currentState.validate()) {

                                      _formKey.currentState.save();


                                      Dialogs.showLoadingDialog(context, _keyLoader);

                                      model.bookTheActivity().then((value) {

                                        Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                                        if(model.data.questions.isEmpty) {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);

                                        }else{

                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);

                                        }


                                        Navigator.pushNamed(context,Routes.activityBookingStatus,arguments: model.getArgumentData());


                                      });
                                    }







                                  })


                              ,
                            ),
                            SizedBox(height: 50,),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );


        },

      ),
    );
  }
}
