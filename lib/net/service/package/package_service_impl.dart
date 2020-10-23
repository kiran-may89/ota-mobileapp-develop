import 'package:dio/dio.dart';
import 'package:ota/models/packages/categories_list.dart';
import 'package:ota/models/packages/destinations_list.dart';
import 'package:ota/models/packages/group_by_category.dart';
import 'package:ota/models/packages/group_by_destinations.dart';
import 'package:ota/models/packages/package_results.dart';
import 'package:ota/net/service/package/package_service.dart';

class PackageServiceImpl extends PackageService {
  Dio apiConnector;

  PackageServiceImpl(this.apiConnector);

  final String _GET_BY_CATEGORY = "package/api/v1/Package/GetAllByCategory/";

  final String GET_BY_DESTINATION = "package/api/v1/Package/GetAllByDestination/";

  final String GET_PACKAGES = "package/api/v1/Package";

  final String GET_CATEGORY_DESTINATIONS_LIST = "package/api/v1/TblPkgeLookupEntitiesValues/GetAllByEntityId/";


  @override
  Future<
  GroupByCategoryResults> getPackageByCategory(int id) async {
    try {
      Response response = await apiConnector.get(
        _GET_BY_CATEGORY+id.toString(),
      );

      var data = response.data;

      GroupByCategoryResults results = GroupByCategoryResults
      .fromMap(data);

      return results;
    } catch (error, stacktrace) {
      GroupByCategoryResults results = GroupByCategoryResults();

      print(error.toString());
      //results.setException(error: error);

      return results;
    }
  }

  @override
  Future<
  GroupTopDestinationsResults> getPackageByDestination(int id) async {
    try {
      Response response = await apiConnector.get(
        GET_BY_DESTINATION+id.toString(),
      );

      var data = response.data;

      GroupTopDestinationsResults results = GroupTopDestinationsResults
      .fromMap(data);

      return results;
    } catch (error, stacktrace) {
      GroupTopDestinationsResults results = GroupTopDestinationsResults();

      print(error.toString());
      //results.setException(error: error);

      return results;
    }
  }

  @override
  Future<
  PackageResultList> getPackagesList() async {
    try {
      Response response = await apiConnector.get(
        GET_PACKAGES,
      );

      var data = response.data;

      PackageResultList results = PackageResultList
      .fromMap(data);

      return results;
    } catch (error, stacktrace) {
      PackageResultList results = PackageResultList();

      print(error.toString());
      //results.setException(error: error);

      return results;
    }
  }

  @override
  Future<
  DestinationsAndCategoryList> getAllCategories(int id) async {



    try {
      Response response = await apiConnector
      .get(GET_CATEGORY_DESTINATIONS_LIST+id.toString(), );

      var data = response.data;


      DestinationsAndCategoryList result = DestinationsAndCategoryList
      .fromMap(data);


      return result;
    } catch (error, stacktrace) {
      DestinationsAndCategoryList results = DestinationsAndCategoryList();


      if (error is DioError) {
        results.responseException(error: error);
      }

      return results;
    }
  }

  @override
  Future<
  DestinationsAndCategoryList> getAllDestinations(int id) async {


    try {
      Response response = await apiConnector
      .get(GET_CATEGORY_DESTINATIONS_LIST+id.toString());

      var data = response.data;


      DestinationsAndCategoryList result = DestinationsAndCategoryList
      .fromMap(data);


      return result;
    } catch (error, stacktrace) {
      DestinationsAndCategoryList results = DestinationsAndCategoryList();

      print(results.responseException);


      if (error is DioError) {
        results.responseException(error: error);
      }

      return results;
    }
  }
}
