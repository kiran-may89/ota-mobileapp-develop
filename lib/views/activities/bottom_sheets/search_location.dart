


import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/googleplaces/predictions.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/activities_view_models/activity_search_view_model.dart';
import 'package:provider/provider.dart';



class SearchLocation extends StatefulWidget {

  Activity_Model model;

  BuildContext context;

  SearchLocation(this.model, this.context);

  @override
  _SearchLocationState createState() => _SearchLocationState(this.model,this.context);
}

class _SearchLocationState extends State<SearchLocation> {

  var height;
  var width;

  Activity_Model model;

  BuildContext context;

  _SearchLocationState(this.model, this.context);


  @override
  Widget build( context) {

    height = MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;

    return ChangeNotifierProvider.value(

        value: model,

        child:

        Consumer<Activity_Model>(builder: (context, model, child) {
          return

            Column(

              children: [

                SizedBox(height: 30,),

                //IconButton(icon: Icons., onPressed: null)


                Card(

                  elevation: 3,

                  margin: EdgeInsets.only(top: 0,bottom: 10),

                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(0.0),

                  ),

                  child:

                  Container(

                    height: height*.8,

                    child:Row(children: <Widget>[

                      Container(
                        width: width*1.5,

                        child:

                        IconButton(icon: Icon(Icons.arrow_back_ios,color: CustomColors.BackGround,),
                            onPressed: (){
                          Navigator.pop(context);
                            }
                            )

                      ),

                      Container(
                        width: width*8.5,
                        alignment: Alignment.centerLeft,

                        child: TextFormField(
                          textAlign: TextAlign.start,
                          controller:model.fromTypeHeadController,

                          autofocus: true,
                          onChanged: (text){
                            model.dataChanged(text);
                          },


                          decoration:
                          InputDecoration(hintText: getLocalText("from", context),
                               hintStyle: CustomStyles.medium16,

                            suffixIcon: IconButton(
                              color: Colors.red,
                              onPressed: () {
                                model.fromTypeHeadController.clear();
                              },
                              icon: Icon(
                                Icons.cancel,
                                size: SizeConstants.SIZE_20,
                              ),
                            ),


                            alignLabelWithHint: true,


                            border: InputBorder.none,
                          ),

                              ),
                        ),
                    ],

                    ),

                  ),

                ),

                SizedBox(height: 0,),



                Flexible(
                    child:
                    !model.startSearch?

                    SizedBox.shrink():

                    FutureBuilder<Predictions>(
                        future:  model.getPredcitions(model.fromTypeHeadController.text),  //returns bool
                        builder: (BuildContext context, AsyncSnapshot<Predictions> snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            // YOUR CUSTOM CODE GOES HERE
                            return ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.predictions.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){

                                    model.setFromSelected(snapshot.data.predictions[index]);

                                    model.cancelSearch();
                                    Navigator.pop(context);


                                  },
                                  child:  Container(
                                    alignment: Alignment.centerLeft,
                                    color: Colors.transparent,
                                    padding: EdgeInsets.only(
                                        left: 0, right: 0,top: 4,bottom: 4),
                                    child:
                                    Column(

                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(

                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,


                                          children: [

                                            Container(
                                              alignment: Alignment.center,
                                              width: width*1.5,
                                              //padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                              child: Image.asset(

                                                'assets/images/location.png',
                                                height: 21,color: CustomColors.BackGround.withOpacity(.8),
                                              ),
                                            ),

                                            Container(
                                              alignment: Alignment.centerLeft,
                                              width: width*8.5,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                              Text(
                                                snapshot.data.predictions[index].description,
                                            style: CustomStyles.countDownStyle.copyWith(color: Colors.black87, fontWeight: FontWeight.bold),
                                          ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),


                                        Container(

                                          height: 1,
                                          width: MediaQuery.of(context).size.width,
                                          color: CustomColors
                                              .disabledButton.withOpacity(.5),
                                        )

                                      ],
                                    ),
                                  ),
                                );
                              },

                            );
                          } else {
                            return  Center(
                              child: SpinKitChasingDots(
                                size: SizeConstants.SIZE_50,
                                color: CustomColors.BackGround,
                              ),
                            );
                          }
                        }
                    )
                )


              ],





            );



        }

        )

    );
  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
