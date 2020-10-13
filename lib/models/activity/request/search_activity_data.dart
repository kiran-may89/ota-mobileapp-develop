import 'package:ota/models/transfers/requests/search_transfer_request.dart';

class SearchActivityData{


  StartPoint startPoint;

  String startPlaceName;

  String fromDate;

  String fromDateMonth;

  String returnDate;

  String returnDateMonth;

  String language;

  int adultCnt;

  String bookingDateMonth;

  List<int> Age;




  String dateTime;



  SearchActivityData({this.startPoint,this.startPlaceName,this.fromDate,
    this.fromDateMonth,this.returnDate,
    this.returnDateMonth,this.adultCnt,this.Age,this.language});







}