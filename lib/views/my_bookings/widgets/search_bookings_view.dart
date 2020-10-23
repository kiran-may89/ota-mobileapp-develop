import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ota/customviews/shimmer_container.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/size_constants.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/my_bookings_viewmodel.dart';
import 'package:provider/provider.dart';

import 'list_container.dart';

class SearchBookingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchBookingView();
}

class _SearchBookingView extends State<SearchBookingsView> {
  MyBookingsViewModel _viewModel;
  bool _isBuild =false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyBookingsViewModel>(
    create: (context) => _viewModel = MyBookingsViewModel.searcbooking(),
    child: Consumer<MyBookingsViewModel>(builder: (context, model, child) {

        return Scaffold(
            appBar: AppBar(
              title: Text("Search Bookings"),
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
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 20,),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 9,
                          child: Container(
                            height: kToolbarHeight - 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey, width: 1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 9,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child:_viewModel.searchHint == "Search By Phone Number"? _intlPhoneNumber() : new TextFormField(
                                      controller: _viewModel.searchText,
                                        decoration:  InputDecoration(

                                      hintText: _viewModel.searchHint
                                    )),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 1.0),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.search,
                                          size: 24,
                                          color: CustomColors.BackGround,
                                        ),
                                        onPressed: () {
                                          if(_viewModel.searchText.value.text!="" )
                                          {
                                            _viewModel.reloadSearchBookings();
                                            _viewModel.searchBookings();
                                            _viewModel.searchText.clear();
                                          } else if(_viewModel.phone!="")
                                            {
                                              _viewModel.reloadSearchBookings();
                                              _viewModel.searchBookings();
                                              _viewModel.searchText.clear();
                                            }
                                        },
                                      ),
                                  ),
                                ),

                                SizedBox(width: 10,)
                              ],
                            ),
                          ),
                        ),
                        Flexible(flex: 1, child: _popupMenu())
                      ],
                    ),
                  ),

                SizedBox(height: 20,),

      _viewModel.isLoading? 
      Flexible(
        flex: 9,
        child: Container(
          child: FutureBuilder(
          initialData: _viewModel.bookingResponseList,
          builder: (BuildContext context, AsyncSnapshot snapshot) {

          if(_viewModel.bookingResponseList!=null) {
            if(_viewModel.bookingResponseList.length>0) {
                return ListView.builder(
                    itemCount: _viewModel.bookingResponseList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListContainer(
                          _viewModel.bookingResponseList[index], _viewModel);
                    }
                );
            }
            else
                {
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Image.asset('assets/nobookings.png',height:100)
                          ,SizedBox(height: 10,),
                          Text("No Bookings Available")

                        ],
                      ),

                    ),
                  );
                }
          }
          else
          {
          return   Center(
            child: SpinKitChasingDots(
            size: SizeConstants.SIZE_50,
            color: CustomColors.BackGround,
          ));

          }
          }


          ),
        ),
      ):Center(
          child: Text("Your Search Will Apper Here"))


                ],
              ),
            )
        );
      }),
    );
  }

  Widget _intlPhoneNumber()
  {
    return InternationalPhoneNumberInput(


        selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG),








  inputDecoration: InputDecoration(

  labelStyle: CustomStyles.normal16
        .copyWith(color: CustomColors.disabledButton),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
    ),
    ignoreBlank: false,
      onInputChanged: (PhoneNumber value) {

          var no =value.phoneNumber.toString().substring(value.dialCode.length,value.phoneNumber.length);
          if(no.isNotEmpty)
          _viewModel.phone = value.dialCode + " "+ no;
      },

    );

  }

  Widget _popupMenu() {
    return PopupMenuButton(
      icon: Icon(
        Icons.filter_list,
        color: CustomColors.BackGround,
      ),
      onSelected: _choiceAction,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: "Search By Reservation No",
          child: Text("Search By Reservation No"),
        ),
        PopupMenuItem<String>(
          value: "Search By First Name",
          child: Text("Search By First Name"),
        ),
        PopupMenuItem<String>(
          value: "Search By LastName",
          child: Text("Search By LastName"),
        ),
        PopupMenuItem<String>(
          value: "Search By Phone Number",
          child: Text("Search By Phone Number"),
        ),
      ],
    );
  }

  void _choiceAction(String choice) {
    _viewModel.searchHint =choice;
  }
}
