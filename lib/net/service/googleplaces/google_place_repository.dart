import 'package:dio/dio.dart';
import 'package:ota/models/googleplaces/place.dart';
import 'package:ota/models/googleplaces/predictions.dart';
import 'package:ota/net/service/googleplaces/google_places.dart';

class GooglePlaceRepository extends GooglePlaces{
  Dio _apiConnector;
  final String _GOOGLE_URL = 'https://maps.googleapis.com/maps/api/place';
  final String _PREDICTIONS = '/queryautocomplete/json';
  final String _PLACE_DETAILS = '/details/json';
  final String _GOOGLE_API_KEY = 'AIzaSyDyipTSY917CuROBicSy_cDmzfseLs_6UQ';


  GooglePlaceRepository(){
    _apiConnector =  Dio(BaseOptions(
        connectTimeout: 50000,
        receiveTimeout: 50000,
        baseUrl:_GOOGLE_URL ));
  }

  @override
  Future<Place> getPlace(String id)async {

    Map<String, dynamic> params =Map();
    params['key'] = _GOOGLE_API_KEY;
    params['place_id'] = id;
    params['fields'] = 'geometry';

    try {
      Response response = await _apiConnector.get(
          _PLACE_DETAILS, queryParameters: params);
      var data = response.data;
      Place result = Place.fromJson(data);
      return result;
    }catch(error, stacktrace){
      Place results = Place();



      return results;
    }
  }

  @override
  Future<Predictions> getPredictions(String id)async {
    Map<String, dynamic> params =Map();
    params['key'] = _GOOGLE_API_KEY;
    params['input'] = id;
    try {
      Response response = await _apiConnector.get(
          _PREDICTIONS, queryParameters: params);
      var data = response.data;
      Predictions result = Predictions.fromJson(data);
      return result;
    }catch(error, stacktrace){
      Predictions results = Predictions();



      return results;
    }
  }

}