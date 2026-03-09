import 'package:appfoud/core/error/failure.dart';
import 'package:appfoud/feature/foud_detail/home/model/foud_detail/foud_detail.dart';
import 'package:appfoud/feature/foud_detail/home/model/foud_detail/meal.dart';
import 'package:appfoud/feature/foud_detail_by_category/home/foud_detail_by_category/model/foud_detail_byid/foud_detailbyid/meal.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/category.dart';
import 'package:dartz/dartz.dart';

abstract class DetailHomeRepo {
  Future<Either<Failure, List<Meal>>> getfoudetail({required String category});
}
