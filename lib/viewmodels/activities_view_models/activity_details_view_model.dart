

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ota/models/activity/full_details_response.dart';
import 'package:ota/models/activity/full_details_response_entity.dart';
import 'package:ota/models/activity/request/activity_answers.dart';
import 'package:ota/models/activity/request/activity_details_data.dart';
import 'package:ota/models/activity/request/fill_details_request.dart';
import 'package:ota/models/activity/small_details_response.dart';
import 'package:ota/models/activity/small_details_response_entity.dart';
import 'package:ota/net/service/activity/activity_service.dart';
import 'package:ota/utils/colors.dart';
import 'package:ota/utils/styles.dart';
import 'package:ota/views/activities/fulldetails_data.dart';

class ActivityDetailsModel extends ChangeNotifier{


//  static var price;
//
//  static var duration;

  FullDetailsData fullDetailsData = FullDetailsData();

  TravelDetails travelDetails = TravelDetails();

  ActivityService _activityService;

  bool loading = true;

  List IMAGES = [];

  List<Set> markerList = List();

  List<bool> showRoutes = List();

   var selectionItemList  = List();

   var cancellationDateSelected = List();

   var cancellationDatesList = List();

   bool somethingWentWrong = false;







   FullDetailsResponse fullDetailsResponse = FullDetailsResponse();

   SmallDetailsResponse smallDetailsResponse = SmallDetailsResponse();


  bool showOperationDays = true;

  bool showLocationOptions = true;


  List<String> modalityFromDate  = List();

  List<String> cancellationSelectionDate  = List();

  String correlationId;


  //List<FullDetailsResponseResultActivity> activityDetailList = [];


  //SmallDetailsResponseEntity  smallDetailsResponseEntity = SmallDetailsResponseEntity();


  ActivityDetailsModel(this.fullDetailsData, this.travelDetails,this.correlationId){

    print(correlationId);

    _activityService = GetIt.instance<ActivityService>();

    getDetails();

  }

  Future<void> getDetails() async {



//    requestData = FullDetailsRequest(
//      options: requestData.options,
//      tpa:     requestData.tpa,
//      tpaName: requestData.tpaName,
//      paxes:   requestData.paxes,
//      code:    requestData.code,
//      language:requestData.language,
//      from:    requestData.from,
//      to:      requestData.to,
//    );




    print(fullDetailsData.fullDetailsRequest.toJson());

    fullDetailsResponse =  await  _activityService.getFullDetails(fullDetailsData.fullDetailsRequest);

    if(fullDetailsResponse!=null||fullDetailsResponse.result!=null){




      smallDetailsResponse = await _activityService.getSmallDetails(fullDetailsData.fullDetailsRequest);

      if(smallDetailsResponse!=null||smallDetailsResponse.result!=null){


        setData();


      } else{


        somethingWentWrong = true;


        loading = false;

        notifyListeners();

      }

    }else{

      somethingWentWrong = true;


          loading = false;

      notifyListeners();


    }








  }

  void setData() {



   fullDetailsResponse.result.activity.content.media.images.forEach((element) {
     IMAGES.add(

       Image.network( element.urls[1].resource,fit:BoxFit.fill,)


     );
   });



   if(modalityFromDate==[]||modalityFromDate.length==0||modalityFromDate==null) {
     print("generated");
     modalityFromDate =
     new List<String>.generate(smallDetailsResponse.result.activity.modalities.length, (int index) => "");

     cancellationDateSelected =  new List<int>.generate(smallDetailsResponse.result.activity.modalities.length, (int index) => 0);

   }

   modalityFromDate.asMap().forEach((i,element) {

     modalityFromDate[i] = smallDetailsResponse.result.activity.modalities[i].rates.first.rateDetails.first.operationDatesWithMarkup.first.from.trim();

     print(element);


   });

   print(modalityFromDate);

   print(cancellationDateSelected);


   _setloading(false);




//   fullDetailsResponseEntity.result.activity.modalities[index].rates.first.rateDetails.first.operationDatesWithMarkup.forEach((element) {
//
//
//
//
//
//
//
//   });



  }


