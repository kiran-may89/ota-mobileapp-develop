import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/my_bookings/booking_resposne.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/dialog.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/my_bookings_viewmodel.dart';
import 'package:provider/provider.dart';

class  TransferBookingDetailView extends StatelessWidget {
  BookingResponseModel _model;
  MyBookingsViewModel _viewModel;


  TransferBookingDetailView(List<Object> s)
  {
    _model = s[0] as BookingResponseModel;
    _viewModel =s[1] as MyBookingsViewModel;

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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                _topHeaderBookingDetails(),
                SizedBox(
                  height: 10,
                ),
                _topHeaderBottomView(),
                SizedBox(
                  height: 10,
                ),
                _reservationNoContainer(context),
                _imageContainer(context),
                SizedBox(
                  height: 10,
                ),
                _titleView(context),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                _singleData(
                    getLocalText("start_location", context),
                    _model.bookings[0].summaryInfo.trips[0].startLocation.address == null
                        ? "NA"
                        : _model.bookings[0].summaryInfo.trips[0].startLocation.address),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                _singleData(
                    "Finish Location",
                    _model.bookings[0].summaryInfo.trips[0].finishLocation.address == null
                        ? "NA"
                        : _model.bookings[0].summaryInfo.trips[0].finishLocation.address),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                _doubleData(
                    getLocalText("pick_up_date", context), 
                    _model.bookings[0].summaryInfo.pickUpDate == null
                        ? "NA"
                        : _model.bookings[0].summaryInfo.pickUpDate.toString().split(' ')[0],
                    getLocalText("pick_up_time", context), 
                    _model.bookings[0].summaryInfo.pickUpTime == null
                        ? "NA"
                        : _model.bookings[0].summaryInfo.pickUpTime.toString()
                        ),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                _singleData(
                    getLocalText("no_of_passengers", context),
                    _model.bookings[0].summaryInfo.trips[0].passengersNumber == null
                        ? "NA"
                        : _model.bookings[0].summaryInfo.trips[0].passengersNumber.toString()),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),

//                SizedBox(
//                  height: 5,
//                ),
//                _singleData(
//                    "Provider",
//                    _model.bookings[0].provider == null
//                        ? "NA"
//                        : _model.bookings[0].provider),
//                Divider(
//                  thickness: 0.2,
//                  color: Colors.grey,
//                ),
                SizedBox(
                  height: 5,
                ),
                _singleData(
                getLocalText("name", context),
                    _model.bookings[0].summaryInfo.trips[0].passengers[0].name== null
                        ? "NA"
                        :     _model.bookings[0].summaryInfo.trips[0].passengers[0].name),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                _singleData(
                getLocalText("phone_number", context),
                    _model.bookings[0].summaryInfo.trips[0].passengers[0].phone== null
                        ? "NA"
                        :     _model.bookings[0].summaryInfo.trips[0].passengers[0].phone),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                _singleData(getLocalText("email", context), _model.contact.email.isEmpty?"NA":_model.contact.email),
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


  Widget _titleView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              color: CustomColors.BackGround,
              width: SizeConstants.SIZE_40,
              height: SizeConstants.SIZE_40,
              padding: EdgeInsets.all(
                SizeConstants.SIZE_8,
              ),
              child: Image.asset(
                "assets/images/dashboard/icon_transfer.png",
                color: CustomColors.White,
                height: 12,
                width: 12,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            _model.bookings[0].summaryInfo.name == null
                ? getLocalText("transfers", context)
                : _model.bookings[0].summaryInfo.name,
            style: CustomStyles.bold17,
          )
        ],
      ),
    );
  }

  Widget _imageContainer(BuildContext context) {
    return Container(
        height: kToolbarHeight * 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [

         Flexible(
           flex: 5,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [


               Text(_model.bookings[0].summaryInfo.carClass.capacity==null?"CarCapacity : "+"NA":"CarCapacity : "+_model.bookings[0].summaryInfo.carClass.capacity.toString(),style: TextStyle(color: Colors.black54),),
               SizedBox(height: 5,),
               Text(_model.bookings[0].summaryInfo.carClass.models.length<=0 ||_model.bookings[0].summaryInfo.carClass.models[0]==null   ? "Model :" + "NA": "Model : "+ _model.bookings[0].summaryInfo.carClass.models.toString().split('.')[1].split(']')[0],style: TextStyle(color: Colors.black54)),
               SizedBox(height: 5,),
               Text(_model.bookings[0].summaryInfo.carClass.title==null?"Capacity : "+"NA":"Capacity : "+ _model.bookings[0].summaryInfo.carClass.title.toString().split('.')[1],style: TextStyle(color: Colors.black54)),


             ],
           ),
         ),

        SizedBox(width: 20,),
        _model.bookings[0].summaryInfo.carClass.photo== null
            ? Flexible(
          flex: 5,
              child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.broken_image,
                    size: 32,
                    color: Colors.grey,
                  ),
                  Text(
                    getLocalText("no_image_available", context),
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )),
            )
            : Center(
              child: Image.network(
          _model.bookings[0].summaryInfo.carClass.photo,
          fit: BoxFit.contain,
                alignment: Alignment.center,
        ),
            ),



       ],




    )
    );
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
                  _model.bookings[0].reservationNumber,
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

  Widget _topHeaderBookingDetails() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topHeaderRightView(),
          _topHeaderLeftView(),
        ],
      ),
    );
  }

  Widget _topHeaderRightView() {
    return Flexible(
      flex: 6,
      child: Row(children: [
        SizedBox(
          width: 10,
        ),
        Text(
          strings.booking_id + " : ",
          style: TextStyle(color: Colors.grey,fontFamily: "roboto"),
        ),
        Text(_model.bookingId, style: CustomStyles.bookingNumberTextStyle),
      ]),
    );
  }

  Widget _topHeaderLeftView() {
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

  Widget _topHeaderBottomView() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _model.bookings[0].bookingDate == null
                ? "NA"
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

  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }
}
