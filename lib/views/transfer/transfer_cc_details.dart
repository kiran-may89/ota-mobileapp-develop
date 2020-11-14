import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_credit_card/credit_card_widget.dart' as CCard;
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/customviews/card_form.dart';
import 'package:ota/models/transfers/requests/credit_card_transfers_data.dart';
import 'package:ota/models/transfers/requests/reservation_request.dart';
import 'package:ota/models/transfers/requests/transfers_passenger_data.dart';
import 'package:ota/net/service/delegate.dart';

import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/transfer_view_models/transfer_cc_model.dart';
import 'package:provider/provider.dart';

class TranferCcDetails extends StatefulWidget {
  TransferPassengerData transferPassengerData;

  TranferCcDetails(this.transferPassengerData);

  @override
  _TranferCcDetailsState createState() => _TranferCcDetailsState(transferPassengerData);
}

class _TranferCcDetailsState extends State<TranferCcDetails> implements Delegate{
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  TransferPassengerData transferPassengerData;

  _TranferCcDetailsState(this.transferPassengerData);

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransferCCModel>(
      create: (context) => TransferCCModel(transferPassengerData,this),
      child: Consumer<TransferCCModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: CustomColors.White,
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
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
                            getLocalText("book_transfers", context),
                            style: CustomStyles.button_style,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              Dialogs.showLoadingDialog(context, _keyLoader,message: "Processing transfer booking");

                              model.bookTransfer().then((value) {
                                if(value!=null) {
                                  Navigator.of(_keyLoader.currentContext,
                                      rootNavigator: true).pop();

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);

                                  Navigator.pushNamed(
                                      context, Routes.transferBookingStatus,
                                      arguments: model.getResponse());
                                }
                                else
                                  return null;
                                  });
                            }
                          }),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void onError(String message, bool isFromCreditCard, String asset) {
    Dialogs.showGenericErrorPopup(context, message, isFromCreditCard, asset);
  }


  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }


}
