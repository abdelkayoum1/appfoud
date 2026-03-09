import 'package:appfoud/core/error/failure.dart';
import 'package:appfoud/feature/foud_detail/home/model/foud_detail/meal.dart';
import 'package:appfoud/feature/foud_detail_by_category/core/api_service_by_category.dart';
import 'package:appfoud/feature/foud_detail_by_category/home/foud_detail_by_category/foud_detail_by_category.dart';
import 'package:appfoud/feature/foud_detail_by_category/home/foud_detail_by_category/model/foud_detail_byid/foud_detailbyid/meal.dart';
import 'package:dartz/dartz.dart';

class FoudDetailByCategoryImpl implements FoudDetailByCategory {
  final ApiServiceByCategory apiservicebycategory;

  FoudDetailByCategoryImpl({required this.apiservicebycategory});

  @override
  Future<Either<Failure, List<Meall>>> getfoudbyid({
    required String idd,
  }) async {
    try {
      var resu = await apiservicebycategory.getfoudbyid(id: int.parse(idd));

      List<Meall> fouddetailbyid = [];
      for (var fouddetailbyidd in resu['meals']) {
        fouddetailbyid.add(Meall.fromJson(fouddetailbyidd));
      }
      return Right(fouddetailbyid);
    } catch (e) {
      return Left(FailureServer(error: e.toString()));
    }
  }
}
