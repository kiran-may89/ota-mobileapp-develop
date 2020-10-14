import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/customviews/card_form.dart';
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

  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActivityCCModel>(
      create: (context) => ActivityCCModel(activityTravellerData),
      child: Consumer<ActivityCCModel>(
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
                            "BOOK ACTIVITY",
                            style: CustomStyles.button_style,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();

                              Dialogs.showLoadingDialog(context, _keyLoader);

                              model.bookTheActivity().then((value) {
                                Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                                if (model.data.questions.isEmpty) {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }

                                Navigator.pushNamed(context, Routes.activityBookingStatus,
                                    arguments: model.getArgumentData());
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
}
