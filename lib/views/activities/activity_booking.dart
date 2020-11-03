import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/activity/request/search_activity_data.dart';
import 'package:ota/models/googleplaces/predictions.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/activities_view_models/activity_search_view_model.dart';
import 'package:ota/views/activities/bottom_sheets/search_location.dart';
import 'package:provider/provider.dart';

import 'date_selector.dart';

class ActivityBooking extends StatefulWidget {
  @override
  _ActivityBookingState createState() => _ActivityBookingState();
}

class _ActivityBookingState extends State<ActivityBooking> {

  var height;

  var width;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {



    height =MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;

    return ChangeNotifierProvider<Activity_Model>(
      create: (context) => Activity_Model(),
      child: Consumer<Activity_Model>(
        builder: (context, model, child) {

          return Scaffold(
            key: _scaffoldKey,


            appBar: AppBar(
              title: Text(
                getLocalText("search_activity", context),
                style: CustomStyles.button_style.copyWith(fontSize: 20),
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
              elevation: 0.0,
              backgroundColor: CustomColors.BackGround,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: width*.4, right: width*.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: height*.5,
                    ),

                    GestureDetector(


                      onTap: (){

                        showSourceBottomSheet(context,model,);

                      },

                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.only(top: 10, bottom: 40),
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

                       Container(
                         child:

                         model.startPlaceData==null?

                         Text(getLocalText("from", context),
                           style: CustomStyles
                               .destinationStyle
                               .copyWith(fontSize: 12),)
                             :
                         Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [

                             Text(getLocalText("from", context),
                               style: CustomStyles
                                   .destinationStyle
                                   .copyWith(fontSize: 9),),

                             SizedBox(height: 7,),

                             Text(model.startPlaceData,
                               style: CustomStyles
                                   .destinationStyle
                                   .copyWith(fontSize: 14),)





                           ],
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
                    ),

                    Container(
//                        margin: EdgeInsets.only(
//                            right: SizeConstants.SIZE_16,
//                            left: SizeConstants.SIZE_16,
//                            top: SizeConstants.SIZE_20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            getLocalText("setDates", context),
                            style: CustomStyles.heading.copyWith(color: CustomColors.heading.withOpacity(.5)),
                          ),
                          Card(
                            elevation: 3,
                            margin: EdgeInsets.only(top: SizeConstants.SIZE_10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(SizeConstants.SIZE_16),
                            ),
                            child: Container(
                                margin: EdgeInsets.only(
                                    bottom: SizeConstants.SIZE_20,
                                    top: SizeConstants.SIZE_20,
                                    left: SizeConstants.SIZE_20,
                                    right: SizeConstants.SIZE_20),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/calender.png",
                                          height: SizeConstants.SIZE_20,
                                        ),
                                        SizedBox(
                                          width: SizeConstants.SIZE_8,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[

                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "${ getLocalText("from", context)}   ${model.startDateMOnth}   ",
                                                  style: CustomStyles
                                                      .cardContentStyle.copyWith(fontSize: 14),
                                                  textAlign:
                                                  TextAlign.start,
                                                ),
                                                Text(
                                                  "${ getLocalText("return", context)}    ${model.returnDateMonth}",
                                                  style: CustomStyles
                                                      .cardContentStyle.copyWith(fontSize: 14),
                                                  textAlign:
                                                  TextAlign.start,
                                                )
                                              ],
                                            )
                                          ],
                                        ),


                                        Spacer(),

                                        RotatedBox(
                                          quarterTurns:
                                          model.toggleDateVisible ? 0 : 2,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_upward,
                                              color: CustomColors.Orange,
                                              size: SizeConstants.SIZE_24,
                                            ),
                                            onPressed: () =>
                                                model.toggleCalender(),
                                          ),
                                        )




                                      ],
                                    ),


                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.easeIn,
                                      height: model.calenderHeight,
                                      child: Visibility(
                                        visible: model.toggleDateVisible,
                                        child: Container(
                                            margin: EdgeInsets.all(5),
                                            padding: EdgeInsets.all(5),
                                            height: 280,
                                            width: 280,
                                            child:
                                            ActivityDateSelector(model, context)
                                        ),
                                      ),
                                    )

                                  ],
                                )),
                          )
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      getLocalText("add_number_of_persons", context),
                      style: CustomStyles.heading.copyWith(color: CustomColors.heading.withOpacity(.5)),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Card(
                      elevation: 3,
                      margin: EdgeInsets.only(top: 22),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: 45,
                        margin: EdgeInsets.only(left: 17, right: 18),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Text(getLocalText("guests", context),
                                  style: model.adultCount == 0
                                      ? CustomStyles.normal16.copyWith(color: CustomColors.disabledButton)
                                      : CustomStyles.normal16),
                            ),
                            Expanded(
                                flex: 5,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 15,
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.do_not_disturb_on,
                                          color: CustomColors.Orange,
                                          size: 22,
                                        ),
                                        onPressed: () {
                                          model.removeAdult();
                                        }),
                                    Text(model.adultCount.toString(),
                                        style: model.adultCount == 0
                                            ? CustomStyles.normal16.copyWith(color: CustomColors.disabledButton)
                                            : CustomStyles.normal16),
                                    IconButton(
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: CustomColors.Orange,
                                          size: 22,
                                        ),
                                        onPressed: () {
                                          model.addAdult();
                                        }),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 75,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.adultCount, // records.length
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "${getLocalText("person", context)} ${index + 1} ${getLocalText("age", context)}",
                                    style: CustomStyles.whiteTextSytle12Size.copyWith(color: Colors.grey),
                                  ),
                                  Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(SizeConstants.SIZE_4),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: SizeConstants.SIZE_60,
                                        height: SizeConstants.SIZE_40,
                                        child: TextField(
                                          style: CustomStyles.whiteTextSytle16Size.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                          inputFormatters: <TextInputFormatter>[
                                            WhitelistingTextInputFormatter.digitsOnly,
                                            LengthLimitingTextInputFormatter(2),
                                          ],
                                          maxLines: 1,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(border: InputBorder.none,isDense: true),
                                          onChanged: (age) {
                                            model.addAge(age,index);
                                          },
                                        ),
                                      ))
                                ],
                              ),
                            );
                          }),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: RaisedButton(
                          color: CustomColors.Orange,
                          child: Text(
                            getLocalText("search_activities", context),
                            style: CustomStyles.button_style,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          onPressed: () {

                            if(model.validateData(_scaffoldKey)) {
                              Navigator.pushNamed(
                                  context, Routes.activityResults,
                                  arguments: model.getRequestData());
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


  showSourceBottomSheet(BuildContext context, Activity_Model model) {


    return showModalBottomSheet(
        isDismissible:true ,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
          //margin: EdgeInsets.all(15),
            child: SearchLocation(model,context)



        ));



  }


  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }

}
