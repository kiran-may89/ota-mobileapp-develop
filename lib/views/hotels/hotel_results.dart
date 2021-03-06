import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/models/hotels/responses/hotel.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/utils/utils.dart';
import 'package:ota/viewmodels/hotels_view_model/hotel_filter_view_model.dart';
import 'package:ota/viewmodels/hotels_view_model/hotel_results_view_model.dart';
import 'package:ota/views/base/base_view.dart';
import 'package:ota/views/base/base_widget.dart';
import 'package:ota/views/hotels/about_hotel.dart';
import 'package:provider/provider.dart';
import 'package:ota/models/hotels/search_hotel_request.dart';
import 'package:ota/models/hotels/hotel_details_request.dart';
import 'package:ota/models/hotels/hotel_search_response.dart';
import 'package:shimmer/shimmer.dart';

class HotelResults extends StatelessWidget {
  SearchHotelRequest dto;

  HotelResults(this.dto);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseWidget<HotelResultsViewModel>(
      viewModel: HotelResultsViewModel(dto),
      onModelReady: (model) => model.initialise(),
      builder: (context) => HotelResultsState(),
    );
  }
}

class HotelResultsState extends BaseModelWidget<HotelResultsViewModel> {
  void _modalBottomSheetMenu(BuildContext context, HotelResultsViewModel model) {
    Future<void> future = showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetState(model);
      },
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(SizeConstants.SIZE_24), topRight: Radius.circular(SizeConstants.SIZE_24)),
      ),
    );
  }

  int getTotalAdults(HotelResultsViewModel model) {
    int count = 0;
    model.dto.rooms.forEach((element) {
      count += element.adultCnt;
    });
    return count;
  }

  List<Widget> Tabs = [
    Tab(
      child: Text(
        'Price Low-High',
      ),
    ),
    Tab(
      child: Text(
        'Price High-Low',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context, HotelResultsViewModel model) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${getLocalText("hotels", context)}-${model.dto.city}", style: CustomStyles.appbar),
        actions: [
          GestureDetector(
              onTap: () {
                _modalBottomSheetMenu(context, model);
              },
              child: Container(
                padding: EdgeInsets.only(right: SizeConstants.SIZE_4),
                child: Icon(
                  Icons.tune,
                ),
              ))
        ],
      ),
      body: model.loading
          ? ShimmerContainer(MediaQuery.of(context).size.height)
          : model.response.isError || model.response.result.hotels.length < 1
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Image.asset('assets/images/hotels.png', height: 150),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(getLocalText("no_hotels_found", context),
                            textAlign: TextAlign.center, style: CustomStyles.medium20.copyWith(color: CustomColors.disabledButton)),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(SizeConstants.SIZE_16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(model.dto.city, style: CustomStyles.heading),
                              SizedBox(height: 7),
                              Text(
                                '${convertToDate(model.dto.checkInDate)} - ${convertToDate(model.dto.checkOutDate)} '
                                '| ${getLocalText("rooms", context)} ${model.dto.rooms.length.toString()} | ${getTotalAdults(model)} ${getLocalText("guest", context)}',
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
                                getLocalText("edit", context), 
                                style: CustomStyles.calenderStyle.copyWith(color: CustomColors.White),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: SizeConstants.SIZE_8),
                        child: MySeparator(
                          color: CustomColors.TabDisabled,
                          height: 2,
                          Horizontal: true,
                        )),
                    Expanded(
                        child: Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          margin: EdgeInsets.only(top: 25),
                          decoration: BoxDecoration(
                            color: CustomColors.BackGround,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                          ),
                          child: DefaultTabController(
                            length: 2,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 26, left: 32, right: 32),
                                  constraints: BoxConstraints.expand(height: 28),
                                  child: TabBar(
                                    isScrollable: true,
                                    indicatorColor: CustomColors.White,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                                    labelStyle: CustomStyles.button_style.copyWith(fontSize: 13),
                                    unselectedLabelColor: CustomColors.White.withOpacity(.5),
                                    tabs: Tabs,
                                    onTap: (value) {
                                      if (value == 0) {
                                        model.asscendingOrder();
                                      } else {
                                        model.descendingOrder();
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: TabBarView(
                                      children: <Widget>[
                                        HotelsList(),
                                        HotelsList(),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          width: 55,
                          height: 55,
                          right: SizeConstants.SIZE_8,
                          child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  border: Border.all(width: 2, color: Colors.white, style: BorderStyle.solid),
                                  color: CustomColors.Orange,
                                  shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: Text(model.hotels.length.toString(), style: CustomStyles.button_style.copyWith(fontSize: 13))),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 0,
                    )
                  ],
                ),
    );
  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}

class HotelsList extends BaseModelWidget<HotelResultsViewModel> {
  @override
  Widget build(BuildContext context, HotelResultsViewModel model) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Column(
        children: <Widget>[
          Expanded(
              child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!model.isListLoading &&
                  model.hotels.length < model.response.result.hotels.length &&
                  scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                model.loadMore();
              }
              return false;
            },
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: model.scrollController,
                itemCount: model.hotels.length,
                // records.length
                itemBuilder: (BuildContext context, int index) {
                  Hotel hotel = model.hotels[index];

                  return GestureDetector(
                    onTap: () {
                      HotelDetailsRequest hotelRequest = HotelDetailsRequest(
                          searchId: model.response.result.searchId,
                          rooms: model.dto.rooms,
                          hotelCode: hotel.hotelCode,
                          options: hotel.options,
                          checkInDate: model.response.result.checkIn,
                          checkOutDate: model.response.result.checkOut,
                          clientNationality: model.dto.clientNationality,
                          tpa: hotel.tpa.toString(),
                          tpaName: hotel.tpaName);

                      Map<String, dynamic> args = new Map();
                      args['response'] = hotelRequest;
                      args['dto'] = model.dto;
                      Navigator.pushNamed(context, Routes.aboutHotel, arguments: args);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: SizeConstants.SIZE_16, left: 0, right:0),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(SizeConstants.SIZE_16))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                    child: FadeInImage.assetNetwork(
                                      image: hotel.images[0],
                                      placeholder: 'assets/images/hotels.png',
                                      width: MediaQuery.of(context).size.width,
                                      height: SizeConstants.SIZE_150,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(SizeConstants.SIZE_16), topRight: Radius.circular(SizeConstants.SIZE_16))),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Container(
                                      decoration: BoxDecoration(color: Colors.black38, shape: BoxShape.rectangle),
                                      height: SizeConstants.SIZE_60,
                                      padding: EdgeInsets.all(SizeConstants.SIZE_4),
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(hotel.name,style: CustomStyles.style3.copyWith(color: Colors.white,fontWeight:FontWeight.bold )),
                                          RatingBar(
                                            initialRating: hotel.starRating.toDouble(),
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
                              vertical: SizeConstants.SIZE_20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(
                                  width: SizeConstants.SIZE_12,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[

                                      Row(
                                        mainAxisAlignment:  MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Icon(
                                            Icons.location_on,
                                            color: Colors.black54,
                                            size: SizeConstants.SIZE_16,
                                          ),

                                          SizedBox(width:2,),
                                          Expanded(child: Text( hotel.address, style: CustomStyles.style3.copyWith(color: Colors.black54,))),

                                        ],
                                      )

                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "SAR ${hotel.roomOption.length > 0 ? hotel.roomOption[0].displayRateInfoWithMarkup.totalPriceWithMarkup : hotel.minRate}",
                                        style: CustomStyles.whiteTextSytle14Size.copyWith(fontWeight: FontWeight.bold, color: CustomColors.Orange),
                                      ),
                                      SizedBox(
                                        height: SizeConstants.SIZE_4,
                                      ),

                                      Text(
                                        "${model.response.result.totalRooms} room | ${model.response.result.totalNights} nights",
                                        style: CustomStyles.whiteTextSytle12Size.copyWith(color: CustomColors.disabledButton,),
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConstants.SIZE_12,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )),
          Visibility(
            maintainSize: false,
            visible: model.isListLoading,
            child: Container(
              height: 50,
              color: Colors.transparent,
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }

}

class BottomSheetState extends StatelessWidget {
  HotelResultsViewModel model;

  BottomSheetState(this.model);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider.value(
      value: model,
      child: Consumer<HotelResultsViewModel>(builder: (context, model, child) {
        return Padding(
          padding:
              EdgeInsets.only(left: SizeConstants.SIZE_16, right: SizeConstants.SIZE_16, top: SizeConstants.SIZE_16, bottom: SizeConstants.SIZE_16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "${getLocalText("filter", context)}", 
                  style: CustomStyles.whiteTextSytle24Size.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: SizeConstants.SIZE_12,
                ),
                Text(
                  getLocalText("price_range", context),
                  style: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.black45, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: SizeConstants.SIZE_16, bottom: SizeConstants.SIZE_16, left: SizeConstants.SIZE_24),
                      width: SizeConstants.SIZE_80,
                      padding: EdgeInsets.only(top: SizeConstants.SIZE_4, bottom: SizeConstants.SIZE_4),
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.25))),
                      child: Text(
                        "${model.rangeValues.start.floor()}",
                        textAlign: TextAlign.center,
                        style: CustomStyles.whiteTextSytle14Size.copyWith(color: CustomColors.BackGround),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: SizeConstants.SIZE_16, bottom: SizeConstants.SIZE_16, right: SizeConstants.SIZE_24),
                      width: SizeConstants.SIZE_80,
                      padding: EdgeInsets.only(top: SizeConstants.SIZE_4, bottom: SizeConstants.SIZE_4),
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.25))),
                      child: Text(
                        "${model.rangeValues.end.floor()}",
                        textAlign: TextAlign.center,
                        style: CustomStyles.whiteTextSytle14Size.copyWith(color: CustomColors.BackGround),
                      ),
                    ),
                  ],
                ),
                RangeSlider(
                  min: model.minPrice,
                  max: model.maxPrice,
                  activeColor: CustomColors.BackGround,
                  inactiveColor: Colors.black26,
                  values: model.rangeValues,
                  onChanged: (values) {
                    model.updateRangeValues(values);
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConstants.SIZE_16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                       getLocalText("location", context),
                        style: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.black45, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: SizeConstants.SIZE_16),
                        padding: EdgeInsets.only(left: SizeConstants.SIZE_12, right: SizeConstants.SIZE_12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(SizeConstants.SIZE_16)),
                          color: Colors.black12,
                        ),
                        child: TextFormField(
                            decoration: InputDecoration(
                          labelText: getLocalText("search_location", context),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: CustomColors.BackGround,
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConstants.SIZE_16),
                  child: Text(
                   getLocalText("filter_by", context),
                    style: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.black45, fontWeight: FontWeight.w500),
                  ),
                ),
                Wrap(
                  children: [
                    ChoiceChip(
                      label: Text(getLocalText("free_cancellation", context)),
                      labelStyle: CustomStyles.whiteTextSytle14Size.copyWith(color: model.freeSelected ? Colors.white : Colors.grey),
                      disabledColor: Colors.grey,
                      backgroundColor: Colors.white,
                      selectedColor: CustomColors.BackGround,
                      shape: StadiumBorder(side: BorderSide(color: Colors.grey, width: 0.5)),
                      selected: model.freeSelected,
                      onSelected: (bool selected) {
                        model.updateFreeSelected(true);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ChoiceChip(
                      label: Text(getLocalText("refundable", context)),
                      labelStyle: CustomStyles.whiteTextSytle14Size.copyWith(color: !model.freeSelected ? Colors.white : Colors.grey),
                      disabledColor: Colors.grey,
                      backgroundColor: Colors.white,
                      selectedColor: CustomColors.BackGround,
                      shape: StadiumBorder(side: BorderSide(color: Colors.grey, width: 0.5)),
                      selected: !model.freeSelected,
                      onSelected: (bool selected) {
                        model.updateFreeSelected(false);
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConstants.SIZE_16, bottom: SizeConstants.SIZE_16),
                  child: Text(
                    strings.star_rating,
                    style: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.black45, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      getLocalText("star_rating", context),
                      style: CustomStyles.whiteTextSytle24Size.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    RatingBar(
                      initialRating: model.rating,
                      minRating: 0,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: SizeConstants.SIZE_30,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: CustomColors.BackGround,
                      ),
                      onRatingUpdate: (rating) {
                        model.updateRating(rating);
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConstants.SIZE_16, bottom: SizeConstants.SIZE_16),
                  child: Text(
                   getLocalText("amenities", context),
                    style: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.black45, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: SizeConstants.SIZE_16),
                  width: MediaQuery.of(context).size.width,
                  height: 320,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: model.amenties.length,
                      itemBuilder: (BuildContext context, int index) {
                        Amentie amentie = model.amenties[index];
                        return GestureDetector(
                            onTap: () {
                              model.updateAmentieSelected(index);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(bottom: SizeConstants.SIZE_16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: SizeConstants.SIZE_16,
                                    height: SizeConstants.SIZE_16,
                                    margin: EdgeInsets.only(right: SizeConstants.SIZE_24),
                                    child: Image.asset(
                                      amentie.icon,
                                      fit: BoxFit.contain,
                                      color: amentie.isAvailable ? Colors.black : Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    amentie.name,
                                    style: CustomStyles.whiteTextSytle14Size.copyWith(color: amentie.isAvailable ? Colors.black : Colors.grey),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: SizeConstants.SIZE_24,
                                    height: SizeConstants.SIZE_24,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle, color: amentie.isAvailable ? CustomColors.BackGround : Colors.grey),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: SizeConstants.SIZE_16,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ));
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                        fit: FlexFit.tight,
                        child: FlatButton(
                          onPressed: () {
                            model.clearFilters();
                            Navigator.of(context).pop();
                          },
                          padding: EdgeInsets.all(SizeConstants.SIZE_16),
                          child: Text(
                            getLocalText("clear_all", context),
                            style: CustomStyles.button_style.copyWith(color: CustomColors.disabledButton),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(SizeConstants.SIZE_16),
                              side: BorderSide(color: CustomColors.disabledButton, width: 2)),
                        )),
                    SizedBox(
                      width: SizeConstants.SIZE_20,
                    ),
                    Flexible(
                        fit: FlexFit.tight,
                        child: FlatButton(
                          color: CustomColors.Orange,
                          onPressed: () {
                            model.applyFilter();
                            Navigator.of(context).pop();
                          },
                          padding: EdgeInsets.all(SizeConstants.SIZE_16),
                          child: Text(
                            getLocalText("apply", context),
                            style: CustomStyles.button_style,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(SizeConstants.SIZE_16), side: BorderSide(color: CustomColors.Orange, width: 2)),
                        ))
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
