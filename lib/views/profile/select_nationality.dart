import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/passenger_info_model.dart';
import 'package:ota/viewmodels/profile/add_member_view_model.dart';
import 'package:ota/viewmodels/profile/family_list_viewmodel.dart';
import 'package:provider/provider.dart';



class ProfileSelectNationality extends StatefulWidget {

  AddMemberViewModel model;

  BuildContext context;

  ProfileSelectNationality(this.model, this.context);

  @override
  _ProfileSelectNationalityState createState() => _ProfileSelectNationalityState(model,context);
}

class _ProfileSelectNationalityState extends State<ProfileSelectNationality> {

  AddMemberViewModel model;

  BuildContext context;

  int index;

  int passengerType;

  _ProfileSelectNationalityState(this.model, this.context
      );


  var height;
  var width;

  @override
  Widget build( context) {


    height = MediaQuery.of(context).size.height/10;

    width = MediaQuery.of(context).size.width/10;
    return ChangeNotifierProvider.value(

        value: model,

        child:

        Consumer<AddMemberViewModel>(builder: (context, model, child) {
          return

            Column(

              children: [

                SizedBox(height: 30,),


                Card(

                  elevation: 3,

                  margin: EdgeInsets.only(top: 0,bottom: 10),

                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(0.0),

                  ),

                  child:

                  Container(

                    height: height*.8,

                    child:Row(children: <Widget>[

                      Container(
                        width: width*1.5,

                        child:

                            Icon(Icons.location_on,color: CustomColors.BackGround,size: 20,)

//                        Image.asset(
//                          'assets/images/plane.png',
//                          height: 21,
//                        ),

                      ),

                      Container(
                        width: width*8.5,
                        alignment: Alignment.centerLeft,

                        child: TextFormField(
                          textAlign: TextAlign.start,
                          controller:model.nationality,

                          autofocus: true,
                          onChanged: (text){

                            model.searchCountryList(text);
                          },


                          decoration: InputDecoration.collapsed(hintText:  "Search Country" ,
                              hintStyle: CustomStyles.medium16),
                        ),
                      )

                    ],

                    ),

                  ),

                ),

                SizedBox(height: 0,),



                Flexible(
                    child:

                              ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: model.tempCountryCodes.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){

                                  model.setNationality(index,passengerType,model.tempCountryCodes[index]);


                                    Navigator.pop(context);


                                  },
                                  child:  Container(
                                    alignment: Alignment.centerLeft,
                                    color: Colors.transparent,
                                    margin: EdgeInsets.only(
                                        left: 0, right: 0,top: 4,bottom: 4),
                                    child:
                                    Column(

                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(

                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,


                                          children: [

                                            Container(
                                              width: width*1.5,
                                              //padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                              child:
                                                 // Icon(Icons.outlined_flag,color: CustomColors.BackGround,size: 21,)

                                              SvgPicture.network(
                                                model.tempCountryCodes[index].flagUrl,
                                                height: 15,
                                                width: 15,
                                              )

//                                              Image.asset(
//
//                                                'assets/images/location.png',
//                                                height: 21,color: CustomColors.BackGround.withOpacity(.8),
//                                              ),
                                            ),

                                            Container(
                                              width: width*8.5,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(

                                                    model.tempCountryCodes[index].name,
                                                    style:
                                                    CustomStyles.bold16,
                                                  ),
//                                                  SizedBox(
//                                                    height: 4,
//                                                  ),
//                                                  Text(
//                                                    snapshot.data.result[index].airportName,
//                                                    style:
//                                                    CustomStyles.normal14.copyWith(color: CustomColors.heading.withOpacity(.7)),
//                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),


                                        Container(

                                          height: 1,
                                          width: MediaQuery.of(context).size.width,
                                          color: CustomColors
                                              .disabledButton.withOpacity(.5),
                                        )

                                      ],
                                    ),
                                  ),
                                );
                              },

                            )

                )










              ],





            );



        }

        )

    );
  }
}
