import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:package_info/package_info.dart';



class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String version;

  String buildNumber;



  @override
  void initState() {
    // TODO: implement initState
    getVersion();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: ListTile.divideTiles(
                  //          <-- ListTile.divideTiles
                context: context,
                tiles: [
                  ListTile(
                    onTap: (){
                      Navigator.pushNamedAndRemoveUntil(
                      context, Routes.signIn, (route) => false);
                    },
                    title: Text('Login/Sign-Up now',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                    leading: Icon(Icons.person_add_alt_1_outlined,color: CustomColors.BackGround.withOpacity(.9),),
                    subtitle: Text("Login to access full features",style: CustomStyles.calenderStyle,),

                  ),
                  ListTile(
                    title: Text('Search Bookings',style: CustomStyles.normal16.copyWith(color: CustomColors.BackGround.withOpacity(.9)),),
                    leading: Icon(Icons.search_rounded,color: CustomColors.BackGround.withOpacity(.9),),
                    subtitle: Text("Search the bookings",style: CustomStyles.calenderStyle,),
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



                ]).toList(),
              ),



    SizedBox(height: 15,),


    Text("TripShop",style: CustomStyles.bold20.copyWith(color: CustomColors.disabledButton),),
    SizedBox(height: 5,),
    Text(version+buildNumber,style: CustomStyles.normal9.copyWith(color: CustomColors.disabledButton),),






    ],
          ),
        ),
      ),
    );
  }

  Future<void> getVersion() async {

    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {

      version = packageInfo.version.replaceAll('-dev', "+");
      buildNumber = packageInfo.buildNumber;


      print(version);

      print(buildNumber);


      setState(() {

      });
    });



  }



}







