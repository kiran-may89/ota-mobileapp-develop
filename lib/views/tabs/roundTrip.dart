import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/models/flights/airport_look_up_response.dart';

import '../../viewmodels/flights_view_model/flightbookingModel.dart';
import '../base/base_view.dart';
import '../base/base_widget.dart';
import '../calendar.dart';
import 'package:ota/models/flights/one_way_search_response.dart';



class RoundTrip extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseWidget<FlightSearch_Model>(
        viewModel: FlightSearch_Model(),
        onModelReady: (model) => model.initialise(),
        builder: (context) =>_RoundTripState());

  }

}

class _RoundTripState extends BaseModelWidget<FlightSearch_Model> {
  final year = DateTime.now().year;
//  DateTime _firstDate;
//  DateTime _lastDate;
//  DatePeriod _selectedPeriod;



//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//
//    _firstDate = DateTime.now().subtract(Duration(days: 45));
//    _lastDate = DateTime.now().add(Duration(days: 45));
//
//    DateTime selectedPeriodStart = DateTime.now().subtract(Duration(days: 4));
//    DateTime selectedPeriodEnd = DateTime.now().add(Duration(days: 8));
//    _selectedPeriod = DatePeriod(selectedPeriodStart, selectedPeriodEnd);
//  }


  @override
  Widget build(BuildContext context, FlightSearch_Model model) {
    return
      SingleChildScrollView(
      child:
      Container(
        margin: EdgeInsets.only(left: 32,right: 32),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[

            Card(elevation: 3,
              margin: EdgeInsets.only(top: 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child:
              Container(
                height: 71,
                child:Row(children: <Widget>[

                  Expanded(child: Container(
                    child:
                    Image.asset('assets/images/plane.png',height: 21,)
                    ,),flex: 2,),

                  Expanded(child:
                  TypeAheadFormField(
                    hideOnError: true,
                    hideOnEmpty: true,
                   // hideOnLoading: true,
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: model.startFromController,
                      autofocus: false,
                      style: CustomStyles.cardContentStyle,
                      decoration: InputDecoration(

                          alignLabelWithHint: true,
                          labelText: strings.from,

                          labelStyle: CustomStyles.cardHeadingStyle,

                          border: InputBorder.none
                      ),
                    ),
                    suggestionsCallback: (pattern) async {

                      if(pattern.length==3||pattern.length==0)
                      print(pattern);

                      var response = await model.getAirports(pattern);

                      print("RESULT$response");

                      return response.result;
                    },
                    itemBuilder: (context, AirportCodes suggestion) {
                      return Container(
                        margin: EdgeInsets.only(left: 5,right: 5),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 4,),
                          Text(suggestion.airportCode+" - "+suggestion.city,style: CustomStyles.normal14,),
                          SizedBox(height: 4,),
                          Text(suggestion.airportName,style: CustomStyles.normal16,),
                          SizedBox(height: 4,),
                          Container(height: 1,width: double.infinity,color: CustomColors.disabledButton,)


                        ],
                      ),);
                    },
                    onSuggestionSelected: (suggestion) {

                      print("Selected$suggestion");

                      model.setFromAirport(suggestion);
                    },
                  ),


                    flex: 8,)
                ],
                ),


              ),

            ),
            Card(
              elevation: 3,
              margin: EdgeInsets.only(top: 10,bottom: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child:
              Container(
                height: 71,
                child:Row(children: <Widget>[

                  Expanded(child: Container(

                    child:
                    Image.asset('assets/images/location.png',height: 21,)
                    ,),flex: 2,),

                  Expanded(child:
//                  Column(
//                    mainAxisSize: MainAxisSize.min,
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//
//                      Text("Destination",style: CustomStyles.cardHeadingStyle,),
//                      SizedBox(height: 4,),
//
//                      Text("Hyderabad, India",style: CustomStyles.cardContentStyle,)
//                    ],
//                  )

                  TypeAheadFormField(
                    hideOnError: true,
                    hideOnEmpty: true,
                    // hideOnLoading: true,
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: model.destinationController,
                      autofocus: false,
                      style: CustomStyles.cardContentStyle,
                      decoration: InputDecoration(

                          alignLabelWithHint: true,
                          labelText: strings.destination,

                          labelStyle: CustomStyles.cardHeadingStyle,

                          border: InputBorder.none
                      ),
                    ),
                    suggestionsCallback: (pattern) async {

                      if(pattern.length==3||pattern.length==0)
                        print(pattern);

                      var response = await model.getAirports(pattern);

                      print("RESULT$response");

                      return response.result;
                    },
                    itemBuilder: (context, AirportCodes suggestion) {
                      return Container(
                        margin: EdgeInsets.only(left: 5,right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 4,),
                            Text(suggestion.airportCode+" - "+suggestion.city,style: CustomStyles.normal14,),
                            SizedBox(height: 4,),
                            Text(suggestion.airportName,style: CustomStyles.normal16,),
                            SizedBox(height: 4,),
                            Container(height: 1,width: double.infinity,color: CustomColors.disabledButton,)


                          ],
                        ),);
                    },
                    onSuggestionSelected: (suggestion) {
                      print("Selected$suggestion");
                      model.setDestinationAirport(suggestion);
                    },
                  ),




                    flex: 8,)
                ],
                ),


              ),

            ),
            Text('Travel date',style: CustomStyles.heading.copyWith(color:CustomColors.heading.withOpacity(.5) ),),
            Container(
                margin: EdgeInsets.only(top: 20,bottom: 40),
                child: PickDates()),

