


class Answers{


  QuestionData questions;

  String answer;

  Answers({this.questions,this.answer});



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;

   // data['question'] = this.questions;


    if (this.questions != null) {
      data['question'] = this.questions.toJson();
    }
    return data;
  }


}


class QuestionData {
  String code;
  String text;
  String required;

  QuestionData({this.code, this.text,this.required});

  QuestionData.fromJson(Map<String, dynamic> json) {
    code =     json['code'];
    text =     json['text'];
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




