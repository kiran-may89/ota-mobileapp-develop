class TravelInfoModel {
  String title;
  String email;
  String surname;
  String name;
  String phone;
  String birthday;
  String nationality;
  String category;
  String cardno;
  String expiration;
  dynamic holdBags;

  TravelInfoModel(
      {this.title,
        this.email,
        this.surname,
        this.name,
        this.phone,
        this.birthday,
        this.nationality,
        this.category,
        this.cardno,
        this.expiration,
        this.holdBags});

  TravelInfoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    email = json['email'];
    surname = json['surname'];
    name = json['name'];
    phone = json['phone'];
    birthday = json['birthday'];
    nationality = json['nationality'];
    category = json['category'];
    cardno = json['cardno'];
    expiration = json['expiration'];
    holdBags = json['hold_bags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['email'] = this.email;
    data['surname'] = this.surname;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    data['nationality'] = this.nationality;
    data['category'] = this.category;
    data['cardno'] = this.cardno;
    data['expiration'] = this.expiration;
    data['hold_bags'] = this.holdBags;
    return data;
  }
}