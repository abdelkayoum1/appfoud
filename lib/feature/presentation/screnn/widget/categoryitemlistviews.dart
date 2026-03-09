import 'package:appfoud/core/approute.dart';
import 'package:appfoud/core/appservice.dart';
import 'package:appfoud/feature/presentation/home/home_repo/home_repo_impl.dart';
import 'package:appfoud/feature/presentation/cubit/cubit/foud_home_cubit.dart';
import 'package:appfoud/feature/presentation/screnn/widget/categorylistviews.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Categoryitemlistviews extends StatelessWidget {
  const Categoryitemlistviews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = FoudHomeCubit(
          HomeRepoImpl(apiserver: Apiservice(dio: Dio())),
        );
        cubit.getfood();
        return cubit;
      },
      child: BlocBuilder<FoudHomeCubit, FoudHomeState>(
        builder: (context, state) {
          if (state is FoudHomeFailure) {
            return Text(state.error);
          } else if (state is FoudHomesucces) {
            if (state.foud.isEmpty) {
              return Container(child: Text('not foud'));
            }
            return GridView.builder(
              itemCount: state.foud.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,

                //  mainAxisExtent: 250,
              ),
              itemBuilder: (context, index) {
                // print(state.foud.first.categories?.first.strCategoryThumb);
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      Approute.fouddetail,
                      extra: state.foud[index].strCategory,
                    );
                  },
                  child: Categorylistviews(foud: state.foud[index]),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
