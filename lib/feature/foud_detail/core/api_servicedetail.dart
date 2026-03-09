import 'package:dio/dio.dart';

class ApiServicedetail {
  final Dio dio;

  ApiServicedetail({required this.dio});

  Future<Map<String, dynamic>> getfouddetail({required String category}) async {
    final String baseurl =
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category';
    var resu = await dio.get(baseurl);
    print(resu);
    return resu.data;
  }
}
