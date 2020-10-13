import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';


class transferResultsCard extends StatefulWidget {
  @override
  _transferResultsCardState createState() => _transferResultsCardState();
}

class _transferResultsCardState extends State<transferResultsCard> {

  List images = ['assets/images/standard_car.png','assets/images/minibus_car.png','assets/images/minivan_car.png'];
  List seater = ['4 Seater','5 Seater','15 Seater'];
  List type = ['Standard','Minivan','Minibus'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:25,right: 25,top: 10),
      child:
      Column(
        children: <Widget>[

          Expanded(
            child:


            ListView.builder(
                itemCount: 3, // records.length
                itemBuilder: (BuildContext context, int index) {
                  return
                    GestureDetector(
                      child:
                      Card(
                          elevation: 3,
                          margin: EdgeInsets.only(top: 10,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child:
                          Container(
                            margin: EdgeInsets.only(left: 23,right: 23,top: 20,bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text(type[index],style: CustomStyles.medium14,),

                                Row(

                                  children: <Widget>[

                                    Flexible(child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        
                                        Text(seater[index],style: CustomStyles.normal14.copyWith(color: CustomColors.disabledButton),),
                                        SizedBox(height: 20,),
                                        Row(children: <Widget>[
                                          Image.asset('assets/images/cab_icon.png',height: 13,)  ,
                                          SizedBox(width: 10,),
                                          Text('Hyderabad Airport',style: CustomStyles.normal10.copyWith(fontSize: 9),)
                                        ],),
                                        
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(width: 5,),
                                            Container(
                                              height: 40,
                                                margin: EdgeInsets.only(top: 10,bottom: 10),
                                                child: MySeparator(color: CustomColors.TabDisabled,height: 1,Horizontal: false,)),
                                            SizedBox(width: 15,),



                                            Text('Non-Stop',style: CustomStyles.normal10.copyWith(fontSize: 9),)
                                          
                                        ],),

                                        Row(children: <Widget>[
                                          Image.asset('assets/images/location.png',height: 12,)  ,
                                          SizedBox(width: 10,),
                                          Text('Banjarahills, Hyderabad',style: CustomStyles.normal10.copyWith(fontSize: 9),)
                                        ],),
                                        


                                      ],

                                    ),
                                      fit: FlexFit.tight,),

                                    Flexible(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Image.asset(images[index]),
                                        SizedBox(height: 30,),

                                        Align(
                                          alignment: Alignment.bottomRight,
                                            child: Text('RS 1599.00',style: CustomStyles.medium14.copyWith(color: CustomColors.Orange),)),
                                        SizedBox(height: 5,),

                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text('Inc. of tolls & taxes',style: CustomStyles.normal12,))




                                      ],
                                    ),
                                    fit: FlexFit.tight,)


                                  ],


                                )







                              ],
                            ),
                          )





                      ),
                      onTap: (){
                        Navigator.pushNamed(context, Routes.transferDetails);

                      },
                    );
                }),




          )

        ],
      ),
    );
  }
}
