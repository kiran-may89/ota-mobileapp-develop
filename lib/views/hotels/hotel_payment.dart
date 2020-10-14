import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/customviews/card_form.dart';
import 'package:ota/models/hotels/responses/hotel_details_response.result.dart';

import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/utils/utils.dart';
import 'package:ota/viewmodels/hotel_payment_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/models/hotels/payments/request/hotel_payment_model.dart';
import 'package:ota/utils/dialog.dart';

class HotelPayment extends StatelessWidget {
  HotelDetailsResponseResult hotel;
  GlobalKey<FormState> _formKey = GlobalKey();
  int selectGroup;
  HotelPaymentViewModel _model;
  HotelPaymentModel _paymentModel;

  HotelPayment(this.hotel, this.selectGroup, this._paymentModel);

  void startTransaction(BuildContext context) {
    Map<String, dynamic> args = new Map();

    Dialogs.showSpinkitLoading(context);
    _model.bookHotel().then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Map<String, dynamic> args = new Map();
      args['response'] = value;
      args['hotel'] = _model.hotel;
      args['group'] = selectGroup;
      Navigator.pushNamed(context, Routes.hotelBookingStatus, arguments: args);
    }, onError: (error) {
      Navigator.pop(context);
      Dialogs.showErrorPopup(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HotelPaymentViewModel>(
      create: (context) => _model = HotelPaymentViewModel(hotel, selectGroup, _paymentModel),
      child: Consumer<HotelPaymentViewModel>(
        builder: (context, model, child) {
          return Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                title: Text(
                  strings.paymentOptions,
                  style: CustomStyles.appbar,
                ),
              ),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_20, vertical: SizeConstants.SIZE_20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Hotel - ${model.hotel.hotel.name}',
                                    style: CustomStyles.heading,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    '${convertToDate(model.hotel.checkIn)} - ${convertToDate(model.hotel.checkOut)} '
                                    '| Rooms ${model.hotel.hotel.roomOption[selectGroup].rooms.length.toString()} | ${model.totalGuest} Guest',
                                    style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 24,
                                width: SizeConstants.SIZE_60,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  color: CustomColors.Orange,
                                  child: Text(
                                    'EDIT',
                                    style: CustomStyles.calenderStyle.copyWith(color: CustomColors.White),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_20, vertical: SizeConstants.SIZE_20),
                          child: MySeparator(
                            height: 1,
                            color: Colors.grey,
                            Horizontal: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_20, vertical: SizeConstants.SIZE_20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Base Price",
                                    style: CustomStyles.normal14,
                                  ),
                                  Text(
                                    'SAR ' + (model.hotel.hotel.roomOption[selectGroup].displayRateInfoWithMarkup.baseRate).toStringAsFixed(2),
                                    style: CustomStyles.bold16,
                                  ),
                                ],
                              ),
                              SizedBox(height: SizeConstants.SIZE_8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Tax & Other Charges",
                                    style: CustomStyles.normal14,
                                  ),
                                  Text(
                                    'SAR ' +
                                        (model.hotel.hotel.roomOption[selectGroup].displayRateInfoWithMarkup.taxAndOtherCharges).toStringAsFixed(2),
                                    style: CustomStyles.bold16,
                                  ),
                                ],
                              ),
                              SizedBox(height: SizeConstants.SIZE_16),
                              MySeparator(
                                height: 1,
                                color: Colors.grey,
                                Horizontal: true,
                              ),
                              SizedBox(height: SizeConstants.SIZE_20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Total Amount",
                                    style: CustomStyles.normal14,
                                  ),
                                  Text(
                                    'SAR ' +
                                        (model.hotel.hotel.roomOption[selectGroup].displayRateInfoWithMarkup.totalPriceWithMarkup).toStringAsFixed(2),
                                    style: CustomStyles.bold16,
                                  ),
                                ],
                              ),
                              SizedBox(height: SizeConstants.SIZE_16),
                              MySeparator(
                                height: 1,
                                color: Colors.grey,
                                Horizontal: true,
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: model.isCardMode,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: SizeConstants.SIZE_20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Apply Coupon',
                                  style: CustomStyles.medium14.copyWith(color: CustomColors.heading.withOpacity(.5)),
                                ),
                                SizedBox(height: 20),
                                Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    height: 45,
                                    width: double.infinity,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Payment Options',
                                  style: CustomStyles.medium14.copyWith(color: CustomColors.heading.withOpacity(.5)),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/credit_card.png',
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        'Credit / Debit / ATM Card',
                                        style: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),
                                      ),
                                      Flexible(fit: FlexFit.tight, child: SizedBox()),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: CustomColors.disabledButton,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                  onTap: () async {
                                    model.changeCardMode();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                            visible: !model.isCardMode,
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
                              ],
                            )),
                        SizedBox(
                          width: SizeConstants.SIZE_100 * 2,
                          height: SizeConstants.SIZE_48,
                          child: RaisedButton(
                              padding: EdgeInsets.all(SizeConstants.SIZE_16),
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
                        SizedBox(
                          height: SizeConstants.SIZE_12,
                        )
                      ],
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}
