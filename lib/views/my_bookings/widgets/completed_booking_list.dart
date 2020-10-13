
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/viewmodels/my_bookings_viewmodel.dart';
import 'package:ota/views/my_bookings/widgets/list_container.dart';
import 'package:provider/provider.dart';

class CompletedBookingList extends StatelessWidget {

  MyBookingsViewModel _viewModel;

  CompletedBookingList(this._viewModel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider.value(
        value: _viewModel,

        child: Consumer<MyBookingsViewModel>(builder: (context, model, child) {
          return FutureBuilder(
              initialData: _viewModel.completedBookingList,
              builder: (BuildContext context, AsyncSnapshot snapshot) {

                if(_viewModel.bookingResponseList.length>0) {
                  return ListView.builder(
                      itemCount: _viewModel.completedBookingList.length,
                      itemBuilder: (BuildContext context, int index) {
                        if(_viewModel.completedBookingList.length>0)
                        return ListContainer(_viewModel.completedBookingList[index],_viewModel);
                        else
                          return Center(
                            child: Text("Data Not Available",style: TextStyle(color: Colors.lightBlue),),
                          );
                      }

                  );
                }
                else
                {
                  return  ShimmerContainer(MediaQuery.of(context).size.height);
                }
              }


          );
        }
        ));
  }
}
