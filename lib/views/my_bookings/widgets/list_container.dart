
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/models/my_bookings/booking_resposne.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/my_bookings_viewmodel.dart';
import 'package:ota/views/my_bookings/widgets/booking_detail_view.dart';
import 'package:ota/views/my_bookings/widgets/hotel_detail_booking_view.dart';

class ListContainer extends StatelessWidget
{
  BookingResponseModel _model;
  MyBookingsViewModel _viewModel;
  ListContainer(this._model,this._viewModel);


  String getTrpType()
  {
    String image = "";

    var item = _model.bookings[0].summaryInfo.serviceType.toString().substring(_model.bookings[0].serviceType.toString().indexOf('.')+1);

    switch(item)
    {
      case "FLT":
        image = "icon_flight.png";
        break;
      case "HTL":
        image = "icon_hotel.png";
        break;

      case "TRF":
        image = "icon_transfer.png";
        break;

      case "ACT":
        image = "icon_activities.png";
        break;

    }

    return image;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return GestureDetector(
      onTap: (){

    var item = _model.bookings[0].summaryInfo.serviceType.toString().substring(_model.bookings[0].serviceType.toString().indexOf('.')+1);

        switch(item)
        {
          case "FLT":
         //   Navigator.pushNamed(context, Routes.activityBookingDetailsView,arguments:[_model,_viewModel]);

            break;
          case "HTL":
            Navigator.pushNamed(context, Routes.hotelsBookingDetailView,arguments:[_model,_viewModel]);

            break;

          case "TRF":
            Navigator.pushNamed(context, Routes.transferBookingDetailsView,arguments:[_model,_viewModel]);

            break;

          case "ACT":
            Navigator.pushNamed(context, Routes.activityBookingDetailsView,arguments:[_model,_viewModel]);

            break;



        }
    //    Navigator.pushNamed(context, Routes.activityBookingDetailsView,arguments:[_model,_viewModel]);



      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: SizeConstants.SIZE_4, horizontal: SizeConstants.SIZE_12),
        width: MediaQuery.of(context).size.width,
        height: kToolbarHeight+kToolbarHeight,
        child: Card(
          elevation: 2,


          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

               _bookingRightView(),
                  _bookingLeftView()

                ],

              ),
              SizedBox(height: 5,),
              Divider(thickness: 0.2,color: Colors.grey,),
             _bookingBottomView()
            ],

          )
        ),
      ),
    );
  }


  Widget _bookingRightView()
  {
    var  image = getTrpType();
    return    Flexible(
      flex: 6,
      child: Row(

        children: [

          SizedBox(width: 10,),
          ClipOval(
              child: Container(
                color: CustomColors.BackGround,
                width: SizeConstants.SIZE_40,
                height: SizeConstants.SIZE_40,
                padding: EdgeInsets.all(
                  SizeConstants.SIZE_8,
                ),
                child: Image.asset(
                  "assets/images/dashboard/$image",
                  color: CustomColors.White,
                  fit: BoxFit.cover,
                ),
              )),

          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text(strings.booking_id,style: TextStyle(color: Colors.grey),),
              Text(_model.bookingId,style:CustomStyles.bookingNumberTextStyle)
            ],

          )


        ],
      ),
    );
  }

  Widget _bookingLeftView()
  {
    return   Flexible(
      flex: 4,
      fit: FlexFit.tight,


      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Padding(
            padding: const EdgeInsets.only(top:2.0),
            child: Text("SAR ",style: TextStyle(color: CustomColors.Orange,fontSize: 12),textAlign: TextAlign.center,),
          )
          ,Flexible(child: Text(_model.totalAmount.toString(),style: TextStyle(color: CustomColors.Orange,fontSize: 18,fontWeight: FontWeight.bold),maxLines: 2,))
          ,SizedBox(width: 5,)
        ],
      ),
    );

  }

  Widget _bookingBottomView()
  {
    return  Padding(
      padding: const EdgeInsets.only(left: 10,right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(_model.bookings[0].bookingDate==null?"NA":_model.bookings[0].bookingDate.toString().split(' ')[0],style: TextStyle(color: Colors.grey),),

          Text(_model.bookings[0].status== null ? "NA" :_model.bookings[0].status.toString().split('.')[1],style: TextStyle(color:_model.bookings[0].status.toString().split('.')== "BOOKING_PENDING"?CustomColors.BackGround:Colors.green,)),

        ],
      ),
    );

  }


}