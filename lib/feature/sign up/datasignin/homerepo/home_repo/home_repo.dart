import 'package:appfoud/core/error/failure.dart';
import 'package:appfoud/feature/sign%20up/datasignin/model/model_course.dart';
import 'package:appfoud/feature/sign%20up/datasignin/model/model_name.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, void>> login({
    required String email,

    required String password,
  });

  Future<Either<Failure, void>> signUp({
    required String password,
    required String email,
    required String name,
  });

  Future<Either<Failure, List<ModelCourse>>> getcourse();

  Future<Either<Failure, List<Modelname>>> getname();

  Future<Either<Failure, void>> logout();
}
