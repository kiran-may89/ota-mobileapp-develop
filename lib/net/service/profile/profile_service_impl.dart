import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ota/models/profile/requests/add_famliy_member.dart';
import 'package:ota/models/profile/requests/get_profile_request.dart';
import 'package:ota/models/profile/responses/common_response.dart';
import 'package:ota/models/profile/responses/family_list.dart';
import 'package:ota/models/profile/responses/update_profile_response.dart';
import 'package:ota/models/profile/responses/web_notification_response.dart';
import 'package:ota/net/service/profile/profile_service.dart';

class ProfileServiceImpl extends ProfileService {
  Dio apiConnector;

  final String _ADD_FAMILY_MEMBERS =
      "profile/api/v1/usercontact/add";

  final String _REMOVE_FAMILY_MEMBERS =
      "profile/api/v1/usercontact/";

  final String _GET_FAMILY_MEMBERS =
      "profile/api/v1/usercontact/";

  final String _GET_PROFILE = "auth/api/v1/Account/GetProfileWithExternalCheck";

  final String _UPDATE_MEMBER = "profile/api/v1/usercontact/update";

  final String _UPDATE_PROFILE = "auth/api/v1/Account/UpdateProfile";

  final String _GET_WEB_NOTIFICATIONS = "/notifications/api/v1/WebNotification/fetch";





  ProfileServiceImpl(this.apiConnector);

  @override
  Future<CommonResponse> addFamilyMember( request) async {
    try {

      Response response = await apiConnector.post(
          _ADD_FAMILY_MEMBERS,
          data: jsonEncode(request.toMap()));
      var data = response.data;
      print(request);
      print(data);
      CommonResponse results =
          CommonResponse.fromMap(data);
      return results;
    } catch (error, stacktrace) {
      CommonResponse results =
          CommonResponse();
      results.isError = true;
      if (error is DioError) {
        results.responseException =
            error.error.toString();
      }

      return results;
    }
  }

  @override
  Future<RelationsList> getFamilyMemersList(
      String uID) async {
    try {
      Response response = await apiConnector.get(
        _GET_FAMILY_MEMBERS + uID,
      );

      RelationsList result =
          RelationsList.fromMap(response.data);

      return result;
    } catch (error, stacktrace) {
      RelationsList results = RelationsList();

      results.isError = true;
      if (error is DioError) {
        results.responseException =
            error.toString();
      }

      return results;
    }
  }

  @override
  Future<CommonResponse> removeFamilyMember(
      String uID) async {
    try {
      Response response =
          await apiConnector.delete(
        _REMOVE_FAMILY_MEMBERS + uID + "/delete",
      );

      CommonResponse result =
          CommonResponse.fromMap(response.data);

      return result;
    } catch (error, stacktrace) {
      CommonResponse results = CommonResponse();

      results.isError = true;
      if (error is DioError) {
        results.responseException =
            error.toString();
      }

      return results;
    }
  }

  @override
  Future<GetProfileResponse> getProfile() async {

    try {
      Response response =
      await apiConnector.get(
        _GET_PROFILE,
      );

      GetProfileResponse result =
      GetProfileResponse.fromMap(response.data);

      return result;
    } catch (error, stacktrace) {
      GetProfileResponse results = GetProfileResponse();

//      results.isError = true;
//      if (error is DioError) {
//        results.responseException =
//        error.toString();
//      }

      return results;
    }


  }

  @override
  Future<CommonResponse> editFamilyMember( body) async {


    try {
      Response response =
      await apiConnector.put(
        _UPDATE_MEMBER,data: jsonEncode(body)
      );

      CommonResponse result =
      CommonResponse.fromMap(response.data);

      return result;
    } catch (error, stacktrace) {
      CommonResponse results = CommonResponse();

//      results.isError = true;
//      if (error is DioError) {
//        results. =
//        error.toString();
//      }

      return results;
    }

  }

  @override
  Future<UpdateProfileResponse> updateUserProfile(body) async {

    try {
      Response response =
      await apiConnector.post(
        _UPDATE_PROFILE,data: jsonEncode(body)
      );

      UpdateProfileResponse result =
      UpdateProfileResponse.fromMap(response.data);

      return result;
    } catch (error, stacktrace) {
      UpdateProfileResponse results = UpdateProfileResponse();

//      results.isError = true;
//      if (error is DioError) {
//        results.responseException =
//        error.toString();
//      }

      return results;
    }

  }

  @override
  Future<WebNotificationResponse> getWebNotifications(body) async {

    try {

      Response response = await apiConnector.post(
      _GET_WEB_NOTIFICATIONS,
      data: jsonEncode(body.toMap()));
      var data = response.data;

      WebNotificationResponse results =
      WebNotificationResponse.fromMap(data);
      return results;
    } catch (error, stacktrace) {
      WebNotificationResponse results =
      WebNotificationResponse();


      return results;
    }


  }



}
