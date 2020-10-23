import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';

import 'colors.dart';

class Dialogs {
  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,

        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              key: key, children: <Widget>[
                Center(
                  child: Container(
                    color: Colors.transparent,
                    child:

                    SpinKitChasingDots(
                      size: SizeConstants.SIZE_50,
                      color: CustomColors.White,
                    )

                  ),
                )
              ]));
        });
  }

  static void showErrorPopup(BuildContext context, {String messaage = "Something Went Wrong"}) {
    showDialog(
        context: context,
        barrierColor: Colors.black12,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: new Text("Alert"),
              content: new Text(messaage),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }


  static void showGenericErrorPopup(BuildContext context, String messege) {
    showDialog(
        context: context,
        barrierColor: Colors.black12,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          title: new Text("Alert"),
          content: new Text(messege),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }

  static void showSpinkitLoading(BuildContext context) {
    showDialog(
        context: context,

        barrierColor: Colors.black12,
        barrierDismissible: true,
        child: Container(
          width: SizeConstants.SIZE_50,
          height: SizeConstants.SIZE_50,
          color: Colors.transparent,
          child: SpinKitChasingDots(
            size: SizeConstants.SIZE_50,
            color: CustomColors.BackGround,
          ),
        ));
  }
}
