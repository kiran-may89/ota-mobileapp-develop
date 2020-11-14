import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/customviews/card_form.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/hotels_view_model/hotel_payment_viewmodel.dart';
import 'package:ota/viewmodels/hotels_view_model/hotel_payment_viewmodel.dart';
import 'package:ota/viewmodels/hotels_view_model/hotel_payment_viewmodel.dart';
class HotelCCDetails extends StatefulWidget
{

  HotelPaymentViewModel viewModel;

  HotelCCDetails(this.viewModel);
  @override
  State<StatefulWidget> createState() => _HotelCCDetails(viewModel);



}

class _HotelCCDetails extends State<HotelCCDetails>
{

  HotelPaymentViewModel model;
  GlobalKey<FormState> _formKey = GlobalKey();
  _HotelCCDetails(this.model);


  void startTransaction(BuildContext context) {
    Map<String, dynamic> args = new Map();

    Dialogs.showSpinkitLoading(context,message: "Processing hotel booking");
    model.bookHotel().then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);

      Map<String, dynamic> args = new Map();
      args['response'] = value;
      args['hotel'] = model.hotel;
      args['group'] = 0;
      Navigator.pushNamed(context, Routes.hotelBookingStatus, arguments: args);
    }, onError: (error) {
      Navigator.pop(context);
      Dialogs.showErrorPopup(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CreditCardWidget(
                cardNumber: model.card.number ?? '',
                expiryDate: '${model.card.expiry?.month ?? ''}/${model.card.expiry?.year ?? ''}',
                cardHolderName: model.holderName,
                cvvCode: model.card.securityCode ?? '',
                showBackView: model.isCvvFocused,
              ),
              CardForm(
                formKey: _formKey,
                onCreditCardModelChange: model.onCreditCardModelChange,
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left:15.0,right: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: SizeConstants.SIZE_48,
                  child: RaisedButton(
                      padding: EdgeInsets.only(left:SizeConstants.SIZE_16,right: SizeConstants.SIZE_16),
                      color: CustomColors.Orange,
                      child: Text(
                        "Proceed",
                        style: CustomStyles.button_style,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          startTransaction(context);
                        }
                      }),
                ),
              ),
              SizedBox(
                height: SizeConstants.SIZE_12,
              )


            ],
          ),
        ),
      ),
    );

  }



}


