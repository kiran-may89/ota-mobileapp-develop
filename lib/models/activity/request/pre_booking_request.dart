class PreBookingRequest {
  String language;
  String clientReference;
  Holder holder;
  List<Activities> activities;
  int tpa;
  String tpaName;
  List options;

  PreBookingRequest(
      {this.language,
        this.clientReference,
        this.holder,
        this.activities,
        this.tpa,
        this.tpaName,
        this.options});

  PreBookingRequest.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    clientReference = json['clientReference'];
    holder =
    json['holder'] != null ? new Holder.fromJson(json['holder']) : null;
    if (json['activities'] != null) {
      activities = new List<Activities>();
      json['activities'].forEach((v) {
        activities.add(new Activities.fromJson(v));
      });
    }
    tpa = json['tpa'];
    tpaName = json['tpaName'];
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['clientReference'] = this.clientReference;
    if (this.holder != null) {
      data['holder'] = this.holder.toJson();
    }
    if (this.activities != null) {
      data['activities'] = this.activities.map((v) => v.toJson()).toList();
    }
    data['tpa'] = this.tpa;
    data['tpaName'] = this.tpaName;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Holder {
  String name;
  String title;
  String email;
  String address;
  String zipCode;
  bool mailing;
  String mailUpdDate;
  String country;
  String surname;
  List<String> telephones;

  Holder(
      {this.name,
        this.title,
        this.email,
        this.address,
        this.zipCode,
        this.mailing,
        this.mailUpdDate,
        this.country,
        this.surname,
        this.telephones});

  Holder.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    email = json['email'];
    address = json['address'];
    zipCode = json['zipCode'];
    mailing = json['mailing'];
    mailUpdDate = json['mailUpdDate'];
    country = json['country'];
    surname = json['surname'];
    telephones = json['telephones'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['email'] = this.email;
    data['address'] = this.address;
    data['zipCode'] = this.zipCode;
    data['mailing'] = this.mailing;
    data['mailUpdDate'] = this.mailUpdDate;
    data['country'] = this.country;
    data['surname'] = this.surname;
    data['telephones'] = this.telephones;
    return data;
  }
}

class Activities {
  String preferedLanguage;
  String serviceLanguage;
  String rateKey;
  String from;
  String to;
  List<Paxes> paxes;
  List answers;

  Activities(
      {this.preferedLanguage,
        this.serviceLanguage,
        this.rateKey,
        this.from,
        this.to,
        this.paxes,
        this.answers});

  Activities.fromJson(Map<String, dynamic> json) {
    preferedLanguage = json['preferedLanguage'];
    serviceLanguage = json['serviceLanguage'];
    rateKey = json['rateKey'];
    from = json['from'];
    to = json['to'];
    if (json['paxes'] != null) {
      paxes = new List<Paxes>();
      json['paxes'].forEach((v) {
        paxes.add(new Paxes.fromJson(v));
      });
    }
    if (json['answers'] != null) {
      answers = new List<Answers>();
      json['answers'].forEach((v) {
        answers.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preferedLanguage'] = this.preferedLanguage;
    data['serviceLanguage'] = this.serviceLanguage;
    data['rateKey'] = this.rateKey;
    data['from'] = this.from;
    data['to'] = this.to;
    if (this.paxes != null) {
      data['paxes'] = this.paxes.map((v) => v.toJson()).toList();
    }
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paxes {
  String type;
  String name;
  String surname;
  String age;

  Paxes({this.type, this.name, this.surname, this.age});

  Paxes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    surname = json['surname'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['age'] = this.age;
    return data;
  }
}

class Answers {
  Question question;
  String answer;

  Answers({this.question, this.answer});

  Answers.fromJson(Map<String, dynamic> json) {
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.question != null) {
      data['question'] = this.question.toJson();
    }
    data['answer'] = this.answer;
    return data;
  }
}

class Question {
  String code;
  String text;
  String required;

  Question({this.code, this.text, this.required});

  Question.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    text = json['text'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['text'] = this.text;
    data['required'] = this.required;
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