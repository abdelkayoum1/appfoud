import 'package:appfoud/core/error/failure.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/category.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/foud_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepoo {
  Future<Either<Failure, List<Category>>> getfood();
}
