
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/models/my_bookings/booking_resposne.dart';
import 'package:ota/utils/colors.dart';

class BookingDetailView extends StatelessWidget
{
  BookingResponseModel _model;
  BookingDetailView(this._model);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Text("booking Id : " , style: TextStyle(color: Colors.grey,fontSize: 14),)
              ,SizedBox(width: 10,)
             , Text(_model.bookingId==null?"NA":_model.bookingId  , style: TextStyle(color: CustomColors.BackGround,fontSize: 16),)

            ],



          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Text("check In Date : " , style: TextStyle(color: Colors.grey,fontSize: 14),)
              ,SizedBox(width: 10,)
              , Text(_model.bookings[0].summaryInfo.checkInDate== null ? "NA" :_model.bookings[0].summaryInfo.checkInDate, style: TextStyle(color: CustomColors.BackGround,fontSize: 16),)

            ],



          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Text("check out date : " , style: TextStyle(color: Colors.grey,fontSize: 14),)
              ,SizedBox(width: 10,),
               Expanded(child: Text(_model.bookings[0].summaryInfo.checkOutDate== null ? "NA" :_model.bookings[0].summaryInfo.checkOutDate , style: TextStyle(color: CustomColors.BackGround,fontSize: 16),))

            ],



          ),
          SizedBox(height: 5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Text("hotel name : " , style: TextStyle(color: Colors.grey,fontSize: 14),)
              ,SizedBox(width: 10,),
               Expanded(child: Text(_model.bookings[0].summaryInfo.name== null ? "NA" :_model.bookings[0].summaryInfo.name , style: TextStyle(color: CustomColors.BackGround,fontSize: 16),))

            ],



          ),

          SizedBox(height: 5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Text("booking status : " , style: TextStyle(color: Colors.grey,fontSize: 14),)
              ,SizedBox(width: 10,)
              , Expanded(child: Text(_model.bookings[0].status== null ? "NA" :_model.bookings[0].status.toString().split('.')[1] , style: TextStyle(color: CustomColors.BackGround,fontSize: 16),))

            ],



          )

        ],

      ),
    );
  }

}