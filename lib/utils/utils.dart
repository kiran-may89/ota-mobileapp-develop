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

RegExp passwordExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$', caseSensitive: true, multiLine: false);
String getIcon(String name) {
  switch (name) {
    case "Internet access":
    case "WLAN access":
      return "assets/images/ameneties/wifi.png";

    case "Car Park":
      return "assets/images/ameneties/parking.png";

    case "Restaurant(s)":
    case "Restaurant":
      return "assets/images/ameneties/restuarant.png";

    case "Bar(s)":
    case "Bar":
      return "assets/images/ameneties/bar.png";

    case "Air conditioning":
    case "Ac":
      return "assets/images/ameneties/ac.png";

    default:
      return "assets/images/ameneties/pets.png";
  }
  ;
}
