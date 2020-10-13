import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';

class PickDates extends StatefulWidget {
  @override
  _PickDatesState createState() => _PickDatesState();
}

class _PickDatesState extends State<PickDates> {

  final month = DateTime.now().month;
  final day = DateTime.now().day;
  final year = DateTime.now().year;
  final days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  Color color = CustomColors.White;
  @override
  Widget build(BuildContext context) {
    final start = difference();
    return Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
      child:
     Container(
       margin: EdgeInsets.all(10),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[


          Container(
            margin: EdgeInsets.only(left: 21,right: 21),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 32),
                  height: 71,
                  child:Row(children: <Widget>[

                    Expanded(child: Container(
                      alignment: Alignment.centerLeft
                      ,

                      child:
                      Image.asset('assets/images/calender.png',height: 20,)
                      ,),flex: 1,),

                    Expanded(child:
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text("Date",style: CustomStyles.cardHeadingStyle,),
                          SizedBox(height: 4,),

                          Text("From 24-Aug, Return 29-Aug",style: CustomStyles.cardContentStyle,)
                        ],
                      ),
                    )


                      ,flex: 9,)
                  ],
                  ),


                ),
                RichText(
                  text: TextSpan(
                      text: DateFormat.MMMM().format(DateTime.now()),
                      style: CustomStyles.heading.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(text: year.toString(),
                            style: CustomStyles.countDownStyle.copyWith(color: CustomColors.disabledButton)
                        )
                      ]
                  ),
                ),
                SizedBox(height: 18,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('SUN',style: CustomStyles.style5.copyWith(color: CustomColors.disabledButton),),
                    Text('MON',style: CustomStyles.style5.copyWith(color: CustomColors.disabledButton),),
                    Text('TUE',style: CustomStyles.style5.copyWith(color: CustomColors.disabledButton),),
                    Text('WED',style: CustomStyles.style5.copyWith(color: CustomColors.disabledButton),),
                    Text('THU',style: CustomStyles.style5.copyWith(color: CustomColors.disabledButton),),
                    Text('FRI',style: CustomStyles.style5.copyWith(color: CustomColors.disabledButton),),
                    Text('SAT',style: CustomStyles.style5.copyWith(color: CustomColors.disabledButton),),
                  ],
                ),


              ],
            ),
          ),





          Container(
            margin: EdgeInsets.only(top: 16,left: 10,right: 10),
            child:
            GridView.builder(
              shrinkWrap: true,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
              itemBuilder: (context, index) {
                if (index < start) {
                  return Container();
                }
                return GestureDetector(
                  child: Container(
                //    color: color,
                    margin: EdgeInsets.only(top: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                       // borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      //  border: Border.all(color: Colors.grey.withOpacity(0.4))
                    ),
                    child: Text('${index + 1 - start}',style: CustomStyles.calenderStyle,),
                  ),
                  onTap: (){

                    print(start);
                    print('${index + 1 - start}');
                    print(index);
                    color=CustomColors.BackGround;
                    setState(() {

                    });
                  },
                );
              },
              itemCount: (month == 2 ?
              checkYear(year) ? days[month - 1] + 1 : days[month - 1]
                  : days[month - 1]) +
                  start,
            ),
          ),
        ],
    ),
     ));
  }

  int difference() {
    String date = DateTime.now().toString();
    String firstDay = date.substring(0, 7) + '01' + date.substring(10);
    int weekDay = DateTime.parse(firstDay).weekday;
    if (weekDay == 7) {
      return 0;
    }
    return weekDay;
  }

  bool checkYear(int year) {
    if (year % 400 == 0) return true;
    if (year % 100 == 0) return false;
    if (year % 4 == 0) return true;
    return false;
  }

  }

