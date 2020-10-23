

import 'package:flutter/material.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/profile/change_password_viewmodel.dart';
import 'package:provider/provider.dart';



class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

var height;

var width;

var _formstate = GlobalKey<FormState>();

final GlobalKey<State> _keyLoader = new GlobalKey<State>();

final GlobalKey<ScaffoldState> globalKey = new GlobalKey<ScaffoldState>();

FocusNode presentPassword = FocusNode();
FocusNode newPassword = FocusNode();
FocusNode confirmPassword = FocusNode();


@override
  Widget build(BuildContext context) {
height =
MediaQuery.of(context).size.height / 10;

width =
MediaQuery.of(context).size.width / 10;


return ChangeNotifierProvider<
ChangePasswordViewModel>(
create: (context) =>
ChangePasswordViewModel(),
child: Consumer<ChangePasswordViewModel>(
builder: (context, model, child) {

    return Scaffold(
    key: globalKey,
    backgroundColor: CustomColors.White,
    appBar: AppBar(
    title: Text(
    'Change Password',
    style: CustomStyles.appbar,
    ),
    leading: new IconButton(
    icon: new Icon(
    Icons.arrow_back_ios,
    color: Colors.white,
    size: 13,
    ),
    onPressed: () =>
    Navigator.of(context).pop(),
    ),

    elevation: 0.0,
    backgroundColor:
    CustomColors.BackGround,
    ),
    body: Container(
        margin: EdgeInsets.all(15),
      child: SingleChildScrollView(
      child:

      Form(
      key: _formstate,
      child: Column(
      children: [
      TextFormField(
      validator: (value) {
      return value.isEmpty
      ? "Enter Present Password"
      : null;
      },
      onFieldSubmitted: (v){
      FocusScope.of(context).requestFocus(newPassword);
      },
      controller: model.presentPassword,
      style: CustomStyles
      .medium16
      .copyWith(
      color: CustomColors
      .BackGround),
      decoration: InputDecoration(
      labelStyle: CustomStyles
      .medium16
      .copyWith(
      color: CustomColors.disabledButton),
      labelText:
      "Present Password",
      alignLabelWithHint:
      true,

      ),
      ),


      TextFormField(
      focusNode: newPassword,
      controller: model.newPassword,
      validator: (value) {
      return value.isEmpty
      ? "Enter New Password"
      : null;
      },
      onFieldSubmitted: (v){
      FocusScope.of(context).requestFocus(confirmPassword);
      },
      style: CustomStyles
      .medium16
      .copyWith(
      color: CustomColors
      .BackGround),
      decoration: InputDecoration(
      labelStyle: CustomStyles
      .medium16
      .copyWith(
      color: CustomColors.disabledButton),
      labelText:
      "New Password",
      alignLabelWithHint:
      true,


      ),
      ),


      TextFormField(
      textInputAction: TextInputAction.done,
      focusNode: confirmPassword,
      controller: model.confirmPassword,
      validator: (value) {
      return value.isEmpty
      ? "Confirm Password" : null;

      },
      style: CustomStyles
      .medium16
      .copyWith(
      color: CustomColors
      .BackGround),
      decoration: InputDecoration(
      labelStyle: CustomStyles
      .medium16
      .copyWith(
      color: CustomColors.disabledButton),
      labelText:
      "Enter Confirm Password",
      alignLabelWithHint:
      true,


      ),
      ),

          SizedBox(height: 45,),


      SizedBox(
      height: 48,

      width: MediaQuery.of(context).size.width*7,
      child: RaisedButton(

      color: CustomColors.Orange,
      child: Text("Change Password",
      style: CustomStyles.button_style
      ,),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),),
      onPressed: (){


      if(_formstate.currentState.validate()) {
      _formstate.currentState.save();
      Dialogs
      .showLoadingDialog(
      context, _keyLoader);

      model
      .changePassword()
      .then((value) {
      Navigator.of(
      _keyLoader
      .currentContext, rootNavigator: true)
      .pop();
      if (value
      .isError) {
      SnackBar snackBar = SnackBar(content: Text("Failed to Change Password", style: CustomStyles
      .medium16
      .copyWith(color: CustomColors
      .White)),
      backgroundColor: CustomColors
      .BackGround,
      );

      globalKey
      .currentState
      .showSnackBar(snackBar);
      } else {
      Navigator
      .pop(context, 'done');
      }
      });
      }
      })


      ,
      ),







      ]
      )),
      ),
    ),





    );

},
),
);

  }
}
