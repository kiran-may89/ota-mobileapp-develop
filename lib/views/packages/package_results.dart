import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/package/package_results_viewmodels.dart';
import 'package:ota/views/bottom_sheets/package_filter.dart';
import 'package:provider/provider.dart';

class PackageResults extends StatefulWidget {
  @override
  _PackageResultsState createState() =>
      _PackageResultsState();
}

class _PackageResultsState
    extends State<PackageResults> {
  var height;

  var width;

  @override
  Widget build(BuildContext context) {
    height =
        MediaQuery.of(context).size.height / 10;

    width =
        MediaQuery.of(context).size.width / 10;

    return ChangeNotifierProvider<
        PackageResultsViewModel>(
      create: (context) =>
          PackageResultsViewModel(),
      child: Consumer<PackageResultsViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: CustomColors.White,
            appBar: AppBar(
              title: Text(
                'Package Results',
                style: CustomStyles.appbar,
              ),
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
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.tune,
                          color:
                              CustomColors.White,
                          size: 20,
                        ),
                        // Icon(Icons.clear, color: Colors.white,size: 20,),
                        onPressed: () {

                          if (model.packageResultList.result != null) if (model
                          .packageResultList
                          .result
                          .isNotEmpty)
                            _showBottomSheet(
                            model, context);




                        },
                      ),
                    ],
                  ),
                ),
              ],
              elevation: 0.0,
              backgroundColor:
                  CustomColors.BackGround,
            ),
            body: model.loading
                ? ShimmerContainer(
                    MediaQuery.of(context)
                        .size
                        .height)
                : Container(
                    height: MediaQuery.of(context)
                        .size
                        .height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize:
                            MainAxisSize.min,
                        mainAxisAlignment:
                            MainAxisAlignment
                                .start,
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        children: <Widget>[
                          Container(
                            //height: MediaQuery.of(context).size.height*.17,
                            width:
                                double.infinity,
                            margin:
                                EdgeInsets.only(left: 22, right: 22, top: 10),

                            child: Column(
                              children: <Widget>[
                                Row(mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <
                                      Widget>[
                                    Expanded(
                                      flex: 8,
                                      child:
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
                                        children: <
                                            Widget>[
                                          Text(
                                            "Popular Packages",
                                            style:
                                                CustomStyles.heading,
                                          ),
//    SizedBox(height: 7,),
//    Wrap(spacing: 1.2,
//
//    alignment: WrapAlignment.start,
//    direction: Axis.horizontal,
//
//    children: <Widget>[
//    Text(model.requestData.oneway?model.requestData.monthFrom+" | ":model.requestData.monthFrom +" - "+model.requestData.monthTo+" | ",style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))),
//    Row(
//    mainAxisSize: MainAxisSize.min,
//    mainAxisAlignment: MainAxisAlignment.start,
//    crossAxisAlignment: CrossAxisAlignment.start,
//    children: <Widget>[
//    model.requestData.adults!=0?Text('Adult ${model.requestData.adults} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
//    model.requestData.children!=0?Text('Children ${model.requestData.children} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
//    model.requestData.infants!=0?Text('Infants ${model.requestData.infants} | ',style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5))):SizedBox.shrink(),
//    ],),
//
//    Text(model.requestData.cabinSelection_name,
//    style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading.withOpacity(.5)),),
//
//
//
//
//    ],)
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child:
                                          SizedBox(
                                        height:
                                            24,
                                        child:
                                            RaisedButton(
                                          onPressed:
                                              () {
                                            Navigator.of(context)
                                                .pop();
                                          },
                                          color: CustomColors
                                              .Orange,
                                          child:
                                              Text(
                                            'EDIT',
                                            style: CustomStyles.calenderStyle.copyWith(
                                                color: CustomColors.White,
                                                fontSize: 11),
                                          ),
                                          elevation:
                                              3,
                                          shape:
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets
                                        .only(
                                            top:
                                                10,
                                            bottom:
                                                10),
                                    child:
                                        MySeparator(
                                      color: CustomColors
                                          .TabDisabled,
                                      height: 1,
                                      Horizontal:
                                          true,
                                    )),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(
                                            context)
                                        .size
                                        .height *
                                    .8,
                                margin: EdgeInsets
                                    .only(
                                  top: SizeConstants
                                      .SIZE_20,
                                ),
                                decoration:
                                    BoxDecoration(
                                  color: CustomColors
                                      .BackGround,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius
                                          .circular(
                                              25),
                                      topLeft: Radius
                                          .circular(
                                              25)),
                                ),
                                child: Container(
                                  margin: EdgeInsets
                                      .only(
                                          top:
                                              10),
                                  child: Column(
                                    children: <
                                        Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            top:
                                                10,
                                            left:
                                                20,
                                            right:
                                                20),
                                        child:
                                            Row(
                                          children: <
                                              Widget>[
                                            Expanded(
                                              child: Container(
                                                  margin: EdgeInsets.only(bottom: 10),
                                                  child: Text(
                                                    'Price :',
                                                    style: CustomStyles.button_style.copyWith(fontSize: 13),
                                                    textAlign: TextAlign.center,
                                                  )),
                                              flex:
                                                  1,
                                            ),
                                            Expanded(
                                              flex:
                                                  2,
                                              child:
                                                  Column(
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: <Widget>[
                                                      Expanded(
                                                          child: GestureDetector(
                                                        child: Text(
                                                          'Low-High',
                                                          style: model.Price_Filter == false ? CustomStyles.button_style.copyWith(fontSize: 13) : CustomStyles.button_style.copyWith(fontSize: 13, color: CustomColors.White.withOpacity(.5)),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                        onTap: () {},
                                                      )),
                                                      Expanded(
                                                          child: GestureDetector(
                                                        child: Text(
                                                          'High-Low',
                                                          style: model.Price_Filter ? CustomStyles.button_style.copyWith(fontSize: 13) : CustomStyles.button_style.copyWith(fontSize: 13, color: CustomColors.White.withOpacity(.5)),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                        onTap: () {},
                                                      )),
                                                    ],
                                                  ),
                                                  AnimatedContainer(
                                                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                                                    duration: Duration(microseconds: 700),
                                                    alignment: !model.Price_Filter ? Alignment.bottomLeft : Alignment.bottomRight,
                                                    child: Container(
                                                      height: 2,
                                                      width: 30,
                                                      color: CustomColors.White,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex:
                                                  2,
                                              child:
                                                  SizedBox(),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            .7,
                                        margin: EdgeInsets.only(
                                            left: width *
                                                .4,
                                            right: width *
                                                .4,
                                            top:
                                                10),
                                        child: ListView.builder(
                                            //physics: NeverScrollableScrollPhysics(),

                                            primary: false,
                                            shrinkWrap: true,
                                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .12),
                                            itemCount: model.packageResultList.result.length, // records.length
                                            itemBuilder: (BuildContext context, int index) {
                                              return Container(
                                                width: MediaQuery.of(context).size.width,
                                                margin: EdgeInsets.only(bottom: SizeConstants.SIZE_16, left: SizeConstants.SIZE_16, right: SizeConstants.SIZE_16),
                                                decoration: BoxDecoration(color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(SizeConstants.SIZE_16))),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      child: Stack(
                                                        children: <Widget>[
                                                          ClipRRect(
                                                              child:
                                                      model.packageResultList.result[index].images.isEmpty?

                                                      Image.asset(
                                                        'assets/images/temp/package2.jpg',
                                                        width: MediaQuery.of(context).size.width,
                                                        height: SizeConstants.SIZE_150,
                                                        fit: BoxFit.cover,
                                                      ):

                                                              Image.network(
                                                              model.packageResultList.result[index].images.first.imageUrl,
                                                                width: MediaQuery.of(context).size.width,
                                                                height: SizeConstants.SIZE_150,
                                                                fit: BoxFit.cover,
                                                              ),
                                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeConstants.SIZE_16), topRight: Radius.circular(SizeConstants.SIZE_16))),
                                                          Positioned(
                                                            bottom: 0,
                                                            left: 0,
                                                            child: Container(
                                                                decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.rectangle),
                                                                height: SizeConstants.SIZE_40,
                                                                padding: EdgeInsets.all(SizeConstants.SIZE_4),
                                                                width: MediaQuery.of(context).size.width,
                                                                alignment: Alignment.centerLeft,
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: [
                                                                        Text(
                                                                        model.packageResultList.result[index].description,
                                                                          style: CustomStyles.medium12.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.flight_takeoff,
                                                                              color: Colors.white,
                                                                              size: 20,
                                                                            ),
                                                                            Icon(
                                                                              Icons.location_on,
                                                                              color: Colors.white,
                                                                              size: 20,
                                                                            )
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                )),
                                                          ),
                                                          Positioned(
                                                            right: SizeConstants.SIZE_8,
                                                            top: SizeConstants.SIZE_8,
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color: Colors.white,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.symmetric(
                                                          vertical: SizeConstants.SIZE_8,
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 8, right: 8),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              RichText(
                                                                text: TextSpan(
                                                                    text: model.packageResultList.result[index].name,
                                                                    style: CustomStyles.medium18.copyWith(
                                                                      color: CustomColors.heading,
                                                                    ),
                                                                    children: <TextSpan>[
                                                                      TextSpan(text: " -" +" All Stunning Places", style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround))
                                                                    ]),
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              RatingBar(
                                                                initialRating: 4.5,
                                                                minRating: 1,
                                                                direction: Axis.horizontal,
                                                                allowHalfRating: true,
                                                                itemCount: 5,
                                                                ignoreGestures: true,
                                                                itemSize: SizeConstants.SIZE_16,
                                                                itemBuilder: (context, _) => Icon(
                                                                  Icons.star,
                                                                  color: Colors.amber,
                                                                ),
                                                                onRatingUpdate: (rating) {
                                                                  print(rating);
                                                                },
                                                              ),
                                                              Row(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: <Widget>[
                                                                  RichText(
                                                                    text: TextSpan(text: "\$ ", style: CustomStyles.normal14.copyWith(fontWeight: FontWeight.bold, color: CustomColors.BackGround), children: <TextSpan>[
                                                                      TextSpan(
                                                                        text: (model.packageResultList.result[index].adultPrice+model.packageResultList.result[index].childPrice).toString(),
                                                                        style: CustomStyles.normal18.copyWith(fontWeight: FontWeight.bold, color: CustomColors.BackGround),
                                                                      )
                                                                    ]),
                                                                  ),
                                                                  SizedBox(
                                                                    height: SizeConstants.SIZE_4,
                                                                  ),
                                                                  RaisedButton(
                                                                    onPressed: () {},
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                    ),
                                                                    child: Text(
                                                                      "View More",
                                                                      style: CustomStyles.medium16.copyWith(color: CustomColors.White),
                                                                    ),
                                                                    color: CustomColors.Orange,
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        )

//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  SizedBox(
//                    width: SizeConstants.SIZE_12,
//                  ),
//                  Expanded(
//                    flex: 5,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisSize: MainAxisSize.max,
//                      children: <Widget>[
//                        RichText(
//                          softWrap: true,
//                          text: TextSpan(children: [
//                            WidgetSpan(
//                              child: Icon(
//                                Icons.location_on,
//                                color: Colors.black54,
//                                size: SizeConstants.SIZE_16,
//                              ),
//                            ),
//                            //TextSpan(text: hotel.address, style: CustomStyles.style3.copyWith(color: Colors.black54)),
//                          ]),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Expanded(
//                    flex: 2,
//                    child:
//
//                  ),
//                  SizedBox(
//                    width: SizeConstants.SIZE_12,
//                  )
//                ],
//              ),

                                                        )
                                                  ],
                                                ),
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                width: 45,
                                height: 45,
                                right:
                                    SizeConstants
                                        .SIZE_8,
                                child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors
                                                .black
                                                .withOpacity(0.25),
                                            spreadRadius:
                                                5,
                                            blurRadius:
                                                7,
                                            offset: Offset(
                                                0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                            width:
                                                2,
                                            color: Colors
                                                .white,
                                            style: BorderStyle
                                                .solid),
                                        color: CustomColors
                                            .Orange,
                                        shape: BoxShape
                                            .circle),
                                    alignment:
                                        Alignment
                                            .center,
                                    child: Text(
                                        model
                                            .packageResultList
                                            .result
                                            .length
                                            .toString(),
                                        style: CustomStyles
                                            .button_style
                                            .copyWith(
                                                fontSize: 13))),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  void _showBottomSheet(PackageResultsViewModel model, BuildContext context) {
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
                  "Filter Packages",
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
            PackageFilter(model, context)
          ],
        ),
      );
    }
    );
  }

}
