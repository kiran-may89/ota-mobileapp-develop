import 'package:ota/models/activity/full_details_response.dart';
import 'package:ota/models/activity/small_details_response.dart';

class ActivitySummaryInfo {
  String serviceType;
  String fromLocationName;
  String activityName;
  SmallDetailsResponseModalities modalityDetails;
  int selectedPersons;
  String provider;
  FullDetailsResponseImages image;

  ActivitySummaryInfo(
      {this.serviceType,
        this.fromLocationName,
        this.activityName,
        this.modalityDetails,
        this.selectedPersons,
        this.provider,
         this.image});

  ActivitySummaryInfo.fromJson(Map<String, dynamic> json) {
    serviceType = json['serviceType'];
    fromLocationName = json['fromLocationName'];
    activityName = json['activityName'];
    modalityDetails = json['modalityDetails'] != null
        ? new SmallDetailsResponseModalities.fromJson(json['modalityDetails'])
        : null;
    selectedPersons = json['selectedPersons'];
    provider = json['provider'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceType'] = this.serviceType;
    data['fromLocationName'] = this.fromLocationName;
    data['activityName'] = this.activityName;
    if (this.modalityDetails != null) {
      data['modalityDetails'] = this.modalityDetails.toJson();
    }
    data['selectedPersons'] = this.selectedPersons;
    data['provider'] = this.provider;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }
}





