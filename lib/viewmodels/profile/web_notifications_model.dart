
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/profile/requests/web_notification_request.dart';
import 'package:ota/models/profile/responses/web_notification_response.dart';
import 'package:ota/net/service/profile/profile_service.dart';
import 'package:ota/prefs/session_manager.dart';
import 'package:ota/prefs/shared_prefernce.dart';

class WebNotificationModel extends ChangeNotifier{

WebNotificationResponse webNotificationResponse = WebNotificationResponse();

ProfileService _profileService;

SessionManager sessionManager;

WebNotificationModel(){

_profileService = GetIt.instance<ProfileService>();

sessionManager = SessionManager.getInstance();

}



 Future<WebNotificationResponse> getWebNotifications() async {


WebNotificationRequest webNotificationRequest  = new WebNotificationRequest(userId:sessionManager.getUser.sub,isRead: false);



 webNotificationResponse = await _profileService.getWebNotifications(webNotificationRequest);

 return webNotificationResponse;

 }












}