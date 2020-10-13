

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/models/flights/airport_look_up_response.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/flightbookingModel.dart';
import 'package:provider/provider.dart';




class FlightSearch extends StatefulWidget {
  FlightSearch_Model model;

  BuildContext context;

  int flightType;

  FlightSearch(this.model, this.context, this.flightType);

  @override
  _FlightSearchState createState() => _FlightSearchState(model,context,flightType);
}

class _FlightSearchState extends State<FlightSearch> {

  FlightSearch_Model model;

  BuildContext context;

  int flightType;

  _FlightSearchState(this.model, this.context, this.flightType);


  var height;
  var width;

  @override
  Widget build(BuildContext context) {


    height = MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;

    return ChangeNotifierProvider.value(

        value: model,

        child:

        Consumer<FlightSearch_Model>(builder: (context, model, child) {
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
                  controller:flightType==0 ?model.startFromController:model.destinationController,

                  autofocus: true,
                  onChanged: (text){
                    model.dataChanged(text);
                  },


                  decoration:
                  InputDecoration(

                  hintText: flightType==0?"From" : "Destination" ,
                   hintStyle: CustomStyles.medium16,

                    suffixIcon: IconButton(
                      color: Colors.red,
                      onPressed: () {
                        flightType==0 ?model.startFromController.clear():model.destinationController.clear();
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
              )

            ],

            ),

          ),

        ),

        SizedBox(height: 0,),



        Flexible(
            child:
            !model.startSearch?

            SizedBox.shrink():

            FutureBuilder<AirportLookupResponse>(
                future:  model.getAirports(flightType==0?model.startFromController.text:model.destinationController.text),  //returns bool
                builder: (BuildContext context, AsyncSnapshot<AirportLookupResponse> snapshot) {

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

                              if(flightType==0) {
                                model.setFromAirport(snapshot.data.result[index]);

                              }else{
                                model.setDestinationAirport(snapshot.data.result[index]);


                              }

                              model.cancelSearch();
                              Navigator.pop(context);


                            },
                            child:  Container(
                              alignment: Alignment.centerLeft,
                              color: Colors.transparent,
                              margin: EdgeInsets.only(
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
                                        width: width*1.5,
                                        //padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                        child: Image.asset(

                                          'assets/images/location.png',
                                          height: 21,color: CustomColors.BackGround.withOpacity(.8),
                                        ),
                                      ),

                                      Container(
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
                                              snapshot.data.result[index].airportCode +
                                              " - " +
                                              snapshot.data.result[index].city,
                                              style:
                                              CustomStyles.bold16,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              snapshot.data.result[index].airportName,
                                              style:
                                              CustomStyles.normal14.copyWith(color: CustomColors.heading.withOpacity(.7)),
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
        )










      ],





    );



  }

  )

  );
  }
}
