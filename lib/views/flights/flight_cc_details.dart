import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/flights/data_model/pass_arguments.dart';
import 'package:ota/models/flights/requests/flight_save_booking_request.dart';
import 'package:ota/utils/colors.dart';

import 'package:flutter_credit_card/credit_card_widget.dart' as CCard;
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_travel_info_model.dart';
import 'package:ota/viewmodels/flights_view_model/flight_cc_details_model.dart';
import 'package:ota/viewmodels/flights_view_model/flight_results_model.dart';
import 'package:provider/provider.dart';



class FlightCCDetails extends StatefulWidget {

  FlightTravelInfoData flightTravelInfoData;

  FlightCCDetails(this.flightTravelInfoData);

  @override
  _FlightCCDetailsState createState() => _FlightCCDetailsState(flightTravelInfoData);
}

class _FlightCCDetailsState extends State<FlightCCDetails> {


  FlightResultsModel model;

  BuildContext context;

  FlightTravelInfoData flightTravelInfoData;

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  _FlightCCDetailsState(this.flightTravelInfoData);


  final GlobalKey<FormState> _formKey = new GlobalKey();



  @override
  Widget build(BuildContext context) {



    return ChangeNotifierProvider<FlightCCModel>(

      create: (context) =>FlightCCModel(flightTravelInfoData),
      child:
      Consumer<FlightCCModel>(

        builder: (context, model, child) {

    return   Scaffold(
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

                            SizedBox(height: 10,),



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


                            SizedBox(height: 10,),


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




                            SizedBox(height: 10,),

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
                            child: Text("Book Flight",
                              style: CustomStyles.button_style
                              ,),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),),
                            onPressed: (){


                              if(_formKey.currentState.validate())

                              Dialogs.showLoadingDialog(
                                  context, _keyLoader);

                              model.saveBooking().then((value){


                                if(!value.isError) {
                                       model.bookFlight().then((value){

                                         Navigator.of(
                                             _keyLoader.currentContext, rootNavigator: true)
                                             .pop();

                                         Navigator.pop(context);
                                         Navigator.pop(context);
                                         Navigator.pop(context);
                                         Navigator.pop(context);
                                         Navigator.pop(context);
                                         Navigator.pop(context);

                                           Navigator.pushNamed(context, Routes.flightBookingStatus,arguments: model.getArguments());






                                       });

                                }else{

                                  Navigator.of(
                                      _keyLoader.currentContext, rootNavigator: true).pop();



                                  Navigator.pushNamed(context, Routes.flightBookingStatus,arguments: model.getArguments());




                                }





                              });



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
    );;



  },
  ),
  );

  }
}
