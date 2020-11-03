import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/my_bookings/booking_resposne.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/my_bookings_viewmodel.dart';
import 'package:provider/provider.dart';

class FlightBookingDetailView extends StatelessWidget {
  BookingResponseModel _model;
  MyBookingsViewModel _viewModel;


  FlightBookingDetailView(List<Object> s)
  {
    _model = s[0] as BookingResponseModel;
    _viewModel =s [1] as MyBookingsViewModel;

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(

        appBar: AppBar(
          title: Text(getLocalText("booking_details", context)),
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
        body: Builder(

          builder:(context)=> SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                _topHeaderBookingDetails(context),
                SizedBox(
                  height: 10,
                ),
                _topHeaderBottomView(context),
                SizedBox(
                  height: 10,
                ),


                _reservationNoContainer(context),
                SizedBox(
                  height: 10,
                ),


                _model.bookings[0].summaryInfo.flight[0].airlinesMeta!=null?
                Padding(
                  padding: const EdgeInsets.only(left:10,right:10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getDepartureList(_model.bookings[0].summaryInfo.flight[0],context),
                  ),
                ):_imageContainer(context),
                SizedBox(
                  height: 10,
                ),

            SizedBox(
                  height: 5,
                ),
                _singleData(
                    getLocalText("city_from", context), 
                    _model.bookings[0].summaryInfo.flight[0].cityFrom == null
                        ? getLocalText("na", context)
                        : _model.bookings[0].summaryInfo.flight[0].cityFrom),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),

                SizedBox(
                  height: 5,
                ),
                _singleData(
                    getLocalText("city_to", context), 
                    _model.bookings[0].summaryInfo.flight[0].cityTo == null
                        ? getLocalText("na", context)
                        : _model.bookings[0].summaryInfo.flight[0].cityTo),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),

                SizedBox(
                  height: 5,
                ),
                _singleData(
                    getLocalText("flight_type", context), 
                    _model.bookings[0].summaryInfo.flightType == null
                        ? getLocalText("na", context)
                        : _model.bookings[0].summaryInfo.flightType),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),

            _doubleData(
                    getLocalText("reservation_date", context), 
                    _model.bookings[0].reservationDate == null
                        ? getLocalText("na", context)
                        : _model.bookings[0].reservationDate.toString().split(' ')[0],
                   getLocalText("return_date", context), 
                    _model.bookings[0].summaryInfo.returnDate == null
                        ? getLocalText("na", context)
                        : _model.bookings[0].summaryInfo.returnDate),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),


//
                _singleData(getLocalText("name", context), _model.contact.firstname.isEmpty?getLocalText("na", context) :_model.contact.firstname +" " +_model.contact.lastname),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ), 

                SizedBox(
                  height: 5,
                ),
                _singleData(getLocalText("phone_number", context), _model.contact.email.isEmpty?getLocalText("na", context) :_model.contact.phoneNumber),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),


                SizedBox(
                  height: 5,
                ),
                _singleData(getLocalText("email", context), _model.contact.email.isEmpty?getLocalText("na", context) :_model.contact.email),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                _bottomButton(context),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _bottomButton(BuildContext _context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: GestureDetector(
            onTap: (){
              if( _model.bookings[0].reservationNumber!=null)

                Navigator.pushNamed(_context, Routes.cancelPolicyView,arguments:[_model.bookings[0].reservationNumber]);


            },
            child: Container(
              height: kToolbarHeight - 10,
              decoration: BoxDecoration(
                  color:_model.bookings[0].reservationNumber==null?  CustomColors.disabledButton:Colors.white30,
                  border:_model.bookings[0].reservationNumber==null?  Border.all(color: Colors.grey, width: 1):Border.all(color: CustomColors.Orange, width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                    getLocalText("view_cancellation_policy", _context),

                    style: TextStyle(fontFamily: "roboto",color:_model.bookings[0].reservationNumber!=null? Colors.grey :Colors.white ),
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: GestureDetector(
            onTap: (){
              if(_model.bookings[0].reservationDate.isAfter(DateTime.now())&&_model.status!=null && _model.bookings[0].reservationNumber!=null && !SessionManager.getInstance().isGuest )
                showDialog(
                    context: _context,
                    barrierColor: Colors.black12,
                    barrierDismissible: true,
                    builder: (context) => AlertDialog(
                      title: new Text(getLocalText("alert", context)),
                      content: new Text(getLocalText("are_you_sure_you_want_cancel_booking", context)),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text(getLocalText("yes", context)),
                          onPressed: () {
                            Navigator.pop(context);

                            Dialogs.showSpinkitLoading(_context);


                            _viewModel.cancelBookingByRezervationId(_model.bookings[0].reservationNumber).then((value){

                              Navigator.pop(_context);
                              Navigator.pop(_context);

                              _viewModel.reloadView();


                            });
                          },

                        ),

                        new FlatButton(
                          child: new Text(getLocalText("no", context)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },)
                      ],
                    ));

            },
            child: Container(
              height: kToolbarHeight - 10,
              decoration: BoxDecoration(
                  color: _model.status==null||_model.bookings[0].reservationNumber==null || SessionManager.getInstance().isGuest||_model.bookings[0].reservationDate.isBefore(DateTime.now())?CustomColors.disabledButton : CustomColors.Orange,
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  getLocalText("cancel_booking", _context),
                  style: TextStyle(color: Colors.white, fontFamily: "roboto"),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _doubleData(title, data, secTitle, secData) {
    return Row(
      children: [
        Flexible(flex: 5, child: _doubleDataItem(title, data)),
        Flexible(flex: 5, child: _doubleDataItem(secTitle, secData)),
      ],
    );
  }

  Widget _singleData(title, data) {

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1)),
                width: SizeConstants.SIZE_20,
                height: SizeConstants.SIZE_20,
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.grey, fontFamily: "roboto"),
                  ),
                  SizedBox(height: 5),
                  ClipRect(
                    child: Text(
                      data,
                      style: CustomStyles.bookingDetaileTextStyle,
                    ),
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _titleView() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex:2,
            child: ClipOval(
              child: Container(
                color: CustomColors.BackGround,
                width: SizeConstants.SIZE_40,
                height: SizeConstants.SIZE_40,
                padding: EdgeInsets.all(
                  SizeConstants.SIZE_8,
                ),
                child: Image.asset(
                  "assets/images/dashboard/icon_activities.png",
                  color: CustomColors.White,
                  height: 12,
                  width: 12,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            flex: 8,
            child: Text(
              _model.bookings[0].summaryInfo.activityName == null
                  ? "NA"
                  : _model.bookings[0].summaryInfo.activityName,
              style: CustomStyles.bold17,
            ),
          )
        ],
      ),
    );
  }

  Widget _imageContainer(BuildContext context) {
    return Container(
        height: kToolbarHeight * 3,
        child: _model.bookings[0].summaryInfo.image==null
            ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.flight_takeoff,
                  size: 48,
                  color: Colors.grey,
                ),
                SizedBox(height: 10,),
                Text(
                  getLocalText("no_flight_detail_available", context),
                  style: TextStyle(fontSize: 18),
                )
              ],
            ))
            : Image.network(
          _model.bookings[0].summaryInfo.image,
          fit: BoxFit.cover,
        ));
  }

  Widget _reservationNoContainer(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: CustomColors.BackGround,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             getLocalText("reservation_no", context),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                 _model.bookings[0].reservationNumber==null?getLocalText("na", context) : _model.bookings[0].reservationNumber,
                  style: TextStyle(color: Colors.white),
                ),
                GestureDetector(
                  onTap: (){
                    Clipboard.setData(new ClipboardData(text:_model.bookings[0].reservationNumber));
                    Scaffold.of(context).showSnackBar(SnackBar(
                      backgroundColor: CustomColors.Orange,
                      content: Text(getLocalText("copied_to_clipboard", context)),
                      duration: Duration(seconds: 2),
                    )) ;

                  },
                  child: Text(
                    getLocalText("copy", context),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _topHeaderBookingDetails(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topHeaderRightView(context),
          _topHeaderLeftView(context),
        ],
      ),
    );
  }

  Widget _doubleDataItem(title, data) {

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1)),
              width: SizeConstants.SIZE_20,
              height: SizeConstants.SIZE_20,
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.grey, fontFamily: "roboto"),
                ),
                SizedBox(height: 5),
                ClipRect(
                  child: Text(
                    data,
                    style: CustomStyles.bookingDetaileTextStyle,
                  ),
                )


              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _topHeaderRightView(BuildContext context) {
    return Flexible(
      flex: 6,
      child: Row(children: [
        SizedBox(
          width: 10,
        ),
        Text(
         getLocalText("booking_id", context)+ " : ",
          style: TextStyle(color: Colors.grey,fontFamily: "roboto"),
        ),
        Text(_model.bookingId, style: CustomStyles.bookingNumberTextStyle),
      ]),
    );
  }

  Widget _topHeaderLeftView(BuildContext context) {
    return Flexible(
      flex: 4,
      fit: FlexFit.tight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              "SAR ",
              style: TextStyle(color: CustomColors.Orange, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
              child: Text(
                _model.totalAmount.toString(),
                style: TextStyle(
                    color: CustomColors.Orange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
              )),
          SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }

  Widget _topHeaderBottomView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _model.bookings[0].bookingDate == null
                ? getLocalText("na", context)
                : _model.bookings[0].bookingDate.toString().split(' ')[0],
            style: TextStyle(color: Colors.grey),
          ),
          Text(
              _model.bookings[0].status == null
                  ? "Cancel_Initialized"
                  : _model.bookings[0].status.toString().split('.')[1],
              style: TextStyle(
                color: _model.bookings[0].status.toString().split('.') ==
                    "BOOKING_PENDING"
                    ? CustomColors.BackGround
                    : Colors.green,
              )),
        ],
      ),
    );
  }
  getSelectedAirLineImage(String airline, List<AirlinesMeta> airlinesMeta) {


    Widget airlineImage;

    for (int j = 0; j < airlinesMeta.length; j++) {

      if (airline == airlinesMeta[j].code) {

        airlineImage =

            Container(child: Image.network(

              airlinesMeta[j].image128, height: 25, width: 25,),

              margin: EdgeInsets.only(left: 2, right: 2),

            );

      }

    }

    return airlineImage;

  }

  String getTimeDifferenceByDate( String departure,String arrival){


    String formatTime(int timeNum) {
      return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
    }

    final parsedDepartureTime = DateTime.parse(departure).toUtc();

    String time1 = parsedDepartureTime.toLocal().toString();

    final departureTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time1, true).toLocal();





    final parsedArrivalTime = DateTime.parse(arrival).toUtc();

    String time2 = parsedArrivalTime.toLocal().toString();

    final arrivalTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time2, true).toLocal();






    var different=arrivalTime.difference(departureTime);



    var seconds = different.inSeconds;



    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;

    return formatTime(hour) + " Hrs " + formatTime(minute) + " min ";


  }




  String getConvertedTime(String convertTime){

//    final parsedTime = DateTime.parse(convertTime).toUtc();
//
//    String time = parsedTime.toLocal().toString();

//    final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(convertTime, false);
//
//    final convertedTime = new DateFormat("HH:mm").format(dateTime);

   final convertedTime = convertTime.toString().split(' ')[1].split('.')[0];
   return convertedTime;


  }

  String getConvertedDate(String convertDate){

//    final parsedDate = DateTime.parse(convertDate).toUtc();
//
//    String time = parsedDate.toLocal().toString();

//    final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(convertDate, false).toLocal();
//
//    final convertedDate = new DateFormat("dd-MMM").format(dateTime);

    return convertDate.toString().split(' ')[0];

  }



  getDepartureList(Flight model, BuildContext context) {

    List<Widget>widgetlist = List();

    for(int i=0;i<model.route.length;i++){

      widgetlist.add(
        Card(
            elevation: 3,
            margin: EdgeInsets.only(top: 10,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child:
            Container(
              margin: EdgeInsets.only(left: 23,right: 23,top: 14,bottom: 14),
              child: Column(
                children: <Widget>[
                  Container(child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Flexible(
                          flex: 3,
                          fit: FlexFit.tight,
                          child: Row(
                            children: <Widget>[

                              getSelectedAirLineImage(model.route[i].airline,model.airlinesMeta)
                              ,
                              SizedBox(width: 5,),

                              Text(model.route[i].airline,style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),

                              SizedBox(width: 5,),
                              Text(model.route[i].flightNo.toString(),style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),



                            ],
                          ),


                        ),
                        Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: SizedBox()),

                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child:  Text("Economy",style: CustomStyles.calenderStyle,textAlign: TextAlign.end,),)




                      ],),


                      Center(child: Text(getTimeDifferenceByDate(model.route[i].localDeparture.toString(),
                          model.route[i].localArrival.toString()),
                        style: CustomStyles.calenderStyle,),),

                      Row(
                        mainAxisSize: MainAxisSize.max,

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          Flexible(fit: FlexFit.loose,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(model.route[i].flyFrom,style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),
                                  SizedBox(width: 30,),
                                  Image.asset('assets/images/circular.png',height: 10,),

                                  Flexible(

                                      child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
                                  ),

                                ],)
                          ),
                          Expanded(

                              child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
                          ),
                          Flexible(fit: FlexFit.loose,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(

                                      child: MySeparator(height: 1,color: CustomColors.TabDisabled,Horizontal: true,)
                                  ),
                                  Image.asset('assets/images/path1.png',height: 15,),
                                  SizedBox(width: 20,),
                                  Text(model.route[i].flyTo,style: CustomStyles.style3.copyWith(fontWeight: FontWeight.w500),),

                                ],)
                          ),




                        ],),


                      SizedBox(height: 5,),
                      Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                              fit: FlexFit.loose,
                              child: Row(children: <Widget>[
                                Image.asset('assets/images/morning.png',height: 13,),
                                SizedBox(width: 5,),
                                Text(getConvertedTime(model.route[i].localDeparture.toString()),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),

                              ],)
                          ),
                          Flexible(
                              fit: FlexFit.tight,
                              child: Center(child: Text(
                                model.onewaystopsCount==0?
                                'Non-Stop' : (model.onewaystopsCount).toString()+" Stops"
                                ,style: CustomStyles.calenderStyle,textAlign: TextAlign.center,))
                          ),
                          Flexible(
                              fit: FlexFit.loose,
                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Image.asset('assets/images/night.png',height: 13,),
                                  SizedBox(width: 5,),
                                  Text(getConvertedTime( model.route[i].localArrival.toString()),style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading),),

                                ],)
                          ),


                        ],),
                      SizedBox(height: 8,),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: Text(getConvertedDate(model.route[i].localDeparture.toString()),style: CustomStyles.calenderStyle,textAlign: TextAlign.start,)
                          ),
                          Flexible(
                            flex: 5,
                            fit: FlexFit.tight,
                            child:
                            SizedBox()
                            ,
                          ),


                          Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: Text(getConvertedDate(model.route[i].localArrival.toString()),style: CustomStyles.calenderStyle,textAlign: TextAlign.end,)
                          ),


                        ],),
                      SizedBox(height: 7,),

                      Container(height: 1,
                        width: double.infinity,
                        color: CustomColors.disabledButton.withOpacity(.3),
                      ),

                      SizedBox(height: 7,),


                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Flexible(

                              fit: FlexFit.loose,
                              child: Text(getLocalText("baggage", context),style: CustomStyles.calenderStyle,)
                          ),
                          Flexible(

                              fit: FlexFit.tight,
                              child: Center(child:

                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: getLocalText("check_in", context), 
                                    style: CustomStyles.calenderStyle,
                                    children: <TextSpan>[
                                      TextSpan(text: " ${model.baglimit.holdWeight.toString()}"+' kgs',
                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading)
                                      )
                                    ]
                                ),
                              )

                              )
                          ),
                          Flexible(

                              fit: FlexFit.tight,
                              child:   RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: getLocalText("cabin", context),
                                    style: CustomStyles.calenderStyle,
                                    children: <TextSpan>[
                                      TextSpan(text:" ${model.baglimit.handWeight.toString()}"+' kgs',
                                          style: CustomStyles.calenderStyle.copyWith(fontSize: 12,color: CustomColors.heading)
                                      )
                                    ]
                                ),
                              )
                          ),


                        ],),

                    ],
                  ),),
                ],
              ),
            )
        ),
      );

    }


    return widgetlist;

  }

  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }

}
