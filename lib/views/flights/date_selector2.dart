import 'package:age/age.dart';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/viewmodels/flights_view_model/flight_results_model.dart';
import 'package:ota/viewmodels/flights_view_model/flightbookingModel.dart';
import 'package:ota/viewmodels/flights_view_model/passenger_info_model.dart';
import 'package:provider/provider.dart';




enum CalendarViews{ dates, months, year }



class DateSelector2 extends StatefulWidget {

  FlightPassengerInfoModel model;
  BuildContext context;
  bool DOB;
  int passengerType;
  int index;


  DateSelector2(this.model, this.context,this.DOB, this.index, this.passengerType);

  @override
  _DateSelector2State createState() => _DateSelector2State(this.model, this.context,this.DOB,this.index,this.passengerType);
}

class _DateSelector2State extends State<DateSelector2> {

  FlightPassengerInfoModel model;
  BuildContext context;
  bool DOB;
  int passengerType;
  int index;

  _DateSelector2State(this.model, this.context,this.DOB,this.index,this.passengerType);



  bool range;

  DateTime _currentDateTime;

  List<Calendar> _sequentialDates;
  int midYear;
  CalendarViews _currentView = CalendarViews.dates;
  final List<String> _weekDays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  final List<String> _monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];




  @override
  Widget build( context) {


    return ChangeNotifierProvider.value(

        value: model,

        child:

        Consumer<FlightPassengerInfoModel>(builder: (context, model,child){



          return Scaffold(
            backgroundColor: CustomColors.White,
            body: Center(
              child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),

                  decoration: BoxDecoration(
                    color: CustomColors.White,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: (_currentView == CalendarViews.dates) ? _datesView()
                      : (_currentView == CalendarViews.months) ? _showMonthsList() : _yearsView(midYear ?? _currentDateTime.year)
              ),







            ),
          );







        }



        )

    );





  }

  // dates view
  Widget _datesView(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // header
        Row(
          children: <Widget>[
            // prev month button
            _toggleBtn(false),
            // month and year
            Expanded(
              child: InkWell(
                onTap: () {

                  setState(() => _currentView = CalendarViews.months);
                },
                child: Center(
                    child:

                    RichText(
                      text: TextSpan(
                          text: _monthNames[_currentDateTime.month-1]+" " ,
                          style: CustomStyles.heading.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(text: _currentDateTime.year.toString(),
                                style: CustomStyles.countDownStyle.copyWith(color: CustomColors.disabledButton)
                            )
                          ]
                      ),
                    )

                ),
              ),
            ),
            // next month button
            _toggleBtn(true),
          ],
        ),
        Flexible(child: _calendarBody()),
      ],
    );
  }

  // next / prev month buttons
  Widget _toggleBtn(bool next) {
    return InkWell(
      onTap: (){
        if(_currentView == CalendarViews.dates){
          setState(() => (next) ? _getNextMonth() : _getPrevMonth());
        }
        else if(_currentView == CalendarViews.year){
          if(next){
            midYear = (midYear == null) ? _currentDateTime.year + 9 : midYear + 9;
          }
          else{
            midYear = (midYear == null) ? _currentDateTime.year - 9 : midYear - 9;
          }
          setState(() {});
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                offset: Offset(3, 3),
                blurRadius: 3,
                spreadRadius: 0,
              ),
            ],
            color: CustomColors.White
        ),
        child: Icon((next) ? Icons.arrow_forward_ios : Icons.arrow_back_ios, color: CustomColors.disabledButton,),
      ),
    );
  }

  // calendar
  Widget _calendarBody() {


    if(_sequentialDates == null) return Container();
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,physics: NeverScrollableScrollPhysics(),
      itemCount: _sequentialDates.length + 7,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // mainAxisSpacing: 15,
        crossAxisCount: 7,
        //crossAxisSpacing: 25,
      ),
      itemBuilder: (context, index){
        if(index < 7) return _weekDayTitle(index);

       // if(model.oneWay){


          if(_sequentialDates[index - 7].date == model.tempDate) {
            return _selector(_sequentialDates[index - 7]);
          }else{

            return _calendarDatesOneWay(_sequentialDates[index - 7]);

          }
       // }
//        else  {
//          if (_sequentialDates[index - 7].date == _selectedToDateTime) {
//            return _selector2(_sequentialDates[index - 7]);
//          }else if(_sequentialDates[index - 7].date == _selectedFromDateTime) {
//            return _selector(_sequentialDates[index - 7]);
//          }
//          else if(
//          _selectedToDateTime!=null&&_selectedFromDateTime!=null&&
//              (_sequentialDates[index - 7].date.isAfter(_selectedFromDateTime))
//              &&(_sequentialDates[index - 7].date.isBefore(_selectedToDateTime))) {
//            return _selector3(_sequentialDates[index - 7]);
//          } else {
//            return _calendarDates(_sequentialDates[index - 7]);
//          }
//
//        }
      }
      ,
    );
  }

  // calendar header
  Widget _weekDayTitle(int index){
    return Container(
        padding: EdgeInsets.all(5),
        child: Text(_weekDays[index], style: CustomStyles.style5.copyWith(color: CustomColors.disabledButton)));
  }



  // date selector
  Widget _selector(Calendar calendarDate) {

    print("This_is_From_Date");

    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CustomColors.BackGround,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        '${calendarDate.date.day}',
        style:CustomStyles.calenderStyle.copyWith(color: CustomColors.White),
      ),
    );
  }

  // get next month calendar
  void _getNextMonth(){
    if(_currentDateTime.month == 12) {
      _currentDateTime = DateTime(_currentDateTime.year+1, 1);
    }
    else{
      _currentDateTime = DateTime(_currentDateTime.year, _currentDateTime.month+1);
    }
    _getCalendar();
  }

  // get previous month calendar
  void _getPrevMonth(){
    if(_currentDateTime.month == 1){
      _currentDateTime = DateTime(_currentDateTime.year-1, 12);
    }
    else{
      _currentDateTime = DateTime(_currentDateTime.year, _currentDateTime.month-1);
    }
    _getCalendar();
  }

  // get calendar for current month
  void _getCalendar(){
    _sequentialDates = CustomCalendar().getMonthCalendar(_currentDateTime.month, _currentDateTime.year, startWeekDay: StartWeekDay.monday);
  }

  // show months list
  Widget _showMonthsList(){
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () => setState(() => _currentView = CalendarViews.year),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('${_currentDateTime.year}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
          ),
        ),
        Divider(color: Colors.white,),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _monthNames.length,
            itemBuilder: (context, index) => ListTile(
              onTap: (){
                _currentDateTime = DateTime(_currentDateTime.year, index+1);
                _getCalendar();
                setState(() => _currentView = CalendarViews.dates);
              },
              title: Center(
                child: (index == _currentDateTime.month-1) ?

                Container(
                  decoration: BoxDecoration(
                    color: CustomColors.BackGround,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(8),

                  child: Text(
                      _monthNames[index],
                      style: CustomStyles.heading.copyWith(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white)
                  ),

                ):

                Text(
                  _monthNames[index],
                  style: CustomStyles.heading.copyWith(fontWeight: FontWeight.bold,fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // years list views
  Widget _yearsView(int midYear){
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            _toggleBtn(false),
            Spacer(),
            _toggleBtn(true),
          ],
        ),
        Expanded(
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index){
                int thisYear;
                if(index < 4){
                  thisYear = midYear - (4 - index);
                }
                else if(index > 4){
                  thisYear = midYear + (index - 4);
                }
                else{
                  thisYear = midYear;
                }
                return
                  ListTile(
                    onTap: (){
                      _currentDateTime = DateTime(thisYear, _currentDateTime.month);
                      _getCalendar();
                      setState(() => _currentView = CalendarViews.months);
                    },
                    title: Center(
                      child: (thisYear == _currentDateTime.year) ?

                      Container(
                        decoration: BoxDecoration(
                          color: CustomColors.BackGround,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(8),

                        child: Text(
                            '$thisYear',
                            style: CustomStyles.heading.copyWith(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white)
                        ),

                      ):

                      Text(
                        '$thisYear',
                        style:  CustomStyles.heading.copyWith(fontWeight: FontWeight.bold,fontSize: 16,color: CustomColors.heading),
                      ),
                    ),
                  );
              }
          ),
        ),
      ],
    );
  }



  @override
  void initState() {
    super.initState();
    final date = DateTime.now();
    _currentDateTime = DateTime(date.year, date.month);

    if(DOB){
      if(model.getPassengerDOB(index, passengerType)!=""){

      DateTime dateTime = DateFormat("dd-MM-yyyy").parse(model.getPassengerDOB(index, passengerType));

    model.tempDate   = dateTime;

    }

    }else{

      if(model.getPassengerPassportExpData(index, passengerType)!=""){

        DateTime dateTime = DateFormat("dd-MM-yyyy").parse(model.getPassengerDOB(index, passengerType));

        model.tempDate = dateTime;

      }

    }




    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() => _getCalendar());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _calendarDatesOneWay(Calendar calendarDate) {

    return InkWell(
      onTap: (){

        if(DOB) {
          if (calendarDate.date.isBefore(DateTime.now()))
            if ( model.tempDate != calendarDate.date) {
              if (calendarDate.nextMonth) {
                _getNextMonth();
              }
              else if (calendarDate.prevMonth) {
                _getPrevMonth();
              }
              // model.upDestinationDate(calendarDate.date);

              print(calendarDate.date);

              setState(() =>  model.tempDate = calendarDate.date);
            }

        }else{

          if (calendarDate.date.isAfter(( DateTime(DateTime.now().year, DateTime.now().month +6, DateTime.now().day)) )) {
            print(DOB);

            if (model.tempDate != calendarDate.date) {
              if (calendarDate.nextMonth) {
                _getNextMonth();
              }
              else if (calendarDate.prevMonth) {
                _getPrevMonth();
              }
              // model.upDestinationDate(calendarDate.date);

              print(calendarDate.date);

              setState(() =>
              model.tempDate = calendarDate.date);
            }
          }


        }




      }


      ,
      child: Container(
          alignment: Alignment.center,
          width: 20,
          height: 20,
          child: Text(
              '${calendarDate.date.day}',
              style:
                  DOB?
              (calendarDate.date.isBefore(DateTime.now()))?
              CustomStyles.calenderStyle.copyWith(color: CustomColors.heading):
              CustomStyles.calenderStyle:calendarDate.date.isAfter(( DateTime(DateTime.now().year, DateTime.now().month +6, DateTime.now().day)) )?CustomStyles.calenderStyle.copyWith(color: CustomColors.heading):CustomStyles.calenderStyle

//            (calendarDate.thisMonth)
//            ? (calendarDate.date.weekday == DateTime.sunday) ? CustomColors.disabledButton : CustomColors.disabledButton
//            : (calendarDate.date.weekday == DateTime.sunday) ? Colors.yellow.withOpacity(0.5) : Colors.white.withOpacity(0.5),
//          ),
          )
      ),
    );




  }

  bool isAfter6Months(DateTime date) {


      AgeDuration timeDifference =
      Age.dateDifference(fromDate: date  , toDate: DateTime.now() );

      print(timeDifference.months);
      print(DateTime.now());
      print(date);
      print(timeDifference.years);


      return  timeDifference.months>6;


  }
}



