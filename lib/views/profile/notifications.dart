import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/models/profile/responses/web_notification_response.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/profile/web_notifications_model.dart';
import 'package:provider/provider.dart';

class WebNotifications extends StatefulWidget {
  @override
  _WebNotificationsState createState() => _WebNotificationsState();
}

class _WebNotificationsState extends State<WebNotifications> {

var height;
var width;

  @override
  Widget build(BuildContext context) {

  height = MediaQuery.of(context).size.height / 10;

  width = MediaQuery.of(context).size.width / 10;

  return ChangeNotifierProvider<
  WebNotificationModel>(
  create: (context) => WebNotificationModel(),
  child: Consumer<WebNotificationModel>(
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
  body:

       FutureBuilder<WebNotificationResponse>(
    future:  model.getWebNotifications(),  //returns bool
    builder: (BuildContext context, AsyncSnapshot<WebNotificationResponse> snapshot) {

    if (snapshot.connectionState == ConnectionState.done) {
    // YOUR CUSTOM CODE GOES HERE
    return ListView.builder(
    primary: false,
    shrinkWrap: true,
    physics: BouncingScrollPhysics(),
    itemCount: snapshot.data.result.length,
    itemBuilder: (context, index) {
    return InkWell(
    onTap: (){


    },
    child:  Container(
    alignment: Alignment.centerLeft,
    color: Colors.transparent,
    margin: EdgeInsets.only(
    left: 0, right: 0,top: 4,bottom: 4),
    child:
    Text(snapshot.data.result[index].message)
    ),
    );
    },

    );
    }
    else {
    return  Center(
    child: SpinKitChasingDots(
    size: SizeConstants.SIZE_50,
    color: CustomColors.BackGround,
    ),
    );
    }
    }
    )

  );
  },
),
);
  }
}
