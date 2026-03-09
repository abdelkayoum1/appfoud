import 'package:dio/dio.dart';

class ApiServiceByCategory {
  final Dio dio;

  ApiServiceByCategory({required this.dio});
  Future<Map<String, dynamic>> getfoudbyid({required int id}) async {
    final String baseurl =
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id';

    var resu = await dio.get(baseurl);

    return resu.data;
  }
}
