import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ota/models/my_bookings/booking_resposne.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/my_bookings_viewmodel.dart';
import 'package:provider/provider.dart';

class ActivtiyBoookingDetailView extends StatelessWidget {
  BookingResponseModel _model;
  MyBookingsViewModel _viewModel;


  ActivtiyBoookingDetailView(List<Object> s)
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
          title: Text("Booking Detail"),
          backgroundColor: CustomColors.BackGround,
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
                _topHeaderBookingDetails(),
                SizedBox(
                  height: 10,
                ),
                _topHeaderBottomView(),
                SizedBox(
                  height: 10,
                ),
                _reservationNoContainer(context),
                _imageContainer(),
                SizedBox(
                  height: 10,
                ),
                _titleView(),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                _singleData(
                    "Modality Name",
                    _model.bookings[0].summaryInfo.modalityDetails.name == null
                        ? "NA"
                        : _model.bookings[0].summaryInfo.modalityDetails.name),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),

                SizedBox(
                  height: 5,
                ),
                _singleData(
                    "Location",
                    _model.bookings[0].summaryInfo.fromLocationName == null
                        ? "NA"
                        : _model.bookings[0].summaryInfo.fromLocationName),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),


                SizedBox(
                  height: 5,
                ),
                _doubleData(
                    "Start Date",
                    _model.bookings[0].reservationDate == null
                        ? "NA"
                        : _model.bookings[0].reservationDate.toIso8601String().split('T')[0],
                    "Duration",
                    _model.bookings[0].summaryInfo.modalityDetails.duration.value == null
                        ? "NA"
                        : _model.bookings[0].summaryInfo.modalityDetails.duration.value.toString() + " " + _model.bookings[0].summaryInfo.modalityDetails.duration.metric.toString()),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 5,
                ),
                _singleData(
                    "No of Person",
                    _model.bookings[0].summaryInfo.selectedPersons == null
                        ? "NA"
                        : _model.bookings[0].summaryInfo.selectedPersons.toString()),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),

                SizedBox(
                  height: 5,
                ),
                _singleData("Name", _model.contact.firstname.isEmpty?"NA":_model.contact.firstname +" " +_model.contact.lastname),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),

                SizedBox(
                  height: 5,
                ),
                _singleData("Phone Number", _model.contact.email.isEmpty?"NA":_model.contact.phoneNumber),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),


                SizedBox(
                  height: 5,
                ),
                _singleData("Email", _model.contact.email.isEmpty?"NA":_model.contact.email),
                Divider(
                  thickness: 0.2,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                _bottomButton(),
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

  Widget _bottomButton() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Container(
            height: kToolbarHeight - 10,
            decoration: BoxDecoration(
                color: Colors.white30,
                border: Border.all(color: CustomColors.Orange, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
                child: Text(
                  "View Cancellation Policy",
                  style: TextStyle(fontFamily: "roboto"),
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Container(
            height: kToolbarHeight - 10,
            decoration: BoxDecoration(
                color: CustomColors.Orange,
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                "Cancel Booking",
                style: TextStyle(color: Colors.white, fontFamily: "roboto"),
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

  Widget _imageContainer() {
    return Container(
        height: kToolbarHeight * 3,
        child: _model.bookings[0].summaryInfo.image==null
            ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.broken_image,
                  size: 48,
                  color: Colors.grey,
                ),
                Text(
                  "No Image Available",
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
              "Reservation No:",
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
                      content: Text("Copied to Clipbaord"),
                      duration: Duration(seconds: 2),
                    )) ;

                  },
                  child: Text(
                    "Copy",
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
                  ? "NA"
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
}
