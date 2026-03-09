import 'package:appfoud/feature/foud_detail/home/detail_home_repo/detail_home_repo.dart';
import 'package:appfoud/feature/foud_detail/home/model/foud_detail/meal.dart';
import 'package:appfoud/feature/foud_detail_by_category/home/foud_detail_by_category/model/foud_detail_byid/foud_detailbyid/meal.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/category.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'foud_detail_state.dart';

class FoudDetailCubit extends Cubit<FoudDetailState> {
  final DetailHomeRepo detailhome;
  FoudDetailCubit(this.detailhome) : super(FoudDetailInitial());

  Future<void> getfoudeatail({required String category}) async {
    try {
      emit(FoudDetailloading());
      var res = await detailhome.getfoudetail(category: category);
      res.fold(
        (failure) {
          emit(FoudDetailfailure(error: failure.error.toString()));
        },
        (fouddetail) {
          print(fouddetail.length);
          emit(FoudDetailsucces(foudetail: fouddetail));
        },
      );
    } catch (e) {
      emit(FoudDetailfailure(error: e.toString()));
    }
  }
}
