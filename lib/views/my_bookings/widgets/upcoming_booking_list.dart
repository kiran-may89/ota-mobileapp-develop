
import 'package:flutter/cupertino.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/viewmodels/my_bookings_viewmodel.dart';
import 'package:ota/views/my_bookings/widgets/list_container.dart';
import 'package:provider/provider.dart';

class UpComingBookingList extends StatelessWidget {

  MyBookingsViewModel _viewModel;

  UpComingBookingList(this._viewModel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider.value(
        value: _viewModel,

        child: Consumer<MyBookingsViewModel>(builder: (context, model, child) {
          return FutureBuilder(
            initialData: _viewModel.upcomingBookingList,
              builder: (BuildContext context, AsyncSnapshot snapshot) {

                if(_viewModel.bookingResponseList!=null) {
                  if (_viewModel.upcomingBookingList.length > 0) {
                    return ListView.builder(
                        itemCount: _viewModel.upcomingBookingList.length,

                        itemBuilder: (BuildContext context, int index) {
                          return ListContainer(
                              _viewModel.upcomingBookingList[index],
                              _viewModel);
                        }

                    );
                  }
                  else {
                    return Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Image.asset('assets/nobookings.png', height: 100)
                            , SizedBox(height: 10,),
                            Text(getLocalText("no_bookings_available", context))

                          ],
                        ),

                      ),
                    );
                  }
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
  getLocalText(String key, BuildContext context) {

  return  AppLocalizations.of(context).translate(key);
  }
}
