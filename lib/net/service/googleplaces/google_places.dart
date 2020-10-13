import 'package:ota/models/googleplaces/place.dart';
import 'package:ota/models/googleplaces/predictions.dart';

abstract class GooglePlaces{
  Future<Place>  getPlace(String id);
  Future<Predictions>  getPredictions(String id);
}