  void _setloading(bool value) {
    loading = value;
    notifyListeners();
  }

  void closeOperationDays() {
    if(showOperationDays){

      showOperationDays = false;

    }else{

      showOperationDays = true;

    }
    notifyListeners();



  }

  getWeekDays(FullDetailsResponseActivity activity) {

    List<Widget> weekdays  = List();



    activity.operationDays.forEach((element) {


weekdays.add(
  Container(
    margin: EdgeInsets.all(4),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(color: CustomColors.BackGround,
      borderRadius: BorderRadius.circular(5)
    ),

    child: Text(element.code,style: CustomStyles.medium12.copyWith(color: CustomColors.White),),


  )

);



    });

    return weekdays;






  }

  getFeatureGroups(FullDetailsResponseContent content) {

    List<Widget> featureGroup = List();

    content.featureGroups.forEach((element) { 
      
      
      featureGroup.add(
        Card(

          child: Container(
            padding: EdgeInsets.all(5),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 5,),

                Text(element.groupCode,style: CustomStyles.medium14.copyWith(color:CustomColors.BackGround),) ,
                SizedBox(height: 5,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,

                  children: getDescription(element.included) ,
                ),
                SizedBox(height: 5,),








                //Text(element.included.first.description,style: CustomStyles.heading.copyWith(color: CustomColors.White),)

              ],

            ),
          ),
        )
      );
    });









