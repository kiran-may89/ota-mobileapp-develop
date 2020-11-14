import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/net/service/common/common_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/profile/profile_view_model.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

class ProfileManagement extends StatefulWidget {
  @override
  _ProfileManagementState createState() =>
      _ProfileManagementState();
}

class _ProfileManagementState
    extends State<ProfileManagement> {
  var screenHeight;

  var screenWidth;
  String version;

  String buildNumber;

  ProfileViewModel profileViewModel = ProfileViewModel();



  final GlobalKey<State> _keyLoader =
  new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    screenHeight =
        MediaQuery.of(context).size.height / 10;

    screenWidth =
        MediaQuery.of(context).size.width / 10;




    return ChangeNotifierProvider<
        ProfileViewModel>(
      create: (context) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor:
                  CustomColors.BackGround,
              leading: new IconButton(
                icon: new Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 13,
                ),
                onPressed: () =>
                    Navigator.of(context).pop(),
              ),
              title: Text(
                getLocalText('profile_management', context),
                style: CustomStyles.appbar,
              ),
              elevation: 0.0,
            ),
            body: model.loading
                ? ShimmerContainer(
                    MediaQuery.of(context)
                        .size
                        .height)
                : model.profileResponse.result!=null?
            Container(
                    width: screenWidth * 10,
                    height: screenHeight * 10,

                    child: SingleChildScrollView( 
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * .5,
                        vertical: screenHeight * .4),
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                  "assets/images/profile_img.png"),
                              backgroundColor:
                                  Colors.transparent,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              model
                                      .profileResponse
                                      .result
                                      .firstName +
                                  " " +
                                  model
                                      .profileResponse
                                      .result
                                      .lastName,
                              style: CustomStyles
                                  .medium16,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              model.profileResponse
                                  .result.email,
                              style: CustomStyles
                                  .medium16,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              model
                                      .profileResponse
                                      .result
                                      .phoneNumber ??
                                  "",
                              style: CustomStyles
                                  .medium16,
                            ),
                            SizedBox(
                              height: 15,
                            ),

                              Column(
                                children: [
                                  ListView(
                                  primary: false,
                                    shrinkWrap: true,
                                    children: ListTile
                                        .divideTiles(
                                            //          <-- ListTile.divideTiles
                                            context:
                                                context,
                                            tiles: [
                                          ListTile(
                                            onTap: () {
                                            Map<String,
                                            dynamic> args = new Map();
                                            args['model'] = model;

                                            args['context'] =
                                           context;


                                              Navigator.pushNamed(
                                                  context,
                                                  Routes
                                                      .profile,arguments:args);
                                            },
                                            title: Text(
                                              getLocalText('profile', context),
                                              style: CustomStyles
                                                  .normal16
                                                  .copyWith(
                                                      color:
                                                      CustomColors.BackGround.withOpacity(.9)),
                                            ),

                                            leading: Icon(
                                              Icons
                                                  .person,
                                              color: CustomColors
                                                  .BackGround.withOpacity(.9),
                                            ),
                                          ),

                                            ListTile(
                                            onTap: () {
                                            Navigator.pushNamed(
                                            context,
                                            Routes
                                            .family_members);
                                            },

                                            title: Text(
                                            getLocalText("family_list", context),
                                            style: CustomStyles
                                            .normal16
                                            .copyWith(
                                            color: CustomColors.BackGround.withOpacity(.9))),
                                            leading: Icon(
                                            Icons.group,
                                            color: CustomColors
                                            .BackGround.withOpacity(.9),
                                            ),
                                            ),
                                          Visibility(
                                            visible: !model.isExternalLogin,
                                            child: ListTile(
                                              onTap: (){
                                                Navigator.pushNamed(context, Routes.changePassword);
                                              },
                                              title: Text(
                                                getLocalText("change_password", context),
                                                style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),
                                              ),
                                              leading: Icon(
                                                Icons.lock_open,color: CustomColors.BackGround.withOpacity(.9),
                                              ),
                                            ),
                                          ),

                                            ListTile(
                                            onTap: (){
                                            Navigator.pushNamed(context, Routes.myBookings);
                                            },
                                            title: Text(
                                           getLocalText("view_bookings", context)
                                            ,style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                                            leading: Icon(Icons.search_rounded,color: CustomColors.BackGround.withOpacity(.9),),
                                           // subtitle: Text("Search the bookings",style: CustomStyles.calenderStyle,),
                                            ),

                                            ListTile(
                                            title: Text(
                                           getLocalText("my_wallet", context)
                                            ,style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                                            leading: Icon(Icons.wallet_giftcard_outlined,color: CustomColors.BackGround.withOpacity(.9),),
                                            ),

//                                          ListTile(
//                                            onTap: (){
//
//                                              Navigator.pushNamed(context,Routes.appSettings);
//
//                                            },
//                                          title: Text(
//                                          getLocalText("settings", context),style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
//                                          leading: Icon(Icons.settings_applications_outlined,color: CustomColors.BackGround.withOpacity(.9),),
//                                          ),


//                                          ListTile(
//                                            onTap: (){
//                                              Navigator.pushNamed(
//                                              context,
//                                              Routes
//                                              .notifications);
//                                            },
//                                          title: Text(getLocalText("notifications", context)
//                                          ,style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
//                                          leading: Icon(Icons.notifications_none,color: CustomColors.BackGround.withOpacity(.9),),
//                                          ),

//                                          ListTile(
//                                          title: Text(getLocalText("rate_us", context)
//                                          ,style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
//                                          leading: Icon(Icons.rate_review_outlined,color: CustomColors.BackGround.withOpacity(.9),),
//                                          ),
//
//                                          ListTile(
//                                          title: Text(
//                                          getLocalText("about_us", context)
//                                          ,style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
//                                          leading: Icon(Icons.info_outline,color: CustomColors.BackGround.withOpacity(.9),),
//                                          ),
//                                          ListTile(
//                                          title: Text(getLocalText("help_support", context),style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
//                                          leading: Icon(Icons.help_outline,color: CustomColors.BackGround.withOpacity(.9),),
//                                          ),


                                          ListTile(
                                            onTap: () {
                                              showLogoutDialog();
                                            },
                                            title: Text(
                                              getLocalText("logout", context),
                                              style: CustomStyles
                                                  .normal16
                                                  .copyWith(
                                                      color:
                                                      CustomColors.BackGround.withOpacity(.9)),
                                            ),
                                            leading: Icon(
                                              Icons
                                                  .power_settings_new,
                                              color: CustomColors.BackGround.withOpacity(.9),
                                            ),
                                          ),
                                        ]).toList(),
                                  ),
                                SizedBox(height: 15,),


                                Text("TripShop",style: CustomStyles.bold20.copyWith(color: CustomColors.disabledButton),),
                                SizedBox(height: 5,),
                                Text(model.version_+model.buildNumber_,style: CustomStyles.normal9.copyWith(color: CustomColors.disabledButton),),




                                ],
                              ),

                          ],
                        ),
                      ),
                    ),
                  ):
            Center(
            child: Text("Something went wrong",style: CustomStyles.heading.copyWith(color: CustomColors.Orange),),
            ),
          );
        },
      ),
    );


  }

  void showLogoutDialog() {
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
          padding: EdgeInsets.all(5),
          height: screenHeight*2.5,
          width: screenWidth*8,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

            SizedBox(height: screenHeight*.2,),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8,top: 8),
                child: Text(
                  "Logout!",
                  style: CustomStyles.medium16,
                  textAlign: TextAlign.start,
                ),
              ),
          SizedBox(height: screenHeight*.4,),

          Padding(
          padding:
          const EdgeInsets.only(left: 8,),
          child: Text("Do you want to really logout ?",style: CustomStyles.medium16,textAlign: TextAlign.start,)),
            SizedBox(height: screenHeight*.2,),

              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No',
                      style: CustomStyles.medium14
                          .copyWith(
                              color: CustomColors
                                  .BackGround),
                    ),

                  ),
                  FlatButton(
                    child: Text(
                      'Yes',
                      style: CustomStyles.medium14
                          .copyWith(
                              color: CustomColors
                                  .BackGround),
                    ),

                    onPressed: () {
                      Navigator.pop(context);
                      Dialogs.showLoadingDialog(
                          context, _keyLoader);
                      CommonService commonService = GetIt.instance<CommonService>();

                         commonService.logout().then((value) {
                        Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();

                        if (value!=null) {

                          SessionManager.getInstance().isGuest = true;
                          Navigator.pushNamedAndRemoveUntil(
                          context, Routes.dashboard, (route) => false);
                        }


                      });
                    },
                  ),
                ],
              )
            ],
          )),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            simpleDialog);
  }



  getLocalText(String key, BuildContext context) {

  return  AppLocalizations.of(context).translate(key);
  }


}
