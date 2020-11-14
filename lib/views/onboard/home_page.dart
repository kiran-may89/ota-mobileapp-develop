
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/prefs/session_manager.dart';

import 'package:ota/utils/colors.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/hotels_view_model/home_page_view_model.dart';
import 'package:ota/views/base/base_view.dart';

import '../base/base_widget.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomePageViewModel>(
        viewModel: HomePageViewModel(),
        onModelReady: (model) => model.initialise(),
        builder: (context) => _MyHomePageState());
  }
}

class _MyHomePageState extends BaseModelWidget<HomePageViewModel> {
  @override
  Widget build(BuildContext context, HomePageViewModel model) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: CustomColors.BackGround,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            pageSnapping: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: GestureDetector(
                onTap: () {
                  navigate(index, context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${getLocalText("hello",context)} Guest,",
                          textAlign: TextAlign.start,
                          style: CustomStyles.style1),
                      SizedBox(height: 25),
                      Text("${getLocalText("what_are_you_looking_for",context)},",
                          textAlign: TextAlign.start,
                          style: CustomStyles.style2),
                      SizedBox(height: 75),
                      Container(
                        alignment: Alignment.center,
                        child:
                            Image.asset(model.sliders[index].image, height: 190
                                //width: 130,
                                ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(getLocalText(model.sliders[index].title, context),
                              style: CustomStyles.button_style
                                  .copyWith(fontSize: 16))),
                      SizedBox(height: 75),
                    ],
                  ),
                ),
              ));
            },
            controller: model.pageController,
            itemCount: model.sliders.length,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: 24, left: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < model.sliders.length; i++)
                    if (i == model.currentPage) ...[circleBar(true)] else
                      circleBar(false),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              color: CustomColors.BackGround,
              child: Text(getLocalText("skip", context), style: CustomStyles.button_style),
              onPressed: () {
                if (SessionManager.getInstance().isGuest) {
                  Navigator.pushReplacementNamed(context, Routes.signIn);
                } else {

                  Navigator.pushReplacementNamed(context, Routes.dashboard);
                }
              },
            ),
          )
        ],
      ),
    );
  }


  void navigate(
  int index,BuildContext context,
  ) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, Routes.hotelBooking);
        break;
      case 1:
        Navigator.pushNamed(context, Routes.flightBooking);
        break;
      case 2:
        Navigator.pushNamed(context, Routes.activityBooking);
        break;
      case 3:
        Navigator.pushNamed(context, Routes.transferBooking);
        break;
      case 4:
        Navigator.pushNamed(context, Routes.packages);
        break;
      case 5:
       // Navigator.pushNamed(context, Routes.activityBooking);
        break;
    }
  }


  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 10,
      width: isActive ? 12 : 10,
      decoration: BoxDecoration(
          color: isActive ? CustomColors.Orange : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  getLocalText(String key, BuildContext context) {

  return  AppLocalizations.of(context).translate(key);
  }
}
