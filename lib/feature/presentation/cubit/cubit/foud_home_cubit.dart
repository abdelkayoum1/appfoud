import 'package:appfoud/feature/foud_detail/home/model/foud_detail/meal.dart';
import 'package:appfoud/feature/presentation/home/home_repo/home_repo.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/category.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/foud_model.dart';
import 'package:appfoud/feature/sign%20up/datasignin/homerepo/home_repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'foud_home_state.dart';

class FoudHomeCubit extends Cubit<FoudHomeState> {
  final HomeRepoo home;
  FoudHomeCubit(this.home) : super(FoudHomeInitial());

  Future<void> getfood() async {
    try {
      emit(FoudHomelaoding());
      var resu = await home.getfood();

      resu.fold(
        (failure) {
          emit(FoudHomeFailure(error: failure.error.toString()));
        },
        (foud) {
          print('succes');
          print({'${foud.first.strCategoryThumb}'});
          emit(FoudHomesucces(foud: foud));
        },
      );
    } catch (e) {
      emit(FoudHomeFailure(error: e.toString()));
    }
  }
}
