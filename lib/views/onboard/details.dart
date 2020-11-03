import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.BackGround,
      appBar: AppBar(
        backgroundColor: CustomColors.BackGround,
        elevation: 0.0,
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
            // onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          //  height: MediaQuery.of(context).size.height-kBottomNavigationBarHeight,
          margin: EdgeInsets.only(left: 32, right: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 9,
              ),
              Text(
                getLocalText("congrats_abroad", context),
                style: CustomStyles.style1,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                strings.complete_your_profile,
                style: CustomStyles.style2,
              ),
              SizedBox(
                height: 26,
              ),
              TextFormField(
                style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Enter your email Id",
                    hintStyle: CustomStyles.HintStyle,
                    contentPadding: EdgeInsets.only(left: 20, top: 5),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.cancel,
                        size: 18,
                      ),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    fillColor: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                decoration: InputDecoration(
                    hintText: strings.gender,
                    hintStyle: CustomStyles.HintStyle,
                    contentPadding: EdgeInsets.only(left: 20, top: 5),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.expand_more,
                        size: 24,
                      ),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                decoration: InputDecoration(
                    hintText: strings.dateofbirth,
                    hintStyle: CustomStyles.HintStyle,
                    contentPadding: EdgeInsets.only(left: 20, top: 5),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.event_available,
                        size: 24,
                      ),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: CustomStyles.HintStyle.copyWith(color: Colors.black),
                decoration: InputDecoration(
                    hintText: strings.mobile_number,
                    hintStyle: CustomStyles.HintStyle,
                    contentPadding: EdgeInsets.only(left: 20, top: 5),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(
                height: 23,
              ),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: RaisedButton(
                    color: CustomColors.Orange,
                    child: Text(
                      strings.done,
                      style: CustomStyles.button_style,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home');

//
                    }),
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Text(
                    strings.skip,
                    style: CustomStyles.countDownStyle,
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context, Routes.dashboard, (route) => false);
                  },
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
