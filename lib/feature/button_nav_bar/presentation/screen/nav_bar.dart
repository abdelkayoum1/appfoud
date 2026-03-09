import 'package:appfoud/feature/button_nav_bar/presentation/cubit/cubit/nav_bar_cubit.dart';
import 'package:appfoud/feature/presentation/screnn/foud_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: // list[currentindex],
            context
                .read<NavBarCubit>()
                .list[context.read<NavBarCubit>().currentindex],
            //  bottomNavigationBar:
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.red,
              selectedFontSize: 20,
              unselectedFontSize: 12,
              // currentIndex: currentindex,
              currentIndex: context.read<NavBarCubit>().currentindex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorate',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Prefile',
                ),
              ],
              onTap: (index) {
                context.read<NavBarCubit>().getindex(index);
                //  getindex(value);
              },
            ),
          );
        },
      ),
    );
  }
}
