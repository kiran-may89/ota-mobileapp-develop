import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/utils/Dash_seperator.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';


class ActivityResultsCard extends StatefulWidget {
  @override
  _ActivityResultsCardState createState() => _ActivityResultsCardState();
}

class _ActivityResultsCardState extends State<ActivityResultsCard> {

  List images = ['assets/images/activity1.png','assets/images/activity2.png','assets/images/activity3.png'];
  List title = ['Dubai Airport Facilities At G-Force Health Club','Half Day Dubai City Tour','Dubai Dolphinarium'];
  List cost = ['SAR 56','SAR 67','SAR 109'];

  @override
  Widget build(BuildContext context) {
    return

      Container(
      margin: EdgeInsets.only(left:25,right: 25,top: 10),
      child: Column(
        children: <Widget>[

          SizedBox(
            height: 45,
            child: TextField(

              decoration: InputDecoration(enabled: false,
                prefixIcon: Padding(child: Icon(Icons.search,color: CustomColors.White,),
                  padding: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),

                ),
                fillColor: CustomColors.White.withOpacity(.5),filled: true,
                labelText: "Search by Name",
                labelStyle: CustomStyles.normal12.copyWith(color: CustomColors.White),

                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                //contentPadding: EdgeInsets.only(left: 15),
                //prefixIconConstraints: BoxConstraints(maxWidth: 25,maxHeight: 25),

              ),

            ),
          ),


          Expanded(
            child:


            ListView.builder(
                itemCount: 3, // records.length
                itemBuilder: (BuildContext context, int index) {
                  return
                    GestureDetector(
                      child:
                      Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 3,
                          margin: EdgeInsets.only(top: 10,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child:
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 190,
                           // margin: EdgeInsets.only(left: 23,right: 23,top: 20,bottom: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                               Expanded(
                                 flex: 4,

                                   child: Image.asset( images[index],fit: BoxFit.cover,height: 190,)),
                                Expanded(
                                  flex: 6,
                                    child: Stack(
                                      children: <Widget>[
//                                        Container(
//                                          alignment: Alignment.bottomRight,
//                                          margin: EdgeInsets.only(bottom: 20.0),
//                                          child: ClipPath(
//                                            clipper: ArcClipper(),
//                                            child: Container(
//                                                width: 90.0,
//                                                height: 70.0,
//                                                padding: EdgeInsets.all(8.0),
//                                                color: CustomColors.Red,
//                                                child: Center(
//                                                    child: Text(
//                                                      '25%',
//                                                      style: TextStyle(
//                                                          color: Colors.white,
//                                                          fontWeight: FontWeight.bold,
//                                                          fontSize: 20.0),
//                                                    ))),
//                                          ),
//                                        ),



                                        Container(
                                          alignment: Alignment.topCenter,
                                          padding: EdgeInsets.only(left: 15,top: 15,bottom: 15,right: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Flexible(
                                                fit:FlexFit.loose ,
                                                  child: Text(title[index],style: CustomStyles.medium14,)),
                                              IconButton(icon: Icon(Icons.favorite,color:CustomColors.Orange,), onPressed: (){})

                                            ],
                                          ),
                                            SizedBox(height: 10,),
                                             Row(children: <Widget>[
                                                 Image.asset('assets/images/location.png',height: 13,) ,
                                                 SizedBox(width: 10,),
                                                 Text('Dubai',style: CustomStyles.normal9,)

                                        ],),
                                        SizedBox(height: 5,),
                                        Text('Duration : 1 Day',style: CustomStyles.normal9,),
                                        Spacer(),
                                        Text(cost[index],style: CustomStyles.medium14.copyWith(color: CustomColors.Orange),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('Exclusive Tax',style: CustomStyles.normal9,),

                                            Text('Save Rs 5000',style: CustomStyles.normal9,),
                                          ],
                                        )





                                  ],

                                ),
                                        ),
                                      ],
                                    ))







                              ],
                            ),
                          )





                      ),
                      onTap: (){
                        Navigator.pushNamed(context, Routes.activityDetails);

                      },
                    );
                }),




          )

        ],
      ),
    );
  }
}


class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    var path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


//path.lineTo(7.0, 0.0);
//
//var firstControlPoint = Offset(5.0, 5.0);
//var firstPoint = Offset(7.5, 2.0);
//path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//firstPoint.dx, firstPoint.dy);
//
//var secondControlPoint = Offset(0.0, 15.0);
//var secondPoint = Offset(2.0, 7.5);
//path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//secondPoint.dx, secondPoint.dy);
//
//path.lineTo(size.width, 0.0);
//path.lineTo(size.width, size.height);
//path.lineTo(size.width/2, size.height-20);
//path.lineTo( 0.0,size.height);
//path.close();
