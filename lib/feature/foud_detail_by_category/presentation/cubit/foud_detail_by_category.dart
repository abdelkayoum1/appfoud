import 'package:appfoud/feature/foud_detail/home/model/foud_detail/meal.dart';
import 'package:appfoud/feature/foud_detail_by_category/home/foud_detail_by_category/model/foud_detail_byid/foud_detailbyid/meal.dart';

abstract class FoudDetailByCategory {}

final class Fouddetailbycategoryinitial extends FoudDetailByCategory {}

final class Fouddetailbycategoryloading extends FoudDetailByCategory {}

final class Fouddetailbycategorysucces extends FoudDetailByCategory {
  final List<Meall> meal;

  Fouddetailbycategorysucces({required this.meal});
}

final class Fouddetailbycategoryfailure extends FoudDetailByCategory {
  final String error;

  Fouddetailbycategoryfailure({required this.error});
}
