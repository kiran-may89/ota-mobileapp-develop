
import 'package:ota/models/search_activity.dart';

class FullDetailsRequest {


  String code;
  String from;
  String to;
  String language;
  List paxes;
  int tpa;
  String tpaName;
  List options;
  List<int>age;

  FullDetailsRequest(
      {this.code,
        this.from,
        this.to,
        this.language,
        this.paxes,
        this.tpa,
        this.age,
        this.tpaName,
        this.options});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['from'] = this.from;
    data['to'] = this.to;
    data['language'] = this.language;
    if (this.paxes != null) {
      data['paxes'] = this.paxes.map((v) => v.toJson()).toList();
    }
    data['tpa'] = this.tpa;
    data['tpaName'] = this.tpaName;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Options {
  String key;
  String value;

  Options({this.key, this.value});

  Options.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}






class TravelDetails{

  String FromDateMonth;

  String ToMonth;

  int count;

  String FromPlace;

  TravelDetails({this.FromDateMonth,this.ToMonth,this.count,this.FromPlace});

}

