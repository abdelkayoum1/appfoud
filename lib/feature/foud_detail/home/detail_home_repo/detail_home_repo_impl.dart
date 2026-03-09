import 'package:appfoud/core/error/failure.dart';
import 'package:appfoud/feature/foud_detail/core/api_servicedetail.dart';
import 'package:appfoud/feature/foud_detail/home/detail_home_repo/detail_home_repo.dart';
import 'package:appfoud/feature/foud_detail/home/model/foud_detail/foud_detail.dart';
import 'package:appfoud/feature/foud_detail/home/model/foud_detail/meal.dart';
import 'package:appfoud/feature/foud_detail/presentation/screen/foud_detail.dart'
    hide FoudDetail;
import 'package:appfoud/feature/presentation/home/modell/foud_model/category.dart';
import 'package:dartz/dartz.dart';

class DetailHomeRepoImpl implements DetailHomeRepo {
  final ApiServicedetail apidetail;

  DetailHomeRepoImpl({required this.apidetail});
  @override
  Future<Either<Failure, List<Meal>>> getfoudetail({
    required String category,
  }) async {
    try {
      var resu = await apidetail.getfouddetail(category: category);

      List<Meal> fouddetail = [];
      for (var foudmeal in resu['meals']) {
        fouddetail.add(Meal.fromJson(foudmeal));
      }
      return Right(fouddetail);
    } catch (e) {
      return Left(FailureServer(error: e.toString()));
    }
  }
}
