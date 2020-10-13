import 'package:ota/models/packages/group_by_category.dart';
import 'package:ota/models/packages/group_by_destinations.dart';
import 'package:ota/models/packages/package_results.dart';

abstract class PackageService {
  Future<GroupTopDestinationsResults>
      getPackageByDestination();

  Future<GroupByCategoryResults>
      getPackageByCategory();


  Future<PackageResultList>
  getPackagesList();

}
