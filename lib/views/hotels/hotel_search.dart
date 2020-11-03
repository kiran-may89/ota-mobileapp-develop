import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/common/country_codes_response_entity.dart';
import 'package:ota/models/hotels/city_look_up_response.dart';
import 'package:ota/models/hotels/responses/hotel_auto_search_model.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/utils/utils.dart';
import 'package:ota/viewmodels/hotel_search_view_model.dart';
import 'package:ota/views/base/base_view.dart';
import 'package:ota/views/base/base_widget.dart';

import 'bottom_sheet/search_country.dart';
import 'bottom_sheet/search_location.dart';

class HotelSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseWidget<HotelSearchViewModel>(
      viewModel: HotelSearchViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context) => HotelSearchState(),
    );
  }
}

class HotelSearchState extends BaseModelWidget<HotelSearchViewModel> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context, HotelSearchViewModel model) {
    // TODO: implement build
    return Scaffold(
      key:scaffoldKey,
      appBar: AppBar(
        title: Text(
          strings.hotel_booking,
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
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: (){

                showSourceBottomSheetForLocation(context, model);

              },
              child: Card(
                  elevation: 3,
                  margin: EdgeInsets.only(top: SizeConstants.SIZE_30, left: SizeConstants.SIZE_16, right: SizeConstants.SIZE_16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SizeConstants.SIZE_16),
                  ),
                  child: Container(
                    height: SizeConstants.SIZE_70,
                    margin: EdgeInsets.only(
                      left: SizeConstants.SIZE_20,
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/location.png',
                          height: SizeConstants.SIZE_20,
                        ),
                        SizedBox(
                          width: SizeConstants.SIZE_10,
                        ),
                        Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(model.typeAheadController.text.isEmpty?strings.destination:model.typeAheadController.text ,
                                  style: CustomStyles.destinationStyle),
                            )


                        ),
                      ],
                    ),
                  )),
            ),
            Container(
                margin: EdgeInsets.only(right: SizeConstants.SIZE_16, left: SizeConstants.SIZE_16, top: SizeConstants.SIZE_20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                  Text(
                    getLocalText("nationality", context),
                    style: CustomStyles.heading.copyWith(color: CustomColors.heading.withOpacity(.5)),
                  ),
                  GestureDetector(
                    onTap: (){
                      showSourceBottomSheet(context, model, 0, 0);
                    },
                    child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(SizeConstants.SIZE_16),
                        ),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              left: SizeConstants.SIZE_16, right: SizeConstants.SIZE_16, top: SizeConstants.SIZE_4, bottom: SizeConstants.SIZE_4),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(model.country,style: CustomStyles.destinationStyle,))
                        )),
                  ),


                ])),
            Container(
              margin: EdgeInsets.only(right: SizeConstants.SIZE_16, left: SizeConstants.SIZE_16, top: SizeConstants.SIZE_20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    getLocalText("setDates", context),
                    style: CustomStyles.heading.copyWith(color: CustomColors.heading.withOpacity(.5)),
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConstants.SIZE_16),
                    ),
                    child: Container(
                        margin: EdgeInsets.only(
                            top: SizeConstants.SIZE_20, left: SizeConstants.SIZE_20, bottom: SizeConstants.SIZE_16, right: SizeConstants.SIZE_20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/images/calender.png",
                                  height: SizeConstants.SIZE_20,
                                ),
                                SizedBox(
                                  width: SizeConstants.SIZE_8,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    "${getLocalText("check_in", context)} ${convertToDate(model.requestDto.checkInDate)} - ${getLocalText("check_out", context)} ${convertToDate(model.requestDto.checkOutDate)}",
                                    style: CustomStyles.cardContentStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Spacer(),
                                RotatedBox(
                                  quarterTurns: model.isCalenderExpanded ? 0 : 2,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_upward,
                                      color: CustomColors.Orange,
                                      size: SizeConstants.SIZE_24,
                                    ),
                                    onPressed: () => model.toggleCalender(),
                                  ),
                                )
                              ],
                            ),
                            Visibility(
                              visible: model.isCalenderExpanded,
                              maintainState: true,
                              maintainAnimation: true,
                              maintainSize: false,
                              child: RangePicker(
                                selectedPeriod: model.selectedPeriod,
                                datePickerStyles: DatePickerRangeStyles(
                                  disabledDateStyle: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.grey),
                                  selectedDateStyle: CustomStyles.whiteTextSytle14Size.copyWith(color: CustomColors.White),
                                  defaultDateTextStyle: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.black),
                                ),
                                selectableDayPredicate: (date) {
                                  var duration = DateTime.now().difference(date).inDays;
                                  return duration <= 0;
                                },
                                onChanged: (period) {
                                  model.setSelectedTimerPeriod(period);
                                },
                                firstDate: model.firstDate,
                                lastDate: model.lastDate,
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: SizeConstants.SIZE_16, left: SizeConstants.SIZE_16, top: SizeConstants.SIZE_20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    getLocalText("rooms", context),
                    style: CustomStyles.heading.copyWith(color: CustomColors.heading.withOpacity(.5)),
                  ),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeConstants.SIZE_16),
                    ),
                    child: Container(
                      height: SizeConstants.SIZE_45,
                      margin: EdgeInsets.only(left: SizeConstants.SIZE_16, right: SizeConstants.SIZE_16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            getLocalText("rooms", context),
                            style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading, fontSize: SizeConstants.SIZE_16),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.do_not_disturb_on,
                                    color: CustomColors.Orange,
                                    size: 22,
                                  ),
                                  onPressed: () => model.addRoomCount(false)),
                              Text(
                                model.requestDto.rooms.length.toString(),
                                style: CustomStyles.heading.copyWith(fontSize: SizeConstants.SIZE_16),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: CustomColors.Orange,
                                    size: 22,
                                  ),
                                  onPressed: () => model.addRoomCount(true)),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: List.generate(
                model.requestDto.rooms.length,
                (index) {
                  return Container(
                    margin: EdgeInsets.only(right: SizeConstants.SIZE_16, left: SizeConstants.SIZE_16, top: SizeConstants.SIZE_20),
                    child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(SizeConstants.SIZE_16),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            right: SizeConstants.SIZE_16,
                            left: SizeConstants.SIZE_16,
                            top: SizeConstants.SIZE_16,
                            bottom: SizeConstants.SIZE_16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "${getLocalText("room", context)} ${(index + 1)}",
                                    style: CustomStyles.heading.copyWith(color: CustomColors.heading.withOpacity(.5)),
                                  ),
                                  IconButton(
                                    constraints: BoxConstraints.loose(Size.fromRadius(SizeConstants.SIZE_16)),
                                    icon: Icon(
                                      Icons.close,
                                      size: SizeConstants.SIZE_20,
                                      color: CustomColors.Orange,
                                    ),
                                    onPressed: () => model.removeRoom(index),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    getLocalText("adult", context),
                                    style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading, fontSize: SizeConstants.SIZE_16),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(
                                            Icons.do_not_disturb_on,
                                            color: CustomColors.Orange,
                                            size: 22,
                                          ),
                                          onPressed: () => model.addAdultCount(false, index)),
                                      Text(
                                        model.requestDto.rooms[index].adultCnt.toString(),
                                        style: CustomStyles.heading.copyWith(fontSize: 16),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.add_circle,
                                            color: CustomColors.Orange,
                                            size: 22,
                                          ),
                                          onPressed: () => model.addAdultCount(true, index)),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    getLocalText("children", context),
                                    style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading, fontSize: SizeConstants.SIZE_16),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                          icon: Icon(
                                            Icons.do_not_disturb_on,
                                            color: CustomColors.Orange,
                                            size: 22,
                                          ),
                                          onPressed: () => model.addChildCount(false, index)),
                                      Text(
                                        model.requestDto.rooms[index].children.length.toString(),
                                        style: CustomStyles.heading.copyWith(fontSize: 16),
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.add_circle,
                                            color: CustomColors.Orange,
                                            size: 22,
                                          ),
                                          onPressed: () => model.addChildCount(true, index)),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                      model.requestDto.rooms[index].children.length,
                                      (ind) => Column(
                                            children: <Widget>[
                                              Text(
                                                "${getLocalText("child", context)} ${ind + 1} Age",
                                                style: CustomStyles.whiteTextSytle12Size.copyWith(color: Colors.grey),
                                              ),
                                              Card(
                                                  elevation: 4,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(SizeConstants.SIZE_4),
                                                  ),
                                                  child: Container(
                                                    width: SizeConstants.SIZE_50,
                                                    height: SizeConstants.SIZE_40,
                                                    child: TextFormField(
                                                      initialValue: model.requestDto.rooms[index].children[ind].childAge.toString(),
                                                      style: CustomStyles.whiteTextSytle16Size
                                                          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                                                      textAlign: TextAlign.center,
                                                      inputFormatters: <TextInputFormatter>[
                                                        WhitelistingTextInputFormatter.digitsOnly,
                                                        LengthLimitingTextInputFormatter(1),
                                                      ],
                                                      maxLines: 1,
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(border: InputBorder.none),
                                                    ),
                                                  ))
                                            ],
                                          )))
                            ],
                          ),
                        )),
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: SizeConstants.SIZE_48,
              margin: EdgeInsets.only(
                  left: SizeConstants.SIZE_20, right: SizeConstants.SIZE_20, top: SizeConstants.SIZE_20, bottom: SizeConstants.SIZE_20),
              child: RaisedButton(
                  color: CustomColors.Orange,
                  child: Text(
                    getLocalText("search_hotels", context),
                    style: CustomStyles.button_style,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                        if(model.validateData(scaffoldKey)) {
                          model.roomPaxes();
                          Navigator.pushNamed(context, Routes.searchHotels,
                              arguments: model.requestDto);
                        }
                  }),
            )
          ],
        ),
      ),
    );
  }

  showSourceBottomSheet(
      BuildContext context,
      HotelSearchViewModel model,
      int index,
      int passengerType) {
    return showModalBottomSheet(
        isDismissible: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
//margin: EdgeInsets.all(15),
            child: SelectCountry(model, context,
                index, passengerType)));
  }

  showSourceBottomSheetForLocation(BuildContext context, HotelSearchViewModel model) {
    return showModalBottomSheet(
        isDismissible: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (context) =>
            Container(
              //margin: EdgeInsets.all(15),
                child: SearchLocation(model, context)


            ));
  }

  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
