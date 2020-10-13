import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/transfers/data_model/search_transfer_data.dart';
import 'package:ota/models/transfers/search_transfer_response_entity.dart';
import 'package:ota/net/service/transfers/transfer_results_data.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/transfer_view_models/transfer_details_model.dart';
import 'package:provider/provider.dart';

class TransferDetails extends StatefulWidget {

  TransferResultsData transferResultsData;

  TransferDetails(this.transferResultsData);


  @override
  _TransferDetailsState createState() => _TransferDetailsState(transferResultsData);
}

class _TransferDetailsState extends State<TransferDetails> {

  TransferResultsData transferResultsData;


  _TransferDetailsState(this.transferResultsData);

  GoogleMapController mapController;



  var height;

  var width;

  @override
  Widget build(BuildContext context) {

    height =MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;

    return  ChangeNotifierProvider<TransferDetailsModel>(

        create: (context) =>TransferDetailsModel(transferResultsData),
    child:
    Consumer<TransferDetailsModel>(

    builder: (context, model, child) {


      void _onMapCreated(GoogleMapController controller) {
        mapController = controller;
        model.addMarkers();


      }


    return Scaffold(

      appBar: AppBar(title: Text("Transfer Details",style: CustomStyles.button_style.copyWith(fontSize: 20),
      ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white,size: 13,),
          onPressed: () => Navigator.of(context).pop(),
        ),

        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.clear, color: Colors.white,size: 20,),
            //  onPressed: () => Navigator.of(context).pop(),
          ),

        ],

        elevation: 0.0,backgroundColor: CustomColors.BackGround,),

      body: SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.only(left:width*.4,right: width*.4,top: 15),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[


                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(flex: 8,
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(model.requestData.oneWay?'One Way':'Round Trip',style: CustomStyles.heading,),

                              SizedBox(height: 7,),


                              Wrap(children: <Widget>[

                                Text("Source : ",style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading,fontWeight: FontWeight.w700),),


                                Text(model.requestData.pichUpPlace,style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading),),



                              ],),
                              SizedBox(height: 7,),

                              Wrap(children: <Widget>[

                                Text("Destination : ",style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading,fontWeight: FontWeight.w700),),


                                Text(model.requestData.dropPlace,style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading),),





                              ],)

                            ],

                          ),
                        ),
                      ),
                      Expanded(flex: 2,
                        child: SizedBox(
                          height: 24,
                          child: RaisedButton(onPressed: (){
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          } ,color: CustomColors.Orange,
                            child: Text('EDIT',style:CustomStyles.calenderStyle.copyWith(color: CustomColors.White) ,),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),

                          ),
                        ),)
                    ],),

                Container(
                    margin: EdgeInsets.only(top: 20,bottom: 20),
                    child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: true,)),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Location Details',style: CustomStyles.medium14.copyWith(color: CustomColors.heading.withOpacity(.5)),),

                    SizedBox(height: 15,),

                    RichText(
                      text: TextSpan(
                          text: "Distance : ",
                          style:  CustomStyles.calenderStyle.copyWith(color: CustomColors.heading,fontWeight: FontWeight.w700),
                          children: <TextSpan>[


                            TextSpan(text: model.transferResultsData.distance,
                                style:CustomStyles.calenderStyle.copyWith(color: CustomColors.heading)
                            )
                          ]
                      ),
                    ),

                    SizedBox(height: 15,),

                    RichText(
                      text: TextSpan(
                          text: "Time        :  ",
                          style:  CustomStyles.calenderStyle.copyWith(color: CustomColors.heading,fontWeight: FontWeight.w700),
                          children: <TextSpan>[


                            TextSpan(text: model.transferResultsData.time,
                                style: CustomStyles.calenderStyle.copyWith(color: CustomColors.heading)
                            )
                          ]
                      ),
                    ),



                  ],
                ),



              ],),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                  height: 350,
                  child: GoogleMap(
                    markers: model.markers,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(model.requestData.startPoint.lat, model.requestData.startPoint.lng),
                      zoom: 10.5,
                    ),
                  )),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 5,),
                              Text(

                                model.selectedVehicleData.first.displayRateInfoWithMarkup.currency +" "+
                                    model.selectedVehicleData.first.displayRateInfoWithMarkup.totalPriceWithMarkup.toString()


                              ,style: CustomStyles.appbar.copyWith(color: CustomColors.BackGround),),
                              SizedBox(height: 9,),

                              Row(children: <Widget>[

                                Text(model.selectedVehicleData.first.carClass.title+" | ",style: CustomStyles.calenderStyle,),

                                Text(model.selectedVehicleData.first.carClass.capacity.toString()+ ' Seater',style: CustomStyles.calenderStyle,),

                              ],),


                              SizedBox(height: 5,),
                            ],
                          ) ,

                          RaisedButton(child: Text('BOOK NOW',style:CustomStyles.button_style ,),color: CustomColors.Orange,padding: EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ) ,
                            onPressed: (){

                              Navigator.pushNamed(context,
                              Routes.travelInfo,
                                  arguments: model.transferResultsData
                              );

                            },)



                        ],

                      ),
                    ),



                  ),
                  SizedBox(height: 50,),


                ],),










            ],

          ),
        ),
      ),



    );


    },
    ),
    );



  }






}
