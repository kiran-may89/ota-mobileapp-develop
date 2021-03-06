import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/hotels_view_model/about_hotel_viewmodel.dart';
import 'package:ota/views/base/base_view.dart';
import 'package:ota/views/base/base_widget.dart';
import 'package:ota/models/hotels/hotel_details_request.dart';

import 'package:ota/models/hotels/search_hotel_request.dart';
import 'package:ota/models/hotels/responses/room_option.dart';
import 'package:ota/utils/utils.dart';

class AboutHotel extends StatelessWidget {
  HotelDetailsRequest dto;
  SearchHotelRequest searchDto;

  AboutHotel(this.dto, this.searchDto);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseWidget<AboutHotelViewModel>(
      viewModel: AboutHotelViewModel(dto, searchDto),
      onModelReady: (model) => model.initialise(),
      builder: (context) => AboutHotelState(),
    );
  }
}

class AboutHotelState extends BaseModelWidget<AboutHotelViewModel> {
  Widget build(BuildContext context, AboutHotelViewModel model) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 13,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          getLocalText("book_hotel", context),
          style: CustomStyles.appbar,
        ),
      ),
      body: model.loading
          ? SpinKitChasingDots(
              size: SizeConstants.SIZE_50,
              color: CustomColors.BackGround,
            )
          : model.hotelDetailsResponse.isError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Image.asset(
                          'assets/images/hotels.png',
                          height: 150,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(getLocalText("something_went_wrong", context),
                            textAlign: TextAlign.center, style: CustomStyles.medium20.copyWith(color: CustomColors.disabledButton)),
                      ),
                    ],
                  ),
                )
              : Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                        child: Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: FadeInImage.assetNetwork(
                            image: model.hotelDetailsResponse.result.hotel.images[0],
                            placeholder: 'assets/images/hotels.png',
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 200),
                          height: MediaQuery.of(context).size.height - 200,
                          decoration: BoxDecoration(
                            color: CustomColors.BackGround,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                          ),
                          child: DefaultTabController(
                            length: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: SizeConstants.SIZE_24, left: SizeConstants.SIZE_30, right: SizeConstants.SIZE_30),
                                  constraints: BoxConstraints.expand(height: 28),
                                  child: TabBar(
                                    indicatorColor: CustomColors.White,
                                    isScrollable: true,
                                    indicatorSize: TabBarIndicatorSize.label,
                                    labelStyle: CustomStyles.whiteTextSytle14Size.copyWith(fontWeight: FontWeight.w500),
                                    unselectedLabelColor: CustomColors.White.withOpacity(.5),
                                    tabs: [
                                      Tab(
                                        child: Text(
                                          getLocalText("overview", context),
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          "Select Rooms",
                                        ),
                                      ),
                                      Tab(
                                        child: Text(
                                          getLocalText("about", context)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: TabBarView(
                                    children: [
                                      HotelsOverView(),
                                      SelectRooms(),
                                      HotelsAbout(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: SizeConstants.SIZE_70,
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex:7,
                              child: Padding(
                                padding: const EdgeInsets.only(left:10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "USD ${model.hotelDetailsResponse.result.hotel.roomOption[model.radioGroupValue].displayRateInfoWithMarkup.totalPriceWithMarkup}",
                                      style: CustomStyles.whiteTextSytle24Size.copyWith(color: CustomColors.BackGround, fontWeight: FontWeight.w500),
                                    ),
                                    LimitedBox(
                                      maxWidth: MediaQuery.of(context).size.width,
                                      child: Text(
                                        "${model.hotelDetailsResponse.result.hotel.roomOption[model.radioGroupValue].rooms[0].roomName}",
                                        style: CustomStyles.whiteTextSytle14Size.copyWith(color: CustomColors.disabledButton),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            Expanded(
                              flex:3,
                              child: Padding(
                                padding: const EdgeInsets.only(right:10.0),
                                child: SizedBox(
                                  height: SizeConstants.SIZE_48,
                                  child: RaisedButton(
                                      padding: EdgeInsets.all(SizeConstants.SIZE_16),
                                      color: CustomColors.Orange,
                                      child: Text(
                                        getLocalText("book_now", context),
                                        style: CustomStyles.button_style,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      onPressed: () {
                                        Map<String, dynamic> args = new Map();
                                        args['response'] = model.hotelDetailsResponse.result;
                                        args['dto'] = model.searchDto;
                                        args['selectGroup'] = model.radioGroupValue;
                                        Navigator.pushNamed(context, Routes.stayInfoHotel, arguments: args);
                                      }),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}

class HotelsOverView extends BaseModelWidget<AboutHotelViewModel> {
  List<Amentie> amenties;

  @override
  Widget build(BuildContext context, AboutHotelViewModel model) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: SizeConstants.SIZE_24, top: SizeConstants.SIZE_40, right: SizeConstants.SIZE_24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            model.hotelDetailsResponse.result.hotel.name,
            style: CustomStyles.whiteTextSytle24Size,
          ),
          SizedBox(
            height: SizeConstants.SIZE_4,
          ),
          Row(
            children: <Widget>[
              RatingBar(
                initialRating: model.hotelDetailsResponse.result.hotel.starRating.toDouble(),
                minRating: 0,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: SizeConstants.SIZE_12,
                ignoreGestures: true,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: SizeConstants.SIZE_4,
              ),
              Text(
                "${model.hotelDetailsResponse.result.hotel.starRating}  ${strings.star_rating}",
                style: CustomStyles.whiteTextSytle12Size,
              )
            ],
          ),
          SizedBox(
            height: SizeConstants.SIZE_20,
          ),
          Text(
           getLocalText("amenities", context),
            style: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w500),
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 3,
              padding: const EdgeInsets.only(top:4.0),

              shrinkWrap: true,
              children: List.generate(
                  model.hotelDetailsResponse.result.hotel.facilities.length > 6 ? 6 : model.hotelDetailsResponse.result.hotel.facilities.length,
                  (index) {
                String item = model.hotelDetailsResponse.result.hotel.facilities[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /* Container(
                      width: SizeConstants.SIZE_20,
                      height: SizeConstants.SIZE_20,
                      child: Image.asset(item.icon),
                    ),
                    Spacer(),*/
                    Expanded(
                      child: Text(
                        item,
                        style: CustomStyles.whiteTextSytle12Size.copyWith(color: Colors.white),
                      ),
                    )

                    /*  Spacer(
                      flex: 3,
                    ),*/
                  ],
                );
              }),
            ),
          ),
//          Flexible(
//            child: ListView.builder(
//              itemBuilder: (BuildContext context, int index) => ExpansionRoom(model.hotelDetailsResponse.result.hotel.roomOption[index], index),
//              itemCount: model.hotelDetailsResponse.result.hotel.roomOption.length,
//            ),
//          )
        ],
      ),
    );
  }

  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}

class SelectRooms extends BaseModelWidget<AboutHotelViewModel>
{
  @override
  Widget build(BuildContext context,AboutHotelViewModel model) {
    // TODO: implement build

    return ListView.builder(
              shrinkWrap: true,

              itemBuilder: (BuildContext context, int index) => ExpansionRoom(model.hotelDetailsResponse.result.hotel.roomOption[index], index),
              itemCount: model.hotelDetailsResponse.result.hotel.roomOption.length,
            );
  }

}

class ExpansionRoom extends BaseModelWidget<AboutHotelViewModel> {
  RoomOption entry;
  int radioIndex;

  ExpansionRoom(this.entry, this.radioIndex);

  @override
  Widget build(BuildContext context, AboutHotelViewModel model) {
    return Padding(
      padding: const EdgeInsets.only(right:10.0),
      child: Container(

        height: (radioIndex == model.radioGroupValue) ? 200 : 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Radio(
                  value: radioIndex,
                  groupValue: model.radioGroupValue,
                  activeColor: Colors.white,
                  onChanged: (val) {
                    model.updateRoomOption(val);
                  },
                ),
                Text(
                  "${getLocalText("available_room_group", context)} ${radioIndex + 1}",
                  style: CustomStyles.whiteTextSytle14Size,
                ),
                Spacer(),
                Text(
                  "USD  ${entry.displayRateInfoWithMarkup.totalPriceWithMarkup}",
                  style: CustomStyles.whiteTextSytle14Size,
                ),
                Spacer(),
                RotatedBox(
                  quarterTurns: (radioIndex == model.radioGroupValue) ? 2 : 0,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.orange,
                  ),
                )
              ],
            ),
            Visibility(
              maintainSize: false,
              visible: (radioIndex == model.radioGroupValue),
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,

                  key: PageStorageKey("List"),
                  itemCount: entry.rooms.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.all(SizeConstants.SIZE_8),
                              height: 100,
                              width: entry.rooms.length > 1
                                  ? (MediaQuery.of(context).size.width / 2 - (SizeConstants.SIZE_24 * 2))
                                  : MediaQuery.of(context).size.width - (SizeConstants.SIZE_24 * 3),
                              child: Image.asset(
                                "assets/images/default_profile_cover.png",
                                fit: BoxFit.cover,
                                width: entry.rooms.length > 1
                                    ? (MediaQuery.of(context).size.width / 2 - (SizeConstants.SIZE_24 * 2))
                                    : MediaQuery.of(context).size.width - (SizeConstants.SIZE_24 * 3),
                              )),
                          Container(
                            child: Text(
                              "${entry.rooms[index].roomName}",
                              style: CustomStyles.whiteTextSytle16Size.copyWith(color: CustomColors.Orange, fontWeight: FontWeight.bold),
                            ),
                            margin: EdgeInsets.only(left: SizeConstants.SIZE_8),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}

class HotelsAbout extends BaseModelWidget<AboutHotelViewModel> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context, AboutHotelViewModel model) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.only(left: SizeConstants.SIZE_24, top: SizeConstants.SIZE_40, right: SizeConstants.SIZE_24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                strings.about,
                style: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.white.withOpacity(0.9)),
              ),
              SizedBox(
                height: SizeConstants.SIZE_16,
              ),
              Text(
                model.hotelDetailsResponse.result.hotel.description,
                style: CustomStyles.whiteTextSytle12Size.copyWith(color: Colors.white.withOpacity(0.9)),
              ),
              SizedBox(
                height: SizeConstants.SIZE_30,
              ),
              Text(
                strings.location.toUpperCase(),
                style: CustomStyles.whiteTextSytle14Size.copyWith(fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.5)),
              ),
              SizedBox(
                height: SizeConstants.SIZE_16,
              ),
              Text(
                model.hotelDetailsResponse.result.hotel.address,
                style: CustomStyles.whiteTextSytle14Size.copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                  height: 300,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    markers: <Marker>{
//                    Marker(
//                        markerId: MarkerId('value'),
//                        position: LatLng(model.hotelDetailsResponse.result.hotel.geolocation.latitude== null? "NA" :model.hotelDetailsResponse.result.hotel.geolocation.latitude,
//                            model.hotelDetailsResponse.result.hotel.geolocation.longitude)),
//
//

                      Marker(
                          markerId: MarkerId('value'),
                          position: LatLng(17.1,
                              83.12)),


                    },
                    initialCameraPosition: CameraPosition(
                      target:LatLng(17.1,
                          83.12),
                      zoom: 13.0,
                    ),
                  )),


              SizedBox(height: 150,)

            ],
          )

      ),
    );
  }
}

class Amentie {
  String name;
  String icon;
  bool isAvailable = false;

  Amentie(this.name, {this.icon, this.isAvailable = false}) {
    icon = getIcon(name);
  }
}

class RoomEntry {
  String title;
  List<RoomType> listTypes;

  RoomEntry(this.title, this.listTypes);

  static List<RoomType> buildRoomEntries() {
    return [
      RoomType("Std. Double Room", "Lowest price", 2000),
    ];
  }

  static List<RoomType> twinRoomEntries() {
    return [
      RoomType("Free Break Fast", "Lowest price", 1500),
    ];
  }
}

class RoomType {
  String typeName;
  String typeTag;
  int price;

  RoomType(this.typeName, this.typeTag, this.price);
}
