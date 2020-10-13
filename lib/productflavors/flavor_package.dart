import 'package:flutter/cupertino.dart';

class Flavor {
  static String PRODUCTION = "prod";
  static String DEV = "dev";

}

class FlavorValues {
  FlavorValues({@required this.baseUrl});

  final String baseUrl;

}


class FlavourConfig {
  final String flavor;
  final String name;
  final FlavorValues values;
  static FlavourConfig _instance;

  factory FlavourConfig({@required String flavor, String name, @required FlavorValues values}) {


    _instance ??= FlavourConfig._internal(
        flavor, name, values);
    return _instance;
  }

  FlavourConfig._internal(this.flavor, this.name, this.values);

  static FlavourConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;

  static bool isDevelopment() => _instance.flavor == Flavor.DEV;

}

