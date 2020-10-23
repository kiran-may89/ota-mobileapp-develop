import 'package:ota/models/packages/categories_list.dart';
import 'package:ota/models/packages/destinations_list.dart';
import 'package:ota/models/packages/group_by_category.dart';
import 'package:ota/models/packages/group_by_destinations.dart';
import 'package:ota/models/packages/package_results.dart';

abstract class PackageService {
  Future<GroupTopDestinationsResults>
      getPackageByDestination(int id);

  Future<GroupByCategoryResults>
      getPackageByCategory(int id);


  Future<PackageResultList>
  getPackagesList();



  Future<DestinationsAndCategoryList>
  getAllCategories(int id);



  Future<DestinationsAndCategoryList>
         getAllDestinations(int id);







}
