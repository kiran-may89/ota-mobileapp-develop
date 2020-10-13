import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/transfer_view_models/transfer_search_view_model.dart';
import 'package:ota/views/base/base_view.dart';
import 'package:ota/views/base/base_widget.dart';

import 'package:ota/models/googleplaces/predictions.dart';

import 'bottom_sheet/search_transfer.dart';

class BookTransfer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<BookTransferViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context) => _BookTransferState(),
      viewModel: BookTransferViewModel(),
    );
  }
}

class _BookTransferState extends BaseModelWidget<BookTransferViewModel> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context, BookTransferViewModel model) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Book a Transfer',
          style: CustomStyles.appbar,
        ),
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 13,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(
              Icons.clear,
              color: Colors.white,
              size: 20,
            ),
            //  onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CustomColors.TabDisabled),
            margin: EdgeInsets.only(
                left: size.width * .2, right: size.width * .2, top: 20),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(microseconds: 1000),
                  alignment: model.OneWay
                      ? Alignment.bottomLeft
                      : Alignment.bottomRight,
                  child: Container(
                    height: 40,
                    width: size.width * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CustomColors.Orange,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        child: Text('One Way',
                            textAlign: TextAlign.center,
                            style: model.OneWay
                                ? CustomStyles.button_style
                                    .copyWith(fontSize: 12)
                                : CustomStyles.button_style.copyWith(
                                    fontSize: 12,
                                    color: CustomColors.disabledButton)),
                      ),
                      onTap: () {
                        model.changeTripType();
                      },
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      child: Text('Round Trip',
                          textAlign: TextAlign.center,
                          style: !model.OneWay
                              ? CustomStyles.button_style.copyWith(fontSize: 12)
                              : CustomStyles.button_style.copyWith(
                                  fontSize: 12,
                                  color: CustomColors.disabledButton)),
                    )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            child: Card(
              elevation: 3,
              margin: EdgeInsets.only(
                  top: 10,
                  left: SizeConstants.SIZE_30,
                  right: SizeConstants.SIZE_30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 71,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          'assets/images/cab_icon.png',
                          height: 21,
                        ),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 4,
                          ),
                          Theme(
                            data: ThemeData(primaryColor: Colors.red),
                            child: Text(
                              model.from??"From",
                              style: CustomStyles.cardContentStyle
                                  .copyWith(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      flex: 8,
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              showSourceBottomSheet(context, model);
              model.sourceType = true;

            },
          ),

          SizedBox(
            height: 40,
          ),
          GestureDetector(
            child: Card(
              elevation: 3,
              margin: EdgeInsets.only(
                  top: 10,
                  left: SizeConstants.SIZE_30,
                  right: SizeConstants.SIZE_30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 71,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Image.asset(
                          'assets/images/location.png',
                          height: 21,
                        ),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 4,
                          ),
                          Theme(
                            data: ThemeData(primaryColor: Colors.red),
                            child: Text(
                              model.destination??"Destination",
                              style: CustomStyles.cardContentStyle
                                  .copyWith(fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      flex: 8,
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              showSourceBottomSheet(context, model);
              model.sourceType = false;

            },
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 48,
            width:
                MediaQuery.of(context).size.width - SizeConstants.SIZE_30 * 2,
            child: RaisedButton(
                color: CustomColors.Orange,
                child: Text(
                  "SEARCH TRANSFER",
                  style: CustomStyles.button_style,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  if(model.validateData(_scaffoldKey)) {

                    print(model.validateData(_scaffoldKey));

                    Navigator.pushNamed(context, Routes.transfeResults,
                        arguments: model.getRequestData());
                  }
                }),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      )),
    );
  }

  showSourceBottomSheet(BuildContext context, BookTransferViewModel model) {
    return showModalBottomSheet(
        isDismissible: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
            //margin: EdgeInsets.all(15),
            child: SearchTransfer(model)));
  }
}