return featureGroup;





  }

  getDescription(List<FullDetailsResponseIncluded> included) {
    
    List<Widget>includedDetails = List();

    if(included!=null) {
      included.forEach((element) {
        includedDetails.add(

            Text(" - " + element.description,
              style: CustomStyles.medium12.copyWith(
                  color: CustomColors.heading),)

        );
      });
    }else{

      includedDetails.add(

          Text("Not Provided",
            style: CustomStyles.medium12.copyWith(
                color: CustomColors.heading),)

      );

    }


    return includedDetails;

  }

  getSegmentationGroups(FullDetailsResponseContent content) {
    List<Widget> segmentGroup = List();

    content.segmentationGroups.forEach((element) {


      segmentGroup.add(
        Card(

          child: Container(
            padding: EdgeInsets.all(5),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 5,),

                Text(element.name,style: CustomStyles.medium14.copyWith(color:CustomColors.BackGround),) ,
                SizedBox(height: 5,),





                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,

                  children: getSegmentDescription(element.segments) ,
                ),
                SizedBox(height: 5,),








                //Text(element.included.first.description,style: CustomStyles.heading.copyWith(color: CustomColors.White),)

              ],

            ),
          ),
        )
      );


    });


    return segmentGroup;
  }

  getSegmentDescription(List<FullDetailsResponseSegments> segments) {




    List<Widget>segmentDetails = List();

    if(segments!=null) {
      segments.forEach((element) {
        segmentDetails.add(

            Text(" - " + element.name,
              style: CustomStyles.medium12.copyWith(
                  color: CustomColors.heading),)

        );
      });
    }else{

      segmentDetails.add(

          Text("Not Provided",
            style: CustomStyles.medium12.copyWith(
                color: CustomColors.heading),)

      );

    }


    return segmentDetails;




  }

  void closeLocationOpions() {


    if(showLocationOptions){

      showLocationOptions = false;

    }else{

      showLocationOptions = true;

    }
    notifyListeners();

  }

  getLocationOptions(List<FullDetailsResponseStartingPoints> startingPoints) {
    
    List<Widget> startPoints = List();

    startingPoints.forEach((element) {
      
      startPoints.add(
        
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
          Text("Description : ${element.meetingPoint.description}",style: CustomStyles.medium14.copyWith(color:CustomColors.heading)),
          SizedBox(height: 5,),
          Text("Type : ${element.type}",style: CustomStyles.medium14.copyWith(color:CustomColors.heading)),
          SizedBox(height: 5,),
        ],)
        
        
      );
      
      
      
    });
    
    
    
    
    return startPoints;
  }

  getHighLights(List<String> highligths) {

    List<Widget> highlightList = List();

    highligths.forEach((element) {

      highlightList.add(

      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5,),
          Text(" - " + element,
            style: CustomStyles.medium12.copyWith(
                color: CustomColors.heading),),
          SizedBox(height: 5,)

        ],
      )

      );

    });



    return highlightList;

  }



  void showRoutesExpand( int i) {
    print(i);

if(showRoutes[i]){

  showRoutes[i] = false;


}else{

  showRoutes[i] = true ;

}



    notifyListeners();

    print(showRoutes);



  }

  getMarkers(List<FullDetailsResponsePoints> points) {


    Set<Marker> markers = Set();





    points.forEach((element) {

      Marker resultMarker = Marker(
        markerId: MarkerId(element.pointOfInterest.address),
        infoWindow: InfoWindow(
            title: "${element.pointOfInterest.address}",
            snippet: "${element.pointOfInterest.description}"),
        position: LatLng(element.pointOfInterest.geolocation.latitude,element.pointOfInterest.geolocation.longitude),
      );

      markers.add(resultMarker);







    });


return markers;


  }

  getArgumentData(int index) {

    List<SmallDetailsResponseModalities>selectedModality  = List();

    selectedModality.add(smallDetailsResponse.result.activity.modalities[index]);

    ActivityDetailsData activityDetailsData;

        activityDetailsData =  ActivityDetailsData(
             modalitySelectedDate: modalityFromDate[index].toString(),
             provider: smallDetailsResponse.result.activity.tpaName,
             selectedModalityDetails: selectedModality,
            correlationId: correlationId,
            answers: [],
            fullDetailsData: fullDetailsData,
            questions: getQuestions(index),
            totalAmountWithMarkup: smallDetailsResponse.result.activity.modalities[index].rates.first.rateDetails.first.totalAmountWithMarkup,
            travelDetails: travelDetails,
            rateKey: smallDetailsResponse.result.activity.modalities[index].rates.first.rateDetails.first.options.first.value,
            duration:  fullDetailsResponse.result.activity.content.scheduling.duration==null?

            "Full Day":

            fullDetailsResponse.result.activity.content.scheduling.opened.first.openingTime.toString()+ " - "+

              fullDetailsResponse.result.activity.content.scheduling.opened.first.closeTime.toString(),
            currency: fullDetailsResponse.result.activity.amountsFromWithMarkup.first.displayRateInfoWithMarkup.currency,
            options: smallDetailsResponse.result.activity.options,
            activityName: fullDetailsResponse.result.activity.name,
             image: fullDetailsResponse.result.activity.content.media.images[1]

        );

        print(fullDetailsResponse.result.activity.name);


        return activityDetailsData;

  }

  getQuestions(int index) {

    List<QuestionData> questions = List();

    QuestionData questionData ;




   smallDetailsResponse.result.activity.modalities[index].questions.forEach((
      element) {

    questionData = QuestionData(code: element.code, required: element.required, text: element.text);

    questions.add(questionData);

  });


    return questions;

  }

  void changeModalitySelection(int index, selection) {

    modalityFromDate[index] = selection;

    
    smallDetailsResponse.result.activity.modalities[index].rates.first.rateDetails.first.operationDatesWithMarkup.asMap().forEach((i,element) {

      if(element.from == selection){

        print(i);

        print(cancellationDateSelected[index]);



        cancellationDateSelected[index] = i;

        print(cancellationDateSelected[index]);

      }

    });
    print(cancellationDateSelected);

        notifyListeners();
  }

   getCancellationDateWithFormat(int index) {



    int cancelDateIndex = cancellationDateSelected[index];

    print(cancelDateIndex);



    final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(smallDetailsResponse.result.activity.modalities[index].rates.first
        .rateDetails.first.operationDatesWithMarkup[cancelDateIndex].cancellationPolicies.first.dateFrom, false).toLocal();

    final convertedDate = new DateFormat("dd-MMM-yyyy").format(dateTime);

    return convertedDate;

  }







}