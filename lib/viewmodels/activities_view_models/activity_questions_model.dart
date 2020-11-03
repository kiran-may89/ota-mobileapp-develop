

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/app/Router.dart';
import 'package:ota/app/app_localizations.dart';
import 'package:ota/models/activity/request/activity_answers.dart';
import 'package:ota/models/activity/request/activity_details_data.dart';
import 'package:ota/models/activity/request/activity_questions_data.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/views/activities/activity_questions.dart';

class questions_model extends ChangeNotifier {



  ActivityDetailsData activityDetailsData;

  List<String>answers = List();

  questions_model(this.activityDetailsData){

    print(activityDetailsData.questions.first.text);


    if(answers==[]||answers.length==0||answers==null) {
      print("generated");
      answers =
      new List<String>.generate(activityDetailsData.questions.length, (int index) => "");
    }


  }

  getQuestions() {

    List<Widget> questionsList = List();


    activityDetailsData.questions.asMap().forEach((i,item) {
      if (item.required == "true") {
        questionsList.add(

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text(item.text, style: CustomStyles.medium16,),

                SizedBox(height: 7,),

                Container(
                  child: TextField(

                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 5.0),
                      ),
                      hintText: 'Answer Here',
                    ),

                    onChanged: (text){

                      changeAnser(i,text);
                    },

                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),



                ),

                SizedBox(height: 25,),




              ],
            )


        );
      }
    });





return questionsList;

  }

  void changeAnser(int i, String text) {


    answers[i] = text;

    notifyListeners();

  }

   getAnswersData() {

    List<Answers> answersList = List();
    Answers answerData ;

    answers.asMap().forEach((i,element) {



      answerData =  Answers(
          questions: activityDetailsData.questions[i],
          answer: answers[i]
      );


      answersList.add(

        answerData

      );
      print(answerData.toJson());



    });


    print(answersList);


return answersList;


  }

  getArgumentData() {

    activityDetailsData.answers = getAnswersData();



//    activityQuestionsData =
//        ActivityQuestionsData(fullDetailsData: activityDetailsData.fullDetailsData,
//                              answers:getAnswersData(),
//                              totalAmountWithMarkup:activityDetailsData.totalAmountWithMarkup,
//                               travelDetails: activityDetailsData.travelDetails,
//                               rateKey: activityDetailsData.rateKey,
//                               Duration: activityDetailsData.Duration,
//                                Currency: activityDetailsData.Currency,
//                                Options: activityDetailsData.Options,
//                                 activityName: activityDetailsData.activityName
//
//                                );





return activityDetailsData;

  }

  bool validateData(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context)
  {
    SnackBar snackBar;

    answers.asMap().forEach((index,element) {
      if (element == "") {
        snackBar = SnackBar(content: Text(
          "${getLocalText("please_answer_question", context)} ${(index + 1)
              .toString()}",
          style: CustomStyles.medium16.copyWith(color: CustomColors.White),),
          backgroundColor: CustomColors.BackGround,
        );

        scaffoldKey.currentState.showSnackBar(snackBar);
        return false;
      }


    });
    return true;
  }











  getLocalText(String key, BuildContext context) {

    return  AppLocalizations.of(context).translate(key);
  }




}