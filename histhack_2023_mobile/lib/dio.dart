import 'package:dio/dio.dart';
import 'package:histhack_2023_mobile/data/places.dart';

var baseUrl = "http://172.20.10.2:3000/";

var dio = Dio(BaseOptions(
  baseUrl: baseUrl,
));

Future<Place> getPlace({required String id}) async {
  Response placeData = await dio.get('/places/$id');
  return Place.fromJson(placeData.data);
}

Future<List<Place>> getPlaces() async {
  Response placeData = await dio.get('/places');
  print(placeData.data);
  return placeData.data.map<Place>((item) => Place.fromJson(item)).toList();
}
