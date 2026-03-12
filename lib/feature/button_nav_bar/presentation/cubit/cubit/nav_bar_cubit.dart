import 'package:appfoud/feature/button_nav_bar/presentation/screen/nav_bar.dart';

import 'package:appfoud/feature/my_favorate/presetation/screen/widget/favorate.dart';
import 'package:appfoud/feature/prefile/presentation/screen/prefile.dart';
import 'package:appfoud/feature/presentation/screnn/foud_home.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  int currentindex = 0;
  List<Widget> list = [FoudHome(), Favorate(), Prefile()];

  void getindex(int index) {
    currentindex = index;
    print('succes');
    emit(NavBarsucces());
  }
}
