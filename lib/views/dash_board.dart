import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/customviews/app_drawer.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/dash_board_view_model.dart';

import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {


  var screenHeight;
  var screenWidth;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  DashBoardViewModel _model;
  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width/10;
    screenHeight = MediaQuery.of(context).size.height/10;

    return ChangeNotifierProvider<DashBoardViewModel>(
      create: (context) {
        _model = DashBoardViewModel();
        return _model;
      },
      child: Consumer<DashBoardViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            key: scaffoldKey,
            drawer: AppDrawer(),
            bottomNavigationBar: BottomAppBar(
              color: CustomColors.BackGround,
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {


                     //   Navigator.pushNamed(context, Routes.dashboard);



                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.collections_bookmark, color: Colors.white54),
                    onPressed: () {

                        Navigator.pushNamed(context, Routes.myBookings);

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white54),
                    onPressed: () {

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person, color: Colors.white54),
                    onPressed: () {


                      if(SessionManager.getInstance().isGuest){

                        scaffoldKey.currentState.openDrawer();

                      }else{

                        Navigator.pushNamed(context, Routes.profile_management);

                      }
                    },
                  ),
                ],
              ),
            ),
            body:model.loading?
            ShimmerContainer(MediaQuery.of(context).size.height):
                  Container(
                  height: screenHeight*10,
                  width: screenWidth*10,
                  decoration: BoxDecoration(
                    color: Colors.white

                  ),
                  child:
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                         // padding: EdgeInsets.only(bottom: screenHeight*.3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),

                          ),
                          height: screenHeight*5,
                          width: screenWidth*10,
                          child:
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              Container(

                                height: screenHeight*4.2,
                                width: screenWidth*10,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[300],
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
                                ),
                              ),
                              Container(
                                height: screenHeight*4.0,
                                width: screenWidth*10,
                                child:
                                Column(children: [
                                  Padding(

                                    padding: EdgeInsets.only(top: screenHeight*.6, left: SizeConstants.SIZE_16, right: SizeConstants.SIZE_16),

                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: (){
                                                if(SessionManager.getInstance().isGuest){

                                                  scaffoldKey.currentState.openDrawer();

                                                }else{

                                                  Navigator.pushNamed(context, Routes.profile_management);

                                                }
                                              },
                                            icon: Icon(Icons.menu,color: Colors.white,)),
                                            Image.asset('assets/images/dashboard/tripshop_logo.png',color: Colors.white,height: screenHeight*.6,width: screenWidth*1.8,),
                                            Icon(Icons.location_on,color: Colors.white,)

                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: 20,),
                                            CircleAvatar(
                                            radius: 20,
                                            backgroundImage: AssetImage(
                                            "assets/images/profile_img.png"),
                                            backgroundColor: Colors.transparent
                                            ),
                                            SizedBox(height: 10,),
                                            Text('Welcome',style: CustomStyles.medium12.copyWith(color: Colors.white),),
                                            SizedBox(height: 2,),
                                            Text("Mr."+SessionManager.getInstance().getUser.firstName+" "+SessionManager.getInstance().getUser.lastName,style: CustomStyles.bold16.copyWith(color: Colors.white),)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 30,),


//                                  Container(
//                                    width: screenWidth*10,
//                                    height: screenHeight*.6,
//
//                                    margin: EdgeInsets.only(left: screenWidth*1.2),
//                                    decoration: BoxDecoration(
//                                      color: Colors.white.withOpacity(.7),
//                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
//                                    ),
//
//                                    child: Row(
//                                      children: [
//                                        Container(
//                                          width: screenWidth*7,
//                                          child: TextFormField(
//                                            textAlign: TextAlign.start,
//                                          cursorColor: Colors.black,
//                                          decoration: new InputDecoration(
//                                          alignLabelWithHint:
//                                          true,
//                                          isDense: true,
//                                          border: InputBorder.none,
//                                          focusedBorder: InputBorder.none,
//                                          enabledBorder: InputBorder.none,
//                                          errorBorder: InputBorder.none,
//                                          disabledBorder: InputBorder.none,
//                                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
//
//                                          hintText: "Search Hotels, Flights etc....",
//                                          hintStyle: CustomStyles.medium14.copyWith(color: Colors.black54))
//
//                                          ),
//                                        ),
//                                        Container(width: 1,color: Colors.black38,),
//
//                                        Flexible(
//                                          fit: FlexFit.tight,
//                                          child: InkWell(
//                                            child: Center(child: Icon(Icons.search,color: CustomColors.BackGround,)),
//                                          ),
//                                        )
//                                      ],
//                                    ),
//
//
//                                  )


                                ],),


                                decoration: BoxDecoration(

                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
                                 image: DecorationImage(
                                // colorFilter: new ColorFilter.mode(Colors.black54.withOpacity(0.4), BlendMode.darken),
                                 image: AssetImage("assets/images/dashboard/cover.jpg"),  fit: BoxFit.cover)
                                ),



                              ),
                              Positioned(
                                left: screenWidth*.2,
                                top:screenHeight*3.4 ,
                                child: Container(
                                  height: screenHeight*1.4,
                                  width: screenWidth*10,
                                  child: ListView.builder(

                                    physics: BouncingScrollPhysics(),
                                    itemCount: model.dashBoardItems.length,
                                    itemExtent: 100,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      DashBoardItem item = model.dashBoardItems[index];
                                      return GestureDetector(
                                        child: DashBoardMenu(item, (index + 1)),
                                        onTap: () {
                                          if (item.navigation != null) {
                                            Navigator.pushNamed(context, item.navigation);
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),
                              )


                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConstants.SIZE_12,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: SizeConstants.SIZE_12),
                          child: Text(
                            strings.popularPackages,
                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: SizeConstants.SIZE_120,
                          margin: EdgeInsets.only(top: SizeConstants.SIZE_20, bottom: SizeConstants.SIZE_20),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: model.groupByCategoryResults.result.first.packages.length,
                            itemExtent: SizeConstants.SIZE_200,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return  Container(
                              clipBehavior: Clip.antiAlias,
                              width: SizeConstants.SIZE_200,
                              height: SizeConstants.SIZE_120,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              child: Stack(
                                fit: StackFit.loose,

                                children: [
                                  Image.asset(
                                    'assets/images/dash_board_pic2.png',
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                      decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.rectangle),
                                      height: SizeConstants.SIZE_40,
                                      padding: EdgeInsets.all(SizeConstants.SIZE_4),
                                      margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_4),
                                      width:  SizeConstants.SIZE_190,
                                      alignment: Alignment.centerLeft,
                                      child:
                                      Text(
                                        model.groupByCategoryResults.result.first.packages[index].name,
                                        style: CustomStyles.medium14.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                            },
                          ),
                        ),
                        SizedBox(
                          height: SizeConstants.SIZE_8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: SizeConstants.SIZE_12),
                          child: Text(
                            "Popular Destinations",
                            style: CustomStyles.medium14.copyWith(color: CustomColors.BackGround),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: SizeConstants.SIZE_120,
                          margin: EdgeInsets.only(top: SizeConstants.SIZE_20, bottom: SizeConstants.SIZE_20),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: model.groupTopDestinationsResults.result.first.packages.length,
                            itemExtent: SizeConstants.SIZE_200,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                width: SizeConstants.SIZE_200,
                                height: SizeConstants.SIZE_120,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                                child: Stack(
                                  fit: StackFit.loose,

                                  children: [
                                    Image.asset(
                                      'assets/images/dash_board_pic2.png',
                                      fit: BoxFit.contain,
                                    ),
                                  Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Container(
                                  decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.rectangle),
                                  height: SizeConstants.SIZE_40,
                                  padding: EdgeInsets.all(SizeConstants.SIZE_4),
                                    margin: EdgeInsets.symmetric(horizontal: SizeConstants.SIZE_4),
                                  width:  SizeConstants.SIZE_190,
                                  alignment: Alignment.centerLeft,
                                  child:
                                  Text(
                                    model.groupTopDestinationsResults.result.first.packages[index].name,
                                    style: CustomStyles.medium14.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                  ),
                                  ),
                                  ],
                                ));
                            },
                          ),
                        ),
