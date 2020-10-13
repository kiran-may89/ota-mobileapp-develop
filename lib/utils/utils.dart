import 'package:intl/intl.dart';

// return date string from 24 Aug
String convertToDate(String date) {
  var parsedDate = DateTime.parse(date);
  return DateFormat('dd MMM').format(parsedDate);
}

String converHotelDate(String date) {
  //2020-09-11T00:00:00
  var parsedDate = DateTime.parse(date);
  return DateFormat('MM-dd-yyyy').format(parsedDate);
}
RegExp passwordExp = RegExp( r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',caseSensitive: true,multiLine: false);
