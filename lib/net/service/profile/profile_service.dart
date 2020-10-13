



import 'package:ota/models/profile/requests/add_famliy_member.dart';
import 'package:ota/models/profile/requests/get_profile_request.dart';
import 'package:ota/models/profile/responses/common_response.dart';
import 'package:ota/models/profile/responses/family_list.dart';
import 'package:ota/models/profile/responses/update_profile_response.dart';

abstract class ProfileService {


Future<CommonResponse> addFamilyMember( request);

Future<RelationsList> getFamilyMemersList(String uID);

Future<CommonResponse> removeFamilyMember(String uID);

Future<GetProfileResponse> getProfile();

Future<CommonResponse> editFamilyMember(body);

Future<UpdateProfileResponse> updateUserProfile(body);







}
