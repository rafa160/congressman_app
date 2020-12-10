import 'package:dio/dio.dart';
import 'package:new_congressman_app/api_routes/api_rotues.dart';
import 'package:new_congressman_app/models/expenses.dart';

class ExpensesRepository {
  Dio dio = new Dio();

  Future<Expenses> getExpensesById(String id) async {
    try {
      print('${ApiRoutes.url}${ApiRoutes.apiVersion}${ApiRoutes.congressman}$id${ApiRoutes.orderExpensesRoute}');
      final response = await dio.get('${ApiRoutes.url}${ApiRoutes.apiVersion}${ApiRoutes.congressman}$id${ApiRoutes.orderExpensesRoute}');
      return Expenses.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
