
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/models/my_bookings/cancel_policy_response.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/viewmodels/my_bookings_viewmodel.dart';
import 'package:provider/provider.dart';

class CancelPolicyView extends StatelessWidget
{
  
  MyBookingsViewModel _viewModel;
  String reservationId;
  CancelPolicyView(List<dynamic> list)
  {
    _viewModel = list[0] as MyBookingsViewModel;
    reservationId =list[1] as String;

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        title: Text(strings.cancel_policy),
        backgroundColor: CustomColors.BackGround,
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 13,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),

      ),
      
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        child: Consumer<MyBookingsViewModel>(

          builder: (context,model,child) {

            return  FutureBuilder(
                future: _viewModel.getCancellationPolicy(reservationId),
              builder: (context,snapshot){
                  if(snapshot.hasData) {


                    var data = snapshot.data as CancelPolicyResponse;
                     if(data.isError)
                      {
                        return AlertDialog(
                          title: new Text("Alert"),
                          content: new Text("Something Went Wrong"),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(data.result[0],style: TextStyle(
                          fontSize: 16,
                          fontFamily: "roboto",

                        ),),
                      ),
                    );
                  }
                  else
                    {

                        return SpinKitChasingDots(
                          size: SizeConstants.SIZE_50,
                          color: CustomColors.BackGround,
                        );




                    }

              },

            );

          }
        ),

      ),

      bottomSheet: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          height: kToolbarHeight,
          color: CustomColors.Orange,
          child: Center(

            child: Text("Done",style: TextStyle(color: Colors.white,fontSize:16 ),),

          ),
        ),
      ),

    );
  }



}