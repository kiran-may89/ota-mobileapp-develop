class CheckAvailability_Request {
  int bnum;
  int pnum;
  String currency;
  int adults;
  int children;
  int infants;
  String tpa;
  List options;

  CheckAvailability_Request(
      {this.bnum,
        this.pnum,
        this.currency,
        this.adults,
        this.children,
        this.infants,
        this.tpa,
        this.options});

  CheckAvailability_Request.fromJson(Map<String, dynamic> json) {
    bnum = json['bnum'];
    pnum = json['pnum'];
    currency = json['currency'];
    adults = json['adults'];
    children = json['children'];
    infants = json['infants'];
    tpa = json['tpa'];
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bnum'] = this.bnum;
    data['pnum'] = this.pnum;
    data['currency'] = this.currency;
    data['adults'] = this.adults;
    data['children'] = this.children;
    data['infants'] = this.infants;
    data['tpa'] = this.tpa;
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