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
              actions: [
                _popupMenu()
              ],
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: 20,),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
                    child: Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: CustomColors.disabledButton,
                          spreadRadius: 0.2,

                        )]
                      ),


                      child: Padding(
                        padding: const EdgeInsets.only(right:5.0,left: 5.0),
                        child: Column(
                          children: [
                           _viewModel.searchHint=="id"?  _searchCriteriaById() : _searchCriteriaByName(),

                            SizedBox(height: 15,),

                            GestureDetector(
                              onTap: (){
                                FocusScope.of(context).unfocus();

                                _viewModel.searchBookings(_viewModel.searchHint);
                              },
                              child: Container(
                                width: kToolbarHeight+20,
                                height: kToolbarHeight-20,
                                decoration: BoxDecoration(
                                  color: CustomColors.Orange,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Center(child: Text("Search",style: CustomStyles.medium16.copyWith(color: Colors.white),),),
                              ),
                            ),

                            SizedBox(height: 10,),
                          ],
                        ),

                      ),
                    ),
                  ),

                SizedBox(height: 20,),

      _viewModel.isLoading?
      Flexible(
       flex:7,
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
  hintText: "Mobile Number",
  hintStyle: CustomStyles.medium14
        .copyWith(color: CustomColors.disabledButton),


    ),
      ignoreBlank: false,
      onInputChanged: (PhoneNumber value) {

          var no =value.phoneNumber.toString().substring(value.dialCode.length,value.phoneNumber.length);
          if(no.isNotEmpty)
          _viewModel.fillSearchData(value.dialCode + no, 2, "byId");
      },

    );

  }

  Widget _popupMenu() {
    return PopupMenuButton(
      icon: Icon(
        Icons.filter_list,
        color: Colors.white,
      ),
      onSelected: _choiceAction,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: "name",
          child: Text("Search Criteria By Name"),
        ),
        PopupMenuItem<String>(
          value: "id",
          child: Text("Search Criteria By Id"),
        ),

      ],
    );
  }

  void _choiceAction(String choice) {
    _viewModel.searchHint =choice;
  }


  Widget _searchCriteriaByName()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Flexible(
            flex: 5,
            child: TextFormField(
                 onChanged: (value){
                   _viewModel.fillSearchData(value, 0, "byName");
                 },
                decoration:  InputDecoration(

                    hintText: "First Name",
                    hintStyle: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),

                )

            ),



        ),

        SizedBox(width: 8,),
        Flexible(
            flex: 5,
            child: TextFormField(
                onChanged: (value){
                  _viewModel.fillSearchData(value, 1, "byName");
                },
                decoration:  InputDecoration(
                    hintStyle: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),

                    hintText: "Last Name"
                )

            ),
        )
      ],
    ),





        TextFormField(
            onChanged: (value){
              _viewModel.fillSearchData(value, 2, "byName");
            },
            decoration:  InputDecoration(
                hintStyle: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),

                hintText: "Email"
            )

        ),


      ],

    );
  }



  Widget _searchCriteriaById()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Flexible(
              flex: 5,
              child:   TextFormField(
                  onChanged: (value){
                    _viewModel.fillSearchData(value, 0, "byId");
                  },
                  decoration:  InputDecoration(

                    hintText: "Reservation ID",
                    hintStyle: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),

                  )

              ),



            ),

            SizedBox(width: 8,),
            Flexible(
              flex: 5,
              child: TextFormField(
                  onChanged: (value){
                    _viewModel.fillSearchData(value, 1, "byId");
                  },
                  decoration:  InputDecoration(
                      hintStyle: CustomStyles.medium14.copyWith(color: CustomColors.disabledButton),

                      hintText: "OTA Booking ID"
                  )

              ),
            )
          ],
        ),





        _intlPhoneNumber()


      ],

    );
  }
}
