

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ota/models/packages/package_results.dart';
import 'package:ota/net/service/package/package_service.dart';

class PackageResultsViewModel  extends ChangeNotifier{


PackageService _packageService;

bool Price_Filter = false;

bool loading = true;

PackageResultList packageResultList = PackageResultList();

List<String>price = ["2,200.00","3,599.00","3,188.00","4,500.00"];

List<String>names = ["Canada","Switzerland","Hongkong","Tokyo"];

List<String>timings = ["2 Days","3 Days 4 Nights","1 Day 2 Nights","1 Day"];


PackageResultsViewModel(){

_packageService = GetIt.instance<PackageService>();

getPackages();
}

  Future<PackageResultList> getPackages() async {

packageResultList = await _packageService.getPackagesList();

print(packageResultList.result.length.toString());

loading = false;

notifyListeners();

  }






}