//            Container(
//              margin: EdgeInsets.only(top: 20,bottom: 40),
//              child: Card(
//                child: Column(
//                  children: <Widget>[
//
//                    Container(
//                      margin: EdgeInsets.only(bottom: 32),
//                      height: 71,
//                      child:Row(children: <Widget>[
//
//                        Expanded(child: Container(
//                          alignment: Alignment.centerLeft
//                          ,
//
//                          child:
//                          Image.asset('assets/images/calender.png',height: 20,)
//                          ,),flex: 1,),
//
//                        Expanded(child:
//                        Container(
//                          margin: EdgeInsets.only(left: 15),
//                          child: Column(
//                            mainAxisSize: MainAxisSize.min,
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//
//                              Text("Date",style: CustomStyles.cardHeadingStyle,),
//                              SizedBox(height: 4,),
//
//                              Text("From 24-Aug, Return 29-Aug",style: CustomStyles.cardContentStyle,)
//                            ],
//                          ),
//                        )
//
//
//                          ,flex: 9,)
//                      ],
//                      ),
//
//
//                    ),
//                    RichText(
//                      text: TextSpan(
//                          text: DateFormat.MMMM().format(DateTime.now()),
//                          style: CustomStyles.heading.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
//                          children: <TextSpan>[
//                            TextSpan(text: year.toString(),
//                                style: CustomStyles.countDownStyle.copyWith(color: CustomColors.disabledButton)
//                            )
//                          ]
//                      ),
//                    ),
//                    SizedBox(height: 18,),
////                    RangePicker(datePickerLayoutSettings: DatePickerLayoutSettings(),
////                      selectedPeriod: _selectedPeriod,
////                      onChanged: (period) {
//////                        setState(() {
//////                          _selectedPeriod = period;
//////                        });
////                      },
////                      firstDate: _firstDate,
////                      lastDate: _lastDate,
////                    ),
//                  ],
//                ),
//              ),
//            ),


            Text('Add number of travellers',style: CustomStyles.heading.copyWith(color:CustomColors.heading.withOpacity(.5) ),),

            Card(elevation: 3,
              margin: EdgeInsets.only(top: 22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child:
              Container(

                height: 45,
                margin: EdgeInsets.only(left: 17,right: 18),
                child:Row(children: <Widget>[

                  Expanded(
                    flex: 5,

                    child:

                    Text('Adult',
                        style: model.adultCount==0?
                        CustomStyles.normal16.copyWith(color: CustomColors.disabledButton)
                            :
                        CustomStyles.normal16
                    ),

                  ),

                  Expanded(
                      flex: 5,
                      child:
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 15,),

                          IconButton(icon: Icon(Icons.do_not_disturb_on,color: CustomColors.Orange,size: 22,),
                              onPressed: (){
                            model.removeAdult();

                          }),
                          Text(model.adultCount.toString(),
                              style: model.adultCount==0?
                              CustomStyles.normal16.copyWith(color: CustomColors.disabledButton)
                                  :
                              CustomStyles.normal16
                          ),
                          IconButton(icon: Icon(Icons.add_circle,color: CustomColors.Orange,size: 22,),
                              onPressed: (){
                            model.addAdult();

                              }),



                        ],
                      )


                  )
                ],
                ),


              ),

            ),

            Card(elevation: 3,
              margin: EdgeInsets.only(top: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child:
              Container(
                height: 45,
                margin: EdgeInsets.only(left: 17,right: 18),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Expanded(
                      flex: 5,
                      child:

                      Text('Children',
                          style: model.childCount==0?
                          CustomStyles.normal16.copyWith(color: CustomColors.disabledButton)
                              :
                          CustomStyles.normal16

                      ),

                    ),

                    Expanded(
                      flex: 5,
                      child:
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          IconButton(icon: Icon(Icons.do_not_disturb_on,color: CustomColors.Orange,size: 22,), onPressed: (){
                            model.removeChild();
                          }),
                          Text(model.childCount.toString(),
                              style: model.childCount==0?
                              CustomStyles.normal16.copyWith(color: CustomColors.disabledButton)
                                  :
                              CustomStyles.normal16
                          ),
                          IconButton(icon: Icon(Icons.add_circle,color: CustomColors.Orange,size: 22,), onPressed: (){
                            model.addChild();
                          }),



                        ],
                      ),


                    )
                  ],
                ),


              ),

            ),

            Card(elevation: 3,
              margin: EdgeInsets.only(top: 10,bottom: 38),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child:
              Container(

                height: 45,
                margin: EdgeInsets.only(left: 17,right: 18),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Expanded(
                      flex: 5,
                      child:

                      Text('Infants',
                          style: model.infantsCount==0?
                          CustomStyles.normal16.copyWith(color: CustomColors.disabledButton)
                              :
                          CustomStyles.normal16
                      ),

                    ),

                    Expanded(
                      flex: 5,
                      child:
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          IconButton(icon: Icon(Icons.do_not_disturb_on,color: CustomColors.Orange,size: 22,), onPressed: (){
                            model.removeInfant();
                          }),

                          Text(model.infantsCount.toString(),
                              style: model.infantsCount==0?
                              CustomStyles.normal16.copyWith(color: CustomColors.disabledButton)
                                  :
                              CustomStyles.normal16
                          ),

                          IconButton(icon: Icon(Icons.add_circle,color: CustomColors.Orange,size: 22,), onPressed: (){
                            model.addInfant();
                          }),



                        ],
                      ),


                    )
                  ],
                ),


              ),

            ),

            Text('Choose cabin class',style: CustomStyles.heading.copyWith(color:CustomColors.heading.withOpacity(.5) ),),

            Container(
                margin: EdgeInsets.only(top: 23,bottom: 46),
                child:
                Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 23,right: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: model.cabinClassImages,),
                  ),
                  Slider(
                    value: model.cabinClassSelection,
                    min: 0,
                    max: 3,
                    label: model.cabin_class[model.cabinClassSelection.toInt()],
                    divisions: 3,

                    onChanged: (double newValue) {

                    model.changeCabinSelection(newValue);


                    },
                    activeColor: CustomColors.BackGround,
                    inactiveColor: CustomColors.disabledButton,
                  ),


                ],)


            ),

            SizedBox(
              height: 48,
              width: double.infinity,
              child: RaisedButton(
                  color: CustomColors.Orange,
                  child: Text("SEARCH FLIGHTS",
                    style: CustomStyles.button_style
                    ,),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),),
                  onPressed: () async {


                    //model.getRequestData();

                    //  Navigator.pushNamed(context, Router.searchFlights,arguments: model.getRequestData());




                  })


              ,
            ),
            SizedBox(height: 50,),




          ],

        ),),
    )
    ;
  }
}
