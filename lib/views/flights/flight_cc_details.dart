import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/customviews/card_form.dart';
import 'package:ota/models/flights/data_model/pass_arguments.dart';
import 'package:ota/models/flights/requests/flight_save_booking_request.dart';
import 'package:ota/net/service/delegate.dart';
import 'package:ota/utils/colors.dart';

import 'package:flutter_credit_card/credit_card_widget.dart' as CCard;
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/data_models/flight_travel_info_model.dart';
import 'package:ota/viewmodels/flights_view_model/flight_cc_details_model.dart';
import 'package:ota/viewmodels/flights_view_model/flight_results_model.dart';
import 'package:provider/provider.dart';

class FlightCCDetails extends StatefulWidget  {
  FlightTravelInfoData flightTravelInfoData;

  FlightCCDetails(this.flightTravelInfoData);

  @override
  _FlightCCDetailsState createState() => _FlightCCDetailsState(flightTravelInfoData);


}

class _FlightCCDetailsState extends State<FlightCCDetails> implements  Delegate {
  FlightResultsModel model;

  BuildContext context;

  FlightTravelInfoData flightTravelInfoData;

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  _FlightCCDetailsState(this.flightTravelInfoData);

  final GlobalKey<FormState> _formKey = new GlobalKey();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();


   }

  @override
  Widget build(BuildContext context) {
     this.context =context;
    return ChangeNotifierProvider<FlightCCModel>(
      create: (context) => FlightCCModel(flightTravelInfoData,this),
      child: Consumer<FlightCCModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: CustomColors.White,
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child:SingleChildScrollView(
                child:  Column(
                  children: <Widget>[
                    CreditCardWidget(
                      cardNumber: model.cardNumber.text,
                      expiryDate: model.expiryDate.text,
                      cardHolderName: model.cardHolderName.text,
                      cvvCode: model.cvvCode.text,
                      showBackView: model.isCvvFocused,
                    ),
                    CardForm(
                      formKey: _formKey,
                      onCreditCardModelChange: model.onCreditCardModelChange,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 48,
                      width: MediaQuery.of(context).size.width - SizeConstants.SIZE_30 * 2,
                      child: RaisedButton(
                          color: CustomColors.Orange,
                          child: Text(
                            "Book Flight",
                            style: CustomStyles.button_style,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                           if (_formKey.currentState.validate()) Dialogs.showLoadingDialog(context, _keyLoader);

                            model.saveBooking().then((value) {
                              if (!value.isError) {
                                model.bookFlight().then((value) {
                                  Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);

                                  Navigator.pushNamed(context, Routes.flightBookingStatus,
                                      arguments: model.getArguments());
                                });
                              } else {
                                Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

                                Navigator.pushNamed(context, Routes.flightBookingStatus, arguments: model.getArguments());
                              }
                            });
                          }),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              )
            ),
          );
          ;
        },
      ),
    );
  }

  @override
  void onError(String messege) {
    Dialogs.showGenericErrorPopup(context,"Booking Failed. Please try other flight");
  }
}
