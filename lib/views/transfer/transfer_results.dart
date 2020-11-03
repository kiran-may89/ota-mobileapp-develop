import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/models/transfers/data_model/search_transfer_data.dart';
import 'package:ota/net/service/delegate.dart';
import 'package:ota/net/service/transfers/transfer_results_data.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/transfer_view_models/transfer_results_model.dart';
import 'package:ota/views/bottom_sheets/TransferFilter.dart';
import 'package:ota/views/tabs/priceHigh_Low.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TransferResults extends StatefulWidget {
  SearchTransferData requestData;

  TransferResults(this.requestData);

  @override
  _TransferResultsState createState() =>
      _TransferResultsState(requestData);
}

class _TransferResultsState
    extends State<TransferResults> implements Delegate {
  SearchTransferData requestData;

  _TransferResultsState(this.requestData);

  TransferResultsModel transferResultsModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<
        TransferResultsModel>(
      create: (context) => transferResultsModel =
          TransferResultsModel(requestData,this),
      child: Consumer<TransferResultsModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(getLocalText("transfer_results", context), 
                  style: CustomStyles.appbar),
              leading: new IconButton(
                icon: new Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 13,
                ),
                onPressed: () =>
                    Navigator.of(context).pop(),
              ),
              actions: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      IconButton(
                        icon: new Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          if (model.transferSearchResponse.result != null) if (model
                              .transferSearchResponse
                              .result
                              .vechiles
                              .isNotEmpty)
                            _showBottomSheet(
                                context, model);
                        },
                      ),
                      model.filterCount != 0
                          ? Positioned(
                              top: 2.0,
                              right: 4.0,
                              child:
                                  new Container(
                                alignment:
                                    Alignment
                                        .center,
                                padding:
                                    EdgeInsets
                                        .all(4),
                                decoration: BoxDecoration(
                                    color:
                                        CustomColors
                                            .Orange,
                                    shape: BoxShape
                                        .circle),
                                child: new Text(
                                  model
                                      .filterCount
                                      .toString(),
                                  style: new TextStyle(
                                      color: Colors
                                          .white,
                                      fontSize:
                                          11.0,
                                      fontWeight:
                                          FontWeight
                                              .w500),
                                ),
                              ))
                          : SizedBox()
                    ],
                  ),
                ),
              ],
            ),
            body: model.loading
                ? ShimmerContainer(
                    MediaQuery.of(context)
                        .size
                        .height)
                : model.transferSearchResponse
                        .isError
                    ? Center(
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .center,
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(
                                      top: 40),
                              child: Image.asset(
                                'assets/images/transfer.png',
                                height: 150,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(
                                      top: 40),
                              child: Text(
                                  getLocalText("something_went_wrong", context), 
                                  textAlign:
                                      TextAlign
                                          .center,
                                  style: CustomStyles
                                      .medium20
                                      .copyWith(
                                          color: CustomColors
                                              .Orange)),
                            ),
                          ],
                        ),
                      )
                    : model
                            .transferSearchResponse
                            .result
                            .vechiles
                            .length<=0
                        ? Center(
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets
                                      .only(
                                          top:
                                              40),
                                  child:
                                      Image.asset(
                                    'assets/images/transfer.png',
                                    height: 150,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets
                                      .only(
                                          top:
                                              40),
                                  child: Text(
                                      getLocalText("no_transfers_found", context),
                                      textAlign:
                                          TextAlign
                                              .center,
                                      style: CustomStyles
                                          .medium20
                                          .copyWith(
                                              color:
                                                  CustomColors.disabledButton)),
                                ),
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              mainAxisSize:
                                  MainAxisSize
                                      .min,
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .start,
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: <Widget>[
                                Container(
                                  width: double
                                      .infinity,
                                  margin: EdgeInsets
                                      .only(
                                          left:
                                              25,
                                          right:
                                              25,
                                          top:
                                              15),
                                  child: Column(
                                    children: <
                                        Widget>[
                                      Row(
                                        mainAxisSize:
                                            MainAxisSize
                                                .min,
                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                        children: <
                                            Widget>[
                                          Expanded(
                                            flex:
                                                8,
                                            child:
                                                Container(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child:
                                                  Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        model.oneWay ? getLocalText("one_way", context) : getLocalText("round_trip", context),
                                                        style: CustomStyles.heading,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Wrap(
                                                    children: <Widget>[
                                                      Text(
                                                        getLocalText("source", context),
                                                        style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading, fontWeight: FontWeight.w700),
                                                      ),
                                                      Text(
                                                        model.requestData.pichUpPlace,
                                                        style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Wrap(
                                                    children: <Widget>[
                                                      Text(
                                                        getLocalText("destination", context),
                                                        style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading, fontWeight: FontWeight.w700),
                                                      ),
                                                      Text(
                                                        model.requestData.dropPlace,
                                                        style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex:
                                                2,
                                            child:
                                                SizedBox(
                                              height:
                                                  24,
                                              child:
                                                  RaisedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                color: CustomColors.Orange,
                                                child: Text(
                                                  getLocalText("edit", context),
                                                  style: CustomStyles.calenderStyle.copyWith(color: CustomColors.White),
                                                ),
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5.0),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top:
                                                  10,
                                              bottom:
                                                  10),
                                          child:
                                              MySeparator(
                                            color:
                                                CustomColors.TabDisabled,
                                            height:
                                                1,
                                            Horizontal:
                                                true,
                                          )),
                                    ],
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Column(
                                      mainAxisSize:
                                          MainAxisSize
                                              .min,
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                      children: [
                                        SizedBox(
                                          height:
                                              20,
                                        ),
                                        Flexible(
                                          fit: FlexFit
                                              .loose,
                                          child:
                                              Container(
                                            decoration:
                                                BoxDecoration(
                                              color:
                                                  CustomColors.BackGround,
                                              borderRadius:
                                                  BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                                            ),
                                            child:
                                                Container(
                                              margin:
                                                  EdgeInsets.only(top: 10),
                                              child:
                                                  Column(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                                                    child: Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Container(
                                                              margin: EdgeInsets.only(bottom: 10),
                                                              child: Text(
                                                                getLocalText("price", context),
                                                                style: CustomStyles.button_style.copyWith(fontSize: 13),
                                                                textAlign: TextAlign.center,
                                                              )),
                                                          flex: 1,
                                                        ),
                                                        Expanded(
                                                          flex: 2,
                                                          child: Column(
                                                            children: <Widget>[
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: <Widget>[
                                                                  Expanded(
                                                                      child: GestureDetector(
                                                                    child: Text(
                                                                      getLocalText("low_high", context),
                                                                      style: !model.priceHighLowFilter ? CustomStyles.button_style.copyWith(fontSize: 13) : CustomStyles.button_style.copyWith(fontSize: 13, color: CustomColors.White.withOpacity(.5)),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                    onTap: () {
                                                                      model.changePriceFilterType();
                                                                    },
                                                                  )),
                                                                  Expanded(
                                                                      child: GestureDetector(
                                                                    child: Text(
                                                                      getLocalText("high_low", context),
                                                                      style: model.priceHighLowFilter ? CustomStyles.button_style.copyWith(fontSize: 13) : CustomStyles.button_style.copyWith(fontSize: 13, color: CustomColors.White.withOpacity(.5)),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                    onTap: () {
                                                                      model.changePriceFilterType();
                                                                    },
                                                                  )),
                                                                ],
                                                              ),
                                                              AnimatedContainer(
                                                                margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                                                                duration: Duration(microseconds: 700),
                                                                alignment: !model.priceHighLowFilter ? Alignment.bottomLeft : Alignment.bottomRight,
                                                                child: Container(
                                                                  height: 2,
                                                                  width: 30,
                                                                  color: CustomColors.White,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(flex: 2, child: SizedBox())
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: MediaQuery.of(context).size.height * .7,
                                                    margin: EdgeInsets.only(left: 25, right: 25, top: 10),
                                                    child: model.transferSearchResponse.result.vechiles.isEmpty
                                                        ? Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: <Widget>[
                                                              Container(
                                                                margin: EdgeInsets.only(top: 40),
                                                                child: Image.asset(
                                                                  'assets/images/transfer.png',
                                                                  height: 150,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.all(7.0),
                                                                child: Text(getLocalText("no_transfers_found", context), textAlign: TextAlign.center, style: CustomStyles.medium20.copyWith(color: CustomColors.White)),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: <Widget>[
                                                                    FlatButton(
                                                                      color: CustomColors.Orange,
                                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0), side: BorderSide(color: CustomColors.Orange, width: 2)),
                                                                      // color: Colors.blue,
                                                                      onPressed: () async {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: Text(getLocalText("back_to_search", context), style: CustomStyles.normal16.copyWith(color: CustomColors.White)),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : model.transferList.length == 0
                                                            ? Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: <Widget>[
                                                                  Container(
                                                                    margin: EdgeInsets.only(top: 40),
                                                                    child: Image.asset(
                                                                      'assets/images/transfer.png',
                                                                      height: 150,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.all(7.0),
                                                                    child: Text(getLocalText("no_transfers_found", context), textAlign: TextAlign.center, style: CustomStyles.medium20.copyWith(color: CustomColors.White)),
                                                                  ),
                                                                ],
                                                              )
                                                            : ListView.builder(
                                                                itemCount: model.transferList.length,
                                                                itemBuilder: (BuildContext context, int index) {
                                                                  return GestureDetector(
                                                                    child: Card(
                                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                        elevation: 3,
                                                                        margin: EdgeInsets.only(
                                                                          top: 10,
                                                                        ),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                        ),
                                                                        child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                          children: <Widget>[
                                                                            Container(
                                                                              margin: EdgeInsets.only(top: 20, left: SizeConstants.SIZE_20, bottom: 5),
                                                                              child: Row(
                                                                                children: <Widget>[
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: <Widget>[
                                                                                      Row(
                                                                                        children: <Widget>[
                                                                                          Image.asset(
                                                                                            'assets/images/cab_icon.png',
                                                                                            height: 13,
                                                                                          ),
                                                                                          SizedBox(
                                                                                            width: 10,
                                                                                          ),
                                                                                          Text(
                                                                                            getLocalText("source", context),
                                                                                            style: CustomStyles.normal12.copyWith(color: CustomColors.heading),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: <Widget>[
                                                                                          SizedBox(
                                                                                            width: 5,
                                                                                          ),
                                                                                          Container(
                                                                                              height: 40,
                                                                                              margin: EdgeInsets.only(top: 10, bottom: 10),
                                                                                              child: MySeparator(
                                                                                                color: CustomColors.TabDisabled,
                                                                                                height: 1,
                                                                                                Horizontal: false,
                                                                                              )),
                                                                                          SizedBox(
                                                                                            width: 15,
                                                                                          ),
                                                                                          Text('Non-Stop', style: CustomStyles.normal10)
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        children: <Widget>[
                                                                                          Image.asset(
                                                                                            'assets/images/location.png',
                                                                                            height: 12,
                                                                                          ),
                                                                                          SizedBox(
                                                                                            width: 10,
                                                                                          ),
                                                                                          Text(
                                                                                            getLocalText("destination", context),
                                                                                            style: CustomStyles.normal12.copyWith(color: CustomColors.heading),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: SizeConstants.SIZE_30,
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                       "${ model.transferList[index].carClass.capacity.toString() }   ${getLocalText("seater", context)}",
                                                                                        style: CustomStyles.normal16.copyWith(color: CustomColors.disabledButton),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 5,
                                                                                      ),
                                                                                      Text(
                                                                                        model.transferList[index].carClass.title,
                                                                                        style: CustomStyles.medium16,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: SizeConstants.SIZE_30,
                                                                                  ),
                                                                                  Expanded(
                                                                                      child: Container(
                                                                                    padding: EdgeInsets.only(right: 10),
                                                                                    child: Image.network(
                                                                                      model.transferList[index].carClass.photo,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ))
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              height: 40,
                                                                              alignment: Alignment.center,
                                                                              width: MediaQuery.of(context).size.width,
                                                                              color: CustomColors.Orange,
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    model.transferList[index].displayRateInfoWithMarkup.currency + " " + model.transferList[index].displayRateInfoWithMarkup.totalPriceWithMarkup.roundToDouble().toString(),
                                                                                    style: CustomStyles.medium14.copyWith(color: CustomColors.White),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 5,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            )
                                                                          ],
                                                                        )),
                                                                    onTap: () {
                                                                      model.selectedVehicleData = [];
                                                                      model.selectedVehicleData.add(model.transferList[index]);
                                                                      Navigator.pushNamed(context, Routes.transferDetails, arguments: model.getArguments());
                                                                    },
                                                                  );
                                                                }),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      width: 45,
                                      height: 45,
                                      top: 0,
                                      right: SizeConstants
                                          .SIZE_8,
                                      child: Container(

                                          // padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.25),
                                              spreadRadius:
                                                  5,
                                              blurRadius:
                                                  7,
                                              offset:
                                                  Offset(0, 3), // changes position of shadow
                                            ),
                                          ], border: Border.all(width: 2, color: Colors.white, style: BorderStyle.solid), color: CustomColors.Orange, shape: BoxShape.circle),
                                          alignment: Alignment.center,
                                          child: Text(model.transferList.length.toString(), style: CustomStyles.button_style.copyWith(fontSize: 13))),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context,
      TransferResultsModel model) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0)),
        ),
        builder: (builder) {
          return Container(
            padding: EdgeInsets.only(
                left: 20, right: 27, top: 22),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.start,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: <Widget>[
                      Text(
                        getLocalText("filter", context),
                        style: CustomStyles.appbar
                            .copyWith(
                                color:
                                    CustomColors
                                        .heading),
                      ),
                      IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            Navigator.of(context)
                                .pop();
                          })
                    ],
                  ),
                  TransferFilterState(
                      model, context)
                ],
              ),
            ),
          );
        });
  }


  @override
  void onError(String message, bool isFromCreditCard, String asset) {

    Dialogs.showGenericErrorPopup(context, message, isFromCreditCard, asset);
    // TODO: implement onError
  }


  getLocalText(String key, BuildContext context) {

  return  AppLocalizations.of(context).translate(key);
  }
  
//  void _showBottomSheet(BuildContext context) {
//
//
//
//
//  }
}