class CustomCalendar{

  // number of days in month [JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP, OCT, NOV, DEC]
  final List<int> _monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  // check for leap year
  bool _isLeapYear(int year){
    if(year % 4 == 0){
      if(year % 100 == 0){
        if(year % 400 == 0) return true;
        return false;
      }
      return true;
    }
    return false;
  }

  /// get the month calendar
  /// month is between from 1-12 (1 for January and 12 for December)
  List<Calendar> getMonthCalendar(int month, int year, {StartWeekDay startWeekDay = StartWeekDay.sunday}){

    // validate
    if(year == null || month == null || month < 1 || month > 12) throw ArgumentError('Invalid year or month');

    List<Calendar> calendar = List<Calendar>();

    // used for previous and next month's calendar days
    int otherYear;
    int otherMonth;
    int leftDays;

    // get no. of days in the month
    // month-1 because _monthDays starts from index 0 and month starts from 1
    int totalDays = _monthDays[month - 1];
    // if this is a leap year and the month is february, increment the total days by 1
    if(_isLeapYear(year) && month == DateTime.february) totalDays++;

    // get this month's calendar days
    for(int i=0; i<totalDays; i++){
      calendar.add(
        Calendar(
          // i+1 because day starts from 1 in DateTime class
          date: DateTime(year, month, i+1),
          thisMonth: true,
        ),
      );
    }

    // fill the unfilled starting weekdays of this month with the previous month days
    if(
    (startWeekDay == StartWeekDay.sunday && calendar.first.date.weekday != DateTime.sunday) ||
        (startWeekDay == StartWeekDay.monday && calendar.first.date.weekday != DateTime.monday)
    ){
      // if this month is january, then previous month would be decemeber of previous year
      if(month == DateTime.january){
        otherMonth = DateTime.december; // _monthDays index starts from 0 (11 for december)
        otherYear = year-1;
      }
      else{
        otherMonth = month - 1;
        otherYear = year;
      }
      // month-1 because _monthDays starts from index 0 and month starts from 1
      totalDays = _monthDays[otherMonth - 1];
      if(_isLeapYear(otherYear) && otherMonth == DateTime.february) totalDays++;

      leftDays = totalDays - calendar.first.date.weekday + ((startWeekDay == StartWeekDay.sunday) ? 0 : 1);

      for(int i=totalDays; i>leftDays; i--){
        calendar.insert(0,
          Calendar(
            date: DateTime(otherYear, otherMonth, i),
            prevMonth: true,
          ),
        );
      }
    }

    // fill the unfilled ending weekdays of this month with the next month days
    if(
    (startWeekDay == StartWeekDay.sunday && calendar.last.date.weekday != DateTime.saturday) ||
        (startWeekDay == StartWeekDay.monday && calendar.last.date.weekday != DateTime.sunday)
    ){
      // if this month is december, then next month would be january of next year
      if(month == DateTime.december){
        otherMonth = DateTime.january;
        otherYear = year+1;
      }
      else{
        otherMonth = month+1;
        otherYear = year;
      }
      // month-1 because _monthDays starts from index 0 and month starts from 1
      totalDays = _monthDays[otherMonth-1];
      if(_isLeapYear(otherYear) && otherMonth == DateTime.february) totalDays++;

      leftDays = 7 - calendar.last.date.weekday - ((startWeekDay == StartWeekDay.sunday) ? 1 : 0);
      if(leftDays == -1) leftDays = 6;

      for(int i=0; i<leftDays; i++){
        calendar.add(
          Calendar(
            date: DateTime(otherYear, otherMonth, i+1),
            nextMonth: true,
          ),
        );
      }
    }

    return calendar;

  }
}

class Calendar{
  final DateTime date;
  final bool thisMonth;
  final bool prevMonth;
  final bool nextMonth;

  Calendar({
    this.date,
    this.thisMonth = false,
    this.prevMonth = false,
    this.nextMonth = false
  });
}

enum StartWeekDay {sunday, monday}