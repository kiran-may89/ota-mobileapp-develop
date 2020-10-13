import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/app/Router.dart';
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
  var height;

  var width;
  String version;

  String buildNumber;

  ProfileViewModel profileViewModel = ProfileViewModel();



  final GlobalKey<State> _keyLoader =
  new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    height =
        MediaQuery.of(context).size.height / 10;

    width =
        MediaQuery.of(context).size.width / 10;




    return ChangeNotifierProvider<
        ProfileViewModel>(
      create: (context) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, model, child) {
          return Scaffold(
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
                'Profile Management',
                style: CustomStyles.appbar,
              ),
              elevation: 0.0,
            ),
            body: model.loading
                ? ShimmerContainer(
                    MediaQuery.of(context)
                        .size
                        .height)
                : Container(
                    width: width * 10,
                    height: height * 10,
                    padding: EdgeInsets.symmetric(
                        horizontal: width * .5,
                        vertical: height * .4),
                    child: SingleChildScrollView( 
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
                                            Navigator.pushNamed(
                                                context,
                                                Routes
                                                    .profile);
                                          },
                                          title: Text(
                                            'Profile',
                                            style: CustomStyles
                                                .normal16
                                                .copyWith(
                                                    color:
                                                        CustomColors.BackGround),
                                          ),

                                          leading: Icon(
                                            Icons
                                                .person,
                                            color: CustomColors
                                                .BackGround,
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
                                          'Family List',
                                          style: CustomStyles
                                          .normal16
                                          .copyWith(
                                          color: CustomColors.BackGround)),
                                          leading: Icon(
                                          Icons.group,
                                          color: CustomColors
                                          .BackGround,
                                          ),
                                          ),
                                        ListTile(
                                          title: Text(
                                            'Change Password',
                                            style: CustomStyles
                                                .normal16
                                                .copyWith(
                                                    color:
                                                        CustomColors.BackGround),
                                          ),
                                          leading: Icon(
                                            Icons
                                                .lock_open,
                                            color: CustomColors
                                                .BackGround,
                                          ),
                                        ),

                                          ListTile(
                                          title: Text('View Bookings',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                                          leading: Icon(Icons.search_rounded,color: CustomColors.BackGround.withOpacity(.9),),
                                         // subtitle: Text("Search the bookings",style: CustomStyles.calenderStyle,),
                                          ),

                                          ListTile(
                                          title: Text('My Wallet',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                                          leading: Icon(Icons.wallet_giftcard_outlined,color: CustomColors.BackGround.withOpacity(.9),),
                                          ),

                                          ListTile(
                                          title: Text('Settings',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                                          leading: Icon(Icons.settings_applications_outlined,color: CustomColors.BackGround.withOpacity(.9),),
                                          ),
                                          ListTile(
                                          title: Text('Notifications',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                                          leading: Icon(Icons.notifications_none,color: CustomColors.BackGround.withOpacity(.9),),
                                          ),

                                          ListTile(
                                          title: Text('Rate Us',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                                          leading: Icon(Icons.rate_review_outlined,color: CustomColors.BackGround.withOpacity(.9),),
                                          ),

                                          ListTile(
                                          title: Text('About Us',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                                          leading: Icon(Icons.info_outline,color: CustomColors.BackGround.withOpacity(.9),),
                                          ),
                                          ListTile(
                                          title: Text('Help & Support',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                                          leading: Icon(Icons.help_outline,color: CustomColors.BackGround.withOpacity(.9),),
                                          ),


                                        ListTile(
                                          onTap: () {
                                            showLogoutDialog();
                                          },
                                          title: Text(
                                            'Logout',
                                            style: CustomStyles
                                                .normal16
                                                .copyWith(
                                                    color:
                                                        CustomColors.BackGround),
                                          ),
                                          leading: Icon(
                                            Icons
                                                .power_settings_new,
                                            color: CustomColors
                                                .BackGround,
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
          height: 130.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 8,top: 8),
                child: Text(
                  "Logout!",
                  style: CustomStyles.medium16,
                  textAlign: TextAlign.start,
                ),
              ),
          SizedBox(height: 10,),

          Padding(
          padding:
          const EdgeInsets.only(left: 8,),
          child: Text("Do you want to really logout ?",style: CustomStyles.medium16,textAlign: TextAlign.start,)),

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




}
