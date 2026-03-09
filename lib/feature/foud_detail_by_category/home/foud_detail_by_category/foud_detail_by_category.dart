import 'package:appfoud/core/error/failure.dart';

import 'package:appfoud/feature/foud_detail_by_category/home/foud_detail_by_category/model/foud_detail_byid/foud_detailbyid/meal.dart';
import 'package:dartz/dartz.dart';

abstract class FoudDetailByCategory {
  Future<Either<Failure, List<Meall>>> getfoudbyid({required String idd});
}
