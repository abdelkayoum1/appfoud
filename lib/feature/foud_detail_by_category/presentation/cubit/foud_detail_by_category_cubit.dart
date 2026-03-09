import 'package:appfoud/feature/foud_detail_by_category/home/foud_detail_by_category/foud_detail_by_category_impl.dart';
import 'package:appfoud/feature/foud_detail_by_category/presentation/cubit/foud_detail_by_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoudDetailByCategoryCubit extends Cubit<FoudDetailByCategory> {
  final FoudDetailByCategoryImpl foudDetailByCategory;
  FoudDetailByCategoryCubit(this.foudDetailByCategory)
    : super(Fouddetailbycategoryinitial());

  Future<void> getfoudeatilbyid({required String idd}) async {
    try {
      emit(Fouddetailbycategoryloading());
      var resu = await foudDetailByCategory.getfoudbyid(idd: idd);

      resu.fold(
        (failure) {
          emit(Fouddetailbycategoryfailure(error: failure.toString()));
        },
        (foudbycategory) {
          emit(Fouddetailbycategorysucces(meal: foudbycategory));
        },
      );
    } catch (e) {
      emit(Fouddetailbycategoryfailure(error: e.toString()));
    }
  }
}
