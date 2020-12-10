
import 'package:dio/dio.dart';
import 'package:new_congressman_app/api_routes/api_rotues.dart';
import 'package:new_congressman_app/models/congressman.dart';

class CongressmanRepository {
  Dio dio = new Dio();

  Future<Congressman> getCongressmen() async {
    try {
      final response = await dio.get(ApiRoutes.baseUrl);

      print(response.data.toString());
      return Congressman.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Congressman> getCongressmanByUrl(String url) async {
    try {
      final response = await dio.get(url);
      return Congressman.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Congressman> getCongressmanById(String id) async {
    try {
      final response = await dio.get(
          '${ApiRoutes.url}${ApiRoutes.apiVersion}${ApiRoutes.congressmanId}$id${ApiRoutes.orderByName}');
      return Congressman.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
