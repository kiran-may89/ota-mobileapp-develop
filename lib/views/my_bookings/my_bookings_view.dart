import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/net/service/my_bookings/booking_service.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/strings.dart';
import 'package:ota/viewmodels/my_bookings_viewmodel.dart';
import 'package:ota/views/my_bookings/widgets/cancelled_booking_list.dart';
import 'package:ota/views/my_bookings/widgets/completed_booking_list.dart';
import 'package:ota/views/my_bookings/widgets/upcoming_booking_list.dart';
import 'package:provider/provider.dart';

class MyBookingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyBookingsView();
}

class _MyBookingsView extends State<MyBookingsView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  MyBookingsViewModel _viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<MyBookingsViewModel>(
      create: (context) => _viewModel = MyBookingsViewModel(),
      child: Consumer<MyBookingsViewModel>(
        builder: (context, model, child) {
          return Scaffold(

            appBar: AppBar(
              title: Text(getLocalText("my_bookings", context)),
              backgroundColor: CustomColors.BackGround,
              leading: new IconButton(
                icon: new Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 13,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                _popupMenu()
              ],
              bottom: TabBar(
                indicatorWeight: 3,
                unselectedLabelColor: Colors.grey,
                labelColor: CustomColors.Orange,
                tabs: [
                  new Tab(
                    text: getLocalText("upcoming", context),
                  ),
                  new Tab(
                    text: getLocalText("completed", context),
                  ),
                  new Tab(
                    text: getLocalText("cancelled", context),
                  ),
                ],
                controller: _tabController,
                indicatorColor: CustomColors.BackGround,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                UpComingBookingList(_viewModel),
                CompletedBookingList(_viewModel),
                CancelledBookingList(_viewModel)
              ],
              controller: _tabController,
            ),
          );
        },
      ),
    );



  }

  Widget _popupMenu()
  {
    return PopupMenuButton(
      icon: Icon(Icons.filter_list,color: Colors.white,),
      onSelected: _choiceAction,
      itemBuilder: (BuildContext context)=>[
        PopupMenuItem<String>(
          value: "All",
          child: Text("All") ,

        ),
        PopupMenuItem<String>(
          value: "FLT",
          child: Text(getLocalText("flights", context)) ,
        ),
        PopupMenuItem<String>(
          value: "HTL",
          child: Text(getLocalText("hotels", context)) ,
        ),
        PopupMenuItem<String>(
          value: "TRF",
          child: Text(getLocalText("transfers", context)) ,
        ),
        PopupMenuItem<String>(
          child: Text(getLocalText("activities", context)) ,
          value: "ACT",
        ),

      ],

    );



  }

  void _choiceAction(String choice)
  {

     _viewModel.getFilteredList(choice);

  }
  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }

}
