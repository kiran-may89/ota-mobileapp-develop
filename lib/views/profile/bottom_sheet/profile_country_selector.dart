import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/profile/profile_view_model.dart';
import 'package:provider/provider.dart';




class ProfileCountrySelection extends StatefulWidget {

ProfileViewModel model;

BuildContext context;

ProfileCountrySelection(this.model, this.context);

  @override
  _ProfileCountrySelectionState createState() => _ProfileCountrySelectionState(model,context);
}

class _ProfileCountrySelectionState extends State<ProfileCountrySelection> {
ProfileViewModel model;

BuildContext context;

var height;
var width;

  _ProfileCountrySelectionState(this.model, this.context);

  @override
  Widget build(BuildContext context) {

  height = MediaQuery.of(context).size.height/10;

  width = MediaQuery.of(context).size.width/10;

    return ChangeNotifierProvider.value(

    value: model,

    child:

    Consumer<ProfileViewModel>(builder: (context, model, child) {
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
    controller:model.searchCountry,

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

    model.setNationality(model.tempCountryCodes[index].name,);

    print(model.tempCountryCodes[index]);


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
