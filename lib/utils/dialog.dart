import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/app/app_localizations.dart';
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
              onWillPop: () async => true,
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


  static void showGenericErrorPopup(BuildContext _context, String messege,bool isFromCreditCard,String asset) {
    showDialog(
        context: _context,

        barrierDismissible: true,
        builder:(context) {
          return Scaffold(
            body: WillPopScope(
              onWillPop: () async => false,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width:MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 40),
                      child: Image.asset(
                        asset,
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text(messege,
                          textAlign: TextAlign.center,
                          style: CustomStyles.medium20.copyWith(
                              color: CustomColors.disabledButton)),
                    ),

                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){

                        if(isFromCreditCard==false) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }
                        else
                          {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);

                          }
                      },
                      child: Container(
                        height: kToolbarHeight-20,
                        width: kToolbarHeight,

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(5),
                          color: CustomColors.BackGround,

                        ),

                        child: Center(child: Text("OK",style:  CustomStyles.medium18.copyWith(
                            color: Colors.white)),),

                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
          );

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

  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }


}
