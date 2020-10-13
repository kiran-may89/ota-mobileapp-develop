class SearchTransferRequest {
  String tenantId;
  StartPoint startPoint;
  StartPoint finishPoint;
//  String pickDate;
  String clientNationality;
  String currency;
//  int adultCnt;
//  List<Childrens> children;

  SearchTransferRequest(
      {this.tenantId,
        this.startPoint,
        this.finishPoint,
       // this.pickDate,
        this.clientNationality,
        this.currency,
//        this.adultCnt,
//        this.children
      });

  SearchTransferRequest.fromJson(Map<String, dynamic> json) {
    tenantId = json['tenantId'];
    startPoint = json['startPoint'] != null
        ? new StartPoint.fromJson(json['startPoint'])
        : null;
    finishPoint = json['finishPoint'] != null
        ? new StartPoint.fromJson(json['finishPoint'])
        : null;
   // pickDate = json['pickDate'];
    clientNationality = json['clientNationality'];
    currency = json['currency'];
//    adultCnt = json['adultCnt'];
//    if (json['children'] != null) {
//      children = new List<Childrens>();
//      json['children'].forEach((v) {
//        children.add(new Childrens.fromJson(v));
//      });
//    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenantId'] = this.tenantId;
    if (this.startPoint != null) {
      data['startPoint'] = this.startPoint.toJson();
    }
    if (this.finishPoint != null) {
      data['finishPoint'] = this.finishPoint.toJson();
    }
  //  data['pickDate'] = this.pickDate;
    data['clientNationality'] = this.clientNationality;
    data['currency'] = this.currency;
//    data['adultCnt'] = this.adultCnt;
//    if (this.children != null) {
//      data['children'] = this.children.map((v) => v.toJson()).toList();
//    }
    return data;
  }
}

class StartPoint {
  double lat;
  double lng;

  StartPoint({this.lat, this.lng});

  StartPoint.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Childrens {
  int childAge;

  Childrens({this.childAge});

  Childrens.fromJson(Map<String, dynamic> json) {
    childAge = json['childAge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['childAge'] = this.childAge;
    return data;
  }
}