//                        Padding(
//                        Padding(
//                          padding: EdgeInsets.only(left: SizeConstants.SIZE_12),
//                          child: Text(
//                            strings.mybookings,
//                            style: CustomStyles.medium16.copyWith(color: Colors.white),
//                          ),
//                        ),
                        SizedBox(
                          height: SizeConstants.SIZE_10,
                        ),
//                        Column(
//                          children: List.generate(
//                              5,
//                              (index) => Container(
//                                    margin: EdgeInsets.symmetric(vertical: SizeConstants.SIZE_4, horizontal: SizeConstants.SIZE_12),
//                                    width: MediaQuery.of(context).size.width,
//                                    height: 120,
//                                    child: DashBoardBooking(),
//                                  )),
//                        )
                      ],
                    ),
                  ),
                )


          );
        },
      ),
    );
  }
}

class DashBoardBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("24 - Jun", style: CustomStyles.normal14.copyWith(color: Colors.grey)),
                SizedBox(
                  height: SizeConstants.SIZE_16,
                ),
                Text(
                  "DownTown",
                  style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                ),
                Text(
                  "Dubai",
                  style: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: ClipOval(
              child: Container(
                color: CustomColors.BackGround,
                width: SizeConstants.SIZE_50,
                height: SizeConstants.SIZE_50,
                padding: EdgeInsets.all(
                  SizeConstants.SIZE_8,
                ),
                child: Image.asset(
                  "assets/images/dashboard/icon_flight.png",
                  color: CustomColors.White,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "SR 2050.99",
                  style: CustomStyles.medium20.copyWith(color: CustomColors.Orange),
                ),
                SizedBox(
                  height: SizeConstants.SIZE_16,
                ),
                Text(
                  "Hyderabad",
                  style: CustomStyles.medium16.copyWith(color: CustomColors.BackGround),
                ),
                Text(
                  "India",
                  style: CustomStyles.whiteTextSytle14Size.copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashBoardMenu extends StatelessWidget {
  DashBoardItem item;
  int index;
  DashBoardMenu(this.item, this.index);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedOpacity(
        opacity: 1,
        duration: Duration(microseconds: 600 * index),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    child: Image.asset(
                      item.assets,
                      fit: BoxFit.contain,
                      color:  CustomColors.BackGround,
                    ),
                  ),
                  Text(
                    item.name,
                    style: CustomStyles.medium12.copyWith(color:CustomColors.BackGround),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConstants.SIZE_12),
                  color:  Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 1.0, spreadRadius: 2, color: Colors.black54, offset: Offset(6, 6))]),
            ),
            SizedBox(
              width: SizeConstants.SIZE_8,
            )
          ],
        ));
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint rectPaint = Paint();
    rectPaint.style = PaintingStyle.fill;
    rectPaint.color = Colors.white54;
    Paint backPaint = Paint();
    backPaint.style = PaintingStyle.fill;
    backPaint.color = Colors.white;

    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        0,
        0,
        size.width,
        size.height - 35,
        bottomLeft: Radius.circular(SizeConstants.SIZE_60),
        topLeft: Radius.circular(SizeConstants.SIZE_10),
        bottomRight: Radius.circular(SizeConstants.SIZE_10),
        topRight: Radius.circular(SizeConstants.SIZE_10),
      ),
      rectPaint,
    );
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        0,
        0,
        size.width,
        size.height - 45,
        bottomLeft: Radius.circular(SizeConstants.SIZE_80),
        topLeft: Radius.circular(SizeConstants.SIZE_10),
        bottomRight: Radius.circular(SizeConstants.SIZE_10),
        topRight: Radius.circular(SizeConstants.SIZE_10),
      ),
      backPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
