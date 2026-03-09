import 'package:appfoud/core/appservice.dart';
import 'package:appfoud/core/error/failure.dart';
import 'package:appfoud/feature/presentation/home/home_repo/home_repo.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/category.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/foud_model.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final Apiservice apiserver;

  HomeRepoImpl({required this.apiserver});
  @override
  Future<Either<Failure, List<Category>>> getfood() async {
    try {
      var resu = await apiserver.getfood();
      List<Category> foud = [];
      for (var fouds in resu['categories']) {
        foud.add(Category.fromJson(fouds));
        print(fouds['strCategoryThumb']);
      }
      return Right(foud);
    } catch (e) {
      return Left(FailureServer(error: e.toString()));
    }
  }
}

/*

{"categories":
[
{
"idCategory":"1",
"strCategory":"Beef",
"strCategoryThumb":"https://www.themealdb.com/images/category/beef.png",
"strCategoryDescription":"Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"}
*/
