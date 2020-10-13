import 'package:flutter/material.dart';
import 'package:ota/productflavors/flavor_package.dart';
import 'package:ota/utils/constants.dart';

import 'app/base_app.dart';


void main() {

  FlavourConfig(
      flavor: Flavor.PRODUCTION,
      name: Flavor.PRODUCTION,
      values: FlavorValues(baseUrl: Constants.PRODUCTION_BASEURL));
  runApp(MyApp());
}

class MyApp extends BaseApp{

}
